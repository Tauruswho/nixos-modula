{ pkgs, config, libs, ...}:

{
  services.jellyfin.enable = true;
environment.systemPackages = with pkgs; [
  jellyfin
  jellyfin-web
  jellyfin-ffmpeg
  caddy
 ];
 # services.caddy = {
 #  enable = true;
 #  virtualHosts."jellyfin.example.com".extraConfig = ''
 #    reverse_proxy 127.0.0.1:8096
 #  '';
 # };
}
