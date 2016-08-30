" Without this, utf chars within this file could screw things up. Though any
" sane OS should figure this shit out by now.
set encoding=utf-8
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
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'
Plug 'robertmeta/nofrils'

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

" Rake for Rake instead of Make {{{3
Plug 'tpope/vim-rake'

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
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'

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

" " NeoMake async lint checker {{{2
" " Plug 'benekastah/neomake'
" Plug '~/workspace/personal/neomake'

" augroup neomake_settings
"   autocmd! BufWritePost,BufEnter * Neomake
" augroup END

" " let g:neomake_logfile='/tmp/neomake.out'
" " let g:neomake_chef_foodcritic_remove_invalid_entries = 0

" Ctrl-P for everything, including non-vim stuff {{{2
" Also has a vim plugin for extra wrapping and functionality
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install --all' } | Plug 'junegunn/fzf.vim'

" FZF mappings {{{3
nnoremap <silent> <C-p> :Files<CR>

" More native-like autocomplete than neocomplete {{{2
Plug 'ajh17/VimCompletesMe'

" Ferret to replace all search plugins {{{2
Plug 'wincent/ferret'
let g:FerretMap=0

" Show git changes {{{2
Plug 'airblade/vim-gitgutter'

" In-vim Gitk viewer {{{2
Plug 'junegunn/gv.vim'

" Super helpful in whitespace significant langs, like YAML or Python {{{2
Plug 'nathanaelkane/vim-indent-guides', { 'on': ['IndentGuidesEnable','IndentGuidesDisable','IndentGuidesToggle'] }

" Auto Tag management {{{2
Plug 'ludovicchabant/vim-gutentags'

if filereadable(expand('/usr/local/Cellar/universal-ctags/HEAD/bin/ctags'))
  let g:gutentags_ctags_executable = '/usr/local/Cellar/universal-ctags/HEAD/bin/ctags'
endif

if filereadable(expand('~/.chefdk/gem/ruby/2.1.0/bin/ripper-tags'))
  let g:gutentags_ctags_executable_ruby = '~/.chefdk/gem/ruby/2.1.0/bin/ripper-tags'
endif

" Use EditorConfig {{{2
Plug 'editorconfig/editorconfig-vim'
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" Terminal Settings! {{{2
Plug 'wincent/terminus'
" Don't change cursor shape. It's incompatible with older Vim's anyway
let g:TerminusCursorShape=0

" Because working with CSV within vim is actually fun and useful {{{2
Plug 'chrisbra/csv.vim', { 'for': 'csv' }

" Better directory navigation {{{2
Plug 'justinmk/vim-dirvish', { 'on': ['Dirvish','Shdo'] }

" Undo Tree {{{2
Plug 'mbbill/undotree/', { 'on': ['UndotreeToggle','UndotreeClose','UntotreeOpen'] }

" Neoterm {{{2
if exists(':terminal')
  Plug 'kassio/neoterm'
endif
let g:neoterm_position = 'vertical'

" Wakatime for Tracking {{{2
Plug 'wakatime/vim-wakatime'

" End of Plugin Manager {{{2
call plug#end()
" }}}1 End of Plugins

" Non-Plugin Customizations go after this line

"""""""""""""""""""""""""""""""""""""" General {{{1
colorscheme PaperColor
set background=dark
set foldlevel=4
set incsearch " start moving while searching
set laststatus=2
set modeline
set number
set scrolloff=2
set showcmd
set smartcase
set splitright
set splitbelow
set ttyfast
set writebackup
set tabstop=2
set shiftwidth=2
set nojoinspaces " this is so the `J` command only has one space after a .

" Colorscheme changes
let g:nofrils_strbackgrounds=1
let g:nofrils_heavycomments=1

try
  set listchars=tab:>›,trail:¬,nbsp:␣,space:·
catch /^Vim\%((\a\+)\)\=:E474/
  set listchars=tab:>›,trail:¬,nbsp:␣
endtry

" Make Swap file update more often
set updatetime=250

" Set Dictionary location
if has('unix')
  set dictionary=/usr/share/dict/words
endif

if exists('+colorcolumn')
set foldmethod=syntax
  set colorcolumn=80
endif

if exists('+breakindent')
  set breakindent
endif

if exists('+linebreak')
  set linebreak
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

"""""""""""""""""""""""""""""""""""""" Abbreviations {{{1
" Insert mode ddate should add date stamp
iab <expr> ddate strftime("%b %d - %a")
iab <expr> ttime strftime("%T")

"""""""""""""""""""""""""""""""""""""" airline {{{1
" Airline with Unicode (more portable)
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = '▒'
let g:airline_right_sep = '▒'
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⑃'
let g:airline_symbols.paste = '✂'
let g:airline_symbols.crypt = '🔐'
let g:airline_symbols.whitespace = 'Ξ'

" Tabline looks better
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" show status of Obsession and tags
let g:airline_section_z = airline#section#create(['%{gutentags#statusline("✎")} ','%{ObsessionStatus(''⊞'', '''')}', 'windowswap', '%3p%% ', 'linenr', ':%3v '])

""""""""""""""""""""""""""""""""""""""" Pandoc file settings {{{1
augroup pandoc_settings
  autocmd!
  autocmd FileType pandoc set tw=78
  autocmd FileType pandoc setlocal tabstop=2
  autocmd FileType pandoc setlocal shiftwidth=2
  autocmd FileType pandoc setlocal expandtab
augroup END

" Pandoc internal codeblock highlights
let g:pandoc#syntax#codeblocks#embeds#langs = ['json=javascript','ruby','python','bash=sh','sh','yaml','ansible','ini=dosini','dosini']
let g:pandoc#formatting#textwidth            = 78
let g:pandoc#after#modules#enabled           = ['vimcompletesme']
let g:pandoc#folding#level                   = 0
let g:pandoc#folding#mode                    = 'syntax'
let g:pandoc#modules#disabled = ['chdir']

""""""""""""""""""""""""""""""""""""""" Syntastic {{{1
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_php_checkers = ['phplint']
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_ruby_rubocop_exec = '~/.rbenv/shims/rubocop'

" Check on things when we open them
let g:syntastic_check_on_open = 0

" Put all errors in the same list
let g:syntastic_aggregate_errors = 1

" We're not using the local list for anything else anyway
let g:syntastic_always_populate_loc_list = 1

" Allow some checks to be more active than others
let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "active_filetypes": ["ruby","python"],
    \ "passive_filetypes": ["php"] }

" Eruby's void context warnings are annoying. Get rid of them.
let g:syntastic_eruby_ruby_quiet_messages =
    \ {'regex': 'possibly useless use of a variable in void context'}


"""""""""""""""""""""""""""""""""""""" internal tweaks {{{1
" Set annoying directories {{{2
" Save your backups to a less annoying place than the current directory.
" If you have .vim-backup in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/backup or . if all else fails.
if isdirectory($HOME . '/.vim/backup') == 0
  call mkdir($HOME.'/.vim/backup', 'p')
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
  call mkdir($HOME . '/.vim/swap', 'p')
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

" viminfo stores the the state of your previous editing session
if exists('+shada')
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
    call mkdir($HOME . '/.vim/undo', 'p')
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif


" Yaml tweaks {{{2
augroup YAML
  autocmd!
  autocmd FileType yaml set tabstop=2|set shiftwidth=2|set softtabstop=2|set expandtab
augroup END

" Make backspace actually useful {{{2
set backspace=indent,eol,start

" Completion changes {{{2
set complete =.,w,b,u,t,i,kspell

""""""""""""""""""""""""""""""""""""""" Python {{{1
augroup python_settings
  autocmd! FileType python setlocal foldmethod=indent
augroup END

""""""""""""""""""""""""""""""""""""""" Spellcheck Git commit messages {{{1
augroup git_settings
  autocmd! FileType gitcommit setlocal spell
augroup END

"""""""""""""""""""""""""""""""""""""""" Python Syntax Settings {{{1
let g:python_highlight_all = 1

"""""""""""""""""""""""""""""""""""""""" Leader shortcuts {{{1
" Open Vimrc {{{2
if filereadable(expand('~/workspace/personal/dotfiles/.vimrc'))
  nmap <leader>v :tabedit ~/workspace/personal/dotfiles/.vimrc<CR>
elseif filereadable(expand('~/workspace/dotfiles/.vimrc'))
  nmap <leader>v :tabedit ~/workspace/dotfiles/.vimrc<CR>
else
  nmap <leader>v :tabedit $MYVIMRC<CR>
endif

" Open ScratchPad {{{2
if filereadable(expand('~/workspace/personal/wiki/README.md'))
  nmap <leader>s :vsplit ~/workspace/personal/wiki/README.md<cr>
elseif filereadable(expand('~/tmp/notes.md'))
  nmap <leader>s :vsplit ~/tmp/notes.md<cr>
else
  nmap <leader>s :vsplit /tmp/scratch.md<cr>
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

" Find all occurances under cursor {{{2
nmap <leader>f <Plug>(FerretAckWord)

" Set List {{{2

nnoremap <leader>l :set list!<cr>

" Turn Jira Link into Markdown Link to Ticket {{{2
nnoremap <leader>j :normal $F/l"ly$I- ["lpa](A)

" modline stuff {{{1
" vim: foldmethod=marker foldlevel=1 tabstop=2 expandtab shiftwidth=2
