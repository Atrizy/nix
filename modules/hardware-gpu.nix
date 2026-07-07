{ config, pkgs, lib, ... }:

# AMD Radeon RX 7900 XTX (Navi 31) + Ryzen 9 9900X.
let
  vars = import ../hosts/archbox/variables.nix;
in
{
  services.xserver.videoDrivers = lib.mkIf (!vars.isVM) [ "amdgpu" ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true; # needed for Steam/Proton
    extraPackages = lib.mkIf (!vars.isVM) [ pkgs.rocmPackages.clr.icd ]; # ROCm OpenCL userspace for the 7900 XTX
  };

  hardware.cpu.amd.updateMicrocode = !vars.isVM;
}
