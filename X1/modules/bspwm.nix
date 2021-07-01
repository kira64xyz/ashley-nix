{pkgs, ...}: {
  xsession.windowManager.bspwm = {
    enable = true;
    
    monitors = {
      eDP1 = ["term" "web" "code" "music" "pass"];
    };

    rules = {
      "firefox" = {
        desktop = "^3";
      };
      "keepassxc" = {
        desktop = "^2";
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
    ];
  };
}
