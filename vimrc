"‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
" Basic
" Quick .vimrc access
" UI settings
" Colors and Fonts
" File and buffer 
" Fold and scroll
" Tagging
" Search matching
" Status line 
" Terminal 
" Feature: Navigation
" Feature: Disable arrow key 
" Feature: Custom Mapping
" Vundle: Bundle Manager
" Plugin: NERDTree (file browser)
" Helper functions
"______________________________________________________________________________


"‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
" Basic
"______________________________________________________________________________
filetype off 
"call pathogen#helptags()
"call pathogen#infect()
"call pathogen#runtime_append_all_bundles()
filetype plugin indent on

"enable matchit build-in plugin - allow match on html tags, method (def - end)
runtime macros/matchit.vim

"Set leader key
let mapleader = ","
"remap to switch to command line
nnoremap ; :

"set tmp file dir
set dir=~/tmp
set bdir=~/tmp

"set no backup
set nobackup
set nowritebackup

"cmdline history
set history=1000

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
 
set list                       " Display unprintable characters
" Change symbols for tabstops and EOLs
set listchars=eol:¬,tab:▸\ ,trail:•,extends:»,precedes:«

" Change 
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.*/
augroup vimrc_autocmds
    autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
    autocmd BufEnter * match OverLength /\%101v.*/
augroup END

augroup sparkup_types
  " Remove ALL autocommands of the current group.
  autocmd!
  " Add sparkup to new filetypes
  autocmd FileType js, jsx runtime! ftplugin/html/sparkup.vim
augroup END
autocmd FileType javascript.js runtime! ftplugin/html/sparkup.vim
autocmd FileType javascript.jsx runtime! ftplugin/html/sparkup.vim
"vertical marker at char 100
set colorcolumn=100

"allow local config
set exrc
set secure
"‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
" Quick .vimrc access 
"______________________________________________________________________________

"edit .vimrc in a new tab
nmap <leader>v :tabedit $MYVIMRC<CR>

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

"‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
" UI settings
"______________________________________________________________________________

"full screen option
"set fuoptions=maxvert,maxhorz
"set fu

"turn off needless toolbar on gvim/mvim
set guioptions-=T

"turn off lazyredraw"
set nolazyredraw

"show incomplete cmds down the bottom
set showcmd     

"show current mode down the bottom
set showmode    

"turn on syntax highlighting
syntax on

"ignore case when searching
set ignorecase

"when searching if upercase is keyed in seach become case sensitive 
set smartcase

"highlight search results
set hlsearch

"incremental search: highlight as typed
set incsearch

" remove highlight
nmap <silent> ,/ :nohlsearch<CR>

"show number relative to the cursor
set relativenumber
"show absolute line number for the current
set number

" wrap text, allow break, hide eol character
set wrap linebreak nolist

"set visual clue when line break
set showbreak=...

"add line space for easy reading
set linespace=4

"indent settings
set shiftwidth=2
set softtabstop=2
set expandtab
set ts=2
set autoindent
"change character '|' by '.' in vertical split
set fillchars+=vert:.
"stop comments when pushing o/O
set formatoptions-=o 

"disable visual bell
set visualbell t_vb=

"‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
" Colors and Fonts
"______________________________________________________________________________
if $TERM =~ '256color'
  set t_Co=256
elseif $TERM =~ '^xterm$'
  set t_Co=256
endif

"set background=dark
"syntax enable
"colorscheme mango
colorscheme Tomorrow-Night
"colorscheme monokai
"set guifont=Menlo\ Bold:h14


"‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
" File and Buffer
"______________________________________________________________________________

" Always edit file, even when swap file is found
set shortmess+=A

