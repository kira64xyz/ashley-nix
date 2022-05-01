{pkgs, ...}: {
  xsession.windowManager.bspwm = {
    enable = true;
    
    monitors = {
      LVDS1 = [ "1" "2" "3" "4" "5" "6" ];
      DP2   = [ "1" "2" "3" "4" "5" "6" ];
    };

    rules = {
      "firefox".desktop = "^2";
      "Chromium".desktop = "^2";
      "qBittorrent".desktop = "^6";
    };

    settings = {
      border_width = 2;
      window_gap = 4;
      focus_follows_pointer = true;
      history_aware_focus = true;
    };

    startupPrograms = [
      "/home/kira/bin/wallpaper"
      "/home/kira/bin/remaps"
    ];
  };
}
