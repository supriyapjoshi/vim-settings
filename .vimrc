set nocompatible        " Must be first line
filetype on
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
source ~/.vimrc.bundles
call vundle#end()
let mapleader = ','

set background=dark 
filetype plugin indent on
syntax on                   " Syntax highlighting
scriptencoding utf-8

set ttimeoutlen=10

if has ('x') && has ('gui') " On Linux use + register for copy-paste
	set clipboard=unnamedplus
else           " On mac and Windows, use * register for copy-paste
	set clipboard=unnamed
endif

 color desert256
set noshowmode

highlight clear SignColumn      " SignColumn should match background for
highlight clear LineNr 
highlight clear CursorLineNr
set colorcolumn=80
set colorcolumn=+1
if has('cmdline_info')
	set ruler                   " Show the ruler
	set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
	set showcmd  
endif
if has('statusline')
	set laststatus=2
	set statusline=%<%f\                     " Filename
	set statusline+=%w%h%m%r                 " Options
	set statusline+=%{fugitive#statusline()} " Git Hotness
	set statusline+=\ [%{&ff}/%Y]            " Filetype
	set statusline+=\ [%{getcwd()}]          " Current dir
	set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info

	set t_Co=256
	let g:airline_powerline_fonts=1
endif
set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set scrolljump=5                " Lines to scroll when cursor leaves screen
set list                        " Higlights whitespace etc.
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set nowrap                      " Wrap long lines
set autoindent                  " Indent at the same level of the previous line
set shiftwidth=2 tabstop=2 softtabstop=2
set expandtab                   " Tabs are spaces, not tabs
set matchpairs+=<:>             " Match, to be used with %
set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType c,cpp,java,go,php,javascript,ruby,python,twig,xml,yml autocmd BufWritePre <buffer> call StripTrailingWhitespace()

autocmd BufRead,BufNewFile *.log set filetype=log
autocmd BufRead,BufNewFile */log/* set filetype=log
autocmd BufNewFile,BufRead *.coffee set filetype=coffee
" Ctags {
  set tags=tags,./tags;/,~/.vimtags
" }
"           {
let g:ctrlp_working_path_mode = 'ra'
nnoremap <silent> <D-t> :CtrlP<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>n :tabn<CR>
nnoremap <leader>p :tabp<CR>
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\.git$\|\.hg$\|\.svn$',
      \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }
"}
function! StripTrailingWhitespace()
  let _s=@/
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  let @/=_s
  call cursor(l, c)
endfunction
