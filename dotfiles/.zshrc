# --- Run fastfetch on terminal open ---
fastfetch

# --- Load prompt system BEFORE selecting theme ---
autoload -Uz promptinit
promptinit

# --- Zsh options ---
setopt autocd
setopt correct
setopt histignoredups
setopt sharehistory
setopt interactivecomments

# --- History ---
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000

# --- Aliases ---
alias ls='ls --color=auto'
alias ll='ls -lah'
alias update='sudo nixos-rebuild switch --flake /etc/nixos --upgrade'
alias cfg='sudo nano /etc/nixos/configuration.nix'
alias hm='home-manager switch'

# --- PATH additions ---
export PATH="$HOME/.local/bin:$PATH"

