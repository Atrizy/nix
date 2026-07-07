{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    ungoogled-chromium
    pcmanfm
  ];
}
