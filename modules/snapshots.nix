{ config, pkgs, lib, ... }:

let
  vars = import ../hosts/archbox/variables.nix;
in
{
  # Snapper requires a real btrfs subvolume - this VM's disk is plain ext4
  # (snapper-cleanup.service fails with "subvolume is not a btrfs subvolume"
  # otherwise). Real hardware uses the intended btrfs @ layout.
  services.snapper.configs.root = lib.mkIf (!vars.isVM) {
    SUBVOLUME = "/";
    ALLOW_USERS = [ "xatrizy" ];
    TIMELINE_CREATE = true;
    TIMELINE_CLEANUP = true;
  };

  # grub-btrfs (boot-menu snapshot entries) is not a packaged NixOS module.
  # Deferred to bare-metal phase - not meaningfully testable in a VM anyway.
  # When needed: package `Antynea/grub-btrfs` as a custom derivation + a systemd
  # path-unit that reruns grub-mkconfig on snapshot changes, or re-check nixpkgs.
}
