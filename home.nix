{
  pkgs,
  inputs,
  lib,
  unstable,
  version,
  name,
  homeDirectory,
  ...
}:

{
  home.username = name;
  home.homeDirectory = homeDirectory;
  home.packages = with unstable; [
    clang
    tree
    fastfetch
    nerd-fonts.jetbrains-mono
    tmux
    gimp3-with-plugins
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
    lsd
    wl-clipboard
    wlogout
  ];

  programs = {
    neovim = {
      enable = true;
      package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
    };
    vscode = {
      enable = true;
      package = pkgs.vscode.fhs;
    };
    direnv = {
      enable = true;
    };

  };

  xdg.enable = true;
  home.activation.myHook = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    cp -av $HOME/nixos/modules/dotConfig/* ~/.config;
    for f in $HOME/nixos/modules/homeConfig/*; do cp -av "$f" ~/."$(basename "$f")"; done
  '';
  home.stateVersion = "${version}";
}
