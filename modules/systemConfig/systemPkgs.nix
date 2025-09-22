{
  pkgs,
  ...
}:
{
  environment.systemPackages = [
    pkgs.curl
    pkgs.firefox
    pkgs.ghostty
    pkgs.waybar
    pkgs.hyprlock
    pkgs.git
    pkgs.swaybg
    pkgs.pavucontrol
    pkgs.kdePackages.dolphin
  ];
}
