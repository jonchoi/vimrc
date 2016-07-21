"set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'             " Autocomplete functions etc
Plugin 'vim-scripts/Auto-Pairs'             " Autocomplete parens/quotes/brackets
Plugin 'vim-scripts/closetag.vim'           " html tag completion and navigation
Plugin 'edsono/vim-matchit'
Plugin 'rking/ag.vim'                       " the_silver_searcher
Plugin 'tomtom/tcomment_vim'                " For easy block commenting
Plugin 'tpope/vim-fugitive'                 " Git integration
Plugin 'JazzCore/ctrlp-cmatcher'            " CtrlP C matching extension
Plugin 'scrooloose/nerdtree'                " Nerdtree allows you to explore your filesystem
Plugin 'scrooloose/syntastic'               " Syntastic for syntax checking
Plugin 'bling/vim-airline'                  " Status and tabline
Plugin 'bling/vim-bufferline'               " Buffer info 
Plugin 'altercation/vim-colors-solarized'   " vim solarized
Plugin 'flazz/vim-colorschemes'             " vim colorschemes
Plugin 'kchmck/vim-coffee-script'           " vim coffeescript
Plugin 'vim-scripts/ZoomWin'                " Zoom in and out of panes
Plugin 'airblade/vim-gitgutter'             " Show added and deleted lines
Plugin 'majutsushi/tagbar'                  " Tagbar shows a summary of the class tags
Plugin 'lukaszkorecki/CoffeeTags'           " Tagbar for coffeescript
Plugin 'mattn/emmet-vim'                    " HTML/CSS editing
Plugin 'ap/vim-css-color'                   " CSS Color
Plugin 'ntpeters/vim-better-whitespace'     " Whitespace errors
Plugin 'nathanaelkane/vim-indent-guides'    " Indent guides
Plugin 'sjl/gundo.vim'                      " Visual undo tree
Plugin 'edkolev/tmuxline.vim'               " Tmux status line
Plugin 'terryma/vim-multiple-cursors'       " Multiple cursors
Plugin 'ivanov/vim-ipython'                 " iPython REPL
Plugin 'ctrlpvim/ctrlp.vim'                 " new ctrlp
Plugin 'junegunn/seoul256.vim'              " Seoul color scheme
Plugin 'junegunn/vim-easy-align'            " Alignment
Plugin 'junegunn/goyo.vim'                  " Quiet your vim
Plugin 'junegunn/limelight.vim'             " Focus your vim
Plugin 'junegunn/fzf'                       " Command line Fuzzyfinder in GO
Plugin 'Yggdroot/indentLine'                " Vertical lines showing indentation
Plugin 'pelodelfuego/vim-swoop'             " helm-swoop style
Plugin 'toyamarinyon/vim-swift'             " swift syntax support
Plugin 'leafgarland/typescript-vim'         " typescript syntax support
Plugin 'Quramy/tsuquyomi'                   " typescript OmniCompletion
Plugin 'Shougo/vimproc.vim'                 " interactive shell
Plugin 'pangloss/vim-javascript'            " js syntax
Plugin 'claco/jasmine.vim'                  " jasmine
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'honza/vim-snippets'                 " snippets
Plugin 'SirVer/ultisnips'                   " track the engine for snippets
Plugin 'groenewege/vim-less'                " less support
Plugin 'dkprice/vim-easygrep'               " global search and replace
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
syntax on
:hi comment ctermfg=darkgray
:hi type ctermfg=37

set cursorline cursorcolumn

" tabs
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab
set expandtab

color seoul256

" set line numbers
set number
:hi LineNr ctermfg=gray
:hi CursorLineNr ctermfg=white

" show directory in vim (this is highly necessary)
set laststatus=2
set statusline+=%F

" html/css autocomplete
:set omnifunc=htmlcomplete#CompleteTags
:set omnifunc=csscomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" other omnifuncs?

""" ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim

" cmatch
let g:ctrlp_max_files = 10000
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }

" ignore files
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Use a leader instead of the actual named binding
nmap <leader>p :CtrlP<cr>

" Easy bindings for its various modes
" nmap <leader>bb :CtrlPBuffer<cr>
" nmap <leader>bm :CtrlPMixed<cr>
" nmap <leader>bs :CtrlPMRU<cr>


""" syntastic
let b:syntastic_mode_map = {
    \ "mode": "active",
    \ "active_filetypes": ["scss"],
    \ "passive_filetypes": ["python", "javascript"] }
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers=['flake8']
let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_scss_checkers = ['scss_lint']
" let g:syntastic_html_tidy_exec = 'tidy5'
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
nmap <leader>y :SyntasticToggleMode<CR>
nmap <leader>c :SyntasticCheck<CR>

" tagbar being mapped to f8
nmap <F8> :TagbarToggle<CR>
" NERDTree being mapped to f7
nmap <F7> :NERDTreeToggle<CR>
" Close vim if NERDTree is only thing remaining
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" set updatetime to 250ms to speed up vim-gitgutter
set updatetime=250
" Line highlight mapped to f6
nmap <F6> :GitGutterLineHighlightsToggle<CR>

" set ctrlp to match NERDTree root
let g:NERDTreeChDirMode       = 2
let g:ctrlp_working_path_mode = 'rw'

" set ag to run ctrlp
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'

" more ctrlp stuff
" let g:ctrlp_match_window = 'bottom,order:ttb'   " top to bottom order matching
" let g:ctrlp_switch_buffer = 0                   " open a file with a new buffer
" let g:ctrlp_working_path_mode = 0               " lets us change a working directory

" Searching
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
nnoremap <leader><space> :nohlsearch<CR>

filetype indent on

" Does this conflict with YCM?
set wildmenu

set lazyredraw

" Highlight matching [{()}]
set showmatch

" Move vertically by visual line
nnoremap j gj
nnoremap k gk

" Move to beginning/end of line
" This could be controversial since it overrides ^ and $
nnoremap B ^
nnoremap E $
" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" open ag.vim
nnoremap <leader>a :Ag

" airline config
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod = ':t'
set guifont=Monaco\ for\ Powerline\ for\ Powerline:h12
set encoding=utf-8

" tabs and buffers
set hidden              " this is necessary
nmap <leader>b :enew<cr>
nmap <leader><left> :bnext<CR>
nmap <leader><right> :bprevious<CR>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>
nmap <leader>q :bd<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Goyo and Limelight
nnoremap <leader>g :Goyo<CR>
nnoremap <leader>t :Limelight!!<CR>
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" FZF
nnoremap <leader>f :FZF<CR>

" No swp files please
set noswapfile

" Code folding
" za (toggle), zc (close), zo (open), zR (open all), zM (close all)
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

" Auto update vim when file changes
:set autoread

" js framework syntax
let g:used_javascript_libs = 'underscore,angularjs,jasmine'

" test ultisnips
let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']

" this is amazing. copy to osx clipboard
set clipboard=unnamed

" scroll with the mouse
set mouse=nicr

" fzf
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
" - window (nvim only)
let g:fzf_layout = { 'down': '~40%'  }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
            \ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" buffers
map gn :bn<cr>
map gp :bp<cr>

set colorcolumn=120

let g:tagbar_type_typescript = {
  \ 'ctagstype': 'typescript',
  \ 'kinds': [
    \ 'c:classes',
    \ 'n:modules',
    \ 'f:functions',
    \ 'v:variables',
    \ 'v:varlambdas',
    \ 'm:members',
    \ 'i:interfaces',
    \ 'e:enums',
  \ ]
\ }
