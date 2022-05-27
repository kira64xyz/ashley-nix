{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Mail
    mutt urlview

    # Media
    mpv ffmpeg exiftool
    mpd ncmpcpp mpc-cli
    yt-dlp zathura
    newsboat gimp 

    # Chat
    catgirl toxic

    # Games & Emulators
    prboom-plus
    quakespasm
    sameboy

    # Networking & Internet
    nmap tcpdump
    arp-scan tor i2pd
    qbittorrent
    tor-browser-bundle-bin

    # Development
    git jq

    # Wayland
    swaylock-fancy
    wl-clipboard swaybg
    dunst bemenu
    wlr-randr imv
    sway-contrib.grimshot

    # Fonts
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
    inconsolata
    noto-fonts-cjk

    # Yubikey
    yubico-pam 
    yubikey-personalization

    # Plan 9
    drawterm plan9port

    # Misc
    alsa-utils htop-vim file
    monero qemu tmux 
    unzip keepassxc
  ];
}
