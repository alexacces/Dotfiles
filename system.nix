{
  pkgs,
  ...
}:
{
  imports = [
    /etc/nixos/hardware-configuration.nix
    ./boot.nix
  ];
  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Jakarta";
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.wayland.enable = true;
  programs.niri.enable = true;
  programs.zsh.enable = true;
  users.users.dev = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      ghostty
      fuzzel
      firefox
      waybar
      swaybg
    ];
  };
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  system.stateVersion = "25.05"; # Did you read the comment?
}
