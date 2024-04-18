{ pkgs, config, libs, ...}:

{
  programs.openvpn3.enable = true;
  environment.systemPackages = with pkgs; [ openvpn3 ];
  programs.fish.shellAliases = {
   zd-vpn = "openvpn3 session-start --config /home/mark/openvpn/openvpn.txt && openvpn3 session-auth";
 };
}
