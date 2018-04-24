"‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
" Plugin: ctrlp
"______________________________________________________________________________

let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:20'

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

"‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
" Plugin: vim-json
"______________________________________________________________________________
"
let g:vim_json_syntax_conceal = 0

"‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
" Plugin: UtltiSnip
"______________________________________________________________________________
"" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<C-j>"
"let g:UltiSnipsJumpForwardTrigger="<C-j>"
""let g:UltiSnipsJumpBackwardTrigger="<C-z>"

"" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

"‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
" Plugin: sparkup
"______________________________________________________________________________

let g:sparkupDoubleQuote = 0
augroup sparkup_types
  " Remove ALL autocommands of the current group.
  autocmd!
  " Add sparkup to new filetypes
  autocmd FileType js, jsx runtime! ftplugin/html/sparkup.vim
augroup END
autocmd FileType javascript.js runtime! ftplugin/html/sparkup.vim
autocmd FileType javascript.jsx runtime! ftplugin/html/sparkup.vim


"‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
" Plugin: ale - syntax checking
"______________________________________________________________________________

map <A-j> <Plug>(ale_previous_wrap)
map <A-k> <Plug>(ale_next_wrap)

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

let NERDTreeAutoDeleteBuffer = 1
let NERDTreeQuitOnOpen = 1
" disable “Press ? for help”
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
nmap <silent> <Leader>n :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<cr>
"make <c-l> clear the highlight as well as redraw
"nnoremap <C-L> :nohls<CR><C-L>
"inoremap <C-L> <C-O>:nohls<CR>

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

