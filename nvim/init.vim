" ----------------------------------- BASIC SETTINGS ------------------------------------

set number
set linebreak
set showbreak=+++
set textwidth=100
set showmatch
set visualbell
set number relativenumber
set noshowmode

set hlsearch
set smartcase
set ignorecase
set incsearch

set autoindent
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4

set mouse=a

set ruler

" -----------------------------------------------------------------------------------------

" --------------------------------- VIMPLUG -----------------------------------------------

call plug#begin('~/.config/nvim/plugged')
" Plug 'joshdick/onedark.vim'
Plug 'junegunn/goyo.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'akinsho/bufferline.nvim'
Plug 'itchyny/lightline.vim'
Plug 'ervandew/supertab'
Plug 'sheerun/vim-polyglot'
" Plug 'fxn/vim-monochrome'
Plug 'dylanaraps/wal.vim'
call plug#end()

" ------------------------------------------------------------------------------------------

" -------------------------------------- LUA -----------------------------------------------

lua << EOF
require'lspconfig'.hls.setup{}
require'lspconfig'.ccls.setup{}
require'lspconfig'.pyright.setup{}
require'lspconfig'.ocamllsp.setup{
  root_dir = function() return vim.loop.cwd() end
}
-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
mapping = {
['<C-d>'] = cmp.mapping.scroll_docs(-4),
['<C-f>'] = cmp.mapping.scroll_docs(4),
['<C-Space>'] = cmp.mapping.complete(),
['<C-e>'] = cmp.mapping.close(),
['<CR>'] = cmp.mapping.confirm({ select = true }),
},
sources = {
{ name = 'nvim_lsp' },
{ name = 'buffer' },
}
})

-- Setup lspconfig.
require'lspconfig'.rust_analyzer.setup {
capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}

require'nvim-tree'.setup{}
require("bufferline").setup{}
EOF

" ---------------------------------------------------------------------------------------------

" ------------------------------------------ THEMES -------------------------------------------
" if (empty($TMUX))
  " if (has("nvim"))
    " let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  " endif
  " if (has("termguicolors"))
    " set termguicolors
  " endif
" endif

set completeopt=menu,menuone,noselect
syntax on
" let g:onedark_hide_endofbuffer = 1
" let g:onedark_terminal_italics = 1
colorscheme wal
let g:lightline = {
	    \ 'colorscheme': 'nord',
	    \ }

nnoremap <C-n> :NvimTreeToggle<CR>
