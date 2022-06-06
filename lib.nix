{ nixpkgs, ... } @ inputs:
let
  inherit (nixpkgs) lib;
in
rec {
  createSystem = profile:
    { system
    , nixpkgs ? inputs.nixpkgs
    , hostname
    , modules ? []
    , extraConfig ? {}
    , ... } @ args:

    let
      _modules = modules;
    in
      args.nixpkgs.lib.nixosSystem rec {
      inherit system;

      modules = [({ networking.hostName = hostname; })]
        ++ _modules
        ++ (profile.modules or [])
        ++ [(( profile.extraConfig or {} // extraConfig ))]; # TODO: this line is causing errors when profile.extraConfig is defined as a function
    };
}
