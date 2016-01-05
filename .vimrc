" Without this, utf chars within this file could screw things up. Though any
" sane OS should figure this shit out by now.
scriptencoding utf-8

" Automatically grab vim-plug {{{1
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  augroup PlugInstall
    autocmd! VimEnter * PlugInstall
  augroup END
endif
" }}}1

" Plugins! {{{1
" Required:
call plug#begin('~/.vim/bundle')

" A few colorschemes I like {{{2
" Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'

" ########################################################
" Here starts God's^H^H^H^H^H Tim Pope's Plugin collection {{{2

" Sets up a lot of custom '.' repeats {{{3
Plug 'tpope/vim-repeat'

" Git integration {{{3
Plug 'tpope/vim-fugitive' " Actual git commands
let g:fugitive_github_domains = ['https://github.com', 'https://git.dev.pardot.com']

Plug 'tpope/vim-git' " Syntax for git related things

" Github Integration {{{3
Plug 'tpope/vim-rhubarb'

" Add, remove, and change surrounding pairs like (),[], etc. {{{3
Plug 'tpope/vim-surround'

" Quite a few sensable defaults. {{{3
Plug 'tpope/vim-sensible'

" 'cheap' character analysis. Helpful with UTF-8 stuff {{{3
Plug 'tpope/vim-characterize'

" Better integration of Unix commands {{{3
Plug 'tpope/vim-eunuch', { 'on': ['Remove','Unlink','Move','Rename','Chmod','Mkdir','Find','Locate','SudoEdit','SudoWrite','Wall','W'] }

" Simple, syntax aware commenting of lines {{{3
Plug 'tpope/vim-commentary'

" Good JSON commands {{{3
Plug 'tpope/vim-jdaddy', { 'for': ['javascript','json'] }

" Auto-add end in ruby and chef files {{{3
Plug 'tpope/vim-endwise', { 'for': ['ruby','chef','sh','lua'] }

" Helpful key-pairs for common actions: i.e. `]q` = next in qlist {{{3
Plug 'tpope/vim-unimpaired'

" Batch off commands to Tmux and/or backround tasks {{{3
Plug 'tpope/vim-dispatch'

" Makes CTRL-A work on datestamps {{{3
Plug 'tpope/vim-speeddating'

" Make the built-in explorer act modal {{{3
Plug 'tpope/vim-vinegar'

" Session management {{{3
Plug 'tpope/vim-obsession'

" thus ends the tpope collection
" ######################################################## }}}2
" A nice status-line that is plugin aware {{{2
Plug 'bling/vim-airline'

