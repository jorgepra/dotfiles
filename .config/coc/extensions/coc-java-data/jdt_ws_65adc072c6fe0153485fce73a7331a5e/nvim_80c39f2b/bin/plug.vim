if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': './install --all' } | Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
" Automatic close parens
Plug 'jiangmiao/auto-pairs'
"Airline
Plug 'vim-airline/vim-airline'
"Fugitive
Plug 'tpope/vim-fugitive'
" Emmet
"Plug 'mattn/emmet-vim'
" highlight colors
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
" css3 syntax highlight
"Plug 'hail2u/vim-css3-syntax'
" Syntax hightlight for .js
"Plug 'pangloss/vim-javascript'
" Syntax highlight for .ts
"Plug 'HerringtonDarkholme/yats.vim', { 'for': 'typescript' }
" Syntax highlight for .tsx
"Plug 'ianks/vim-tsx', { 'for': 'typescript.tsx' }
" Syntax hightlight for Vue.js
"Plug 'posva/vim-vue'
"Plug 'iamcco/coc-angular', {'branch': 'release'}
"Plug 'airblade/vim-gitgutter'
" Syntax hightlight for .jsx
"Plug 'mxw/vim-jsx'
"Tailwindcss
"Plug 'iamcco/coc-tailwindcss',  {'do': 'yarn install --frozen-lockfile && yarn run build'}
"Grahql
"Plug 'jparise/vim-graphql'

call plug#end()
