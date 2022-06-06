{ pkgs, config, ... }:

{
  networking.firewall.allowedTCPPorts = [ 3000 ];

  services.hydra = {
    enable = true;
    hydraURL = "http://nixsrv.fritz.box:3000"; # externally visible URL
    notificationSender = "hydra@localhost"; # e-mail of hydra service
    # a standalone hydra will require you to unset the buildMachinesFiles list to avoid using a nonexistant /etc/nix/machines
    buildMachinesFiles = [];
    # you will probably also want, otherwise *everything* will be built from scratch
    useSubstitutes = true;
  };

  nix.buildMachines = [
    { 
      hostName = "localhost";
      system = "x86_64-linux";
      supportedFeatures = ["kvm" "nixos-test" "big-parallel" "benchmark"];
      maxJobs = 2;
    }
  ];
}
