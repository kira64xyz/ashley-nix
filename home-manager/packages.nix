{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Mail
    mutt urlview

    # Media
    mpv ffmpeg exiftool
    mpd ncmpcpp mpc-cli
    yt-dlp zathura
    xwallpaper nsxiv
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
    firefox ungoogled-chromium

    # Development
    git nixpkgs-review
    github-cli

    # X11
    xorg.xmodmap polybar 
    xclip picom i3lock
    dunst st dmenu maim
    gnome3.adwaita-icon-theme

    # Fonts
    inconsolata-nerdfont
    noto-fonts-cjk
    noto-fonts-emoji 

    # Yubikey
    yubico-pam 
    yubikey-personalization

    # Plan 9
    drawterm plan9port

    # Misc
    alsa-utils htop file
    monero qemu tmux 
    unzip keepassxc
  ];
}
