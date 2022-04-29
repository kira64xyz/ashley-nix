{ pkgs, ... }:

{
  programs.bash = 
  {
    enable = true;

    sessionVariables = {
      PATH    = "$PATH:$HOME/bin";
      EDITOR  = "nvim";
      VISUAL  = "nvim";
      LESSHST = "/dev/null";
    }; shellOptions = [
      "autocd"
    ];
    shellAliases = {
      hms    = "home-manager switch --flake $HOME/.config/nixpkgs#kira";
      build  = "nix-build -E '((import <nixpkgs> {}).callPackage (import ./default.nix) { })'";
      myip   = "curl ipinfo.io/ip && echo";
      ls     = "ls --color";
      lc     = "ls -F";
      la     = "ls -la";
      lh     = "ls -lh";
      lah    = "ls -lah";
      lm     = "ls -t -1";
      lt     = "du -hd 1";
      cp     = "cp -iv";
      mv     = "mv -iv";
      rm     = "rm -v";
      sxiv   = "nsxiv";
      view   = "nvim -R";
      ytdl   = "yt-dlp --add-metadata -f 'bestvideo[height<=?1080]+bestaudio/best'";
      ytdla  = "ytdl -x -f bestaudio/best";
      sdn    = "poweroff";
      monero = "monero-wallet-cli --log-file /dev/null";
    };
    initExtra = ''
      set -o vi
      bind -m vi-insert 'Control-l: clear-screen'
      PS1="\[\033[1;36m\]\u@\h \[\033[1;34m\]\w \$\[\033[0m\] "
    '';
  };

}
