" Without this, utf chars within this file could screw things up. Though any
" sane OS should figure this shit out by now.
scriptencoding utf-8

"Automatically grab vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" Plugins!
" Required:
" call plug#begin('~/.vim/plugged')
call plug#begin('~/.vim/bundle')

" My current theme of choice
Plug 'morhetz/gruvbox'

" ########################################################
" Here starts God's^H^H^H^H^H Tim Pope's Plugin collection

" Sets up a lot of custom '.' repeats
Plug 'tpope/vim-repeat'

" Git integration
Plug 'tpope/vim-fugitive' " Actual git commands
Plug 'tpope/vim-git' " Syntax for git related things

" Add, remove, and change surrounding pairs like (),[], etc.
Plug 'tpope/vim-surround'

" Quite a few sensable defaults. Some of which are overridden in this file
Plug 'tpope/vim-sensible'

" 'cheap' character analysis. Helpful with UTF-8 stuff
Plug 'tpope/vim-characterize'

" Better integration of Unix commands
Plug 'tpope/vim-eunuch', { 'on': ['Remove','Unlink','Move','Rename','Chmod','Mkdir','Find','Locate','SudoEdit','SudoWrite','Wall','W'] }

" Simple, syntax aware commenting of lines
Plug 'tpope/vim-commentary'

" Some Tmux integrations for interacting *with* tmux
Plug 'tpope/vim-tbone'

" Auto-detect and setup expandtab, tabstop, and shiftwidth
Plug 'tpope/vim-sleuth'

" Setup Abbreviations that auto-scale
Plug 'tpope/vim-abolish', { 'on': ['Abolish','Subvert'] }

" Keep sessions updated
Plug 'tpope/vim-obsession'

" Good JSON commands
Plug 'tpope/vim-jdaddy', { 'for': ['javascript','json'] }

" Auto-add end in ruby and chef files
Plug 'tpope/vim-endwise', { 'for': ['ruby','chef','sh','lua'] }

" Super helpful non-intrusive key-pairs for common actions, like next in the
" quicklist `]q`
Plug 'tpope/vim-unimpaired'

" Batch off commands to Tmux and/or backround tasks
Plug 'tpope/vim-dispatch'

" Makes CTRL-A work on datestamps
Plug 'tpope/vim-speeddating'

" Make the built-in explorer act modal
Plug 'tpope/vim-vinegar'

" thus ends the tpope collection
" ########################################################

" A viml library that us used by other plugins
Plug 'tomtom/tlib_vim'

" A nice status-line that is plugin aware
Plug 'bling/vim-airline'

" Syntax for Jinja templates
Plug 'lepture/vim-jinja'

" Syntax highlighting for a lot of 'extras'
Plug 'sheerun/vim-polyglot'

" Align and Justify text based on delimiters
Plug 'godlygeek/tabular', { 'on': ['Tabularize','AddTabularPattern','AddTabularPipeline'] }

" Pandoc integration, because Markdown is awesome.
" This requires 7.4+ so fall back to native MD support if it's not present
if v:version >= 704 " because old vims hate this
  Plug 'vim-pandoc/vim-pandoc-syntax'
  Plug 'vim-pandoc/vim-pandoc'
  Plug 'vim-pandoc/vim-pandoc-after'
endif

" Better JSON syntax support
Plug 'elzr/vim-json', { 'for': ['javascript','json'] }

" A good in-line linter
Plug 'scrooloose/syntastic'

" Fuzzy Finding
Plug 'ctrlpvim/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher' " speeds up ctrlP


" Ctrl-P for everything, including non-vim stuff
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }

" More native-like autocomplete than neocomplete
Plug 'ajh17/VimCompletesMe'

" Chef sugar
Plug 'dougireton/vim-chef', { 'for': 'chef' }

" Visualize the undo tree
Plug 'sjl/gundo.vim'

" Kept on because it doesn't clobber vimgrep and isn't super heavy, also,
" incase ag isn't installed
Plug 'mileszs/ack.vim', { 'on': ['Ack', 'AckAdd', 'AckFromSearch', 'LAck', 'LAckAdd', 'AckFile', 'AckHelp', 'LAckHelp', 'AwkWindow', 'LAckWindow']}

