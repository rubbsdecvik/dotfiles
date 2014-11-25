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
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-speeddating'
Plugin 'idanarye/vim-merginal'
Plugin 'bling/vim-airline'
Plugin 'lepture/vim-jinja'
Plugin 'sheerun/vim-polyglot'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/syntastic'
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
Plugin 'mileszs/ack.vim'
Plugin 'rking/ag.vim'
Plugin 'ConradIrwin/vim-bracketed-paste'
Plugin 'roman/golden-ratio'
Plugin 'airblade/vim-gitgutter'
Plugin 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe'
Plugin 'thomwiggers/vim-colors-solarized'
Plugin 'terryma/vim-expand-region'
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
Plugin 'justinmk/vim-gtfo'
Plugin 'mnpk/vim-jira-complete'
Plugin 'freeo/vim-kalisi'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'mtth/scratch.vim'

filetype plugin indent on

" Customizations go after this line

augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 120
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python set nowrap
augroup END

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

" Spellcheck Git commit messages
autocmd FileType gitcommit setlocal spell

" Limit the line length for markdown
autocmd FileType markdown set tw=80
autocmd FileType markdown setlocal spell
autocmd FileType markdown set tabstop=2
autocmd FileType markdown set softtabstop=2
autocmd FileType markdown set shiftwidth=2
autocmd FileType markdown set expandtab

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
" set backupdir=~/.vimbackup
" set dir=~/.vimswp
set ttyfast
set mouse=a
"set tabstop=2
"set softtabstop=2
"set shiftwidth=2
"set expandtab
set breakindent

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

" An attempt to get clipboard support in tmux
if $TMUX == ''
    set clipboard+=unnamed
endif

"Json, show quotes (don't conceal)
let g:vim_json_syntax_conceal = 0

" " Trigger configuration. Do not use <tab> if you use
" " https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"Make GitGutter slightly faster
let g:gitgutter_realtime=1500

" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Unite stuff.

" nnoremap [unite] <Nop>
" nmap <space> [unite]

" " CtrlP search
" call unite#filters#matcher_default#use(['matcher_fuzzy'])
" call unite#filters#sorter_default#use(['sorter_rank'])
" call unite#custom#source('file_rec/async','sorters','sorter_rank')
" " replacing unite with ctrl-p
" nnoremap <silent> <C-p> :Unite -start-insert -buffer-name=files -winheight=10 file_rec/async<cr>

" " recent files
" map [unite]F :Unite -no-split -start-insert buffer tab file_mru directory_mru<cr>

" " Ag
" nnoremap [unite]/ :Unite grep:.<cr>
" if executable('ag')
"   let g:unite_source_grep_command = 'ag'
"   let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
"   let g:unite_source_grep_recursive_opt = ''
" endif

" call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
"   \ 'ignore_pattern', join([
"   \ '\.git/',
"   \ '\.sass-cache/',
"   \ '\vendor/',
"   \ '\node_modules/',
"   \ ], '\|'))

" " Custom mappings for the unite buffer
" autocmd FileType unite call s:unite_settings()
" function! s:unite_settings()
"   let b:SuperTabDisabled=1

"   imap <buffer> <C-j> <Plug>(unite_select_next_line)
"   imap <buffer> <C-k> <Plug>(unite_select_previous_line)
"   imap <buffer> <c-a> <Plug>(unite_choose_action)

"   imap <silent><buffer><expr> <C-s> unite#do_action('split')
"   imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
"   imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')

"   nmap <buffer> <ESC> <Plug>(unite_exit)
" endfunction


" " Yankring
" let g:unite_source_history_yank_enable = 1
" nnoremap [unite]y :Unite history/yank<cr>

" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Leader shortcuts
" Open Vimrc
nmap <leader>v :tabedit $MYVIMRC<CR>

" Toggle paste mode
set pastetoggle=<leader>p

" Open ScratchPad
nmap <leader>s :tabedit ~/Dropbox/Scratchpad.md<cr>

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
