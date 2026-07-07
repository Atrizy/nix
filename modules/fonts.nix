{ config, pkgs, lib, ... }:

{
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    nerd-fonts.intone-mono # verify attribute name against current nixpkgs - nerd-fonts is split per-font; ghostty config.ghostty references "Intone Mono Nerd Font"
  ];
}
