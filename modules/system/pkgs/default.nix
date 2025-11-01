{
  inputs,
  pkgs,
  system,
  apple-fonts,
  ...
}:
{

  programs.neovim = {
    enable = true;
    package = inputs.neovim-nightly-overlay.packages.${system}.default;
  };

  environment.systemPackages = with pkgs; [
    apple-fonts.sf-pro
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    kitty
    chromium
    git
    lsd
    gnumake
    fuzzel
    waybar
    swaybg
  ];
  system.stateVersion = "25.05"; # Did you read the comment?
}
