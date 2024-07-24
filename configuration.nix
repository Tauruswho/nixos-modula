 # Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

 { config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan and other modules.
      ./hardware-configuration.nix
      ./avahi.nix
      ./bluetooth.nix
      ./fonts.nix
      ./network.nix
      ./nfs.nix
      ./packages.nix
      ./printing.nix
      ./samba.nix
      ./sound.nix
      ./users.nix
      ./zfs.nix
      ./steam.nix
      ./jellyfin.nix
      # ./syncoid.nix
    ];

     # Enable Flakes and the new command-line tool
   nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # Set default editor to vim
   environment.variables.EDITOR = "vim";

  # Bootloader.
   boot.loader.systemd-boot.enable = true;
   boot.loader.efi.canTouchEfiVariables = true;
  # boot.supportedFilesystems = [ "bcachefs" ];
  # boot.kernelPackages = pkgs.linuxPackages_latest;
   boot.kernelPackages = config.boot.zfs.package.latestCompatibleLinuxPackages;
   boot.supportedFilesystems = [ "zfs" ];
  # boot.zfs.forceImportRoot = false;
   boot.zfs.extraPools = [ "tank2" ]; # Tank2--Backup-zfs-2
   networking.hostId = "3cc408bd";

  networking.hostName = "who"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Set your time zone.
  time.timeZone = "Europe/Madrid";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_ES.UTF-8";
    LC_IDENTIFICATION = "es_ES.UTF-8";
    LC_MEASUREMENT = "es_ES.UTF-8";
    LC_MONETARY = "es_ES.UTF-8";
    LC_NAME = "es_ES.UTF-8";
    LC_NUMERIC = "es_ES.UTF-8";
    LC_PAPER = "es_ES.UTF-8";
    LC_TELEPHONE = "es_ES.UTF-8";
    LC_TIME = "es_ES.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the Plasma and Enlightenment Desktop Environments.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.xserver.desktopManager.enlightenment.enable = true;
  programs.dconf.enable = true;

  # Configure keymap in X11
  services.xserver.xkb.layout = "gb";
  #  services.xserver.xkb.Variant = "";

  # Configure console keymap
  console.keyMap = "uk";

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  security.sudo.extraConfig = " Defaults	timestamp_timeout=60 ";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.git = {
  enable = true;
  package = pkgs.gitFull;
  config.credential.helper = "libsecret";
};

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:
  # Auto system update
  system.autoUpgrade.enable = false;
  system.autoUpgrade.allowReboot = false;
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.gvfs.enable = true;
  services.logrotate.enable = true;
  services.flatpak.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ 2049 5357 ];
  # networking.firewall.allowedUDPPorts = [ 3702 ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
# Automatic Garbage Collection
  nix.gc = {
                automatic = true;
                dates = "weekly";
                options = "--delete-older-than 14d";
        };
  boot.kernel.sysctl = { "vm.swappiness" = 10;};
}




