{ config, pkgs, ... }:

{
  imports = [
    ./packages.nix
    ./modules/bash.nix
    ./modules/vim.nix
    ./modules/dunst.nix
    ./modules/locker.nix
    ./modules/tmux.nix
    ./modules/git.nix
  ];

  nixpkgs.overlays = [
    (self: super: {
      st = super.st.overrideAttrs (_: {
        patches = [ ./patches/my-st-patch.diff ];
      });
      dwm = super.dwm.overrideAttrs (_: {
        patches = [ 
          ./patches/my-dwm-patch.diff 
          ./patches/fibonacci.diff 
          ./patches/attachbelow.diff 
          ./patches/systray.diff 
          ./patches/titlecolor.diff
        ];
      });
      dmenu = super.dmenu.overrideAttrs (_: {
        patches = [ ./patches/my-dmenu-patch.diff ];
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
