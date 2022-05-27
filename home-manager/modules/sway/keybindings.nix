{ pkgs, mod, workspaces, terminal }:

{
  "${mod}+Shift+q" = "exec [ \"$(printf \"No\\nYes\" | bmenu -i -p \"Would you like to exit i3?\")\" = \"Yes\" ] && ${pkgs.sway}/bin/swaymsg exit";
  "${mod}+Shift+r" = "reload";
  "${mod}+Shift+b" = "border toggle";

  "${mod}+p" = "exec ${pkgs.bemenu}/bin/bemenu-run --ff '#D9E0EE' --fb '#1E1E2E' --tf '#1E1E2E' --tb '#C9CBFF' --hf '#1E1E2E' --hb '#C9CBFF' --nf '#D9E0EE' --nb '#1E1E2E'";

  # General programs
  "${mod}+Shift+Return" = "exec ${terminal}";
  "${mod}+m" = "exec ${terminal} -e mutt";
  "${mod}+n" = "exec ${terminal} -e ncmpcpp";
  "${mod}+b" = "exec ${terminal} -e newsboat";
  "${mod}+w" = "exec ${pkgs.tor-browser-bundle-bin}/bin/tor-browser";
  "${mod}+Shift+w" = "exec ${pkgs.qutebrowser}/bin/qutebrowser";

  # Scripts
  "${mod}+x" = "exec dmenuplumb";
  "${mod}+Shift+x" = "exec dmenuhandler";
  "${mod}+Shift+e" = "exec dock";

  # MPD
  "${mod}+Shift+o" = "exec music";
  "${mod}+Shift+p" = "exec mpc toggle";
  "${mod}+Shift+bracketleft" = "exec mpc prev";
  "${mod}+Shift+bracketright" = "exec mpc next";

  # Navigation
  "${mod}+h" = "focus left";
  "${mod}+l" = "focus right";
  "${mod}+k" = "focus up";
  "${mod}+j" = "focus down";
  "${mod}+Shift+h" = "move left";
  "${mod}+Shift+l" = "move right";
  "${mod}+Shift+k" = "move up";
  "${mod}+Shift+j" = "move down";
  "${mod}+Ctrl+h" = "resize shrink width 10 px or 10 ppt";
  "${mod}+Ctrl+l" = "resize grow width 10 px or 10 ppt";
  "${mod}+Ctrl+k" = "resize shrink height 10 px or 10 ppt";
  "${mod}+Ctrl+j" = "resize grow height 10 px or 10 ppt";
  "${mod}+v" = "split v";
  "${mod}+Shift+v" = "split h";
  "${mod}+s" = "layout stacking";
  "${mod}+t" = "layout tabbed";
  "${mod}+e" = "layout toggle split";
  "${mod}+f" = "fullscreen toggle";
  "${mod}+Shift+space" = "floating toggle";
  "${mod}+space" = "focus mode_toggle";
  "${mod}+a" = "focus parent";
  "${mod}+Shift+c" = "kill";
  "${mod}+1" = "workspace ${workspaces.ws1}";
  "${mod}+2" = "workspace ${workspaces.ws2}";
  "${mod}+3" = "workspace ${workspaces.ws3}";
  "${mod}+4" = "workspace ${workspaces.ws4}";
  "${mod}+5" = "workspace ${workspaces.ws5}";
  "${mod}+6" = "workspace ${workspaces.ws6}";
  "${mod}+7" = "workspace ${workspaces.ws7}";
  "${mod}+8" = "workspace ${workspaces.ws8}";
  "${mod}+9" = "workspace ${workspaces.ws9}";
  "${mod}+0" = "workspace ${workspaces.ws10}";
  "${mod}+Tab" = "workspace back_and_forth";
  "${mod}+Shift+1" = "move container to workspace ${workspaces.ws1}";
  "${mod}+Shift+2" = "move container to workspace ${workspaces.ws2}";
  "${mod}+Shift+3" = "move container to workspace ${workspaces.ws3}";
  "${mod}+Shift+4" = "move container to workspace ${workspaces.ws4}";
  "${mod}+Shift+5" = "move container to workspace ${workspaces.ws5}";
  "${mod}+Shift+6" = "move container to workspace ${workspaces.ws6}";
  "${mod}+Shift+7" = "move container to workspace ${workspaces.ws7}";
  "${mod}+Shift+8" = "move container to workspace ${workspaces.ws8}";
  "${mod}+Shift+9" = "move container to workspace ${workspaces.ws9}";
  "${mod}+Shift+0" = "move container to workspace ${workspaces.ws10}";
  "${mod}+Shift+Tab" = "move container to workspace back_and_forth";

  # Volume control
  "XF86AudioMute" = "exec amixer sset Master toggle";
  "XF86AudioMicMute" = "exec amixer sset Capture toggle";
  "XF86AudioRaiseVolume" = "exec amixer sset Master 5%+";
  "XF86AudioLowerVolume" = "exec amixer sset Master 5%-";
  "XF86ScreenSaver" = "exec ${pkgs.swaylock-fancy}/bin/swaylock-fancy";

  "Print" = "exec ${pkgs.sway-contrib.grimshot}/bin/grimshot --notify save area";
  "${mod}+Print" = "exec ${pkgs.sway-contrib.grimshot}/bin/grimshot --notify save screen";
}
