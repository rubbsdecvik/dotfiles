"Automatically grab vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" Required:
" call plug#begin('~/.vim/plugged')
call plug#begin('~/.vim/bundle')

Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-git'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-tbone'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-vinegar'
Plug 'bling/vim-airline'
Plug 'lepture/vim-jinja'
Plug 'sheerun/vim-polyglot'
Plug 'godlygeek/tabular'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-after'
Plug 'elzr/vim-json'
Plug 'scrooloose/syntastic'
Plug 'kien/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher' " speeds up ctrlP
Plug 'tomtom/tlib_vim'
Plug 'ajh17/VimCompletesMe'
Plug 'dougireton/vim-chef'
Plug 'sjl/gundo.vim'
Plug 'mileszs/ack.vim'
Plug 'rking/ag.vim'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'airblade/vim-gitgutter'
Plug 'ntpeters/vim-better-whitespace'
Plug 'chase/vim-ansible-yaml'
Plug 'chrisbra/csv.vim'
Plug 'tmux-plugins/vim-tmux'
Plug 'jaxbot/semantic-highlight.vim', { 'on': ['SemanticHighlight','SemanticHighlightRevert','SemanticHighlightToggle' ] }
Plug 'wakatime/vim-wakatime'
call plug#end()

" Customizations go after this line

"""""""""""""""""""""""""""""""""""""""""" General
set laststatus=2
set t_Co=256
colorscheme gruvbox
set background=dark
set incsearch
set smartcase
set scrolloff=2
set showcmd
set relativenumber
set number
set writebackup
set ttyfast
set mouse=a

if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

set nocompatible
filetype on                          " try to detect filetypes
filetype plugin indent on
"set autoindent smarttab
autocmd FileType text setlocal textwidth=78

" set foldmethod=indent
" set foldlevel=99

" Set Dictionary location
if has("unix")
  set dictionary=/usr/share/dict/words
endif


"""""""""""""""""""""""""""""""""""""""""" internal tweaks
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


"""""""""""""""""""""""""""""""""""""""""" airline
"let g:airline_powerline_fonts=1
let g:airline_symbols = {}

" Airline with Unicode (more portable)
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⬍'
let g:airline_symbols.paste = '✂'
let g:airline_symbols.whitespace = 'Ξ'

""""""""""""""""""""""""""""""""""""""""""" Spellcheck Git commit messages
autocmd FileType gitcommit setlocal spell

""""""""""""""""""""""""""""""""""""""""""" Pandoc file settings
autocmd FileType pandoc set tw=78
autocmd FileType pandoc setlocal spell
autocmd FileType text,markdown,pandoc let b:vcm_tab_complete = 'dict'

" Pandoc internal codeblock highlights
let g:pandoc#syntax#codeblocks#embeds#langs = ["json=javascript","ruby","python","bash=sh"]
let g:pandoc#formatting#mode = 's'
let g:pandoc#formatting#textwidth = 80
let g:pandoc#after#modules#enabled = ["vimcompletesme"]

au FileType yaml set tabstop=2|set shiftwidth=2|set softtabstop=2|set expandtab
set backspace=indent,eol,start

autocmd FileType ruby,eruby set filetype=ruby.eruby.chef

""""""""""""""""""""""""""""""""""""""""""" Syntastic
let g:syntastic_javascript_checkers = ['jscs','jshint']
let g:syntastic_check_on_open = 1

" An attempt to get clipboard support in tmux
" if $TMUX == ''
"     set clipboard+=unnamed
" endif

"""""""""""""""""""""""""""""""""""""""""" Json, show quotes (don't conceal)
let g:vim_json_syntax_conceal = 0

""""""""""""""""""""""""""""""""""""""""""" GitGutter
"Make GitGutter slightly faster
let g:gitgutter_realtime=1500
" highlight clear SignColumn

""""""""""""""""""""""""""""""""""""""""""" Leader shortcuts
" Open Vimrc
if filereadable(expand("~/workspace/personal/dotfiles/.vimrc"))
  nmap <leader>v :tabedit ~/workspace/personal/dotfiles/.vimrc<CR>
else
  nmap <leader>v :tabedit $MYVIMRC<CR>
endif

" Toggle paste mode
set pastetoggle=<leader>p

" Open ScratchPad
nmap <leader>s :tabedit ~/Dropbox/Scratchpad.md<cr>

" Open EmailScratchPad
nmap <leader>e :tabedit ~/Dropbox/Email.md<cr>

" Json Tool Useage
nmap <leader>j :%!python -m json.tool<CR>

" Toggle Git Gutter
if exists(":GitGutterToggle")
  nmap <leader>g :GitGutterToggle<CR>
endif

" CtrlP in Tag mode
if exists(":CtrlPTag")
  nnoremap <leader>. :CtrlPTag<CR>
endif

" Update Tags
if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    " Do Mac stuff here
    nnoremap <silent> <Leader>t :!/usr/local/bin/ctags -R -f ./.git/tags .<CR>
    au BufEnter /private/tmp/crontab.* setl backupcopy=yes
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
  nmap <Leader>a| :Tabularize /|<CR>
  vmap <Leader>a| :Tabularize /|<CR>
endif
