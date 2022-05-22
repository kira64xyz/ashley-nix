{ config, pkgs, ... }:

{
  imports = [
    ./packages.nix
    ./modules/alacritty.nix
    ./modules/bash.nix
    ./modules/dunst.nix
    ./modules/git.nix
    ./modules/nvim.nix
    ./modules/qutebrowser.nix
    ./modules/sway/sway.nix
    ./modules/tmux.nix
  ];

  gtk = {
    enable = true;

    theme = {
      name = "Arc-Dark";
      package = pkgs.arc-theme;
    };

    iconTheme = {
      name = "Arc";
      package = pkgs.arc-icon-theme;
    };
  };

  nixpkgs.config = {
    allowUnfree = false;
    nativeOnly = true;
    fonts.fontconfig.allowType1 = true;
  };

  programs.command-not-found.enable = true;

  fonts.fontconfig.enable = true;

  programs.home-manager = {
    enable = true;
    path = "…";
  };
}
