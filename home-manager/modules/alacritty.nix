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
          background = "#1E1E2E";
          foreground = "#D9E0EE";
        };

        normal = {
          black   = "#1E1E2E";
          red     = "#F28FAD";
          green   = "#ABE9B3";
          yellow  = "#FAE3B0";
          blue    = "#96CDFB";
          magenta = "#DDB6F2";
          cyan    = "#F5C2E7";
          white   = "#D9E0EE";
        };

        bright = {
          black   = "#575268";
          red     = "#F28FAD";
          green   = "#ABE9B3";
          yellow  = "#FAE3B0";
          blue    = "#96CDFB";
          magenta = "#DDB6F2";
          cyan    = "#F5C2E7";
          white   = "#D9E0EE";
        };
      };
    };
  };
}
