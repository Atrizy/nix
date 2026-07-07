{ config, pkgs, lib, ... }:

{
  programs.git = {
    enable = true;
    userName = "CHANGE_ME"; # no git identity was configured anywhere on the source system - fill in
    userEmail = "xvinraven@gmail.com"; # confirm this is the address you want on commits
  };
}
