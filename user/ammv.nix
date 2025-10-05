{
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
  home.stateVersion = "25.05";
}
