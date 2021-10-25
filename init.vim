" Base vim/nvim config
set nocompatible
set showmatch
set ignorecase
set hlsearch
set incsearch

set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2
set autoindent

set number
set relativenumber

set cc=100
set wildmode=longest,list

syntax on
filetype plugin indent on

set cursorline
set ttyfast

" Plugins
call plug#begin("~/.vim/plugged")
  " Colorschemes
  Plug 'dracula/vim'
  Plug 'rakr/vim-one'

  " File tree
  Plug 'preservim/nerdtree'

  " Start page
  Plug 'mhinz/vim-startify'

  " Fuzzy finder! New Ctrl+p
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  " Better status line
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  
  " Which key! <3
  Plug 'folke/which-key.nvim'
  
  " Better surround semantics for brackets
  Plug 'tpope/vim-surround'

  " Colorful brackets
  Plug 'frazrepo/vim-rainbow'

  " Git plugins
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'

  """ Generic Language Support
  Plug 'neovim/nvim-lspconfig'

  """ Language Specific Stuff
  Plug 'guns/vim-sexp'
  Plug 'tpope/vim-sexp-mappings-for-regular-people'

  Plug 'tpope/vim-dispatch'
  Plug 'radenling/vim-dispatch-neovim'
  Plug 'clojure-vim/vim-jack-in'
  Plug 'Olical/conjure', {'tag': 'v4.25.0'}
call plug#end()

" Style
syntax enable
" colorscheme dracula
set background=dark
let g:one_allow_italics = 1
let g:airline_theme = 'one'
colorscheme one

let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
set termguicolors


""""""""" Plugin Configuration
lua << EOF
require'lspconfig'.clojure_lsp.setup{}
EOF

lua << EOF
  require("which-key").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

""""""""" Keybinds

" Clear Space of any existing keybinds
nnoremap <SPACE> <Nop>

" Space for mapleader <3
let mapleader=" "
let maplocalleader=","

" Vim stuff
nnoremap <leader>vs :source $MYVIMRC<CR>
nnoremap <leader>ve :e $MYVIMRC<CR>

" Save/quit
map <leader>fs :w<CR>
map <leader>q :q<CR>

" Use ; to open fzf (ctrlp)
map <leader>fp :Files<CR>
map ; :Files<CR>

" Use Ctrl+O to open nerd tree
map <C-o> :NERDTreeToggle<CR>
map <leader>t :NERDTreeToggle<CR>

" Window and navigation binds
map <leader>wv <C-w>v
map <leader>ws <C-w>s

map <leader>wh <C-w>h
map <leader>wj <C-w>j
map <leader>wk <C-w>k
map <leader>wl <C-w>l
map <leader>wq :q<CR>

" Buffers
map <leader><Tab> :bp<cr>
map <leader>bn :bn<cr>
map <leader>bp :bp<cr>
map <leader>bd :bd<cr>
