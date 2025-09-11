{
  ...
}:
{
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.wayland.enable = true;
  programs.niri = {
    enable = true;
  };
}
