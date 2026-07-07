{ config, pkgs, lib, ... }:

{
  boot.loader.systemd-boot.enable = false;
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    device = "nodev";
    useOSProber = true; # dual-boot Windows detection - real hardware only, no-op in VM
  };
  boot.loader.efi.canTouchEfiVariables = true;

  # Single pinned kernel - CachyOS ran both linux-cachyos and linux-cachyos-lts,
  # which is redundant; latest stable kernel covers the 9900X/7900XTX fine.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.plymouth.enable = true;

  zramSwap.enable = true;
}
