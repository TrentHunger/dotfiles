set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Syntastic'
Plugin 'AutoClose'
Plugin 'scrooloose/nerdtree'
Plugin 'Nopik/vim-nerdtree-direnter'
Plugin 'beigebrucewayne/Turtles'
Plugin 'dikiaap/minimalist'
Plugin 'junegunn/vim-emoji'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'

call vundle#end()
filetype plugin indent on

colorscheme turtles

syntax enable                           " Enable default syntax highlighting

let mapleader=","                       " Change mapleader

set mouse=a                             " Enable mouse
set number                              " Enable line numbers
set clipboard=unnamed                   " Enable system clipboard
set encoding=utf-8 nobomb               " Change encoding to UTF-8 without BOM
set hlsearch                            " Enable highlighting on search terms
set wrap                                " Enable word wrap
set expandtab                           " Replace tabs with spaces
set tabstop=4                           " Number of spaces to replace tabs in expandtab
set backspace=indent,eol,start          " Backspace in insert mode
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_    " Show “invisible” characters
set list                                " ^ cont
set ignorecase                          " Ignoring case in search
set incsearch                           " Dynamic highlight in search
set ruler                               " Show cursor position
set showmode                            " Show current mode
set title                               " Show filename in title bar
set noerrorbells                        " Disable error sound
set completefunc=emoji#complete

autocmd BufWritePre * %s/\s\+$//e       " Remove trailing white space on write (dangerous if extra space is desired)
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif   " Closes VIM if the only window left is NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif                             " +^ Opens NERDTree if no file was specified"

nmap <leader>nt :NERDTreeToggle<CR>
nmap <leader>tN :tabnew<CR>
nmap <leader>tp :tabp<CR>
nmap <leader>tn :tabn<CR>

au FileType c,cpp setlocal comments-=:// comments+=f://         " Disable multiple line comment insertions for single line comment

:map <Leader>em :s/:\([^:]\+\):/\=emoji#for(submatch(1), submatch(0))/g<CR>

nnoremap <Esc>A <up>                    " Stop the arrow key rewrites when using vim in tmux
nnoremap <Esc>B <down>
nnoremap <Esc>C <right>
nnoremap <Esc>D <left>
inoremap <Esc>A <up>
inoremap <Esc>B <down>
inoremap <Esc>C <right>
inoremap <Esc>D <left>

if has('win32')
elseif has('mac')
elseif has('unix')
endif

" NERDtree
let g:NERDTreeDirArrowExpandable = '├'
let g:NERDTreeDirArrowCollapsible = '└'
let NERDTreeShowHidden=1
"let NERDTreeMapOpenInTab='<ENTER>'

" YCM
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Airline
let g:airline#extensions#hunks#enabled=1
let g:airline#extensions#branch#enabled=1


"set runtimepath-=~/.vim/bundle/YouCompleteMe
"set runtimepath-=~/.vim/bundle/Syntastic
"set runtimepath-=~/.vim/bundle/nerdtree
"set runtimepath-=~/.vim/bundle/vim-gitgutter
"set runtimepath-=~/.vim/bundle/Vundle.vim
"set runtimepath-=~/.vim/bundle/minimalist
"set runtimepath-=~/.vim/bundle/vim-nerdtree-direnter
