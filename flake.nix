{
  description = "Nixos flakes + Home-manager";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs =
    {
      self,
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
          ./modules/systemConfig/systemCore.nix
          ./modules/systemConfig/systemBoot.nix
          ./modules/systemConfig/systemUsers.nix
          ./modules/systemConfig/systemPkgs.nix
          ./modules/systemConfig/systemWayland.nix

        ];
      };

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
