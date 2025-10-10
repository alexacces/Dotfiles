{ inputs, pkgs, ... }:
{
  #programs.niri.settings.environment."NIXOS_OZONE_WL" = "1";

  programs.niri = {
    enable = true;
    # Kamu bisa pilih stable / unstable:
    package = inputs.niri.packages.${pkgs.system}.niri-unstable;
  };
}
