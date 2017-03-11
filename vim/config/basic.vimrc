"‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
" Basic
"______________________________________________________________________________
filetype off 
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

"vertical marker at char 100
set colorcolumn=100


set pastetoggle=<F2>

"allow local config
set exrc
set secure

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

