{ config, pkgs, ... }:

{
  time.timeZone = "Europe/Berlin";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  users.users.kira = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];

    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCrozDLIavGdcmEb+TWBtdrITYqalHY3kTnCS4oWiasTCj7JVSdjnXsY4ADy7PZcaaZEJHrHbCVFLIIYQ7foSJiRQAoNsVgh/zeuV0yptuZZclnXswKhfuUY4H/6eyZ0y8RkN+NjfqtGLqUVHfTCYjUmRgd4gr0AP+mtLM696ml7Qg1uPtNh8rnJPef9UTk/NpCclUh5YopPxvFrO3G2k1w9LsnkKVTChaVANmHez4vlxHDQRgmmMzhw73phRjkTxq3z9LI6LSsnUPBfqJ7n8cUCbRwhFT1W+ZD3vhlIGNiYBog7xYODmwCmaclnis5u2KXghl8TwKC9+KBlgsh781JNdcgBqzbhQQ9E9CHZCAjVp+Eq+zdzGvV3MWg3bYbVQ/cgzt5MM7S9ZObQW3+sB6Exw0LxxGgHelYjju5q7qX4N/9HtW9v/guuYf5eEtkjvePdHlbYbZfqY7qphDeDecnTltwL7GBmK03/qh3QR24JVwo0gpxW2+sb3xPq7BFJHE= kira@fragile"
    ];
  };

  environment.systemPackages = with pkgs; [
    curl
  ];

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  services = {
    openntpd.enable = true;
    openssh = {
      enable = true;
      kbdInteractiveAuthentication = false;
      passwordAuthentication = false;
      permitRootLogin = "no";
      ports = [ 8088 ];
    };
  };

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
  };

  system.stateVersion = "22.05";

}

