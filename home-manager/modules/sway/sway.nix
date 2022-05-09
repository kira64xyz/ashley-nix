{ pkgs, ...}:

let
  mod = "Mod4";

  terminal = "alacritty";

  workspaces = {
    ws1 = "1";
    ws2 = "2";
    ws3 = "3";
    ws4 = "4";
    ws5 = "5";
    ws6 = "6";
    ws7 = "7";
    ws8 = "8";
    ws9 = "9";
  };

  # Colors
  foregroundColor = "#DDB6F2";
  backgroundColor = "#1E1E2E";
  textColor = "#D9E0EE";
  inactiveTextColor = "#988BA2";
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
        names = [ "Inconsolata Nerd Font" ];
        size = 10.0;
      };

      gaps = {
        inner = 2;
        outer = 3;
      };

      window.commands = [
        { command = "border pixel 1"; criteria.class = "^.*"; }
        { command = "move to workspace ${workspaces.ws2}"; criteria.class = "chromium-browser"; }
        { command = "move to workspace ${workspaces.ws2}"; criteria.class = "firefox"; }
      ];

      startup = [
        { command = "wl-wallpaper"; always = false; }
      ];

      input."*" = {
        xkb_variant = "gb";
        xkb_options = "caps:swapescape";
        repeat_delay = "300";
        repeat_rate = "50";
      };

      colors = {
        focused = { background = "#81848c"; border = "#81848c"; childBorder = "#81848c"; text = textColor; indicator = "#81848c"; };
        focusedInactive = { background = backgroundColor; border = backgroundColor; childBorder = backgroundColor; text = inactiveTextColor; indicator = backgroundColor; };
        unfocused = { background = backgroundColor; border = backgroundColor; childBorder = backgroundColor; text = inactiveTextColor; indicator = backgroundColor; };
        urgent = { background = "#e53935"; border = "e53935"; childBorder = "e53935"; text = textColor; indicator = backgroundColor; };
      };

      seat."*".xcursor_theme = "Adwaita 24";

      bars = [ {
        statusCommand = "${pkgs.i3status}/bin/i3status";
        position = "bottom";

        fonts = {
          names = [ "Inconsolata Nerd Font" ];
          size = 10.0;
        };

        colors = {
          background = backgroundColor;
          separator = "757575";
          focusedWorkspace = { background = foregroundColor; border = backgroundColor; text = backgroundColor; };
          activeWorkspace = { background = backgroundColor; border = backgroundColor; text = textColor; };
          inactiveWorkspace = { background = backgroundColor; border = backgroundColor; text = inactiveTextColor; };
          urgentWorkspace = { background = "#e53935"; border = "e53935"; text = textColor; };
        };
      } ];
    };
  };
}
