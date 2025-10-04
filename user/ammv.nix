{
  pkgs,
  username,
  homeDirectory,
  ...
}:

{
  imports = [
    ./pkgs.nix
  ];
  home.username = username;
  home.homeDirectory = homeDirectory;
  programs.home-manager.enable = true;
  home.stateVersion = "25.05";
}
