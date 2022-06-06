{ pkgs, ...}:

let
  mod = "Mod4";

  terminal = "alacritty";

  workspaces = {
    ws1  = "1";
    ws2  = "2";
    ws3  = "3";
    ws4  = "4";
    ws5  = "5";
    ws6  = "6";
    ws7  = "7";
    ws8  = "8";
    ws9  = "9";
    ws10 = "10";
  };

  # Colors
  colorRosewater = "#f5e0dc";
  colorMauve = "#cba6f7";
  colorBase = "#1e1e2e";
  colorText = "#cdd6f4";
  colorSurface = "#585b70";
in {
  imports = [
    ./bar.nix
  ];

  wayland.windowManager.sway = {
    enable = true;

    #xwayland = false;

    config = {
      modifier = mod;
      keybindings = import ./keybindings.nix { inherit pkgs mod workspaces terminal; };
      fonts = {
        names = [ "FuraCode Nerd Font" ];
        size = 9.0;
      };

      defaultWorkspace = "workspace ${workspaces.ws1}";

      gaps = {
        inner = 2;
        outer = 3;
      };

      window.commands = [
        { command = "border pixel 1"; criteria.class = "^.*"; }
      ];

      startup = [
        { command = "wl-wallpaper"; always = false; }
      ];

      input."*" = {
        xkb_layout = "eu";
        xkb_options = "caps:swapescape";
        repeat_delay = "300";
        repeat_rate = "50";
      };

      colors = {
        focused = { background = colorMauve; border = colorMauve; childBorder = colorMauve; text = colorBase; indicator = colorMauve; };
        focusedInactive = { background = colorBase; border = colorBase; childBorder = colorBase; text = colorSurface; indicator = colorMauve; };
        unfocused = { background = colorBase; border = colorMauve; childBorder = colorBase; text = colorText; indicator = colorBase; };
        urgent = { background = "#e53935"; border = "#e53935"; childBorder = "#e53935"; text = colorText; indicator = colorBase; };
      };

      seat."*".xcursor_theme = "Adwaita 24";

      bars = [ {
        statusCommand = "${pkgs.i3status}/bin/i3status";
        position = "bottom";

        fonts = {
          names = [ "FuraCode Nerd Font" ];
          size = 9.0;
        };

        colors = {
          background = colorBase;
          separator = "757575";
          focusedWorkspace = { background = colorMauve; border = colorBase; text = colorBase; };
          activeWorkspace = { background = colorBase; border = colorBase; text = colorText; };
          inactiveWorkspace = { background = colorBase; border = colorBase; text = colorSurface; };
          urgentWorkspace = { background = colorRosewater; border = colorRosewater; text = colorBase; };
        };
      } ];
    };
  };
}
