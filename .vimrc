"Tips
"replace all :[range(1,$)]s/[cmp]/[rep]/g[c]
""ay yard to a reg

"Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

"UI
Plugin 'Lokaltog/vim-powerline'
Plugin 'altercation/vim-colors-solarized'

"Open file
Plugin 'ctrlpvim/ctrlp.vim'
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/]\.(git|hg|svn)$',
	\ 'file': '\v\.(exe|so|dll|swp|zip|7z|rar|gz|xz|apk|dmg|iso|jpg|png|pdf)$',
	\ }

"Option
Plugin 'majutsushi/tagbar'
let g:tagbar_show_linenumbers = 2

"Compete
Plugin 'vim-scripts/AutoComplPop'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

"Hotkey
Plugin 'vim-scripts/Auto-Pairs'
Plugin 'junegunn/vim-easy-align'
Plugin 'tpope/vim-surround'
Plugin 'ervandew/supertab'
let SuperTabMappingForward="<S-Tab>"
Plugin 'terryma/vim-multiple-cursors'

"CSS
Plugin 'gorodinskiy/vim-coloresque'

"Python
Plugin 'davidhalter/jedi-vim'
"Plugin 'python_match.vim'

"php
Plugin 'StanAngeloff/php.vim'

call vundle#end()
filetype plugin indent on

"Keymap
nmap ; :
vmap ; :
nmap <C-t> :TagbarToggle<CR><C-w>l
nmap <C-a> ggVG
nmap <C-y> :set paste!<CR>
nmap <C-5> :set fileencoding=big5<CR>
nmap <C-8> :set fileencoding=utf8<CR>
vmap <Enter> <Plug>(EasyAlign)

"Setting
syntax on " Color syntax
color Tomorrow-Night-Bright	" Colorscheme

set backspace=start,eol,indent	" Backspcae
set smartindent " Autoindent
set number " Line number
set mouse=a " Use mouse
set clipboard=unnamed " Clipboard
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set fileencodings=utf8,big5,gbk,latin1 " set fileopentype
set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors
set cursorline
set hls
set ignorecase
set incsearch

"tab setting
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

"folding
set foldenable
set foldmethod=indent
set foldcolumn=1
set foldlevel=2
nmap <Space> za

"Run fils
autocmd filetype ruby nnoremap <C-c> :w <bar> exec '!ruby '.shellescape('%') <CR>
autocmd filetype haml nnoremap <C-c> :w <bar> exec '!haml '.shellescape('%').' %:r.html' <CR><CR>
autocmd filetype javascript nnoremap <C-c> :w <bar> exec '!nodejs '.shellescape('%') <CR>
autocmd filetype lisp nnoremap <C-c> :w <bar> exec '!clisp '.shellescape('%') <CR>
autocmd filetype shell nnoremap <C-c> :w <bar> exec '!bash '.shellescape('%') <CR>
"autocmd filetype php nnoremap <C-c> :w <bar> exec '!php -f '.shellescape('%') <CR>
autocmd filetype python nnoremap <C-c> :w <bar> exec '!python '.shellescape('%')<CR>
autocmd filetype c nnoremap <C-c> :w <bar> exec '!gcc -o %:r '.shellescape('%').' -O2 && ./%:r'<CR>
autocmd filetype cpp nnoremap <C-c> :w <bar> exec '!g++ -o %:r '.shellescape('%').' -std=c++11 -O2 && ./%:r'<CR>
