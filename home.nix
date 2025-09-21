{
  pkgs,
  inputs,
  lib,
  ...
}:

{
  xdg.enable = true;
  home.username = "dev";
  home.homeDirectory = "/home/dev";
  home.activation.myHook = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    cp -av $HOME/nixos/modules/dotConfig/* ~/.config;
    for f in $HOME/nixos/modules/homeConfig/*; do cp -av "$f" ~/."$(basename "$f")"; done
  '';

  home.packages = with pkgs; [
    clang
    tree
    fastfetch
    nerd-fonts.jetbrains-mono
    tmux
    gimp3-with-plugins
    xclip
    fzf
    ntfs3g
    #for neovim
    nodePackages.typescript
    nodePackages.typescript-language-server
    lua-language-server
    nil
    nixfmt
    unzip
    nodejs
    stylua
    prettierd
    picom
    feh
  ];

  programs.neovim = {
    enable = true;
    package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
  };

  programs.git.enable = true;

  home.stateVersion = "25.05";
}
