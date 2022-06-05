{ pkgs, config, ... }:

let
  catppuccin = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/NarutoXY/qutebrowser/main/catppuccin.py";
    sha256 = "sha256-71XveJA3ndPFMbT5WMIxtlz4PlxbIRDdrMX7UqnIYRo=";
    name = "qutebrowser-catppuccin.py";
  };
in {
  programs.qutebrowser = {
    enable = true;

    # Apply theme
    extraConfig = builtins.readFile catppuccin;

    settings = {
      colors.webpage.preferred_color_scheme = "dark";
      content.javascript.enabled = false;
      downloads.location.directory = "$HOME/downloads";

      url = {
        start_pages = "https://searx.puffyan.us";
        default_page = "https://searx.puffyan.us";
      };
    };
  
    keyBindings = {
      normal = {
        "<Alt-o>" = "spawn --verbose --detach mpv {url}";
        "<Alt-Shift-o>" = "hint links spawn --verbose --detach mpv {hint-url}";
        "<Alt-c>" = "spawn wl-copy {url}";
        "<Alt-Shift-c>" = "hint links spawn wl-copy {hint-url}";
      };
      prompt = { "<Alt-y>" = "prompt-yes"; };
    };

    searchEngines = {
      DEFAULT = "https://searx.puffyan.us/search?q={}";
      git = "https://github.com/search?q={}";
      nixopts = "https://search.nixos.org/options?query={}&channel=unstable";
      nixpkgs = "https://search.nixos.org/packages?query={}&channel=unstable";
      yt = "https://vid.puffyan.us/results?search_query={}";
    };
  
    quickmarks = {
      dotfiles = "https://github.com/kira64xyz/ashley-nix";
      youtube = "https://vid.puffyan.us/";
      catppuccin = "https://github.com/catppuccin/catppuccin";

      github = "https://github.com";
      github-notifications = "https://github.com/notifications";
      nix-manual = "https://nixos.org/manual/nix/unstable";
      nixpkgs = "https://github.com/NixOS/nixpkgs";
      nixpkgs-prs = "https://github.com/NixOS/nixpkgs/pulls";
      nixpkgs-tracker = "https://nixpk.gs/pr-tracker.html";
      nixpkgs-manual = "https://nixos.org/manual/nixpkgs/unstable";
      hydra-trunk = "https://hydra.nixos.org/jobset/nixpkgs/trunk";
      nixos = "https://nixos.org";
      nixos-manual = "https://nixos.org/manual/nixos/unstable";
      nixos-options = "https://search.nixos.org/options?channel=unstable";
      home-manager = "https://github.com/nix-community/home-manager";
      home-manager-manual = "https://nix-community.github.io/home-manager";
      home-manager-options = "https://rycee.gitlab.io/home-manager/options.html";
    };
  };
}
