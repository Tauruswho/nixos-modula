   { config, lib, pkgs, ... }: {
    # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.twat = {
    isNormalUser = true;
    description = "Twat";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  firefox
    #  thunderbird
    ];
  };

    users.users.mince = {
    homeMode = "770";
    isNormalUser = true;
    uid = 1956;
    home  = "/home/mince";
    description = "Mince";
    group ="mince";
    extraGroups = [ "networkmanager" "wheel" "mark" "mince" "monica" "scanner" "lp" "users" ];
    packages = with pkgs; [
    # firefox
    ];
  };
  users.users.mark = {
  homeMode = "770";
  isNormalUser  = true;
  uid = 1955;
  home  = "/home/mark";
  description  = "Mark";
  group = "mark";
  extraGroups  = [ "wheel" "networkmanager" "mark" "mince" "monica" "scanner" "lp" "users" ];

};

  users.users.monica = {
  homeMode = "770";
  isNormalUser  = true;
  uid = 1957;
  home  = "/home/monica";
  description  = "Monica";
  group = "monica";
  extraGroups  = [ "wheel" "networkmanager" "monica" "mark" "mince" "scanner" "lp" "users" ];

};

  users.groups.mark.gid = 1955;
  users.groups.mince.gid = 1956;
  users.groups.monica.gid = 1957;
}

