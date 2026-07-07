{ config, pkgs, lib, ... }:

{
  programs.git = {
    enable = true;
    settings.user = {
      name = "CHANGE_ME"; # no git identity was configured anywhere on the source system - fill in
      email = "xvinraven@gmail.com"; # confirm this is the address you want on commits
    };
  };
}
