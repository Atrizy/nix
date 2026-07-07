{ config, pkgs, lib, ... }:

{
  services.snapper.configs.root = {
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
