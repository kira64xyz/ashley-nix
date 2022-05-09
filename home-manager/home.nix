{ config, pkgs, ... }:

{
  imports = [
    ./packages.nix
    ./modules/alacritty.nix
    ./modules/bash.nix
    ./modules/dunst.nix
    ./modules/git.nix
    ./modules/nvim.nix
    ./modules/sway/sway.nix
    ./modules/tmux.nix
  ];

  nixpkgs.config = {
    allowUnfree = false;
    nativeOnly = true;
    fonts = {
      enableDefaultFonts = true;
      fonts = with pkgs; [
        fira-code
        inconsolata-nerdfont
        noto-fonts-emoji
        noto-fonts-cjk
      ];
      fontconfig = {
        allowType1 = true;
        defaultFonts.emoji = with pkgs; [
          noto-fonts-emoji
        ];
      };
    };
  };

  programs.command-not-found.enable = true;

  fonts.fontconfig.enable = true;

  programs.home-manager = {
    enable = true;
    path = "…";
  };
}
