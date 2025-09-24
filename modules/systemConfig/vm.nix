{ pkgs, ... }:
{
  virtualisation.libvirtd.enable = true;
  environment.systemPackages = with pkgs; [
    virt-manager
    (pkgs.qemu.override {
      gtkSupport = true;
      sdlSupport = true;
      openGLSupport = true;
    })
  ];
}
