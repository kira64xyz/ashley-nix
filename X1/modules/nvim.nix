{ pkgs, ... }: {

programs.neovim = {
  enable = true;

  viAlias = true;
  vimAlias = true;

  plugins = with pkgs.vimPlugins; [
    vim-nix
    vimspector
  ];
  
  extraConfig = ''
    " Colorscheme options
    set t_Co=256
    set background=dark
    
    set completeopt=noinsert,menuone,noselect
    inoremap <c-c> <ESC>
    " Some basic config
    syntax on
    set relativenumber
    set number
    set tabstop=8
    set mouse=a
  '';
};
}
