{ config, pkgs, ... }:

{
  imports = [
    ./packages.nix
    ./modules/bash.nix
    ./modules/vim.nix
    ./modules/tmux.nix
    ./modules/git.nix
  ];

  nixpkgs.config = {
    allowUnfree = true;
    nativeOnly = true;
    packageOverrides = pkgs: {
      stable = import <nixos-stable> { config = config; };
    };
    nixpkgs.config.fonts.fonts = with pkgs; [
      noto-fonts-emoji
      noto-fonts-cjk
    ];
    fonts.fontconfig.allowType1 = true;
    fonts.fontconfig.defaultFonts.emoji = with pkgs; [
      noto-fonts-emoji
    ];
  };

  # Shell Options
  programs.command-not-found.enable = true;

  fonts.fontconfig.enable = true;

  programs.home-manager = {
    enable = true;
    path = "…";
  };
}
