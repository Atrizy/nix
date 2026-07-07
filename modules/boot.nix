{ config, pkgs, lib, ... }:

let
  vars = import ../hosts/archbox/variables.nix;
in
{
  # grub-install fails on VirtualBox's virtual SATA/EFI emulation ("Inappropriate
  # ioctl for device") - systemd-boot sidesteps it entirely and os-prober dual-boot
  # detection is irrelevant in a VM anyway.
  boot.loader.systemd-boot.enable = vars.isVM;
  boot.loader.grub = {
    enable = !vars.isVM;
    efiSupport = true;
    device = "nodev";
    useOSProber = true; # dual-boot Windows detection - real hardware only
  };
  boot.loader.efi.canTouchEfiVariables = true;

  # Single pinned kernel - CachyOS ran both linux-cachyos and linux-cachyos-lts,
  # which is redundant; latest stable kernel covers the 9900X/7900XTX fine.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.plymouth.enable = true;

  zramSwap.enable = true;
}
