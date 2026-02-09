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
      nodejs_24
      glsl_analyzer
      (pkgs.python3.withPackages (ps: with ps; [
        python-lsp-server
        pylsp-mypy
        python-lsp-ruff
        pycodestyle
      ]))
    ];

#    programs.neovim.extraLuaConfig = ''
#      vim.lsp.config('pylsp', {})
#    '';

    programs.neovim.extraLuaConfig = ''
      local coq = require "coq"

      vim.lsp.config('clangd', coq.lsp_ensure_capabilities({}))
      vim.lsp.enable('clangd')

      vim.lsp.config('nixd', coq.lsp_ensure_capabilities({}))
      vim.lsp.enable('nixd')

      vim.lsp.config('glsl_analyzer', coq.lsp_ensure_capabilities({}))
      vim.lsp.enable('glsl_analyzer')

      vim.lsp.config('pylsp', coq.lsp_ensure_capabilities({
        settings = {
          pylsp = {
            plugins = {
              pycodestyle = {
                ignore = {'E501'},
              }
            }
          }
        }
      }))
      vim.lsp.enable('pylsp')

	  vim.diagnostic.config({
        virtual_lines = {
          current_line = true
        }
      })

    '';

    programs.neovim.extraConfig = ''
      set number
      set ai
      autocmd BufWinLeave *.* mkview
      autocmd BufWinEnter *.* silent! loadview
	  autocmd VimEnter * COQnow --shut-up
      set tabstop=4
      set scrolloff=10
      set smartindent 
      set shiftwidth=4
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
      Plug 'ms-jpq/coq_nvim', { 'branch': 'coq' }
      Plug 'ms-jpq/coq.artifacts', { 'branch': 'artifacts' }
      Plug 'ms-jpq/coq.thirdparty', { 'branch': '3p' }
      call plug#end()
      
      colorscheme catppuccin-mocha
      
      set signcolumn=auto

      nnoremap <leader>ff <cmd>Telescope find_files<cr>
      nnoremap <leader>fg <cmd>Telescope live_grep<cr>
      nnoremap <leader>fb <cmd>Telescope buffers<cr>
      nnoremap <leader>fh <cmd>Telescope help_tags<cr>
      nnoremap <leader>fi <cmd>Fern %:h<cr>

      let g:user42    = 'tomoron'
      let g:mail42    = 'tomoron@student.42angouleme.fr'
      let g:fern#renderer = "nerdfont"

    '';

    home.file = {
      #install plug.vim
      ".local/share/nvim/site/autoload/plug.vim".source = "${fetchGit {
        url = "https://github.com/junegunn/vim-plug";
        rev = "d80f495fabff8446972b8695ba251ca636a047b0";
        ref = "master"; 
      }}/plug.vim";

      #install stdheader 42
      ".config/nvim/plugin/stdheader.vim".source = "${fetchGit {
        url = "https://github.com/42Paris/42header";
        rev = "e6e6b191871545e0d43f1aad817070bc806b8fa7";
        ref = "master";
      }}/plugin/stdheader.vim";

    };
  };
}
