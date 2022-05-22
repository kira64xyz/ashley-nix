{ nixpkgs, ... } @ inputs:
let
  inherit (nixpkgs) lib;
in
rec {
  createSystem = profile:
    { system
    , hostname
    , modules ? []
    , extraConfig ? {}
    , ... } @ args:

    let
      _modules = modules;
    in
    nixpkgs.lib.nixosSystem rec {
      inherit system;

      specialArgs = {
        inherit (profile) username;
        inherit system;
      } // inputs;

      modules = [({ networking.hostName = hostname; })]
        ++ _modules
        ++ (profile.modules or [])
        ++ [(( profile.extraConfig or {} // extraConfig ))]; # TODO: this line is causing errors when profile.extraConfig is defined as a function
    };
}
