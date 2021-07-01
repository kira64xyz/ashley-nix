{pkgs, ...}: {
  services.sxhkd = {
    enable = true;
    keybindings = {
      "alt + p" = "dmenu_run -p 'run:'";
      "alt + shift + Return" = "st -e tmux";
      "alt + shift + r" = "bspc wm -r";
      "alt + {_, shift + } {1-5,0}" = "bspc {desktop -f, node -d} '^{1-5,10}'";
      "alt + shift + Escape" = "pkill -USR1 -x sxhkd";
      "alt + shift + e" = "power.sh";
      "alt + {_,shift + }c" = "bspc node -{c,k}";
      "alt + shift + Delete" = "bspc quit";
      "super + shift + k" = "kaomoji_dmenu.sh";
      "alt + {h,j,k,l}" = "bspc node -f {west,south,north,east}";
      "alt + shift + {h,j,k,l}" = "bspc node -n {west,south,north,east} --follow";
      "XF86AudioRaiseVolume" = "amixer sset Master 5%+";
      "XF86AudioLowerVolume" = "amixer sset Master 5%-";
      "XF86AudioMute" = "amixer sset Master toggle";
      "XF86MonBrightnessUp" = "brightnessctl s +5%";
      "XF86MonBrightnessDown" = "brightnessctl s 5%-";
      "Print" = "screenshot.sh";
    };
  };
}
