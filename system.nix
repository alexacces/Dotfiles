{
  ...
}:
{
  imports = [
    /etc/nixos/hardware-configuration.nix
  ];
  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Jakarta";
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  system.stateVersion = "25.05"; # Did you read the comment?
}
