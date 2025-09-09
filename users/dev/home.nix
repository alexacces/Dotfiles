{ pkgs, inputs, ... }:
{
  xdg.enable = true;
  programs.neovim = {
    enable = true;
    package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
  };
  home.username = "dev";
  home.homeDirectory = "/home/dev";
  home.file.".config/nvim" = {
    source = ../../config/nvim;
    recursive = true;
  };
  home.packages = with pkgs; [
    lua-language-server
    nodejs
    clang
    tree
    nixd
    nixfmt
    fastfetch
  ];
  programs.git.enable = true;
  home.stateVersion = "25.05";
}
