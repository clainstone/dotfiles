
" ==============================================================================
" 1. KEYMAPS PERSONALI
" ==============================================================================
" Carica le tue scorciatoie personalizzate
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

" TEMA: OneDark
Plug 'joshdick/onedark.vim'

" Status bar super accessoriata e temi
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
"set relativenumber      " Mostra i numeri relativi per saltare facilmente (es. 5j)
set cursorline          " Evidenzia la riga corrente
set termguicolors       " Colori a 24-bit (FONDAMENTALE PER ONEDARK)
set signcolumn=yes      " Colonna fissa a sinistra per evitare saltelli con gli errori LSP

" Imposta il tema
set background=dark
colorscheme onedark

" Comportamento
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

" Ricerca
set hlsearch
set incsearch
set ignorecase
set smartcase           " Ignora il maiuscolo a meno che tu non lo scriva esplicitamente
set showmatch           " Evidenzia parentesi corrispondenti

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

" Comandi rapidi per l'LSP (Definizione, Referenze, Rinomina)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

" --- NERDTree ---
" Usa Ctrl+n per aprire/chiudere l'albero dei file
nnoremap <C-n> :NERDTreeToggle<CR>

" --- FZF ---
" Usa Ctrl+p per cercare rapidamente i file nel progetto
 nnoremap <C-p> :Files<CR>

" Usa Ctrl+f per cercare testo dentro i file
nnoremap <C-f> :Rg<CR>

" --- Vim-Airline ---
" Imposta il tema di Airline per abbinarlo a OneDark
let g:airline_theme='onedark'

" ABILITA I FONT POWERLINE (Fondamentale per le frecce e le icone)
let g:airline_powerline_fonts = 1

" Mostra gli errori e i warning del Language Server (CoC) direttamente nella barra
let g:airline#extensions#coc#enabled = 1

" Abilita la 'Top Bar' (Tabline): mostra i file aperti in alto come schede
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail' " Mostra solo il nome del file
