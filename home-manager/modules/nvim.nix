{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; [
      vim-nix
      editorconfig-nvim
      catppuccin-nvim
      nvim-web-devicons

      {
        plugin = lualine-nvim;
        config = ''
          lua << EOF
            require('lualine').setup {
              options = {
                theme = "catppuccin",
                section_separators = "|",
                component_separators = "|"
              }
            }
          EOF
        '';
      }
      {
        plugin = barbar-nvim;
        config = ''
          lua << EOF
            vim.g.bufferline = {
              -- Enable auto-hiding when there is only one tab
              auto_hide = true,
              -- Disable close button
              closable = false,
            }
          EOF
        '';
      }
    ];

    extraConfig = ''
      set completeopt=noinsert,menuone,noselect

      " some basic config
      syntax on
      set autochdir
      set relativenumber
      set number
      set splitbelow splitright
      "set laststatus=2 " Enable white statusbar
      set ruler
      set autoindent
      set foldmethod=marker
      set foldlevel=0
      set title
      set backspace=indent,eol,start
      set tabstop=4 softtabstop=0 shiftwidth=4 smarttab
      set t_Co=256
      set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
      let g:mapleader="\<Space>"

      " Nix/C[++] options
      autocmd FileType nix,c,cpp set tabstop=2 softtabstop=0 shiftwidth=2 expandtab 

      " LaTeX/roff compile
      autocmd FileType tex,nroff map <leader>C :!vimcompiledoc %:r <CR><CR>

      " execute shell/python script
      autocmd FileType py,sh map <leader>C :!./%<CR>

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
      map <leader>a :bprevious<CR>
      map <leader>s :bnext<CR>
      " Yank (copy) contents of current file (buffer) - also to X11 clipboard
      map <F5> :%y+<CR>
      " Show name of file and path relative to current working directory
      map <F6> :echo @%<CR>
      " Show current working directory
      map <F7> :pwd<CR>
      " Show non-visible chars
      map <F12> :set list!<CR>
      " Close current buffer
      map <leader>c :bd!<CR>
      " Close fold
      map <leader>f :foldclose<CR>
      " Map C-w a to do a vertical split, so i dont have to move my finger as much :)
      nnoremap <C-W>a <C-W>v

      " Theming
      syntax enable
      colorscheme catppuccin
      set cursorline
      set termguicolors
      set noshowmode
  '';
  };
}
