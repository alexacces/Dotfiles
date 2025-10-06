{
  description = "My Home Manager config";

  nixConfig = {
    substituters = [
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store?priority=10"
      "https://cache.nixos.org/"
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
      username = "ammv";
      homeDirectory = "/home/ammv/";
      hostname = "ammv";

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
          {
            programs.niri.enable = true;

            fonts.packages = with pkgs; [
              nerd-fonts.fira-code
              nerd-fonts.droid-sans-mono
            ];

          }
          inputs.xlibre-overlay.nixosModules.overlay-xlibre-xserver
          inputs.xlibre-overlay.nixosModules.overlay-xlibre-xf86-input-libinput
          ./configuration.nix
          ./x11awesome.nix
        ];

      };

      homeConfigurations.ammv = home-manager.lib.homeManagerConfiguration {

        inherit pkgs;
        modules = [

          # gtk
          {
            gtk = {
              enable = true;
              font = {
                name = "SF Pro Display"; # Ganti sesuai hasil fc-list
                size = 11;
              };

            };
            xdg.portal = {
              enable = true;
              extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
              config.common.default = "*";
            };
            #Neovim nightly

            programs.neovim = {
              enable = true;
              package = inputs.neovim-nightly-overlay.packages.${system}.default;
            };

            #home config
            home.username = username;
            home.homeDirectory = homeDirectory;
            home.stateVersion = "25.05";
          }

          #packages
          ./user/pkgs.nix
        ];

        extraSpecialArgs = {
          apple-fonts = apple-fonts.packages.x86_64-linux;
          inherit inputs;
        };

      };

      apps.${system}.default = {
        type = "app";
        program = "${self.homeConfigurations.${username}.activationPackage}/activate";
      };
    };
}
