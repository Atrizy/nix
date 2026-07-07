{ config, pkgs, lib, inputs, ... }:

{
  # Real niri KDL config ported as-is (static files, not re-authored in Nix) -
  # avoids transcription errors, still tracked/versioned via this repo.
  xdg.configFile."niri" = {
    source = ./files/niri;
    recursive = true;
  };

  # DankMaterialShell settings/themes, also ported as-is.
  xdg.configFile."DankMaterialShell" = {
    source = ./files/dms;
    recursive = true;
  };

  imports = [ inputs.dms.homeModules.default ];
  programs.dank-material-shell.enable = true;
}
