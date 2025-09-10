{
  description = "Nixos flakes";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = system;

        modules = [
          #nixos config core
          ./modules/system/systemCore.nix
          ./modules/system/systemBoot.nix
          ./modules/system/systemUsers.nix
          ./modules/system/systemPkgs.nix
          ./modules/system/systemWayland.nix
        ];
        homeConfigurations.dev = home-manager.lib.homeManagerConfiguration {
          inherit pkgs inputs;
          modules = [
            ./users/dev/home.nix
          ];
        };
      };
    };
}
