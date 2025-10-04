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

  home.packages = with pkgs; [
    cargo
  ];
  home.username = username;
  home.homeDirectory = homeDirectory;
  programs.home-manager.enable = true;
  home.stateVersion = "25.05";
}
