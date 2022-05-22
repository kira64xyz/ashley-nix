{ config, pkgs, ... }:

{
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Berlin";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    #jack.enable = true;
  };

  services.openntpd.enable = true;

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

