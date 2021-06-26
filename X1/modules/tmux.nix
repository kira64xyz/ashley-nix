{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    shortcut = "z";
    terminal = "tmux-256color";
    escapeTime = 0;
    extraConfig = ''
      set -g status-style bg=black
      set -g status-style fg=white
      set -g set-titles on
      set -g mouse on
      bind-key j select-pane -D 
      bind-key k select-pane -U
      bind-key l select-pane -R
      bind-key h select-pane -L
      bind-key x kill-server
      bind-key C new-window -c "#{pane_current_path}"
      bind-key -n C-J previous-window
      bind-key -n C-K next-window
      bind-key '"' split-window -v -c "#{pane_current_path}"
      bind-key '|' split-window -h -c "#{pane_current_path}"
      set-window-option -g window-status-current-style fg=brightcyan
    '';
  };
}
