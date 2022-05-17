{
  description = "Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { home-manager, ... }:
    let
      system = "x86_64-linux";
      username = "kira";
    in {
      homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
        configuration = import ./home.nix;

        inherit system username;
        homeDirectory = "/home/${username}";
        stateVersion = "22.05";
      };
    };
}
