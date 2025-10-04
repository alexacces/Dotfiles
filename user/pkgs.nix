{ pkgs, ... }:
{
  home.packages = with pkgs; [
    fastfetch
    stylua
    nixfmt
    prettierd
    nixd
    rustfmt
    lua-language-server
    bash-language-server
    rust-analyzer
    vscode-langservers-extracted # HTML, CSS, JSON, ESLint
    typescript-language-server
    tailwindcss-language-server
    svelte-language-server
    emmet-ls
    eslint_d
    clang-tools
  ];
}
