{
  description = "My Home Manager config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      username = "ammv";
      homeDirectory = "/home/ammv/";
    in
    {
      homeConfigurations.ammv = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
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
