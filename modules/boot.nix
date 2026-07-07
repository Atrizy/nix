{ config, pkgs, lib, ... }:

let
  vars = import ../hosts/archbox/variables.nix;
in
{
  # VM (VirtualBox, this test) boots legacy BIOS - no ESP exists at all, so both
  # EFI GRUB and systemd-boot (UEFI-only) fail outright. Install GRUB straight to
  # the MBR instead. Real hardware boots UEFI, keeps the original EFI GRUB setup.
  boot.loader.systemd-boot.enable = false;
  boot.loader.grub = {
    enable = true;
    efiSupport = !vars.isVM;
    device = if vars.isVM then "/dev/sda" else "nodev";
    useOSProber = !vars.isVM; # dual-boot Windows detection - real hardware only
  };
  boot.loader.efi.canTouchEfiVariables = !vars.isVM;

  # Single pinned kernel - CachyOS ran both linux-cachyos and linux-cachyos-lts,
  # which is redundant; latest stable kernel covers the 9900X/7900XTX fine.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Hangs indefinitely at "Show Plymouth Boot Screen" in this VM (VirtualBox's
  # display doesn't give it a usable framebuffer), blocking the rest of boot
  # entirely - purely cosmetic, safe to skip for VM testing.
  boot.plymouth.enable = !vars.isVM;

  zramSwap.enable = true;
}
