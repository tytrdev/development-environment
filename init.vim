set noswapfile
set backupcopy=yes

call plug#begin("~/.vim/plugged")
  " Plugin Section
  Plug 'tpope/vim-fugitive'
  Plug 'preservim/nerdcommenter'
  Plug 'joshdick/onedark.vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'frazrepo/vim-rainbow'
  Plug 'ryanoasis/vim-devicons'

  " Conflicting binds for ctrl+b
  " Plug 'yuttie/comfortable-motion.vim'
  Plug 'scrooloose/nerdtree'

  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

  Plug 'junegunn/fzf.vim'
  
  Plug 'eraserhd/parinfer-rust'

  Plug 'takac/vim-hardtime'
  Plug 'itchyny/lightline.vim'

  Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
  Plug 'ianks/vim-tsx'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'mhartington/nvim-typescript', { 'for': ['typescript', 'tsx'], 'do': './install.sh' }

  " Auto complete 
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " post install (yarn install | npm install) then load plugin only for
  " editing supported files
  Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

  Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

" Config Section
if (has("termguicolors"))
  set termguicolors
endif
syntax enable
syntax on
set encoding=utf8
colorscheme onedark

set number
set relativenumber

let g:deoplete#enable_at_startup = 1

" Mappings
nnoremap <silent><c-s> :<c-u>update<cr>
vnoremap <silent><c-s> <c-c>:update<cr>gv
inoremap <silent><c-s> <c-o>:update<cr>

nnoremap <silent><c-q> :<c-u>quit<cr>
vnoremap <silent><c-q> <c-c>:quit<cr>gv
inoremap <silent><c-q> <c-o>:quit<cr>

noremap ; l
noremap l k
noremap k j
noremap j h

" TODO: Add maps for moving lines up/down

let g:mapleader = ','

inoremap <leader>d <C-R>=strftime("%Y-%m-%dT%H:%M")<CR> 

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''

" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

" use alt+hjkl to move between split/vsplit panels
tnoremap <A-j> <C-\><C-n><C-w>h
tnoremap <A-k> <C-\><C-n><C-w>j
tnoremap <A-l> <C-\><C-n><C-w>k
tnoremap <A-;> <C-\><C-n><C-w>l
nnoremap <A-j> <C-w>h
nnoremap <A-k> <C-w>j
nnoremap <A-l> <C-w>k
nnoremap <A-;> <C-w>l

nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }

" Typescript formatting with prettier
autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript

filetype plugin indent on
" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2

" when indenting with '>', use 2 spaces width
set shiftwidth=2

" let g:hardtime_default_on = 1

let $FZF_DEFAULT_COMMAND = 'ag -g ""'
nnoremap <leader>s :Ag<cr>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

let python_highlight_all=1

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

nnoremap <leader>f :Prettier<cr>
vnoremap <leader>f :Prettier<cr>
inoremap <leader>f :Prettier<cr>

" Move lines up/down
nnoremap <S-k> :m .+1<CR>==
nnoremap <S-l> :m .-2<CR>==
vnoremap <S-k> :m '>+1<CR>gv=gv
vnoremap <S-l> :m '<-2<CR>gv=gv

let g:rainbow_active = 1
