{ config, pkgs, lib, ... }:

{
  networking.networkmanager.enable = true;
  networking.useDHCP = false;

  hardware.bluetooth.enable = true;

  services.resolved.enable = true;
  services.timesyncd.enable = true;

  # Rules unknown (couldn't read live ufw config, needs sudo) - conservative
  # default until real rules are supplied.
  networking.firewall.enable = true;

  # Dropped entirely, no identified use case on this system:
  # modemmanager, xl2tpd, dnsmasq, bind, avahi-daemon
}
