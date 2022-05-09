{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader.grub = { 
      enable = true;
      version = 2;
      device = "nodev";
    };
  };

  networking = { 
    hostName = "fragile";
    networkmanager.enable = true;
  };

  time.timeZone = "Europe/Berlin";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "uk";
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    #jack.enable = true;
  };

  services.openntpd.enable = true;

  hardware.trackpoint.emulateWheel = true;

  users.users.kira = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "kvm" ];
  };

  environment.systemPackages = with pkgs; [
    curl
    neovim
  ];

  programs.sway.enable = true;

  programs.gnupg.agent = {
    enable = true;
    pinentryFlavor = "gnome3";
  };

  nix = {
    package = pkgs.nixUnstable;
    settings = rec {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };
  };

  system.stateVersion = "21.11";

}

