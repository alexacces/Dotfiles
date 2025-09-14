{ ... }:
{
  services.xserver = {
    enable = true;
    layout = "us"; # sesuaikan layout keyboard kamu
    xkbOptions = "caps:escape"; # Caps Lock jadi Esc
    autoRepeatDelay = 300; # dalam milidetik sebelum repeat dimulai
    autoRepeatInterval = 50; # dalam milidetik sebelum repeat dimulai
    displayManager.sessionCommands = ''
      xrandr --output VGA-1 --primary --mode 1366x768 --pos 0x0 --rotate normal
    '';
  };
  services.xserver.windowManager.awesome.enable = true;
  # Input driver override dari xlibre
  services.xserver.libinput.enable = true;
  # Video driver, sesuaikan dengan hardware kamu
  services.xserver.videoDrivers = [ "modesetting" ];
}
