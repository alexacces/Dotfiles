{ pkgs, ... }:
{

  programs.zsh = {
    enable = true;
  };
  users.users.ammv = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
  };
}
