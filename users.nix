{ ... }:
{
  programs.zsh.enable = true;
  users.users.dev = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };
}
