{ config, pkgs, ... }:

{
  imports = [
    ./packages.nix
    ./modules/bash.nix
    ./modules/tmux.nix
    ./modules/nvim.nix
    ./modules/git.nix
    ./modules/dunst.nix
    ./modules/bspwm.nix
    ./modules/sxhkd.nix
  ];

  nixpkgs.overlays = [
    (self: super: {
      st = super.st.overrideAttrs (_: {
        patches = [ ./patches/st.diff ];
      });
      dmenu = super.dmenu.overrideAttrs (_: {
        patches = [ ./patches/dmenu.diff ];
      });
    })
  ];

  systemd.user.targets.xsession = {
    Unit = {
      Description = "xorg session";
      BindsTo = [ "graphical-session.target" ];
      Wants = [ "graphical-session-pre.target" ];
      After = [ "graphical-session-pre.target" ];
    };
  };

  nixpkgs.config = {
    allowUnfree = false;
    nativeOnly = true;
    nixpkgs.config.fonts.fonts = with pkgs; [
      noto-fonts-emoji
      noto-fonts-cjk
      inconsolata-nerdfont
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
