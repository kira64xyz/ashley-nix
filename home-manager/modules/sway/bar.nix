{ pkgs, ...}:

{
  programs.i3status = {
    enable = true;

    general = {
      colors = true;
      color_good = "#C9CBFF";
      color_degraded = "#F5C2E7";
      color_bad = "#F28FAD";
    };

    modules = {
      "battery all" = {
        position = 4;
        settings = {
          last_full_capacity = true;
          format = "%status %percentage %remaining";
        };
      };

      memory = {
        position = 7;
        settings.format = "%used/%total (%available)";
      };

      "tztime local" = {
        position = 8;
        settings.format = "%a %d-%m-%Y %H:%M";
      };
    };
  };
}
