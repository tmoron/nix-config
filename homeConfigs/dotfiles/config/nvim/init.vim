source ~/.vimrc

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
call plug#end()

colorscheme catppuccin-mocha

"lsp
lua require'lspconfig'.clangd.setup{}
lua require'lspconfig'.nixd.setup{}
lua require'lspconfig'.glsl_analyzer.setup{}

set signcolumn=no

let g:user42	= 'tomoron'
let g:mail42	= 'tomoron@student.42angouleme.fr'

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
