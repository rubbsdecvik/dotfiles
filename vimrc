set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/vundle'

" The bundles you install will be listed here

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-scriptease'
Plugin 'tpope/vim-characterize'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-tbone'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-pastie'
Plugin 'tpope/vim-jdaddy'
Plugin 'idanarye/vim-merginal'
Plugin 'bling/vim-airline'
Plugin 'klen/python-mode'
Plugin 'lepture/vim-jinja'
Plugin 'ikiwiki-nav'
Plugin 'plasticboy/vim-markdown'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/syntastic'
Plugin 'edkolev/promptline.vim'
Plugin 'elzr/vim-json'
Plugin 'kien/ctrlp.vim'
Plugin 'FelikZ/ctrlp-py-matcher' " speeds up ctrlP
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'SirVer/ultisnips' " New 'snipmate'
Plugin 'honza/vim-snippets'
Plugin 'vadv/vim-chef'
Plugin 'sjl/gundo.vim'
Plugin 'jaxbot/semantic-highlight.vim'
Plugin 'godlygeek/tabular'
Plugin 'mileszs/ack.vim'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-endwise'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-unimpaired'
Plugin 'ConradIrwin/vim-bracketed-paste'
Plugin 'zhaocai/GoldenView.Vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-speeddating'
Plugin 'thomwiggers/vim-colors-solarized'
Plugin 'terryma/vim-expand-region'
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
Plugin 'Shougo/unite.vim'
Plugin 'farseer90718/unite-workflow'


filetype plugin indent on

" Customizations go after this line

augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 120
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python set nowrap
augroup END

" Powerline setup
"set guifont=Ubuntu\ Mono\ for\ Powerline\ 10
set laststatus=2
"let g:Powerline_symbols = "fancy"
set t_Co=256


" airline
"let g:airline_powerline_fonts=1
let g:airline_symbols = {}

" Airline with Unicode (more portable)
"let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.branch = '➲'
let g:airline_symbols.branch = '⬍'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
let g:airline_symbols.paste = '✂'
let g:airline_symbols.whitespace = 'Ξ'

" NerdTree setup
map <F2> :NERDTreeToggle<CR>


" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 1

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
"let g:pymode_folding = 0





" My changes


" Limit the line length for this mode
autocmd FileType markdown set tw=80

"let g:solarized_termcolors=256
colorscheme solarized
set incsearch
set ignorecase
set smartcase
set scrolloff=2
set showcmd
set relativenumber
set number
set undofile
"set tabstop=2
"set softtabstop=2
"set shiftwidth=2
"set expandtab

set background=dark
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

set tabpagemax=25

syntax on                           " syntax highlighing
filetype on                          " try to detect filetypes
"filetype plugin indent on
"set autoindent smarttab
autocmd FileType text setlocal textwidth=78

set foldmethod=indent
set foldlevel=99

au FileType yaml set tabstop=2|set shiftwidth=2|set softtabstop=2|set expandtab
set backspace=indent,eol,start

autocmd FileType ruby,eruby set filetype=ruby.eruby.chef

"Json, show quotes (don't conceal)
let g:vim_json_syntax_conceal = 0

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"Make GitGutter slightly faster
let g:gitgutter_realtime=1500

"GoldenView
let g:goldenview__enable_default_mapping = 0
" 1. split to tiled windows
nmap <silent> <C-L>  <Plug>GoldenViewSplit
nmap <silent> <leader>R <Plug>ToggleGoldenViewAutoResize

" 2. quickly switch current window with the main pane
" and toggle back
nmap <silent> <leader>s   <Plug>GoldenViewSwitchMain
nmap <silent> <leader>S <Plug>GoldenViewSwitchToggle

" 3. Manually resize
nmap <silent <leader>r <Plug>GoldenViewResize



" Leader shortcuts
nmap <leader>v :tabedit $MYVIMRC<CR>
set pastetoggle=<leader>p
nmap <leader>j :%!python -m json.tool<CR>
nmap <leader>n :set number!<CR>:set relativenumber!<CR>
nmap <leader>g :GitGutterToggle<CR>
nnoremap <leader>. :CtrlPTag<CR>
nnoremap <silent> <Leader>b :TagbarToggle<CR>
nnoremap <silent> <Leader>t :!ctags -R -f ./.git/tags .<CR>
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif
