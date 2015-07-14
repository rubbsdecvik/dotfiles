" Without this, utf chars within this file could screw things up. Though any
" sane OS should figure this shit out by now.
scriptencoding utf-8

" Automatically grab vim-plug {{{1
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif
" }}}1

" Plugins! {{{1
" Required:
call plug#begin('~/.vim/bundle')

" Gruvbox My current theme of choice {{{2
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'

" ########################################################
" Here starts God's^H^H^H^H^H Tim Pope's Plugin collection {{{2

" Sets up a lot of custom '.' repeats {{{3
Plug 'tpope/vim-repeat'

" Git integration {{{3
Plug 'tpope/vim-fugitive' " Actual git commands
let g:fugitive_github_domains = ['https://github.com', 'https://git.dev.pardot.com']
Plug 'tpope/vim-git' " Syntax for git related things

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

" Some Tmux integrations for interacting *with* tmux {{{3
Plug 'tpope/vim-tbone'

" Setup Abbreviations that auto-scale {{{3
Plug 'tpope/vim-abolish', { 'on': ['Abolish','Subvert'] }

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

" thus ends the tpope collection
" ######################################################## }}}2

" A viml library that us used by other plugins {{{2
Plug 'tomtom/tlib_vim'

" A nice status-line that is plugin aware {{{2
Plug 'bling/vim-airline'

" Syntax for Jinja templates {{{2
Plug 'lepture/vim-jinja'

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

" A good in-line linter {{{2
Plug 'scrooloose/syntastic'

" Fuzzy Finding {{{2
Plug 'ctrlpvim/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher' " speeds up ctrlP
let g:ctrlp_show_hidden = 1

" Ctrl-P for everything, including non-vim stuff {{{2
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }

" More native-like autocomplete than neocomplete {{{2
Plug 'ajh17/VimCompletesMe'

" Chef sugar {{{2
Plug 'dougireton/vim-chef', { 'for': ['ruby','chef'] }

" Visualize the undo tree {{{2
Plug 'sjl/gundo.vim', { 'on': ['GundoToggle','GundoHide','GundoRenderGraph','GundoShow'] }

" Ack incase ag isn't installed. Not super heavy {{{2
Plug 'mileszs/ack.vim', { 'on': ['Ack', 'AckAdd', 'AckFromSearch', 'LAck', 'LAckAdd', 'AckFile', 'AckHelp', 'LAckHelp', 'AwkWindow', 'LAckWindow'] }

" Silver Searcher support for Vim. Fairly lightweight. {{{2
Plug 'rking/ag.vim', { 'on': ['Ag', 'AgAdd', 'AgFromSearch', 'LAg', 'LAgAdd', 'AgFile', 'AgHelp', 'LAgHelp', 'AwkBuffer', 'LAgBuffer'] }

" Show git changes {{{2
Plug 'airblade/vim-gitgutter'

" Highlight, and also trim whitespace. Pretty lightweight {{{2
Plug 'ntpeters/vim-better-whitespace'

" Ansible specific YAML highlighting {{{2
Plug 'chase/vim-ansible-yaml'

" Because working with CSV within vim is actually fun and useful {{{2
Plug 'chrisbra/csv.vim', { 'for': 'csv' }

" Syntax & sugar for editing .tmux.conf. NOTE: Not redundant with tbone {{{2
Plug 'tmux-plugins/vim-tmux'

" Not really semantic, but helpful coloring for dense docs {{{2
Plug 'jaxbot/semantic-highlight.vim', { 'on': ['SemanticHighlight','SemanticHighlightRevert','SemanticHighlightToggle' ] }

" Super helpful in whitespace significant langs, like YAML or Python {{{2
Plug 'nathanaelkane/vim-indent-guides'

" Auto Tag management {{{2
Plug 'ludovicchabant/vim-gutentags'

" More text objects {{{2
Plug 'wellle/targets.vim'

" Use EditorConfig, like the rest of Pardot {{{2
Plug 'editorconfig/editorconfig-vim'

" Add time tracking {{{2
Plug 'wakatime/vim-wakatime'

" Different form of note taking {{{2
Plug 'fmoralesc/vim-pad'
let g:pad#dir = "~/Dropbox/notes/"
let g:pad#default_format = "pandoc"
let g:pad#local_dir='.notes'
let g:pad#window_height= 20

" Terminal Settings! {{{2
Plug 'wincet/terminus'

" End of Plugin Manager {{{2
call plug#end()
" }}}1 End of Plugins

" Non-Plugin Customizations go after this line

