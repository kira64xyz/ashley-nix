{ pkgs, ... }:

{
  wayland.windowManager.sway = {
    enable = true;
    config.fonts = {
      names = [ "JetBrains Mono" ];
      size = 11.0;
    };
    config.bars = [  ];
    config.terminal = "alacritty";
    extraConfig = ''
      output * scale 1
      default_border pixel 2
      exec autotiling
      exec mako

      # Brightness
      bindsym XF86MonBrightnessDown exec "brightnessctl set 2%-"
      bindsym XF86MonBrightnessUp exec "brightnessctl set +2%"

      # Volume
      bindsym XF86AudioRaiseVolume exec 'amixer sset Master 5%+'
      bindsym XF86AudioLowerVolume exec 'amixer sset Master 5%-'
      bindsym XF86AudioMute exec 'amixer sset Master toggle'

      input * {
       dwt enabled
       tap enabled
       middle_emulation enabled
      }

      bar {
    position top
    # When the status_command prints a new line to stdout, swaybar updates.
    # The default just shows the current date and time.
    status_command while statusw.sh; do sleep 1; done

 #   colors {
  #      statusline #ffffffbb
   #     background #000000aa
    #    inactive_workspace #000000aa #000000aa #ffffffbb
	#focused_workspace #ff7dc9 #ff7dc9 #ffffffbb
#	focused_workspace #282E66 #282E66 #ffffffbb
      }
      }


    '';
  };
}
