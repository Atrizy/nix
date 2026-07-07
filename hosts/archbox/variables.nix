{
  hostName = "archbox";
  timeZone = "America/St_Johns";
  primaryUser = "xatrizy";
  # Pin to the NixOS release this config was first created against.
  # Never bump this on an existing install without reading the release notes -
  # it governs on-disk data format defaults (see `man configuration.nix`, stateVersion).
  stateVersion = "25.05";

  # Set true while testing this config in a VM (no real AMD GPU to bind to -
  # forcing the amdgpu driver there hangs boot). Set false for the real 9900X/7900XTX box.
  isVM = true;
}
