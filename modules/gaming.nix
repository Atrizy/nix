{ config, pkgs, lib, ... }:

{
  programs.steam.enable = true;

  environment.systemPackages = with pkgs; [
    mangohud
    prismlauncher
  ];

  # Actually used to stream to another device - start-on-demand rather than
  # boot-enabled, since it's not needed at idle.
  services.sunshine = {
    enable = true;
    capSysAdmin = true; # needed for Wayland DRM/KMS capture under niri
    openFirewall = true;
    autoStart = false; # goal is "systemctl start sunshine" on demand, not boot-enabled
  };

  # playit-bin (game tunnel) dropped entirely, not used.
}
