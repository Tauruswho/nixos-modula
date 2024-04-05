 { config, lib, pkgs, ... }:
  # Fonts
{
  fonts.packages = with pkgs; [
  noto-fonts
  noto-fonts-cjk
  noto-fonts-emoji
  liberation_ttf
  fira-code
  fira-code-symbols
  mplus-outline-fonts.githubRelease
  dina-font
  proggyfonts
  corefonts
  google-fonts
  redhat-official-fonts
  ];
}

