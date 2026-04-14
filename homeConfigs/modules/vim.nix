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
	  rust-analyzer
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

  -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
  -- Set configuration for specific filetype.
  --[[ cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' },
    }, {
      { name = 'buffer' },
    })
 })
 require("cmp_git").setup() ]]--

 -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
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

      vim.lsp.enable('clangd')
	  vim.lsp.config('clangd', {
		  capabilities = capabilities
	  })

      vim.lsp.enable('nixd')
	  vim.lsp.config('nixd', {
		  capabilities = capabilities
	  })

      vim.lsp.enable('glsl_analyzer')
	  vim.lsp.config('glsl_analyzer', {
		  capabilities = capabilities
	  })

      vim.lsp.enable('pylsp')
	  vim.lsp.config('pylsp', {
		  capabilities = capabilities
	  })
	
	 vim.lsp.enable('rust_analyzer')
	vim.lsp.config('rust_analyzer', {
		capabilities = capabilities,
		settings = {
    ["rust-analyzer"] = {
      cargo = {
        features = "all"
      },
    },
  },
	  })

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
  };
}
