 { config, lib, pkgs, ... }:
  # Enable networking
{
  networking.networkmanager.enable = true;
  networking.enableIPv6  = false;
  networking.extraHosts =
  ''
    192.168.1.21 who  who.local
    192.168.1.22 who  who.local
    192.168.1.23 rocky  rocky.local
    192.168.1.24 rocky  rocky.local
    192.168.1.25 nuc7   nuc7.local
    192.168.1.26 nuc7   nuc7.local
    192.168.1.27 hp     hp.local
    192.168.1.28 hp     hp.local
    192.168.1.29 nuc6   nuc6.local
    192.168.1.30 nuc6   nuc6.local
    192.168.1.31 raspi  raspi.local
    192.168.1.32 raspi  raspi.local
  '';
  # networking.defaultGateway = "192.168.1.1";
  # networking.nameservers = [ "1.1.1.1" "1.0.0.1" ];
  # networking.interfaces.eth0.ipv4.addresses = [ {
  # address = "192.168.1.27";
  # prefixLength = 24;
 # } ];
}

