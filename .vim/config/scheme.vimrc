"‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
" Colors and Fonts
"______________________________________________________________________________
if $TERM =~ '256color'
  set t_Co=256
elseif $TERM =~ '^xterm$'
  set t_Co=256
endif

syntax enable
"colorscheme mango
colorscheme Tomorrow-Night
"colorscheme monokai
"set guifont=Menlo\ Bold:h14
"colorscheme flattened_light
"Set high visibility for diff mode
