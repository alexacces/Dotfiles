{
  pkgs,
  username,
  homeDirectory,
  inputs,
  system,
  ...
}:
{
  imports = [ ./pkgs ];

  gtk = {
    enable = true;
    font = {
      name = "SF Pro Display"; # Ganti sesuai hasil fc-list
      size = 11;
    };

  };
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common.default = "*";
  };
  #Neovim nightly

  programs.neovim = {
    enable = true;
    package = inputs.neovim-nightly-overlay.packages.${system}.default;
  };

  #home config
  home.username = username;
  home.homeDirectory = homeDirectory;
  home.stateVersion = "25.05";
}
