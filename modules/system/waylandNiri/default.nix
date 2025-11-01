{ inputs, pkgs, ... }:
{
  #programs.niri.settings.environment."NIXOS_OZONE_WL" = "1";
  services.displayManager.cosmic-greeter.enable = true;
  # Enable the COSMIC DE itself
  services.desktopManager.cosmic.enable = true;
  #services.displayManager.ly.enable = true;

}
