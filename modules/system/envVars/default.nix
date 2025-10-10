{ ... }:
{
  environment.variables = {
    EDITOR = "nvim";
    NIXOS_OZONE_WL = "1";
    GDK_BACKEND = "wayland";
    QT_QPA_PLATFORM = "wayland";
  };

}
