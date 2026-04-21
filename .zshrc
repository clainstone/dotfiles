# --- ZINIT (Plugin Manager) ---
# Percorso per l'installazione di Zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
# Installa Zinit se non esiste
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
# Carica Zinit
source "${ZINIT_HOME}/zinit.zsh"

# Completamenti, suggerimenti, evidenziazione sintassi
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# --- COMPLETIONS (Zsh Native) ---
autoload -U compinit && compinit


# --- HISTORY ---
HISTSIZE=3000000                   # Numero massimo di righe nella history in memoria
SAVEHIST=$HISTSIZE                 # Numero massimo di righe salvate nel file
HISTFILE=~/.zsh_history            # File dove salvare la history
HISTDUP=erase                      # Rimuove i duplicati consecutivi dalla history
setopt appendhistory               # Aggiunge la history invece di sovrascriverla
setopt sharehistory                # Condivide la history tra sessioni diverse aperte contemporaneamente
setopt hist_ignore_space           # Ignora comandi che iniziano con spazio
setopt hist_ignore_all_dups        # Rimuove tutti i duplicati precedenti quando si aggiunge un comando
setopt hist_find_no_dups           # Non mostrare duplicati quando si cerca nella history

# --- ALIASES ---
# Alias comuni per macOS
alias ls="ls -lG"
alias py="python3"
alias rm='rm -i'
alias nvim='vim'
alias vi='vim'
alias dotgit='git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
if command -v oh-my-posh > /dev/null; then
 eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/zash.omp.json)" # <-- CAMBIA QUESTO PERCORSO AL TUO TEMA!
fi

export EDITOR="$(command -v nvim || command -v vim || echo 'vi')"
export VISUAL="$EDITOR"
export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export TIMEFMT=$'\nreal %E\nuser %U\nsys  %S'
