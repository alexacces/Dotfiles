{ ... }:
{
  # Enable the X11 windowing system.
  services.xserver.resolutions = [
    {
      x = 1366;
      y = 768;
    } # Example: Set 1920x1080 as default
  ];
  services.xserver = {
    enable = true;
    autoRepeatDelay = 200;
    autoRepeatInterval = 50; # Example for rate
  };
  services.xserver.windowManager.awesome.enable = true;
  #services.displayManager.ly.enable = true;

  # Configure keymap in X11
  services.xserver.xkb.layout = "us";
  services.xserver.xkb.options = "caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # services.pulseaudio.enable = true;
  # OR
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
}
