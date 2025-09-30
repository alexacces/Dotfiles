{
  pkgs,
  ...
}:
{
  environment.systemPackages = [
    pkgs.curl
    pkgs.google-chrome
    pkgs.git
    pkgs.xclip
    pkgs.kdePackages.dolphin
    pkgs.home-manager
  ];
}
