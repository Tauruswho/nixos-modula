 { config, lib, pkgs, ... }:
{
 services.syncoid = {
  enable = true;
  interval = "*:0/Daily";
  commands = {
    "tank/home" = {
      target = "tank2/home";
      sendOptions = "r";
    };
  localSourceAllow =
     options.services.syncoid.localSourceAllow.default ++ [ "mount" ];
  localTargetAllow =
     options.services.syncoid.localTargetAllow.default ++ [ "destroy" ];
  };
}

