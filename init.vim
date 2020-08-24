call plug#begin("~/.vim/plugged")
  " Plugin Section
  Plug 'joshdick/onedark.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'ryanoasis/vim-devicons'

  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  
  Plug 'eraserhd/parinfer-rust'

  Plug 'takac/vim-hardtime'
  Plug 'itchyny/lightline.vim'

  Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
  Plug 'ianks/vim-tsx'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'HerringtonDarkholme/yats.vim'

  Plug 'mhartington/nvim-typescript', { 'for': ['typescript', 'tsx'], 'do': './install.sh' }
  Plug 'Shougo/denite.nvim'
  Plug 'dense-analysis/ale'

  " post install (yarn install | npm install) then load plugin only for
  " editing supported files
  Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
call plug#end()

" Config Section
if (has("termguicolors"))
  set termguicolors
endif
syntax enable
colorscheme onedark

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

" ALE linting configuration
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['tsserver', 'tslint'],
\   'vue': ['eslint']
\}

let g:ale_fixers = {
\    'javascript': ['eslint'],
\    'typescript': ['prettier'],
\    'vue': ['eslint'],
\    'scss': ['prettier'],
\    'html': ['prettier']
\}

let g:ale_fix_on_save = 1
let g:hardtime_default_on = 1
