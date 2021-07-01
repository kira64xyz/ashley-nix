{ pkgs, ... }:

{
  home.packages = with pkgs;[
    mpv ffmpeg alsa-utils
    polybar hack-font
    siji termsyn monero
    gnome3.adwaita-icon-theme
    weechat xclip yubico-pam
    yubikey-personalization
    firefox git exiftool
    noto-fonts-emoji dunst st
    python3 qemu nmap
    wireshark torbrowser
    xss-lock i3lock noto-fonts-cjk
    toxic tor dmenu sxiv
    gimp tmux imagemagick
    unzip brightnessctl
    nheko libnotify arp-scan
    keepassxc qbittorrent
    wireguard htop 
    xwallpaper youtube-dl
  ];
}
