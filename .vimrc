"NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=/Users/patrick.regan/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/Users/patrick.regan/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-git'
NeoBundle 'tpope/vim-sensible'
NeoBundle 'tpope/vim-scriptease'
NeoBundle 'tpope/vim-characterize'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-tbone'
NeoBundle 'tpope/vim-sleuth'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-obsession'
NeoBundle 'tpope/vim-jdaddy'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'tpope/vim-speeddating'
NeoBundle 'tpope/vim-vinegar'
NeoBundle 'idanarye/vim-merginal'
NeoBundle 'bling/vim-airline'
NeoBundle 'lepture/vim-jinja'
NeoBundle 'sheerun/vim-polyglot'
NeoBundle 'godlygeek/tabular'
NeoBundle 'vim-pandoc/vim-pandoc-syntax'
NeoBundle 'vim-pandoc/vim-pandoc'
NeoBundle 'vim-pandoc/vim-pandoc-after'
NeoBundle 'elzr/vim-json'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'FelikZ/ctrlp-py-matcher' " speeds up ctrlP
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'ajh17/VimCompletesMe'
NeoBundle 'SirVer/ultisnips' " New 'snipmate'
NeoBundle 'honza/vim-snippets'
NeoBundle 'vadv/vim-chef'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'rking/ag.vim'
NeoBundle 'ConradIrwin/vim-bracketed-paste'
NeoBundle 'roman/golden-ratio'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'ervandew/supertab'
NeoBundle 'thomwiggers/vim-colors-solarized'
NeoBundle 'ntpeters/vim-better-whitespace'
NeoBundle 'chase/vim-ansible-yaml'
NeoBundle 'wakatime/vim-wakatime'
NeoBundle 'jeetsukumaran/vim-indentwise'
NeoBundle 'chrisbra/csv.vim'

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------


"
" Customizations go after this line

set laststatus=2
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

" My changes

" Spellcheck Git commit messages
autocmd FileType gitcommit setlocal spell

" Limit the line length for markdown
" autocmd FileType pandoc set tw=80
autocmd FileType pandoc setlocal spell
" autocmd FileType pandoc set tabstop=2
" autocmd FileType pandoc set softtabstop=2
" autocmd FileType pandoc set shiftwidth=2
" autocmd FileType pandoc set expandtab
" autocmd FileType pandoc set conceallevel=2

" Pandoc internal codeblock highlights
let g:pandoc#syntax#codeblocks#embeds#langs = ["json=javascript","ruby","python","bash=sh"]
let g:pandoc#formatting#mode = 'hA'
let g:pandoc#formatting#textwidth = 80

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
set backup
set writebackup
set ttyfast
set mouse=a
" set breakindent

" Set annoying directories
" Save your backups to a less annoying place than the current directory.
" If you have .vim-backup in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/backup or . if all else fails.
if isdirectory($HOME . '/.vim/backup') == 0
  :silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup

" Save your swp files to a less annoying place than the current directory.
" If you have .vim-swap in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
  :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif


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

let g:syntastic_javascript_checkers = ['jscs','jshint']

" An attempt to get clipboard support in tmux
if $TMUX == ''
    set clipboard+=unnamed
endif

"Json, show quotes (don't conceal)
let g:vim_json_syntax_conceal = 0

 " Trigger configuration. Do not use <tab> if you use
" " https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" GitGutter
"Make GitGutter slightly faster
let g:gitgutter_realtime=1500
highlight clear SignColumn

" Leader shortcuts
" Open Vimrc
nmap <leader>v :tabedit $MYVIMRC<CR>

" Toggle paste mode
set pastetoggle=<leader>p

" Open ScratchPad
nmap <leader>s :tabedit ~/Dropbox/Scratchpad.md<cr>

" Open EmailScratchPad
nmap <leader>e :tabedit ~/Dropbox/Email.md<cr>

" Json Tool Useage
nmap <leader>j :%!python -m json.tool<CR>

" Turn off and on numbers
nmap <leader>n :set number!<CR>:set relativenumber!<CR>

" Toggle Git Gutter
nmap <leader>g :GitGutterToggle<CR>

" CtrlP in Tag mode
nnoremap <leader>. :CtrlPTag<CR>

" Toggle Tagbar
nnoremap <silent> <Leader>b :TagbarToggle<CR>

" Update Tags
if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    " Do Mac stuff here
    nnoremap <silent> <Leader>t :!/usr/local/bin/ctags -R -f ./.git/tags .<CR>
  endif
else
  nnoremap <silent> <Leader>t :!ctags -R -f ./.git/tags .<CR>
endif

" Whitespace stuff
" Whitespace Highlight Toggle
nnoremap <silent> <leader>w :ToggleWhitespace<CR>
" And Strip it
nnoremap <silent> <leader>W :StripWhitespace<CR>

" prettify
nnoremap <leader>= gg=G``

" Table Format (markdown files only)
nnoremap <silent> <leader>T :TableFormat<CR>

" Toggle SemanticHighlighting
nnoremap <silent> <Leader>h :SemanticHighlightToggle<CR>

" Tab align along = or :
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
  nmap <Leader>a> :Tabularize /=><CR>
  vmap <Leader>a> :Tabularize /=><CR>
endif
