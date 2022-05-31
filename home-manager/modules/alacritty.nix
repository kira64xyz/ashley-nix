{ pkgs, ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
      font = {
        size = 9;
        normal.family = "FuraCode Nerd Font";
      };

      window.padding = {
        x = 3;
        y = 3;
      };

      draw_bold_text_with_bright_colors = true;
  
      key_bindings = let
        mod = "Alt";
      in [
        {
          mods = mod;
          key = "C";
          action = "Copy";
        } {
          mods = mod;
          key = "V";
          action = "Paste";
        }
  
        {
          mods = "${mod}";
          key = "K";
          action = "ScrollLineUp";
        } {
          mods = "${mod}";
          key = "J";
          action = "ScrollLineDown";
        } {
          mods = "${mod}";
          key = "U";
          action = "ScrollPageUp";
        }
  
        {
          mods = mod;
          key = "F";
          mode = "~Search";
          action = "SearchForward";
        }
      ];

      colors = {
        primary = {
          background = "#1e1e2e";
          foreground = "#cdd6f4";
        };

        normal = {
          black   = "#1e1e2e";
          red     = "#f38ba8";
          green   = "#a6e3a1";
          yellow  = "#f9e2af";
          blue    = "#89b4fa";
          magenta = "#cba6f7";
          cyan    = "#f5c2e7";
          white   = "#cdd6f4";
        };

        bright = {
          black   = "#575268";
          red     = "#f38ba8";
          green   = "#a6e3a1";
          yellow  = "#f9e2af";
          blue    = "#89b4fa";
          magenta = "#cba6f7";
          cyan    = "#f5c2e7";
          white   = "#cdd6f4";
        };
      };
    };
  };
}