"""""""""""""""""""""""""""""""""""""" General {{{1
set laststatus=2
set background=dark
colorscheme gruvbox
set incsearch " start moving while searching
set smartcase
set scrolloff=2
set showcmd
set number
set writebackup
set ttyfast
set foldmethod=syntax
set foldlevel=2
set modeline
set splitright
" Because ancient vims dont' have this
" if exists('+relativenumber')
"   set relativenumber
" endif
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
" Otherwise it saves it to ~/.vim/swap, ~/tmp or . {{{2
if isdirectory($HOME . '/.vim/swap') == 0
  :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

" viminfo stores the the state of your previous editing session {{{2
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+ {{{2
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif

au FileType yaml set tabstop=2|set shiftwidth=2|set softtabstop=2|set expandtab
set backspace=indent,eol,start

autocmd FileType ruby,eruby set filetype=ruby.eruby.chef

"""""""""""""""""""""""""""""""""""""" airline {{{1
"let g:airline_powerline_fonts=1
let g:airline_symbols = {}

" Airline with Unicode (more portable)
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⬍'
let g:airline_symbols.paste = '✂'
let g:airline_symbols.whitespace = 'Ξ'

" Tabline looks better
let g:airline#extensions#tabline#enabled = 1

""""""""""""""""""""""""""""""""""""""" Spellcheck Git commit messages {{{1
autocmd FileType gitcommit setlocal spell

""""""""""""""""""""""""""""""""""""""" Pandoc file settings {{{1
autocmd FileType pandoc set tw=78
autocmd FileType pandoc setlocal spell
autocmd FileType text,markdown,pandoc let b:vcm_tab_complete = 'dict'
autocmd FileType pandoc setlocal tabstop=2
autocmd FileType pandoc setlocal shiftwidth=2
autocmd FileType pandoc setlocal expandtab

" Pandoc internal codeblock highlights
let g:pandoc#syntax#codeblocks#embeds#langs  = ["json=javascript","ruby","python","bash=sh"]
let g:pandoc#formatting#mode                 = 's'
let g:pandoc#formatting#textwidth            = 80
let g:pandoc#after#modules#enabled           = ["vimcompletesme"]
let g:pandoc#folding#level                   = 2


""""""""""""""""""""""""""""""""""""""" Syntastic {{{1
let g:syntastic_javascript_checkers = ['jscs','jshint']
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_ruby_rubocop_exec = '~/.rbenv/shims/rubocop'
" The following is only helpful if your codebase doesn't suck
" let g:syntastic_check_on_open = 1
let g:syntastic_aggregate_errors = 1

let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "active_filetypes": ["ruby","python", "php"],
    \ "passive_filetypes": ["eruby"] }

"""""""""""""""""""""""""""""""""""""" Json, show quotes (don't conceal) {{{1
let g:vim_json_syntax_conceal = 0

""""""""""""""""""""""""""""""""""""""" GitGutter {{{1
"Make GitGutter slightly faster
let g:gitgutter_realtime=1500
" highlight clear SignColumn

" """""""""""""""""""""""""""""""""""""" Leader shortcuts {{{1
" Open Vimrc {{{2
if filereadable(expand("~/workspace/personal/dotfiles/.vimrc"))
  nmap <leader>v :tabedit ~/workspace/personal/dotfiles/.vimrc<CR>
else
  nmap <leader>v :tabedit $MYVIMRC<CR>
endif

" Open ScratchPad {{{2
" nmap <leader>s :tabedit ~/Dropbox/Scratchpad.md<cr>

" Open EmailScratchPad {{{2
nmap <leader>e :tabedit ~/Dropbox/Email.md<cr>

" Json Tool Useage {{{2
nmap <leader>j :%!python -m json.tool<CR>

" Toggle Git Gutter {{{2
nmap <leader>g :GitGutterToggle<CR>

" CtrlP in Tag mode {{{2
nnoremap <leader>. :CtrlPTag<CR>

" CtrlP Clear Cache {{{2
nnoremap <leader>p :CtrlPClearAllCaches<CR>

" Update Tags {{{2
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

" Whitespace stuff {{{2
" Whitespace Highlight Toggle
nnoremap <silent> <leader>w :ToggleWhitespace<CR>
" And Strip it
nnoremap <silent> <leader>W :StripWhitespace<CR>

" prettify {{{2
nnoremap <leader>= gggqG``

" Toggle SemanticHighlighting {{{2
nnoremap <silent> <Leader>h :SemanticHighlightToggle<CR>

" vim: foldmethod=marker foldlevel=1