" Silver Searcher support for Vim. Fairly lightweight.
Plug 'rking/ag.vim', { 'on': ['Ag', 'AgAdd', 'AgFromSearch', 'LAg', 'LAgAdd', 'AgFile', 'AgHelp', 'LAgHelp', 'AwkBuffer', 'LAgBuffer']}

" Makes pasting in do auto :setpaste and :setnopaste when needed
Plug 'ConradIrwin/vim-bracketed-paste'

" Show git changes
Plug 'airblade/vim-gitgutter'

" Highlight, and also trim whitespace. Pretty lightweight
Plug 'ntpeters/vim-better-whitespace'

" Ansible specific YAML highlighting not lazing loading so it can recognize
" when it's in Ansible stuff
Plug 'chase/vim-ansible-yaml'

" Because working with CSV within vim is actually fun and useful
Plug 'chrisbra/csv.vim', { 'for': 'csv' }

" Syntax and other sugar for editing .tmux.conf. NOTE: Not redundant with
" tbone
Plug 'tmux-plugins/vim-tmux'

" Not exactly semantic, but gives a different highlight. good for super dense
" works.
Plug 'jaxbot/semantic-highlight.vim', { 'on': ['SemanticHighlight','SemanticHighlightRevert','SemanticHighlightToggle' ] }

" Helpful for Prose stuff.
Plug 'reedes/vim-wordy', { 'on': ['Wordy','NoWordy','NextWordy','PrevWordy']}

" Gives basic Github integration into Vim. Not super awesome, but can be lazy
" loaded.
if has("ruby") && v:version >= 700
  Plug 'junegunn/vim-github-dashboard', { 'on': ['GHDashboard', 'GHActivity', 'GHD', 'GHA'] }
  let g:github_dashboard = { 'username': 'rubbsdecvik', 'password': $GITHUB_TOKEN }
  nmap <leader>c :GHA Pardot/chef<cr>
endif

" Super helpful in whitespace significant langs, like YAML or Python
Plug 'nathanaelkane/vim-indent-guides'

" Auto Tag management
Plug 'ludovicchabant/vim-gutentags'

" End of Plugin Manager
call plug#end()

" Non-Plugin Customizations go after this line

"""""""""""""""""""""""""""""""""""""""""" General
set laststatus=2
set t_Co=256
colorscheme gruvbox
set background=dark
set incsearch
set smartcase
set scrolloff=2
set showcmd
set number
set writebackup
set ttyfast
set mouse=a
set foldmethod=syntax
set foldlevel=2
" Because ancient vims dont' have this
if exists('+relativenumber')
  set relativenumber
endif
if exists('+breakindent')
  set breakindent
endif

if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

filetype on                          " try to detect filetypes
filetype plugin indent on
autocmd FileType text setlocal textwidth=78

" Set Dictionary location
if has("unix")
  set dictionary=/usr/share/dict/words
endif

" insert newline without entering insert mode
nmap <silent> <leader>o o<esc>

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
let g:pandoc#syntax#codeblocks#embeds#langs  = ["json=javascript","ruby","python","bash=sh"]
let g:pandoc#formatting#mode                 = 's'
let g:pandoc#formatting#textwidth            = 80
let g:pandoc#after#modules#enabled           = ["vimcompletesme"]
let g:pandoc#folding#level                   = 2

au FileType yaml set tabstop=2|set shiftwidth=2|set softtabstop=2|set expandtab
set backspace=indent,eol,start

autocmd FileType ruby,eruby set filetype=ruby.eruby.chef tabstop=2 shiftwidth=2 expandtab

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
nmap <leader>g :GitGutterToggle<CR>

" CtrlP in Tag mode
nnoremap <leader>. :CtrlPTag<CR>

" Update Tags
if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    " Do Mac stuff here
    nnoremap <silent> <Leader>t :Dispatch! /usr/local/bin/ctags -R -f ./.git/tags .<CR>
    au BufEnter /private/tmp/crontab.* setl backupcopy=yes
  endif
else
  nnoremap <silent> <Leader>t :Dispatch! ctags -R -f ./.git/tags .<CR>
endif

" Whitespace stuff
" Whitespace Highlight Toggle
nnoremap <silent> <leader>w :ToggleWhitespace<CR>
" And Strip it
nnoremap <silent> <leader>W :StripWhitespace<CR>

" prettify
nnoremap <leader>= gggqG``

" Toggle SemanticHighlighting
nnoremap <silent> <Leader>h :SemanticHighlightToggle<CR>

