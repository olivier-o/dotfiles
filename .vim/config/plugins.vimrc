call plug#begin('~/dotfiles/.vim/plugged')
" general
" explorer
Plug 'lambdalisue/fern.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'} | "autocompletion imports and type definition"
" Track the engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" fzf installed using Homebrew
Plug '/usr/local/opt/fzf'
" fzf vim integration
Plug 'junegunn/fzf.vim'
Plug 'jesseleite/vim-agriculture' |  "search enhancement
Plug 'christoomey/vim-tmux-navigator'
" " editing
" Plug 'mbbill/undotree'
 Plug 'tpope/vim-commentary'
 Plug 'airblade/vim-gitgutter'
 Plug 'itchyny/vim-gitbranch'
 Plug 'Raimondi/delimitMate'
 Plug 'tpope/vim-repeat'
 Plug 'tpope/vim-speeddating'
 Plug 'tpope/vim-surround'
 Plug 'tpope/vim-unimpaired'
 " linter
 Plug 'dense-analysis/ale'
 " html helper
 Plug 'mattn/emmet-vim'
 Plug 'pedrohdz/vim-yaml-folds'
 "# UUID generator
 Plug 'kburdett/vim-nuuid'
" " eye candy
 Plug 'itchyny/lightline.vim'

" " javascript

" " syntax
Plug 'sheerun/vim-polyglot'
" Plug 'avakhov/vim-yaml'
" Plug 'jparise/vim-graphql'
" Plug 'HerringtonDarkholme/yats.vim'

" " other
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'terryma/vim-multiple-cursors'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' } | "hexa color code interpretation

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

call plug#end()
