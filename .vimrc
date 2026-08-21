" ==============================================================================
" KEYMAPS PERSONALI
" ==============================================================================
noremap w G
vnoremap w G
noremap n o
noremap c diw
noremap e 10h
noremap r 10l
vnoremap e 10h
vnoremap r 10l
vnoremap y "+y
vnoremap p "+p
noremap <S-Up> gk8
noremap <S-Down> gj8
vnoremap <S-Up> gk8
vnoremap <S-Down> gj8
nnoremap z a
vnoremap z i
nnoremap c i//
nnoremap <Space> G
xnoremap <Space> G
nnoremap C C<Esc>

" ==============================================================================
" IMPOSTAZIONI GENERALI
" ==============================================================================
syntax on
set encoding=utf-8
set ttyfast

" Aspetto
set number
set cursorline
set background=dark
set signcolumn=no
colorscheme default

" Comportamento
set ttimeout
set ttimeoutlen=100
set hidden
set scrolloff=8
set wrap
set textwidth=79
set formatoptions=tcqrn1

" Indentazione
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround
set smartindent

" Ricerca
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

" Keymap native
nnoremap ca ggVG
vnoremap ca <Esc>ggVG
