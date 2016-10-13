" install dein

set nocompatible
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim
call dein#begin(expand('~/.vim/dein'))
call dein#add('Shougo/dein.vim')

" UI
call dein#add('vim-airline/vim-airline')
let g:airline_powerline_fonts = 1
call dein#add('tomasr/molokai')
let g:molokai_original = 1
let g:rehash256 = 1

" Autocomplete
call dein#add('MarcWeber/vim-addon-mw-utils')
call dein#add('tomtom/tlib_vim')
call dein#add('garbas/vim-snipmate')
call dein#add('honza/vim-snippets')
call dein#add('Shougo/deoplete.nvim')
let g:deoplete#enable_at_startup = 1
call dein#add( 'scrooloose/syntastic')
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Hotkey
call dein#add('vim-scripts/auto-pairs')
call dein#add('scrooloose/nerdcommenter')
call dein#add('michaeljsmith/vim-indent-object')
call dein#add('ervandew/supertab')
let SuperTabMappingForward="<S-Tab>"
call dein#add('easymotion/vim-easymotion')
let g:EasyMotion_smartcase = 1

" Python
call dein#add('hdima/python-syntax')
let python_highlight_all = 1
call dein#add('zchee/deoplete-jedi')

call dein#end()
filetype plugin indent on

" Hotkey
map  n       <Plug>(easymotion-next)
map  N       <Plug>(easymotion-prev)
nmap ;       :
vmap ;       :
map  /       <Plug>(easymotion-sn)
omap /       <Plug>(easymotion-tn)
nmap \       zR
nmap <C-a>   ggVG
nmap <C-k>   <Plug>(easymotion-w)
nmap <C-l>   :nohl<CR>
nmap <C-y>   :set paste!<CR>
nmap <C-5>   :set fileencoding=big5<CR>
nmap <C-8>   :set fileencoding=utf8<CR>
nmap <Enter> za
vmap <Enter> <Plug>(EasyAlign)
nmap <Tab>   gt
nmap <S-Tab> gT

" evil shift!
cab Q   q
cab Qa  qa
cab W   w
cab X   x
cab WQ  wq
cab Wq  wq
cab wQ  wq
cab Set set

" setting
let mapleader=" "                      " leader key
syntax on                              " Color syntax
color molokai                          " Theme
set backspace=start,eol,indent         " Backspcae
set clipboard=unnamed                  " Clipboard
set cursorline                         " height corrent line
set encoding=utf-8                     " Necessary to show Unicode glyphs
set fileencodings=utf8,big5,gbk,latin1 " set fileopentype
set hls                                " search heightlight
set ignorecase                         " ignore case in search
set incsearch                          " search back
set laststatus=2                       " Always show the statusline
set mouse=a                            " Use mouse
set number                             " Line number
set ruler                              " show line info
set scrolloff=7                        " scroll while close under
set showcmd                            " show command
set smartindent                        " Autoindent
set t_Co=256                           " Explicitly tell Vim that the terminal supports 256 colors
set timeoutlen=300                     " escape delay
set wildmenu                           " Autocomplete menu

" Tab
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Folding
set foldenable
set foldmethod=indent
set foldcolumn=1
set foldlevel=2

" Filetype Related
autocmd FileType python setlocal et sta  sw=4 sts=4 cc=80 completeopt-=preview
autocmd FileType html   setlocal et sw=2 sts=2
autocmd FileType ruby   setlocal et sw=2 sts=2

" Run file
autocmd filetype ruby       nnoremap <C-c> :w <bar> exec '!ruby '.shellescape('%') <CR>
autocmd filetype javascript nnoremap <C-c> :w <bar> exec '!nodejs '.shellescape('%') <CR>
autocmd filetype shell      nnoremap <C-c> :w <bar> exec '!bash '.shellescape('%') <CR>
autocmd filetype php        nnoremap <C-c> :w <bar> exec '!php -f '.shellescape('%') <CR>
autocmd filetype python     nnoremap <C-c> :w <bar> exec '!python '.shellescape('%')<CR>
autocmd filetype c          nnoremap <C-c> :w <bar> exec '!gcc -o %:r '.shellescape('%').' -O2 && ./%:r'<CR>
autocmd filetype cpp        nnoremap <C-c> :w <bar> exec '!g++ -o %:r '.shellescape('%').' -std=c++11 -O2 && ./%:r'<CR>
