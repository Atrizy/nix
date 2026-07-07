{ config, pkgs, lib, inputs, ... }:

{
  imports = [
    ./niri.nix
    ./fish.nix
    ./git.nix
    ./terminals.nix
    ./dev-tools.nix
    ./apps.nix
  ];

  home.username = "xatrizy";
  home.homeDirectory = "/home/xatrizy";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;
}
