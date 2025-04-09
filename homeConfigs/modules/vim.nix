{config, lib, pkgs, ...}:

{
  options.mods.vim.enable = lib.mkOption {
	type = lib.types.bool;
	default = true;
	description = "install and configure vim";
  };

  config = lib.mkIf config.mods.vim.enable {
    programs.neovim = {
      enable = true;
	  defaultEditor = true;
      viAlias = true;
	  vimAlias = true;
	};

    home.packages = with pkgs; [
      clang-tools
      nixd
      nodejs_23
	  glsl_analyzer
    ];

	programs.neovim.extraConfig = ''
      set number
      set ai
      autocmd BufWinLeave *.* mkview
      autocmd BufWinEnter *.* silent! loadview
      set tabstop=4
	  set shiftwidth=4
      set scrolloff=10
      set preserveindent
      map <silent> <C-N> :bnext<CR>
      map <silent> <C-P> :bprevious<CR>
      nmap <silent> <c-k> :wincmd k<CR>
      nmap <silent> <c-j> :wincmd j<CR>
      nmap <silent> <c-h> :wincmd h<CR>
      nmap <silent> <c-l> :wincmd l<CR>
      set hidden
      set path +=**
      set wildmenu
      set wildignore+=**/node_modules/**

      let mapleader=";"
      
      autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
        \| PlugInstall --sync
      \| endif
      
      call plug#begin('~/.config/nvim/plugged')
      Plug 'bling/vim-bufferline'
      Plug 'nvim-lua/plenary.nvim'
      Plug 'nvim-telescope/telescope.nvim'
      Plug 'andweeb/presence.nvim'
      Plug 'neovim/nvim-lspconfig'
      Plug 'bluz71/vim-nightfly-colors'
      Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
      Plug 'tikhomirov/vim-glsl'
	  Plug 'lambdalisue/nerdfont.vim'
	  Plug 'lambdalisue/glyph-palette.vim'
	  Plug 'lambdalisue/fern-renderer-nerdfont.vim'
	  Plug 'lambdalisue/fern-git-status.vim'
	  Plug 'lambdalisue/fern.vim'
      call plug#end()
      
      colorscheme catppuccin-mocha
      
      lua require'lspconfig'.clangd.setup{}
      lua require'lspconfig'.nixd.setup{}
      lua require'lspconfig'.glsl_analyzer.setup{}
      set signcolumn=no
      
      nnoremap <leader>ff <cmd>Telescope find_files<cr>
      nnoremap <leader>fg <cmd>Telescope live_grep<cr>
      nnoremap <leader>fb <cmd>Telescope buffers<cr>
      nnoremap <leader>fh <cmd>Telescope help_tags<cr>
	  nnoremap <leader>fi <cmd>Fern %:h<cr>

      let g:user42	= 'tomoron'
      let g:mail42	= 'tomoron@student.42angouleme.fr'
	  let g:fern#renderer = "nerdfont"
	'';

    home.file = {
      #install plug.vim
      ".local/share/nvim/site/autoload/plug.vim".source = "${builtins.fetchGit {
        url = "https://github.com/junegunn/vim-plug";
        rev = "d80f495fabff8446972b8695ba251ca636a047b0";
        ref = "master"; 
      }}/plug.vim";

      #install stdheader 42
      ".config/nvim/plugin/stdheader.vim".source = "${builtins.fetchGit {
        url = "https://github.com/42Paris/42header";
        rev = "71e6a4df6d72ae87a080282bf45bb993da6146b2";
        ref = "master";
      }}/plugin/stdheader.vim";

    };
  };
}
