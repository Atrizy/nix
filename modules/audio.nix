{ config, pkgs, lib, ... }:

{
  security.rtkit.enable = true;

  services.pulseaudio.enable = false;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  environment.systemPackages = with pkgs; [
    pwvucontrol # native PipeWire control GUI, not pavucontrol
  ];
}
