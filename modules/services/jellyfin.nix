{ pkgs, lib, config, ... }:

{
  # 1. enable vaapi on OS-level
  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
    ];
  };

  # 2. allow jellyfin user to access the graphics card
  users.users.${config.services.jellyfin.user}.extraGroups = [ "video" "render" ];

  # 3. override default hardening measure from NixOS
  systemd.services.jellyfin.serviceConfig = {
    PrivateDevices = lib.mkForce false;
    DeviceAllow = lib.mkForce [ "/dev/dri/renderD128" ];
  };

  # 4. do not forget to enable jellyfin
  services.jellyfin.enable = true;

  # 5. enable nginx interface
  networking.firewall.allowedTCPPorts = [ 80 443 ];

  services.nginx = {
    enable = true;
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;

    virtualHosts."nixsrv.fritz.box" = {
      locations."/" = {
        proxyPass = "http://localhost:8096";
      };
    };
  };
}

