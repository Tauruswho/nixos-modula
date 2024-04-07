{ config, lib, pkgs, ... }:
{
 # Enable CUPS to print documents and enable scanners.
  services.printing.enable = true;
  # run on first setup: sudo hp-setup -i -a
  services.printing.drivers = [ pkgs.hplip ];
  # enables support for SANE scanners
  hardware.sane.enable = true;
  services.ipp-usb.enable=true;
  hardware.sane.extraBackends = [ pkgs.hplip ];
  nixpkgs.config.packageOverrides = pkgs: {
    xsaneGimp = pkgs.xsane.override { gimpSupport = true; };
  services.fwupd.enable = true;
 };

  services.printing = {
   listenAddresses = [ "*:631" ];
   allowFrom = [ "all" ];
   browsing = true;
   defaultShared = true;
   openFirewall = true;
#   browsedConf = ''
#    BrowseDNSSDSubTypes _cups,_print
#    BrowseLocalProtocols all
#    BrowseRemoteProtocols all
#    CreateIPPPrinterQueues All
#    BrowseProtocols all
#    '';
 };
}


