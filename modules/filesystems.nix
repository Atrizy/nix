{ config, pkgs, lib, ... }:

# Actual `fileSystems` mount entries (the btrfs @, @home, @root, @srv, @cache,
# @tmp, @log subvolume layout) live in hardware-configuration.nix, since that
# file is regenerated per-machine. This module only holds the non-machine-specific
# filesystem behavior that goes with that layout.
{
  services.fstrim.enable = true;

  environment.systemPackages = with pkgs; [
    btrfs-progs
  ];
}
