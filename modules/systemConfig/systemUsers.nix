{
  pkgs,
  name,
  groups,
  ...
}:
{
  programs.zsh.enable = true;
  users.users.${name} = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = groups; # Enable ‘sudo’ for the user.
  };
}
