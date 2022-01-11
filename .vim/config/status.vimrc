"‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
" Status line 
"______________________________________________________________________________
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name',
      \   'filename': 'LightlineFilename'
      \ },
      \ }
set laststatus=2
set noshowmode
" set statusline=%{expand('%:p:h:t')}/%t
function! LightlineFilename()
  let root = fnamemodify(get(b:, 'gitbranch_path'), ':h:h')
  let tail = expand('%:t')
  if tail == 'index.js'
    let path = expand('%:p:h:t')
    return path
  else
    return tail 
  endif
  " if path[:len(root)-1] ==# root
  "   return path[len(root)+1:]
  " endif
  " return expand('%:p:h:t')
endfunction

