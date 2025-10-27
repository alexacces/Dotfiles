{
  description = "My Home Manager config";

  nixConfig = {
    substituters = [
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store?priority=10"
      "https://cache.nixos.org/"
      "https://niri.cachix.org"
    ];
  };

  inputs = {
    xlibre-overlay = {
      url = "git+https://codeberg.org/takagemacoed/xlibre-overlay";
    };
    apple-fonts = {
      url = "github:Lyndeno/apple-fonts.nix";
    };
    nixpkgs-unstable = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-25.05";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
    };
    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
    };
    niri = {
      url = "github:sodiboo/niri-flake";
    };
  };

  outputs =

    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      apple-fonts,
      niri,
      ...
    }@inputs:

    let

      system = "x86_64-linux";
      username = "ammv";
      homeDirectory = "/home/ammv/";
      hostname = "nixos";

      lib = nixpkgs.lib;
      pkgs = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };

    in

    {
      nixosConfigurations.${hostname} = lib.nixosSystem {

        inherit system;
        modules = [
          niri.nixosModules.niri
          inputs.xlibre-overlay.nixosModules.overlay-xlibre-xserver
          inputs.xlibre-overlay.nixosModules.overlay-xlibre-xf86-input-libinput
          ./host/maxusH61

        ];
        specialArgs = {
          inherit hostname inputs;
        };
      };

      homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {

        inherit pkgs;
        modules = [
          ./modules/users/ammv
        ];

        extraSpecialArgs = {
          apple-fonts = apple-fonts.packages.x86_64-linux;
          inherit
            system
            inputs
            username
            homeDirectory
            ;
        };

      };

      apps.${system}.default = {
        type = "app";
        program = "${self.homeConfigurations.${username}.activationPackage}/activate";
      };
    };
}
