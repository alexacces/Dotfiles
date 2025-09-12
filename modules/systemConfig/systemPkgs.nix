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
pkgs.fuzzel
pkgs.hyprlock
pkgs.git
  ];
}
