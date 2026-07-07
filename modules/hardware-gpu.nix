{ config, pkgs, lib, ... }:

# AMD Radeon RX 7900 XTX (Navi 31) + Ryzen 9 9900X.
# Inert on the VM (no real amdgpu device to bind to) but should evaluate cleanly;
# becomes meaningful once run on real hardware.
{
  services.xserver.videoDrivers = [ "amdgpu" ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true; # needed for Steam/Proton
  };

  hardware.cpu.amd.updateMicrocode = true;

  # ROCm/OpenCL userspace for the 7900 XTX (used by ollama-rocm below).
  # verify against current nixpkgs docs - option name/shape has moved across releases
  hardware.amdgpu.opencl.enable = true;
}
