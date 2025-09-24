{
  timezone,
  version,
  hostname,
  ...
}:
{
  imports = [
    /etc/nixos/hardware-configuration.nix
  ];
  networking.networkmanager.enable = true;
  networking.hostName = hostname;
  time.timeZone = "${timezone}";
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  system.stateVersion = "${version}"; # Did you read the comment?
}