"""""""""""""""""""""""""""""""""""""" airline {{{3
" Airline with Unicode (more portable)
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⬍'
let g:airline_symbols.paste = '✂'
let g:airline_symbols.crypt = '🔐'
let g:airline_symbols.whitespace = 'Ξ'

" Tabline looks better
let g:airline#extensions#tabline#enabled = 1


" Syntax highlighting for a lot of 'extras' {{{2
Plug 'sheerun/vim-polyglot'

" Align and Justify text based on delimiters {{{2
Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)','EasyAlign'] }
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. geip)
nmap ge <Plug>(EasyAlign)

" Pandoc integration, because Markdown is awesome. {{{2
" This requires 7.4+ so fall back to native MD support if it's not present
if v:version >= 704 " because old vims hate this
  Plug 'vim-pandoc/vim-pandoc-syntax'
  Plug 'vim-pandoc/vim-pandoc'
  Plug 'vim-pandoc/vim-pandoc-after'
endif

" Better JSON syntax support {{{2
Plug 'elzr/vim-json', { 'for': ['javascript','json'] }

"""""""""""""""""""""""""""""""""""""" Json, show quotes (don't conceal) {{{3
let g:vim_json_syntax_conceal = 0

" A good in-line linter {{{2
Plug 'scrooloose/syntastic'

""""""""""""""""""""""""""""""""""""""" Syntastic {{{3
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_ruby_rubocop_exec = '~/.rbenv/shims/rubocop'

" Check on things when we open them
let g:syntastic_check_on_open = 1

" Put all errors in the same list
let g:syntastic_aggregate_errors = 1

" Allow some checks to be more active than others
let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "active_filetypes": ["ruby","python", "php"],
    \ "passive_filetypes": [] }

" Eruby's void context warnings are annoying. Get rid of them.
let g:syntastic_eruby_ruby_quiet_messages =
    \ {'regex': 'possibly useless use of a variable in void context'}


" " NeoMake async lint checker {{{2
" " Plug 'benekastah/neomake'
" Plug '~/workspace/personal/neomake'
" let g:neomake_logfile='neomake.log'

" augroup neomake_settings
"   autocmd! BufWritePost,BufEnter * Neomake
" augroup END

" Ctrl-P for everything, including non-vim stuff {{{2
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
nnoremap <silent> <C-p> :FZF<CR>

" More native-like autocomplete than neocomplete {{{2
Plug 'ajh17/VimCompletesMe'

" Chef sugar {{{2
Plug 'dougireton/vim-chef'

" Ferret to replace all search plugins {{{2
Plug 'wincent/ferret', { 'on': ['Ack', 'Acks', 'Lack', 'Qargs'] }
let g:FerretMap=0

" Show git changes {{{2
Plug 'airblade/vim-gitgutter'

""""""""""""""""""""""""""""""""""""""" GitGutter {{{3
"Make GitGutter slightly faster
let g:gitgutter_realtime=1500

" Super helpful in whitespace significant langs, like YAML or Python {{{2
Plug 'nathanaelkane/vim-indent-guides', { 'on': ['IndentGuidesEnable','IndentGuidesDisable','IndentGuidesToggle'] }

" Auto Tag management {{{2
Plug 'ludovicchabant/vim-gutentags'

" Use EditorConfig, like the rest of Pardot {{{2
Plug 'editorconfig/editorconfig-vim'

" Terminal Settings! {{{2
Plug 'wincent/terminus'
" Don't change cursor shape. It's incompatible with older Vim's anyway
let g:TerminusCursorShape=0

" Because working with CSV within vim is actually fun and useful {{{2
Plug 'chrisbra/csv.vim', { 'for': 'csv' }

" End of Plugin Manager {{{2
call plug#end()
" }}}1 End of Plugins

" Non-Plugin Customizations go after this line

"""""""""""""""""""""""""""""""""""""" General {{{1
colorscheme PaperColor
set background=dark
set foldlevel=2
set foldmethod=syntax
set incsearch " start moving while searching
set laststatus=2
set modeline
set number
set scrolloff=2
set showcmd
set smartcase
set splitright
set ttyfast
set writebackup

" Set Dictionary location
if has('unix')
  set dictionary=/usr/share/dict/words
endif


if exists('+breakindent')
  set breakindent
endif

if &t_Co > 2 || has('gui_running')
  syntax on
  set hlsearch
endif

filetype on                          " try to detect filetypes
filetype plugin indent on
augroup text_settings
  autocmd! FileType text setlocal textwidth=78
augroup END

augroup cronsettings
  autocmd! filetype crontab setlocal nobackup nowritebackup
augroup END

""""""""""""""""""""""""""""""""""""""" Pandoc file settings {{{1
augroup pandoc_settings
  autocmd!
  autocmd FileType pandoc set tw=78
  autocmd FileType pandoc setlocal tabstop=2
  autocmd FileType pandoc setlocal shiftwidth=2
  autocmd FileType pandoc setlocal expandtab
augroup END

" Pandoc internal codeblock highlights
let g:pandoc#syntax#codeblocks#embeds#langs = ["json=javascript","ruby","python","bash=sh","sh"]
let g:pandoc#formatting#textwidth            = 78
let g:pandoc#after#modules#enabled           = ["vimcompletesme"]
let g:pandoc#folding#level                   = 0
let g:pandoc#folding#mode                    = "syntax"

"""""""""""""""""""""""""""""""""""""" internal tweaks {{{1
" Set annoying directories {{{2
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
if has('nvim')
  set shada+=n~/.nvim/shada
else
  set viminfo+=n~/.vim/viminfo
endif

" This is only present in 7.3+ {{{3
if exists('+undofile')
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif


" Yaml tweaks {{{2
augroup YAML
  autocmd! FileType yaml set tabstop=2|set shiftwidth=2|set softtabstop=2|set expandtab
augroup END

" Make backspace actually useful {{{2
set backspace=indent,eol,start

" Completion changes
set complete =.,w,b,u,t,i,kspell

""""""""""""""""""""""""""""""""""""""" Spellcheck Git commit messages {{{1
augroup git_settings
  autocmd! FileType gitcommit setlocal spell
augroup END

" """""""""""""""""""""""""""""""""""""" Leader shortcuts {{{1
" Open Vimrc {{{2
if filereadable(expand('~/workspace/personal/dotfiles/.vimrc'))
  nmap <leader>v :tabedit ~/workspace/personal/dotfiles/.vimrc<CR>
elseif filereadable(expand('~/workspace/dotfiles/.vimrc'))
  nmap <leader>v :tabedit ~/workspace/dotfiles/.vimrc<CR>
else
  nmap <leader>v :tabedit $MYVIMRC<CR>
endif

" Open ScratchPad {{{2
if filereadable(expand('~/Dropbox/Scratchpad.md'))
  nmap <leader>s :tabedit ~/Dropbox/Scratchpad.md<cr>
elseif filereadable(expand('~/tmp/notes.md'))
  nmap <leader>s :tabedit ~/tmp/notes.md<cr>
else
  nmap <leader>s :tabedit /tmp/scratch.md<cr>
endif


" Fix Ruby Hashes {{{2
" Shamelessly stolen from http://www.economyofeffort.com/2014/07/09/vim-tricks-for-ruby-hashes/

function! RubyHashesAll()
  :%s/:\([^ ]*\)\(\s*\)=>/\1:/ge
endfunction

function! RubyHashesSelected()
  :'<,'>s/:\([^ ]*\)\(\s*\)=>/\1:/ge
endfunction

nnoremap <leader>r :call RubyHashesAll()<CR>
xnoremap <leader>r :call RubyHashesSelected()<CR>

" Find all TODOs and FIXMEs {{{2

nnoremap <leader>t :Ack FIXME\|TODO<cr>

" modline stuff {{{1
" vim: foldmethod=marker foldlevel=1 tabstop=2 expandtab shiftwidth=2
