set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'Nopik/vim-nerdtree-direnter'
Plugin 'beigebrucewayne/Turtles'
Plugin 'dikiaap/minimalist'
Plugin 'junegunn/vim-emoji'
Plugin 'airblade/vim-gitgutter'

call vundle#end()
filetype plugin indent on

color Turtles

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

nmap <leader>n :NERDTreeToggle<CR>

if has('win32')
elseif has('mac')
elseif has('unix')
endif

" Gitgutter
"let g:gitgutter_sign_added = emoji#for('small_blue_diamond')
"let g:gitgutter_sign_modified = emoji#for('small_orange_diamond')
"let g:gitgutter_sign_removed = emoji#for('small_red_triangle')
"let g:gitgutter_sign_modified_removed = emoji#for('collision')

" NERDtree
let g:NERDTreeDirArrowExpandable = '├'
let g:NERDTreeDirArrowCollapsible = '└'
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

