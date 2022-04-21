{pkgs, ...}: {
  xsession.windowManager.bspwm = {
    enable = true;
    
    monitors = {
      LVDS-1 = ["1" "2" "3" "4" "5"];
      DP-2   = ["1" "2" "3" "4" "5"];
    };

    rules = {
      "firefox" = {
        desktop = "^2";
      };
      "keepassxc" = {
        desktop = "^5";
      };
    };

    settings = {
      border_width = 2;
      window_gap = 4;
      focus_follows_pointer = true;
      history_aware_focus = true;
    };

    startupPrograms = [
      "sxhkd"
      "polybar top"
      "picom"
      "/home/kira/bin/wallpaper"
    ];
  };
}
