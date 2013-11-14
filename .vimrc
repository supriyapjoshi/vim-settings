set nocompatible
set laststatus=2
set t_Co=256
set termencoding=utf-8
set backspace=indent,eol,start
set tabstop=2
set shiftwidth=2
set expandtab
set ruler
set showmatch

syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" filetype off                   " required!

let mapleader = ','
set pastetoggle=<leader>p

set cul                                           " highlight current line
hi CursorLine term=none cterm=none ctermbg=8      " adjust color

set rtp+=~/.vim/bundle/vundle/
set runtimepath^=~/.vim/bundle/ctrlp.vim
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" original repos on github
Bundle 'tpope/vim-markdown'
Bundle 'bling/vim-airline'
Bundle 'vim-ruby/vim-ruby'
Bundle 'jwhitley/vim-matchit'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'myusuf3/numbers.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
Bundle 'gabemc/powershell-vim'
Bundle "pangloss/vim-javascript"
Bundle 'scrooloose/nerdtree'
Bundle 'ervandew/supertab'
Bundle 'elzr/vim-json'
" vim-scripts repos
Bundle 'L9'
" non github repos
" Bundle 'git://git.wincent.com/command-t.git'
" Fugitive {
nnoremap <silent><leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent><leader>ga :Gadd<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>:GitGutter<CR>
nnoremap <silent> <leader>gg :GitGutterToggle<CR>
"}
nnoremap <silent><C-j> :tabp<CR>
nnoremap <silent><C-l> :tabn<CR>

" NERDTree {
nnoremap <silent><leader>n :NERDTree<CR>
nnoremap <silent><leader>t :NERDTreeToggle<CR>
nnoremap <silent><C-h> :NERDTreeTabsToggle<CR>
"}
let g:Powerline_symbols = 'fancy'
nnoremap <silent><leader>nt :NumbersToggle<CR>

autocmd BufWritePre *.rb :%s/\s\+$//e
autocmd BufWritePre *.json :%s/\s\+$//e
autocmd BufWritePre *.yml :%s/\s\+$//e
augroup json_autocmd 
  autocmd! 
  autocmd FileType json set autoindent 
  autocmd FileType json set formatoptions=tcq2l 
  autocmd FileType json set textwidth=78 shiftwidth=2 
  autocmd FileType json set softtabstop=2 tabstop=8 
  autocmd FileType json set expandtab 
  autocmd FileType json set foldmethod=syntax 
augroup END
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
