{
  description = "My Home Manager config";

  nixConfig = {
    substituters = [
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store?priority=10"
    ];
  };

  inputs = {
    apple-fonts.url = "github:Lyndeno/apple-fonts.nix";
    apple-fonts.inputs.nixpkgs.follows = "nixpkgs";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs =

    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      apple-fonts,
      ...
    }@inputs:

    let

      system = "x86_64-linux";
      lib = nixpkgs.lib;
      hostname = "ammv";
      pkgs = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
      username = "ammv";
      homeDirectory = "/home/ammv/";

    in

    {
      nixosConfigurations.${hostname} = lib.nixosSystem {

        inherit system;
        modules = [
          ./configuration.nix
        ];

      };

      homeConfigurations.ammv = home-manager.lib.homeManagerConfiguration {

        inherit pkgs;
        modules = [
          #gtk
          {
            gtk = {
              enable = true;
              font = {
                name = "SF Pro Text"; # Ganti sesuai hasil fc-list
                size = 8;
              };

            };
          }
          #Neovim nightly
          {

            programs.neovim = {
              enable = true;
              package = inputs.neovim-nightly-overlay.packages.${system}.default;
            };
          }

          #home config
          {
            home.username = username;
            home.homeDirectory = homeDirectory;
            home.stateVersion = "25.05";
          }
          #packages
          ./user/pkgs.nix
        ];

        extraSpecialArgs = {
          apple-fonts = apple-fonts.packages.x86_64-linux;
        };

      };

      apps.${system}.default = {
        type = "app";
        program = "${self.homeConfigurations.${username}.activationPackage}/activate";
      };
    };
}
