{ pkgs, ... }:

{
  services.screen-locker = {
    enable = true;
    enableDetectSleep = true;
    inactiveInterval = 30;
    lockCmd = "${pkgs.i3lock}/bin/i3lock -n -c 000000";
  };
}
