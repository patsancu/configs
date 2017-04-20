# If a command command_x not exists, try to cd command_x
# only applicable if setopt SHIN_STDIN
setopt AUTO_CD
setopt GLOB

setopt APPEND_HISTORY # If this is set, zsh sessions will append 
                      # their history list to the history file, rather than replace it.
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.
setopt DOT_GLOB 

# Completion
#
### Autocompletion
# AWS autocomplete
#which aws_completer > /dev/null && source /usr/local/bin/aws_zsh_completer.sh
# Enable kubernetes autocompletion, if installed
#which kubectl > /dev/null &&  source /usr/local/share/zsh/site-functions/kubectl

# Fuzzy finder 
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


autoload -U compinit && compinit
zmodload -i zsh/complist

if [ $commands[kubectl] ]; then
  source <(kubectl completion zsh)
fi
