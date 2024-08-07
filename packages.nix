 { config, lib, pkgs, ... }:
{
 # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
      wget
      gitFull
      vim
      curl
      firefox
      kate
      conky
      thunderbird
      glabels
      golden-cheetah
      audacity
      strawberry
      simple-scan
      shotwell
      gnome-disk-utility
      vlc
      audacious
      audacious-plugins
      asunder
      lxdvdrip
      libsForQt5.skanlite
      castnow
      libreoffice-qt
      neofetch
      cmatrix
      fswebcam
      sane-backends
      sane-frontends
      xsane
      gimp-with-plugins
      usbutils
      webcamoid
      gedit
      killall
      lm_sensors
      htop
      gparted
      chromium
      pciutils
      fwupd
      easyeffects
      qpwgraph
      flac
      wavpack
      handbrake
      lame
      ffmpeg_4-full
      smplayer
      efibootmgr
      flatpak
      libsForQt5.bluez-qt
      bluez
      bluez-alsa
      bluez-tools
      openhantek6022
      mpv
      eagle
      libsForQt5.kdeconnect-kde
      ghostscript
      onlyoffice-bin_latest
      enlightenment.terminology
      krusader
      xfce.thunar
      xfce.thunar-volman
      xfce.thunar-archive-plugin
      xfce.thunar-media-tags-plugin
      kicad
      #    (kicad.override {
      # NOTE: wxpython-4.2.1 is not supported for interpreter python3.12
      # python3 = pkgs.python311;
    # })

      teams-for-linux
      zoom-us
      obs-studio
      enlightenment.econnman
      fastfetch
      dconf-editor
      abcde
      kdePackages.k3b
      inxi
      dmidecode
      hardinfo
      lshw
      hwinfo
      nvme-cli
      google-chrome
      brave
      tor
      tor-browser
    ];
}

