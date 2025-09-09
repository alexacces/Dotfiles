{
  pkgs,
  ...
}:
{
  packages = with pkgs; [
    ghostty
    fuzzel
    firefox
    waybar
    swaybg
  ];
}
