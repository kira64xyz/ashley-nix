{ pkgs, ... }:

let
  mod = "Mod1";
in {
  programs.foot = {
    enable = true;

    server.enable = false;

    settings = {
      main = {
        font = "FuraCode Nerd Font:size=7";
        pad = "3x3";
      };

      key-bindings = {
        clipboard-copy = "${mod}+c";
        clipboard-paste = "${mod}+v";

        scrollback-down-line = "${mod}+j";
        scrollback-up-line = "${mod}+k";

        search-start = "${mod}+f";

        show-urls-launch = "${mod}+u";
      };

      search-bindings = {
        find-next = "${mod}+n";
        find-prev = "${mod}+p";

        cursor-left = "${mod}+h";
        cursor-right = "${mod}+l";
        cursor-left-word = "${mod}+b";
        cursor-right-word = "${mod}+w";

        clipboard-paste = "${mod}+v";
      };

      cursor.beam-thickness = 0.5;

      colors = {
        background = "1E1E2E";
        foreground = "D9E0EE";

        regular0 = "1E1E2E";
        regular1 = "F28FAD";
        regular2 = "ABE9B3";
        regular3 = "FAE3B0";
        regular4 = "96CDFB";
        regular5 = "DDB6F2";
        regular6 = "F5C2E7";
        regular7 = "D9E0EE";

        bright0 = "575268";
        bright1 = "F28FAD";
        bright2 = "ABE9B3";
        bright3 = "FAE3B0";
        bright4 = "96CDFB";
        bright5 = "DDB6F2";
        bright6 = "F5C2E7";
        bright7 = "D9E0EE";
      };
    };
  };
}
