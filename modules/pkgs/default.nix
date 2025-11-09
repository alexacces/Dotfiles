{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    clang
    stylua
    nixfmt-rfc-style
    picom
    feh
    rofi
    lsd
    fzf
    tmux
    fastfetch
    nixd
  ];
}
