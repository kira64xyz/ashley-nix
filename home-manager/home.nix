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
    fonts = {
      enableDefaultFonts = true;
      fonts = with pkgs; [
        inconsolata-nerdfont
        twemoji-color-font
        ipafont
      ];
      fontconfig = {
        allowType1 = true;
        defaultFonts.emoji = with pkgs; [
          twemoji-color-font
        ];
      };
    };
  };

  # Shell Options
  programs.command-not-found.enable = true;

  fonts.fontconfig.enable = true;

  programs.home-manager = {
    enable = true;
    path = "…";
  };
}
