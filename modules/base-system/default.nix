{ config, lib, pkgs, ... }:

{
  imports = [ /etc/nixos/hardware-configuration.nix ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  boot.kernelParams = [ "quiet" "video=1366x768" ];
  boot.loader.grub.enable = true;
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  boot.loader.grub.device = "nodev"; # or "nodev" for efi only
  networking.hostName = "rustlinux"; # Define your hostname.
  networking.networkmanager.enable =
    true; # Easiest to use and most distros use this by default.
  time.timeZone = "Asia/Jakarta";
  users.users.dev = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [ tree ];
  };
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    alacritty
    chromium
    gnumake

  ];
  system.stateVersion = "25.05"; # Did you read the comment?

}