"reselect just pasted text
nnoremap <leader>m V`]

"remove trailing space
autocmd FileType c,cpp,python,ruby,java,javascript,json autocmd BufWritePre <buffer> :%s/\s\+$//e

"add color syntax
au BufNewFile,BufRead *.json set ft=javascript
au BufNewFile,BufRead *.hamlbars set ft=haml

"allow backspacing over everything in insert mode
set backspace=indent,eol,start

"hide buffers when not displayed
set hidden

"‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
" Fold and scroll
"______________________________________________________________________________

"folding settings
set foldmethod=syntax   "fold based on syntax
set foldnestmax=5       "deepest fold is 5 levels
set nofoldenable        "dont fold by default

"vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

"‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
" Search matching
"______________________________________________________________________________

" Use Ag (https://github.com/ggreer/the_silver_searcher) instead of Grep when available
if executable("ag")
  set grepprg=ag\ --noheading\ --nogroup\ --nocolor
endif

set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing

"key mapping for vimgrep result navigation
map <A-o> :copen<CR>
map <A-q> :cclose<CR>
map <A-j> :cnext<CR>
map <A-k> :cprevious<CR>

"visual search mappings
function! s:VSetSearch()
    let temp = @@
    norm! gvy
    let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
    let @@ = temp
endfunction
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR>

"‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
" Tagging
"______________________________________________________________________________
set tag=./tags,tags,./.git/tags;/

"‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
" Status line 
"______________________________________________________________________________
let g:lightline = { 'colorscheme': 'wombat' }
"‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
" Terminal
"______________________________________________________________________________
"some stuff to get the mouse going in term
"set mouse=a
"set ttymouse=xterm2
"function! ScreenShellStartOrRestart()
  "if g:ScreenShellActive
    "ScreenShellReopen
  "else
    "ScreenShellVertical
  "endif
"endfunction

""screen settings
"let g:ScreenImpl = 'Tmux'
"let g:ScreenShellTmuxInitArgs = '-2'
"let g:ScreenShellInitialFocus = 'shell'
"let g:ScreenShellQuitOnVimExit = 0
"map <F5> :call ScreenShellStartOrRestart()<CR>
"command! -nargs=? -complete=shellcmd W  :w | :call ScreenShellSend("load '".@%."';")
"map <Leader>rc :ScreenShellVertical bundle exec rails c<CR>
"map <Leader>s :w<CR> :call ScreenShellSend("rspec ".@% . ':' . line('.'))<CR>
"map <Leader>e :w<CR> :call ScreenShellSend("cucumber --format=pretty ".@% . ':' . line('.'))<CR>
"map <Leader>b :w<CR> :call ScreenShellSend("break ".@% . ':' . line('.'))<CR>

"cursor shape
if exists('$ITERM_PROFILE')
  if exists('$TMUX')
    let &t_SI = "\<Esc>[3 q"
    let &t_EI = "\<Esc>[0 q"
  else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  endif
end

"‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
" Feature: Navigation
"______________________________________________________________________________

"key mapping for window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map + <C-w>+
map - <C-w>-

"‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
" Feature: Disable arrow keys
"______________________________________________________________________________

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
"nnoremap j gj
"nnoremap k gk

"‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
" Feature: Custom Mapping
"______________________________________________________________________________

"copy/paste clipboard
set clipboard=unnamed
"add ; at the end of a line
 inoremap <leader>; <C-o>A;

"force write on a readonly file
cmap w!! %!sudo tee > /dev/null %

"format json
map <leader>j %!python -m json.tool<cr>

"‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
" Vundle: Bundle Manager
"______________________________________________________________________________
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Vundle manage Vundle: required! 
  Plugin 'gmarik/vundle'
" original repos on github
  "Plugin 'kana/vim-fakeclip'
  "Plugin 'xolox/vim-reload'
  "Plugin 'xolox/vim-misc'
  Plugin 'jiangmiao/auto-pairs'
  Plugin 'kien/ctrlp.vim'
  "Plugin 'tomtom/quickfixsigns_vim'
  Plugin 'scrooloose/nerdcommenter'
  Plugin 'scrooloose/nerdtree'
  " syntax checking
  Plugin 'scrooloose/syntastic'
  " syntax beautifier
  "Plugin 'Chiel92/vim-autoformat'
  " beautify status line
  Plugin 'itchyny/lightline.vim'
  " tmux integration
  "Plugin 'ervandew/screen'
  Plugin 'SirVer/ultisnips'
  Plugin 'honza/vim-snippets'
  Plugin 'Valloric/YouCompleteMe'
  Plugin 'bentayloruk/vim-react-es6-snippets'
  "Plugin 'Konfekt/FastFold'
  Plugin 'terryma/vim-multiple-cursors'
  " A parser for a condensed HTML format 
  Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}  
  " see practical vim page 236
  "Plugin 'nelstrom/vim-qargs'
  "Plugin 'tpope/vim-repeat'
  Plugin 'tpope/vim-surround'
  "repeat motions
  "Plugin 'repmo.vim'
  Plugin 'epmatsw/ag.vim'
  "bar to display ctags on a panel
  Plugin 'majutsushi/tagbar'
  " syntax
  Plugin 'kchmck/vim-coffee-script'
  Plugin 'tpope/vim-cucumber'
  Plugin 'tpope/vim-haml'
  Plugin 'nono/vim-handlebars'
  Plugin 'tpope/vim-markdown'
  Plugin 'tpope/vim-rails'
  Plugin 'slim-template/vim-slim'
  Plugin 'muz/vim-gemfile'
  Plugin 'derekwyatt/vim-scala' 
  Plugin 'tfnico/vim-gradle'
  Plugin 'jade.vim'
  Plugin 'fatih/vim-go'
  Plugin 'pangloss/vim-javascript'
  Plugin 'mxw/vim-jsx'
  Plugin 'isRuslan/vim-es6'
  Plugin 'elzr/vim-json'
  Plugin 'iptables'
  Plugin 'crontab.vim'
  Plugin 'tmux-plugins/vim-tmux'
call vundle#end()            
filetype plugin indent on
"‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
" Plugin: ctrlp
"______________________________________________________________________________

let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:20'
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endi

"‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
" Plugin: UtltiSnip
"______________________________________________________________________________
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
"let g:UltiSnipsJumpBackwardTrigger="<C-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
"‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
" Plugin: sparkup
"______________________________________________________________________________

let g:sparkupDoubleQuote = 0

"‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
" Plugin: syntastic
"______________________________________________________________________________
let g:syntastic_javascript_checkers = ['eslint']

"‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
" Plugin: lightline - replacement for powerline
"______________________________________________________________________________


"‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
" Plugin: Tagbar
"______________________________________________________________________________

nnoremap <silent> <Leader>t :TagbarToggle<CR>

"‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
" Plugin: NERDTree
"______________________________________________________________________________

nmap <silent> <Leader>n :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<cr>
"make <c-l> clear the highlight as well as redraw
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>

"map to bufexplorer
nnoremap <leader>b :BufExplorer<cr>

"map Q to something useful
noremap Q gq

"make Y consistent with C and D
nnoremap Y y$

"mark syntax errors with :signs
let g:syntastic_enable_signs=1

"‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
" Plugin: Auto-pairs
"______________________________________________________________________________
 let g:AutoPairsFlyMode = 0
"‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
" Helper functions
"______________________________________________________________________________

"‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
" auto set paste in tmux
"______________________________________________________________________________
"function! WrapForTmux(s)
  "if !exists('$TMUX')
    "return a:s
  "endif

  "let tmux_start = "\<Esc>Ptmux;"
  "let tmux_end = "\<Esc>\\"

  "return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
"endfunction

"let &t_SI .= WrapForTmux("\<Esc>[?2004h")
"let &t_EI .= WrapForTmux("\<Esc>[?2004l")

"function! XTermPasteBegin()
  "set pastetoggle=<Esc>[201~
  "set paste
  "return ""
"endfunction

"inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
"‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
" section header template
"______________________________________________________________________________
