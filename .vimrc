set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Plugin 'VundleVim/Vundle.vim' " required, https://github.com/VundleVim/Vundle.vim
"Plugin 'tmhedberg/SimpylFold'
"Plugin 'konfekt/fastfold'
"Plugin 'vim-scripts/indentpython.vim'
"Plugin 'scrooloose/syntastic'
"Plugin 'nvie/vim-flake8'
"Plugin 'jnurmine/Zenburn'
"Plugin 'altercation/vim-colors-solarized'
"Plugin 'valloric/youcompleteme' " https://github.com/Valloric/YouCompleteMe
"Plugin 'Lokaltog/vim-powerline'
"Plugin 'jmcantrell/vim-virtualenv' " https://github.com/jmcantrell/vim-virtualenv
"Plugin 'tpope/vim-fugitive' " http://vimawesome.com/plugin/fugitive-vim
"Plugin 'alfredodeza/pytest.vim' " http://vimawesome.com/plugin/pytest-vim

" All of your Plugins must be added before the following line
"call vundle#end()            " required
"filetype plugin indent on    " required

set encoding=utf-8  "  🚵 💣

" so we can use crontab -e on osx
autocmd filetype crontab setlocal nobackup nowritebackup

let python_highlight_all=1
syntax on

" Enable folding with <space>
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" change color of folded code so it's solarized-friendly
highlight Folded ctermfg=7 ctermbg=242 guifg=LightGrey guibg=DarkGrey

" enable docsctrings for folded code
" (requires SimplyFold plugin)
let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_docstring = 0

" PEP8 but wide please
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=99 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix " |
    \ match BadWhitespace /\s\+$/

au BufNewFile,BufRead *.js, *.html, *.css, *.jinja2
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

" Global ignores (should probly do these per project in setup.cfg)
"let g:pep8_ignore="E221"
"let g:syntastic_python_flake8_args="--ignore=E221"

"let g:syntastic_python_checkers = ['flake8']
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" you complete me autocomplete config
let g:ycm_autoclose_preview_window_after_completion=1
"map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Ensure ycm is using the correct python
"let g:ycm_python_binary_path = 'python'

" powerline fonts
let g:Powerline_symbols = 'fancy'

let g:solarized_termcolors=256
" Colors
"if has('gui_running')
"  set background=dark
"  colorscheme solarized
"else
"  colorscheme zenburn
"endif

" shortcut for toggling dark light color scheme
" call togglebg#map("<F5>")

" line numbering
"set nu

" always keep a statusline
set laststatus=2

" restore visual mode selection after indenting
vmap < <gv
vmap > >gv

" remap escape key
imap jj <Esc>

set backspace=start

" Auto change the directory to the current file I'm working on
autocmd BufEnter * lcd %:p:h

" Set auto-read when file is changed
set autoread

" Lines of history to remember
set history=500

" Always show current position
set ruler

" Ignore case when searching
set ignorecase
set smartcase

" Highlight search terms
set hlsearch

" Inceremental search
set incsearch

" Show matchin braces
set showmatch

" Set font
set gfn=Inconsolata:h14

