{
  ...
}:
{
  boot.kernelParams = [
    "quiet"
    "video=1366x768"
  ];
  boot.loader.grub.enable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.device = "nodev"; # or "nodev" for efi only
}
