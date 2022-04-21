{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.loader.grub = { 
    enable = true;
    version = 2;
    device = "nodev";
  };

  networking = { 
    hostName = "fragile";
    networkmanager.enable = true;
    useDHCP = false;
    interfaces.eno0.useDHCP = true;
    interfaces.wlp2s0.useDHCP = true;
  };

  time.timeZone = "Europe/Berlin";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "uk";
  };

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    displayManager.startx.enable = true;
    windowManager.bspwm.enable = true;
    layout = "gb";
  };

  hardware.trackpoint.emulateWheel = true;

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    #jack.enable = true;
  };

  users.users.kira = {
    isNormalUser = true;
    extraGroups = [ "wheel" "network" "kvm" ];
  };

  environment.systemPackages = with pkgs; [
    curl
  ];

  programs.gnupg.agent.enable = true;

  nix = {
    package = pkgs.nixUnstable;
    settings = rec {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };
  };

  system.stateVersion = "21.11";

}

