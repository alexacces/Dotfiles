{
  pkgs,
  ...
}:
{
  environment.systemPackages = [
    pkgs.curl
    pkgs.brave
    pkgs.git
    pkgs.xclip
    pkgs.kdePackages.dolphin
    pkgs.home-manager
  ];
}
