{
  description = "My Home Manager config";
nixConfig = {subtituters = 
[ "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store" ];
};


  inputs = {
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
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
lib = nixpkgs.lib;
	hostname = "ammv";
      system = "x86_64-linux";
      pkgs = import nixpkgs {
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
