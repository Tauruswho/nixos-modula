 { config, lib, pkgs, ... }: {
 # NFS Server
 services.nfs.server.enable = true;
 services.nfs.server.exports = ''  /home 192.168.1.0/18(rw,async,insecure,no_root_squash,no_subtree_check)  '';

 # NFS Client
 # fileSystems."/nfs-mnt" = {
 #    device = "192.168.1.28:/home";
 #    fsType = "nfs";
 #    options = [ "x-systemd.automount" "noauto" ];
 #  };
 }

