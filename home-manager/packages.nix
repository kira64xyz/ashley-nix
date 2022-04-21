{ pkgs, ... }:

{
  home.packages = with pkgs;[
    mpv ffmpeg xorg.xev
    polybar inconsolata-nerdfont
    monero catgirl mutt
    gnome3.adwaita-icon-theme
    xclip yubico-pam htop
    yubikey-personalization
    firefox git exiftool
    noto-fonts-emoji dunst st
    python3 qemu nmap tcpdump
    tor-browser-bundle-bin
    i3lock noto-fonts-cjk
    toxic tor dmenu nsxiv
    gimp tmux imagemagick
    unzip maim alsa-utils
    nheko libnotify arp-scan
    keepassxc qbittorrent
    xwallpaper yt-dlp
    plan9port newsboat
    mpd ncmpcpp aria2
    openssl picom
    drawterm mpc-cli
    chocolateDoom
    zathura quakespasm
    xorg.xmodmap
    sameboy
  ];
}
