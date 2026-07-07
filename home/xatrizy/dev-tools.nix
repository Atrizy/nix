{ config, pkgs, lib, ... }:

{
  programs.vscode.enable = true;

  home.packages = with pkgs; [
    ripgrep
    python3
    nodejs
    jdk # single modern JDK - dropped jre8, prismlauncher (gaming.nix) manages its
        # own per-instance Java runtimes for Minecraft, so a system JRE8 isn't needed
    claude-code # verify package name against current nixpkgs; fall back to `npm i -g @anthropic-ai/claude-code` if unpackaged
    cursor # verify package name/availability against current nixpkgs, may need an overlay
  ];
}
