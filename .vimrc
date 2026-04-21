
" ==============================================================================
" 1. KEYMAPS PERSONALI
" ==============================================================================
source ~/.ideavimrc
 
" ==============================================================================
" 2. PLUGIN MANAGER (vim-plug)
" ==============================================================================
call plug#begin('~/.vim/plugged')

" LSP e Autocompletamento (Il cuore della Power Config)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Sintassi avanzata per decine di linguaggi
Plug 'sheerun/vim-polyglot'

" File Explorer laterale
Plug 'preservim/nerdtree'

" Fuzzy Finder (Ricerca file ultra-veloce)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Integrazione Git
Plug 'tpope/vim-fugitive'    " Comandi Git dentro Vim
Plug 'airblade/vim-gitgutter' " Mostra le righe modificate a sinistra

" Utilities essenziali
Plug 'jiangmiao/auto-pairs'      " Chiude automaticamente parentesi e virgolette
Plug 'tpope/vim-commentary'      " Commenta/decommenta velocemente (gcc)

Plug 'ayu-theme/ayu-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Icone per i file (richiede un Nerd Font)
Plug 'ryanoasis/vim-devicons'

call plug#end()



" ==============================================================================
" 3. IMPOSTAZIONI GENERALI (Old School + Modern)
" ==============================================================================
syntax on
set encoding=utf-8
set ttyfast

" Aspetto
set number              " Mostra il numero della riga corrente
set cursorline          " Evidenzia la riga corrente
set termguicolors       " Colori a 24-bit (FONDAMENTALE PER ONEDARK)
set signcolumn=yes      " Colonna fissa a sinistra per evitare saltelli con gli errori LSP

" Imposta il tema
set background=dark
colorscheme ayu

" Comportamento
set ttimeout
set ttimeoutlen=1
set hidden              " Permette di cambiare file senza dover salvare
set updatetime=300      " Aggiorna i messaggi LSP e GitGutter più velocemente
set scrolloff=8         " Mantieni 8 righe di margine quando scorri
set wrap                " A capo automatico visuale
set textwidth=79
set formatoptions=tcqrn1

" Indentazione
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround
set smartindent         " Indentazione intelligente in base al codice
set signcolumn=no

" Ricerca
set hlsearch
set incsearch
set ignorecase
set smartcase           " Ignora il maiuscolo a meno che tu non lo scriva esplicitamente
set showmatch           " Evidenzia parentesi corrispondenti

"Keymap specifiche per Vim
nnoremap ca ggVG
vnoremap ca <Esc>ggVG

nnoremap f :BLines<CR>
vnoremap f <Esc>:BLines<CR>

" ==============================================================================
" 4. CONFIGURAZIONE PLUGIN
" ==============================================================================

" --- CoC.nvim (LSP & Autocomplete) ---
" Usa Tab per navigare nel menu di autocompletamento
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Usa Invio per confermare il completamento
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


let g:airline_section_b = ''       " Rimuove Git branch
let g:airline_section_x = ''       " Rimuove Filetype
let g:airline_section_y = ''       " Rimuove Encoding
let g:airline_section_warning = '' " Rimuove avvisi
let g:airline_section_error = ''   " Rimuove errori"

let ayucolor="dark" 
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
