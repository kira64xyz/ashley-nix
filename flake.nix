{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-small.url = "github:nixos/nixpkgs/nixos-22.05-small";
  };

  outputs = inputs @ { self, nixpkgs, nixpkgs-small }: let
    # TODO: Make these platform-agnostic
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in rec {
    lib = import ./lib.nix { inherit (inputs) nixpkgs; };

    profiles = {
      ashley = {
        username = "kira";
      };
    };

    nixosConfigurations = {
      fragile = lib.createSystem profiles.ashley rec {
        inherit system;
        hostname = "fragile";
        nixpkgs = inputs.nixpkgs;

        modules = [
          ./modules/desktop.nix
          ./modules/hardware-configuration.nix
        ];

        extraConfig = {
          boot = {
            kernelPackages = pkgs.linuxPackages_latest;
            loader.grub = { 
              enable = true;
              version = 2;
              device = "nodev";
            };
          };
          hardware.trackpoint.emulateWheel = true;
        };
      };

      desk = lib.createSystem profiles.ashley rec {
        inherit system;
        hostname = "desk";
        nixpkgs = inputs.nixpkgs;

        modules = [
          ./modules/desktop.nix
          ./modules/hardware-configuration.nix
        ];

        extraConfig = {
          boot = {
            kernelPackages = pkgs.linuxPackages_latest;
            loader = {
              systemd-boot = {
                enable = true;
                configurationLimit = 10;
              };
              efi.canTouchEfiVariables = false;
            };
          };
          programs.steam.enable = true;
          services = {
            openssh.enable = true;
            zerotierone.enable = true;
          };
          nixpkgs.config.allowUnfree = true;
        };
      };
    };
  };
}
