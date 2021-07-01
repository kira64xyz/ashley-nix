# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot = {
    loader= {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_latest_hardened;
  };

  networking = {
    hostName = "nixos-saturn"; # Define your hostname.
    wireless.iwd.enable = true;
  #  networkmanager = {
  #    enable = true;
  #    unmanaged = [ 
  #      "*" "except:type:wwan" "except:type:gsm"
  #    ];
  #  };
    useDHCP = false;
    interfaces = {
      enp0s31f6.useDHCP = true;
      wlan0.useDHCP = true;
    };
  };

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  services.xserver.windowManager.bspwm.enable = true;
  services.xserver.displayManager.startx.enable = true;

  # Configure keymap in X11
  services.xserver.layout = "us";
  services.xserver.xkbOptions = "caps:swapescape";

  services.xserver.videoDrivers = ["intel"];
  services.xserver.deviceSection = ''
  Option "TearFree" "true"
  '';

  security = {
    doas.enable = true;
    doas.extraRules = [
      { users = [ "ashley" ]; noPass = false; keepEnv = true; }
    ];
    sudo.enable = false;
  };

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    # alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };


  # Enable touchpad support (enabled default in most desktopManager).

  services.xserver.libinput = {
    enable = true;
    touchpad.disableWhileTyping = true;
    touchpad.tappingDragLock = false;
  };

  networking.firewall = {
   # if packets are still dropped, they will show up in dmesg
   logReversePathDrops = true;
   # wireguard trips rpfilter up
   extraCommands = ''
     ip46tables -t raw -I nixos-fw-rpfilter -p udp -m udp --sport 51194 -j RETURN
     ip46tables -t raw -I nixos-fw-rpfilter -p udp -m udp --dport 51194 -j RETURN
     ip46tables -t raw -I nixos-fw-rpfilter -p udp -m udp --sport 51820 -j RETURN
     ip46tables -t raw -I nixos-fw-rpfilter -p udp -m udp --dport 51820 -j RETURN
   '';
   extraStopCommands = ''
     ip46tables -t raw -D nixos-fw-rpfilter -p udp -m udp --sport 51194 -j RETURN || true
     ip46tables -t raw -D nixos-fw-rpfilter -p udp -m udp --dport 51194 -j RETURN || true
     ip46tables -t raw -D nixos-fw-rpfilter -p udp -m udp --sport 51820 -j RETURN || true
     ip46tables -t raw -D nixos-fw-rpfilter -p udp -m udp --dport 51820 -j RETURN || true
   '';
  };

  hardware.bluetooth.enable = false;

  nix = {
    allowedUsers = [ "@wheel" ]; # Allow users in the "wheel" group to control the nix deamon
    autoOptimiseStore = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ashley = {
    isNormalUser = true;
    extraGroups = [ "wheel" "kvm" "network" ]; # Enable root access for the user.
  };

  services.udev.packages = [ pkgs.yubikey-personalization ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  ];

  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.05"; # Did you read the comment?

}

