{
  description = "My Home Manager config";
  nixConfig = {
    substituters = [
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store?priority=10"
      "https://cache.nixos.org/"
    ];
  };
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-25.05";
    };

    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
    };

  };
  outputs =

    { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations.rustlinux = nixpkgs.lib.nixosSystem {

        inherit system;
        modules = [
          ./modules/base-system
          ./modules/Awesomewm
          ./modules/neovim-nightly
          ./modules/fonts
          ./modules/pkgs
        ];

        specialArgs = { inherit inputs; };
      };
    };
}
