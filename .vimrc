set nocompatible
set laststatus=2
set t_Co=256
set termencoding=utf-8

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

set cul                                           " highlight current line
hi CursorLine term=none cterm=none ctermbg=8      " adjust color

set rtp+=~/.vim/bundle/vundle/
set runtimepath^=~/.vim/bundle/ctrlp.vim
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" original repos on github
Bundle 'tpope/vim-markdown'
Bundle 'Lokaltog/vim-powerline'
Bundle 'vim-ruby/vim-ruby'
Bundle 'jwhitley/vim-matchit'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'myusuf3/numbers.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'gnupg'
Bundle 'tpope/vim-fugitive'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
Bundle 'gabemc/powershell-vim'
Bundle 'scrooloose/nerdtree'
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
let g:Powerline_symbols = 'fancy'
nnoremap <silent><leader>nt :NumbersToggle<CR>

autocmd BufWritePre *.rb :%s/\s\+$//e
autocmd BufWritePre *.json :%s/\s\+$//e
autocmd BufWritePre *.yml :%s/\s\+$//e
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
