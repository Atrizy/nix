{ config, pkgs, lib, ... }:

{
  services.ollama = {
    enable = true;
    acceleration = "rocm"; # verify against current nixpkgs docs - may also need `rocmOverrideGfx` for the 7900 XTX gfx target
  };

  # Not boot-enabled - models unload from VRAM after ~5min idle anyway, but no
  # need for the daemon itself to be resident until actually used.
  systemd.services.ollama.wantedBy = lib.mkForce [ ];

  # Models (mistral-nemo, gemma) are pulled at runtime via `ollama pull`, not
  # declared here - not something Nix should manage.
}
