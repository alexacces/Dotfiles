{
  description = "Nixos flakes + Home-manager";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nixpkgs-unstable,
      ...
    }@inputs:
    let
      #System config
      system = "x86_64-linux";
      timezone = "Asia/Jakarta";
      version = "25.05";
      hostname = "nixos";

      #User config

      name = "dev";
      homeDirectory = "/home/${name}";
      groups = [
        "wheel"
        "libvirtd"
      ];

      unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      #system level config
      nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit
            timezone
            version
            name
            groups
            hostname
            ;
        };
        system = system;
        modules = [
          ./modules/systemConfig/systemCore.nix
          ./modules/systemConfig/systemBoot.nix
          ./modules/systemConfig/systemUsers.nix
          ./modules/systemConfig/systemPkgs.nix
          ./modules/systemConfig/systemWayland.nix
          ./modules/systemConfig/vm.nix

        ];
      };

      #home level config
      homeConfigurations.${name} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home.nix
        ];
        extraSpecialArgs = {
          inherit
            inputs
            unstable
            version
            name
            homeDirectory
            ;

        };
      };
    };
}
