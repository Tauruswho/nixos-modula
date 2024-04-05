 { config, lib, pkgs, ... }: {
  # zfs autosnapshots -- zfs set com.sun:auto-snapshot=true nix-zroot/home
  services.zfs.autoSnapshot = {
  enable = true;
  frequent = 0;
  hourly = 8;
  daily = 7;
  weekly = 4;
  monthly = 1;
};

  services.zfs.autoScrub = {
  enable = true;
  interval = "*-*-1,15 02:30";
};
}

