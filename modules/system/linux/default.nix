{ pkgs, ... }:
{

  programs.nix-ld.enable = true;
  boot.kernelPackages = pkgs.linuxPackages_zen;
}
