{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = inputs @ { self, nixpkgs }: let
    # TODO: Make these platform-agnostic
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in rec {
    lib = import ./lib.nix { inherit (inputs) nixpkgs; };

    profiles = {
      ashley = {
        username = "kira";

        modules = [
          ./configuration.nix
        ];
      };
    };

    nixosConfigurations = {
      fragile = lib.createSystem profiles.ashley rec {
        inherit system;
        specialArgs = { inherit inputs; };
        hostname = "fragile";

        modules = [
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
        specialArgs = { inherit inputs; };
        hostname = "desk";

        modules = [
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
        };
      };
    };
  };
}
