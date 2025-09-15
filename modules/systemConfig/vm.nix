{ pkgs, ... }:
{
  users.groups.libvirtd.members = [ "dev" ];
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
