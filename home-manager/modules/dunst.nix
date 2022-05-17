{ pkgs, ... }:

{
  services.dunst = {
    enable = true;

    settings = {
      global = {
        geometry = "300x5-30+20";
        follow = "keyboard";
        shrink = false;
        notification_height = 0;
        separator_height = 2;
        padding = 8;
        horizontal_padding = 8;
        frame_width = 2;
        font = "FuraCode Nerd Font 10";
        line_height = 0;
        markup = "full";
        format = "<b>%s</b>\n%b";
        alignment = "left";
        show_age_threshold = 60;
        word_wrap = true;
        ignore_newline = false;
        stack_duplicates = true;
        hide_duplicate_count = false;
        sticky_history = true;
        history_length = 20;
        always_run_script = true;
        title = "Dunst";
        class = "Dunst";
        icon_position = "left";
        frame_color = "#96CDFB";
        separator_color = "frame";
      };

      expertimental.per_monitor_dpi = false;

      shortcuts = {
        close = "ctrl+space";
        close_all = "ctrl+shift+space";
        history = "ctrl+grave";
        context = "ctrl+shift+period";
      };

      urgency_low = {
        timeout = 5;
        background = "#1E1E2E";
        foreground = "#D9E0EE";
      };

      urgency_normal = {
        timeout = 10;
        background = "#1E1E2E";
        foreground = "#D9E0EE";
      };

      urgency_critical = {
        timeout = 20;
        background = "#1E1E2E";
        foreground = "#D9E0EE";
        frame_color = "#F8BD96";
      };
    };
  }; 
}
