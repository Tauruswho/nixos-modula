 { config, lib, pkgs, ... }:
{
  # Samba Server
services.samba = {
  enable = true;
  package = pkgs.samba4Full;
  securityType = "user";
  openFirewall = true;
  extraConfig = ''
    load printers = yes
    printing = CUPS
    printcap name = cups
    workgroup = WORKGROUP
    server string = smbnix
    netbios name = smbnix
    security = user
    #use sendfile = yes
    #max protocol = smb2
    # note: localhost is the ipv6 localhost ::1
    hosts allow = 192.168.1. 127.0.0.1 localhost
    hosts deny = 0.0.0.0/0
    guest account = nobody
    map to guest = bad user
  '';
  shares = {
    public = {
      path = "/home/twat";
      browseable = "yes";
      "read only" = "no";
      "guest ok" = "yes";
      "create mask" = "0644";
      "directory mask" = "0755";
      "force user" = "username";
      "force group" = "groupname";
    };
    private = {
      path = "/home";
      browseable = "yes";
      "read only" = "no";
      "guest ok" = "no";
      "create mask" = "0644";
      "directory mask" = "0755";
      "force user" = "username";
      "force group" = "groupname";
    };
    printers = {
      comment = "All Printers";
      path = "/var/spool/samba";
      public = "yes";
      browseable = "yes";
      # to allow user 'guest account' to print.
      "guest ok" = "yes";
      writable = "no";
      printable = "yes";
      "create mode" = 0700;
    };
  };
};
  systemd.tmpfiles.rules = [ "d /var/spool/samba 1777 root root -" ];

  # Samba for windows...
   services.samba-wsdd = {
    enable = true;
    openFirewall = true;
    };
}
