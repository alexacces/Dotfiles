{
  pkgs,
  ...
}:
{
  environment.systemPackages = [
    pkgs.firefox
    pkgs.ghostty
    pkgs.fuzzel
    pkgs.curl
    pkgs.nerd-fonts.jetbrains-mono

  ];
}
