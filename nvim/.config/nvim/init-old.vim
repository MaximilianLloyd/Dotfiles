call plug#begin('~/.config/nvim/plugged')
Plug 'nvim-lua/plenary.nvim'
Plug 'editorconfig/editorconfig-vim'
Plug 'akinsho/bufferline.nvim'
Plug 'ggandor/lightspeed.nvim'
Plug 'sindrets/diffview.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'folke/lua-dev.nvim'
Plug 'folke/tokyonight.nvim'
Plug 'andweeb/presence.nvim'

Plug 'NLKNguyen/papercolor-theme'

" Session
" Plug 'rmagatti/auto-session'

" Telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'

" Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'

Plug 'nvim-lualine/lualine.nvim'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'github/copilot.vim' 
Plug 'rust-lang/rust.vim'
Plug 'ryanoasis/vim-devicons'


" Tools
Plug 'fatih/vim-go'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'

Plug 'onsails/lspkind-nvim', { 'commit': '06872e887e7e4579765cc51fa6b0e7643b4284fa' }
Plug 'saadparwaiz1/cmp_luasnip'

" Snippets 
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

" Themes
Plug 'ayu-theme/ayu-vim'
Plug 'gruvbox-community/gruvbox'
Plug 'marko-cerovac/material.nvim' 
Plug 'AlessandroYorba/Sierra'
Plug 'sjl/badwolf'
Plug 'tomasr/molokai'

" Dashboard
Plug 'glepnir/dashboard-nvim'
Plug 'folke/which-key.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'p00f/nvim-ts-rainbow'
call plug#end()

let loaded_matchparen = 1
let g:loaded_matchparen = 1
set timeoutlen=500
set ttimeoutlen=50
set scrolloff=8
set number
set relativenumber
set ic
set nohls
set hidden
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set noerrorbells

set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set noshowmode
set nowrap

" Extra column on the left for linting
set signcolumn=yes

let g:gruvbox_transparent_bg=1
let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

colorscheme gruvbox

" Transparency
hi normal guibg=000000
highlight clear SignColumn
hi LineNrAbove guifg=#CCCCCC ctermfg=white
hi LineNrBelow guifg=#CCCCCC ctermfg=white
" set fillchars=""
set fillchars=stl:\ ,stlnc:\ ,vert:\ ,fold:-,diff:-

highlight ColorColumn term=reverse ctermbg=0 guibg=#081c23
highlight VertSplit guibg=000000 guifg=Black ctermbg=6 ctermfg=0


let mapleader = " " 
nnoremap <leader>vv :Vex<CR>
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
noremap <silent> <C-S> :update<CR>
inoremap <silent> <C-S> <ESC> :update<CR>

nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<CR>
nnoremap <leader>fh <cmd>Telescope help_tags<CR>
nnoremap <leader>fb <cmd>Telescope file_browser<CR>
nnoremap <leader>b <cmd>Telescope buffers<CR>

" Bufferline
nnoremap bb <cmd>BufferLinePick<CR>
nnoremap bh <cmd>BufferLineCyclePrev<CR>
nnoremap bl <cmd>BufferLineCycleNext<CR>
nnoremap btd <cmd>BufferLineGroupToggle Docs<CR>

" Telescope git stuff
nnoremap <leader>gc <cmd>Telescope git_commits<CR>
nnoremap <leader>gb <cmd>Telescope git_branches<CR>
nnoremap <leader>gd <cmd>DiffviewOpen<CR>

" Grep
nnoremap <leader>fr :lua require('telescope.builtin').lsp_references()<CR>
" nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("🔍 Grep for > ")})<CR>

nnoremap <C-p> <cmd>Telescope git_files<cr>
nnoremap <C-h> :cprev<CR>
nnoremap <C-l> :cnext<CR>
nnoremap <C-o> :copen<CR>
nnoremap <C-x> :cclose<CR>

" Symbols outline
nnoremap <leader>o :SymbolsOutline<CR>


nnoremap <leader>ha :lua require('harpoon.mark').add_file()<CR>
nnoremap <C-m> <cmd>Telescope harpoon marks<CR>

" move code
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

" Session
nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>

set updatetime=300
set nobackup
set nowritebackup
set shortmess+=c

" not sure what this does
" vnoremap <leader>p "_dP
vnoremap <leader>y "+y

" Copilot remap
imap <silent><script><expr> <C-a> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

" Autoformat
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.tsx lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.html lua vim.lsp.buf.formatting_sync(nil, 1000)

hi WhichKeyFloat ctermbg=BLACK ctermfg=BLACK
autocmd ColorScheme * highlight WhichKeyFloat ctermbg=NONE ctermfg=NONE

lua require("maximilianlloyd")
" lua require("mivi")
