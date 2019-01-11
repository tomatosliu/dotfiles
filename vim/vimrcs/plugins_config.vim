set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Raimondi/delimitMate.git'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-syntastic/syntastic'
Plugin 'tell-k/vim-autopep8.git'
Plugin 'heavenshell/vim-pydocstring'
Plugin 'Valloric/YouCompleteMe'
Plugin 'yuttie/comfortable-motion.vim'
Plugin 'jreybert/vimagit'

" Colorscheme
Plugin 'dracula/vim'
Plugin 'jacoborus/tender.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'



" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" Nerd Commenter
let g:NERDDefaultAlign = 'left'
let NERDTreeIgnore = ['\.pyc$']
nmap " :NERDTreeToggle<CR>

" Vim Flake8
"let g:flake8_show_quickfix=1
"let g:flake8_show_in_gutter=1
"let g:flake8_show_in_file=1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers=['flake8']

" Neocomplate
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
"let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>""

" Pydocstring
nmap <silent> <C-_> <Plug>(pydocstring)

" YCM
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

" Comfort Motion
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"
 
" Deocomplete
let g:deoplete#enable_at_startup = 1

