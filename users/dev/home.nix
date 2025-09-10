{
  pkgs,
  inputs,
  lib,
  ...
}:

{
  xdg.enable = true;

  programs.neovim = {
    enable = true;
    package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
  };

  home.username = "dev";
  home.homeDirectory = "/home/dev";
  home.activation.myHook = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    cp -av $HOME/nixos/modules/dotConfig/* ~/.config;
    for f in $HOME/nixos/modules/homeConfig/*; do cp -av "$f" ~/."$(basename "$f")"; done
  '';

  home.packages = with pkgs; [
    lua-language-server
    nodejs
    clang
    tree
    nil
    nixfmt
    fastfetch
    nerd-fonts.jetbrains-mono
    tmux
  ];

  programs.git.enable = true;

  home.stateVersion = "25.05";
}
