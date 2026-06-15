# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    vim.nix                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2026/06/14 19:22:40 by tomoron           #+#    #+#              #
#    Updated: 2026/06/14 19:32:07 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{pkgs, ...}:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    withPython3 = false;
    withRuby = false;
  };

  home.packages = with pkgs; [
    ripgrep
  ];

  programs.neovim.initLua= ''
    local cmp = require'cmp'

    cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
  	  end,
    },

    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },

    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),

    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
      }, {
        { name = 'buffer' },
      })
    })

    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      }),
      matching = { disallow_symbol_nonprefix_matching = false }
    })

    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    local _99 = require("99")
    
    local cwd = vim.uv.cwd()
    local basename = vim.fs.basename(cwd)
    _99.setup({
          provider = _99.Providers.OpenCodeProvider,
    	model = "ollama/gemma4:26b",
    	logger = {
    		level = _99.DEBUG,
    		path = "/home/tom/99logs/" .. basename .. ".99.debug",
    		print_on_error = true,
    	},
          tmp_dir = "./tmp",
    
          --- Completions: #rules and @files in the prompt buffer
          completion = {
              --- Configure @file completion (all fields optional, sensible defaults)
              files = {
                  -- enabled = true,
                  -- max_file_size = 102400,     -- bytes, skip files larger than this
                  -- max_files = 5000,            -- cap on total discovered files
                  -- exclude = { ".env", ".env.*", "node_modules", ".git", ... },
              },
              --- File Discovery:
    
              source = "cmp", -- "native" (default), "cmp", or "blink"
          },
    
    	md_files = {
    		-- "AGENT.md",
    	},
    })
    
    vim.keymap.set("v", "<leader>9v", function()
    	_99.visual()
    end)
    
    vim.keymap.set("n", "<leader>9x", function()
    	_99.stop_all_requests()
    end)
    
    vim.keymap.set("n", "<leader>9s", function()
    	_99.search()
    end)
    
    vim.keymap.set("n", "<leader>9m", function()
    		require("99.extensions.telescope").select_model()
    end)
  '';

  programs.neovim.extraConfig = ''
    set number
    set ai
    autocmd BufWinLeave *.* mkview
    autocmd BufWinEnter *.* silent! loadview
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
    Plug 'hrsh7th/nvim-cmp'
    Plug 'ThePrimeagen/99'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'

    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'
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
}
