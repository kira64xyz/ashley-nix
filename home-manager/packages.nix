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

    # Games
    prboom-plus
    quakespasm
    sameboy

    # Networking & Internet
    nmap tcpdump
    arp-scan tor
    qbittorrent
    ungoogled-chromium
    firefox i2pd

    # Development
    git nixpkgs-review
    github-cli

    # Wayland
    swaylock-fancy
    wl-clipboard swaybg
    dunst bemenu
    wlr-randr imv
    sway-contrib.grimshot
    gnome3.adwaita-icon-theme

    # Fonts
    fira-code
    inconsolata-nerdfont
    noto-fonts-cjk
    noto-fonts-emoji

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
