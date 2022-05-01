{pkgs, ...}: {
  services.sxhkd = {
    enable = true;
    keybindings = {
      "super + p" = "dmenu_run -p 'run:'";
      "super + shift + Return" = "st";
      "super + shift + r" = "bspc wm -r";
      "super + {_, shift + } {1-6,0}" = "bspc {desktop -f, node -d} '^{1-6,10}'";
      "super + {_, shift + } Tab" = "bspc {desktop -f, node -d} 'last'";
      "super + {_, shift + } space" = "bspc node focused -t {floating, tiled}";
      "super + shift + Escape" = "pkill -USR1 -x sxhkd";
      "super + shift + e" = "sysact";
      "super + {_, shift + }c" = "bspc node -{c,k}";
      "super + shift + Delete" = "bspc quit";
      "super + {h,j,k,l}" = "bspc node -f {west,south,north,east}";
      "super + shift + {h,j,k,l}" = "bspc node -n {west,south,north,east} --follow";
      "super + m" = "st -e mutt";
      "super + n" = "st -e ncmpcpp";
      "super + b" = "st -e newsboat";
      "super + v" = "st -e htop";
      "super + w" = "firefox";
      "super + shift + w" = "chromium";
      "super + s" = "dmenuhandler";
      "super + shift + s" = "dmenuplumb";
      "super + e" = "9 acme";
      "super + shift + t" = "qbittorrent";
      "super + shift + o" = "music";
      "super + shift + p" = "mpc toggle";
      "super + shift + bracket{left,right}" = "mpc {prev,next}";
      "XF86AudioRaiseVolume" = "amixer sset Master 5%+";
      "XF86AudioLowerVolume" = "amixer sset Master 5%-";
      "XF86AudioMicMute" = "amixer sset Capture toggle";
      "XF86ScreenSaver" = "/home/kira/bin/lock";
      "Print" = "/home/kira/bin/screenshot";
    };
  };
}
