{ config, lib, pkgs, modulesPath, ... }:

# PLACEHOLDER — not yet generated from real hardware.
# Replace by partitioning the target disk (VM or bare metal) and running:
#   nixos-generate-config --root /mnt --show-hardware-config > hardware-configuration.nix
# This file must always be machine-specific; never hand-author it for real use.
{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot.initrd.availableKernelModules = [ "ahci" "xhci_pci" "virtio_pci" "virtio_scsi" "sd_mod" "sr_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "ext4";
  };

  swapDevices = [ ];

  nixpkgs.hostPlatform = "x86_64-linux";
}
