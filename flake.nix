{
  description = "Nixos flakes + Home-manager";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    xlibre-overlay.url = "git+https://codeberg.org/takagemacoed/xlibre-overlay";
    #xlibre-overlay.url = "/home/dev/Project/xlibre-overlay/";

  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nixpkgs-unstable,
      xlibre-overlay,
      ...
    }@inputs:
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      #system level config
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = system;
        modules = [
          ./modules/systemConfig/systemCore.nix
          ./modules/systemConfig/systemBoot.nix
          ./modules/systemConfig/systemUsers.nix
          ./modules/systemConfig/systemPkgs.nix
          #./modules/systemConfig/systemWayland.nix
          ./modules/systemConfig/systemXlibre.nix
          ./modules/systemConfig/vm.nix

          xlibre-overlay.nixosModules.overlay-xlibre-xserver
          xlibre-overlay.nixosModules.overlay-all-xlibre-drivers
        ];
      };

      #home level config
      homeConfigurations.dev = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home.nix
        ];
        extraSpecialArgs = {
          inherit inputs;
        };
      };

      apps.${system} = {
        #   default = self.apps.${system}.dev;
        dev = {
          type = "app";
          program = "${self.homeConfigurations.dev.activationPackage}/activate";
        };
      };
    };

}
