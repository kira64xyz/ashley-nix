{ pkgs, ... }: {

programs.neovim = {
  enable = true;

  viAlias = true;
  vimAlias = true;

  plugins = with pkgs.vimPlugins; [
    vim-nix
  ];

  extraConfig = ''
    set completeopt=noinsert,menuone,noselect

    " some basic config
    syntax on
    set relativenumber
    set number
    set splitbelow splitright
    set laststatus=2 " Enable white statusbar
    set ruler
    set autoindent
    set foldmethod=marker
    set foldlevel=0
    set title
    set titleold=st
    set backspace=indent,eol,start
    set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
    set t_Co=256

    " LaTeX/roff compile
    autocmd FileType tex,nroff map <leader>c :!vimcompiledoc %:r <CR><CR>

    " execute shell/python script
    autocmd FileType py,sh map <leader>c :!./%<CR>

    " map the window switching to just C-{h,j,k,l} for faster switching
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>
    nnoremap <C-H> <C-W><C-H>

    nnoremap <C-Down> <C-W><C-J>
    nnoremap <C-Up> <C-W><C-K>
    nnoremap <C-Right> <C-W><C-L>
    nnoremap <C-Left> <C-W><C-H>

    " Buttons for going to previous/next file (buffer)
    map <F2> :bprevious<CR>
    map <F3> :bnext<CR>
    " Show a list of files (buffers) that are open
    map <F4> :buffers<CR>
    " Yank (copy) contents of current file (buffer) - also to X11 clipboard
    map <F5> :%y+<CR>
    " Show name of file and path relative to current working directory
    map <F6> :echo @%<CR>
    " Show current working directory
    map <F7> :pwd<CR>
    " Close current buffer
    map <F12> :bd!<CR>
    " Close fold
    map <leader>f :foldclose<CR>

    " Theming
    syntax enable
    colorscheme luna-term
    set cursorline

    " Airline
    "set laststatus=2
    "set noshowmode
    "set timeoutlen=50
    "let g:airline_theme='luna'

    " map C-w a to do a vertical split, so i dont have to move my finger as much :)
    nnoremap <C-W>a <C-W>v
  '';
};
}
