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
      color = "#bcb8cc";
      frame_color = "#817f7f";
      separator_color = "#817f7f";
      font = "Hack 10";
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
      startup_notification = false;
      force_xinerama = false;
    };

    expertimental.per_monitor_dpi = false;

    shortcuts = {
      close = "ctrl+space";
      close_all = "ctrl+shift+space";
      history = "ctrl+grave";
      context = "ctrl+shift+period";
    };

    urgency_low = {
      background = "#242231";
      foreground = "#bcb8cc";
      timeout = 10;
    };
    urgency_normal = {
      background = "#242231";
      foreground = "#bcb8cc";
      timeout = 10;
    };
    urgency_critical = {
      background = "#242231";
      foreground = "#bcb8cc";
      frame_color = "#ff0099";
      timeout = 20;
    };
  };
}; 
}

