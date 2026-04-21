# --- ZINIT (Plugin Manager) ---
# Percorso per l'installazione di Zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Installa Zinit se non esiste
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

# Carica Zinit
source "${ZINIT_HOME}/zinit.zsh"

# --- PLUGINS (Caricati con Zinit) ---
# NOTA: oh-my-posh viene inizializzato più avanti.
# NOTA: fzf-tab è stato rimosso.

# Completamenti, suggerimenti, evidenziazione sintassi
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# --- COMPLETIONS (Zsh Native) ---
# Inizializza il sistema di completamento di Zsh
autoload -U compinit && compinit

# --- KEYBINDINGS ---
# Usa keybindings stile Emacs (standard)
bindkey -e
# Mappa Ctrl+F alla ricerca all'indietro nella history (potrebbe confliggere, verifica nel tuo terminale)
# bindkey '^f' history-search-backward # Potresti voler cambiare questo binding se usato da macOS/terminale

# --- HISTORY ---
# Impostazioni per la cronologia dei comandi
HISTSIZE=3000000                   # Numero massimo di righe nella history in memoria
SAVEHIST=$HISTSIZE                 # Numero massimo di righe salvate nel file
HISTFILE=~/.zsh_history            # File dove salvare la history
HISTDUP=erase                      # Rimuove i duplicati consecutivi dalla history
setopt appendhistory               # Aggiunge la history invece di sovrascriverla
setopt sharehistory                # Condivide la history tra sessioni diverse aperte contemporaneamente
setopt hist_ignore_space           # Ignora comandi che iniziano con spazio
setopt hist_ignore_all_dups        # Rimuove tutti i duplicati precedenti quando si aggiunge un comando
#setopt hist_save_no_dups           # Non salvare comandi duplicati consecutivi nel file (simile a HISTDUP=erase)
#setopt hist_ignore_dups            # Non registrare comandi se sono uguali al precedente (meno aggressivo di ignore_all_dups)
setopt hist_find_no_dups           # Non mostrare duplicati quando si cerca nella history

# --- ALIASES ---
# Alias comuni per macOS
alias g="git"# Alias per git
alias c="cmatrix -B -a -C red"
export JAVA_HOME=$(brew --prefix java)
alias ls="ls -lG"
alias py="python3"

alias rm='rm -i'
alias nvim='vim'
alias vi='vim'
alias dotgit='git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
# alias p='pipes.sh'                # Assicurati che pipes.sh sia installato e nel PATH
# alias r='ranger'                  # Assicurati che ranger sia installato (brew install ranger)

# --- COMPLETIONS (Zstyle Configuration) ---
# Configurazione del comportamento dei completamenti

# Case-insensitive matching
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Colori per i completamenti (usa le impostazioni di ls di macOS)
# Su macOS, LSCOLORS è usato di default da ls -G. Zsh potrebbe capirlo.
# Se i colori non funzionano, prova a decommentare la riga sotto per disabilitarli
# zstyle ':completion:*' list-colors ''
# zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}" # LS_COLORS potrebbe non essere definito di default su macOS

# Abilita il menu di selezione standard di Zsh per i completamenti
# (fzf-tab è stato rimosso, quindi ripristiniamo il menu Zsh)
zstyle ':completion:*' menu select

# --- OH MY POSH (Prompt) ---
# Inizializza Oh My Posh. Assicurati che sia installato (brew install jandedobbeleer/oh-my-posh/oh-my-posh)
# Scegli un tema e specifica il percorso qui sotto.
# Puoi vedere i temi disponibili con 'get-omp-themes'
# Esempio: usa un tema personalizzato salvato in ~/.config/omp/mytheme.omp.json
# Cambia il percorso --config con il tuo tema preferito
if command -v oh-my-posh > /dev/null; then
 eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/zash.omp.json)" # <-- CAMBIA QUESTO PERCORSO AL TUO TEMA!
fi

# --- Environment Variables ---
# Imposta l'editor preferito (usato da comandi come 'git commit', 'fc')
# Usa 'command -v nvim' per trovare il percorso corretto di nvim installato via Homebrew
export EDITOR="$(command -v nvim || command -v vim || echo 'vi')"
export VISUAL="$EDITOR"

# NOTA: La configurazione di SUDO_EDITOR è stata rimossa. sudoedit userà EDITOR/VISUAL o default di sistema.

# Aggiunte Utili per macOS (Opzionale)
# export HOMEBREW_NO_ANALYTICS=1 # Disabilita l'invio di dati anonimi a Homebrew

# Alla fine, assicurati che le completions siano aggiornate se necessario
# compinit -u # Decommenta se hai problemi di completamento dopo aver aggiunto nuovi plugin/comandi


export JAVA_HOME=$(/usr/libexec/java_home)
export CATALINA_HOME="/usr/local/tomcat10"
export PATH="$CATALINA_HOME/bin:$PATH"
export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"


export TIMEFMT=$'\nreal %E\nuser %U\nsys  %S'
