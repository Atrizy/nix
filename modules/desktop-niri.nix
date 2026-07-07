{ config, pkgs, lib, ... }:

{
  programs.niri.enable = true; # verify against current nixpkgs docs - niri module is fairly new

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true; # niri is Wayland-only
  };

  security.polkit.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}
