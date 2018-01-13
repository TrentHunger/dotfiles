set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'beigebrucewayne/Turtles'
Plugin 'dikiaap/minimalist'
Plugin 'Nopik/vim-nerdtree-direnter'

call vundle#end()
filetype plugin indent on

color Turtles

syntax enable                           " Enable default syntax highlighting

set mouse=a                             " Enable mouse interaction
set number                              " Enable line numbers
set clipboard=unnamed                   " Enable system clipboard
set encoding=utf-8                      " Change encoding from ASCII to UTF-8
set hlsearch                            " Enable highlighting on search terms
set wrap                                " Enable word wrap
set expandtab                           " Replace tabs with spaces
set tabstop=4                           " Number of spaces to replace tabs in expandtab

autocmd BufWritePre * %s/\s\+$//e       " Remove trailing white space on write (dangerous if extra space is desired)

nmap <leader>n :NERDTreeToggle<CR>

" NERDtree
let g:NERDTreeDirArrowExpandable = '├'
let g:NERDTreeDirArrowCollapsible = '└'
"let NERDTreeMapOpenInTab='<ENTER>'

" YCM
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

if has('win32')
elseif has('mac')
elseif has('unix')
endif

