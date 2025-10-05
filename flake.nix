{
  description = "My Home Manager config";

  nixConfig = {
    substituters = [
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store?priority=10"
    ];
  };

  inputs = {
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
      ...
    }@inputs:
    let
      lib = nixpkgs.lib;
      hostname = "ammv";
      system = "x86_64-linux";
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
          {
            programs.neovim = {
              enable = true;
              package = inputs.neovim-nightly-overlay.packages.${system}.default;
            };
          }
          ./user/ammv.nix
        ];
        extraSpecialArgs = {
          inherit
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
