{ pkgs, ...}:

let
  colorBlue = "#89b4fa";
  colorPink = "#f5c2e7";
  colorRed = "#f38ba8";
in {
  programs.i3status = {
    enable = true;

    general = {
      colors = true;
      color_good = colorBlue;
      color_degraded = colorPink;
      color_bad = colorRed;
    };

    modules = {
      ipv6.enable = false;

      "wireless _first_" = {
        position = 1;
        settings.format_up = "W: %quality %ip";
      };

      "battery all" = {
        position = 2;
        settings = {
          last_full_capacity = true;
          format = "%status %percentage %remaining";
        };
      };

      "ethernet _first_" = {
        position = 3;
      };

      "disk /" = {
        position = 4;
        settings.format = "%used/%total (%avail)";
      };

      memory = {
        position = 5;
        settings.format = "%used/%total (%free)";
      };

      load.enable = false;

      "tztime local" = {
        position = 6;
        settings.format = "%a %d-%m-%Y %H:%M";
      };
    };
  };
}
