{ config, pkgs, lib, inputs, ... }:

let
  vars = import ./variables.nix;
in
{
  imports = [
    ./hardware-configuration.nix

    ../../modules/boot.nix
    ../../modules/filesystems.nix
    ../../modules/snapshots.nix
    ../../modules/hardware-gpu.nix
    ../../modules/networking.nix
    ../../modules/audio.nix
    ../../modules/desktop-niri.nix
    ../../modules/gaming.nix
    ../../modules/fonts.nix
  ];

  networking.hostName = vars.hostName;
  time.timeZone = vars.timeZone;

  nixpkgs.config.allowUnfree = true; # needed for spotify, steam, etc.
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  users.users.${vars.primaryUser} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" "input" ];
    shell = pkgs.fish;
  };
  programs.fish.enable = true;

  system.stateVersion = vars.stateVersion;
}
