{ pkgs, ... }:

{
  home.packages = with pkgs;[
    mpv ffmpeg
    yubico-pam
    yubikey-personalization
    monero-gui
    firefox git exiftool
    qemu nmap
    wireshark tor-browser
    gimp tmux
    nheko libnotify
    keepassxc qbittorrent
    wireguard htop 
    youtube-dl
  ];
}
