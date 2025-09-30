{
  pkgs,
  ...
}:
{
  #  services.xserver.enable = true;
  services.displayManager.ly.enable = true;
  programs.hyprland.enable = true; # enable Hyprland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = false;
  };
  environment.systemPackages = [
    pkgs.kitty # required for the default Hyprland config
    pkgs.waybar
    pkgs.swaybg
    pkgs.wofi
    pkgs.hyprlock
  ];
}
