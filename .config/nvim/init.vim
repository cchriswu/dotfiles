set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent

set nocompatible
set nohlsearch
syntax on
set shortmess+=I
set number
set relativenumber
set laststatus=2
set backspace=indent,eol,start
set hidden
set ignorecase
set smartcase
set incsearch
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.
set noerrorbells visualbell t_vb=
set mouse+=a

" vim-plug
call plug#begin('~/.vim/plugged')

Plug 'ntpeters/vim-better-whitespace'

" GUI enhancements
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'

" Lint tools
" Plug 'prettier/vim-prettier'

" Git integration
Plug 'airblade/vim-gitgutter'
Plug 'APZelos/blamer.nvim'

" Colorscheme
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

" LSP and auto completion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

call plug#end()


" colorscheme configs
colorscheme gruvbox
let g:lightline = { 'colorscheme': 'gruvbox' }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LSP config start

set completeopt=menu,menuone,noselect

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  -- Use vsnip as snippet plugin
  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn"vsnip#anonymous"
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set select to false to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for / (if you enabled native_menu, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled native_menu, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  -- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
  -- capabilities = capabilities
  -- }
EOF

" LSP config end
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" enable git blamer
let g:blamer_enabled = 1

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
