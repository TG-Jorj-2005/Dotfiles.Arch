#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

zmodload zsh/zprof

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

setopt AUTO_CD                # cd automat în directoare
setopt HIST_VERIFY           # confirmă comenzile din history
setopt SHARE_HISTORY         # partajează history între sesiuni
setopt APPEND_HISTORY        # adaugă la history, nu suprascrie
setopt HIST_IGNORE_DUPS      # ignoră duplicate în history
setopt HIST_IGNORE_SPACE     # ignoră comenzile care încep cu spațiu
setopt HIST_REDUCE_BLANKS    # elimină spațiile extra din history
setopt AUTO_PUSHD            # pushd automat
setopt PUSHD_IGNORE_DUPS     # ignoră duplicate în directory stack

PLUGIN_DIR="$HOME/.config/zsh/plugins"
[[ -f "$PLUGIN_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] &&
    source "$PLUGIN_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
[[ -f "$PLUGIN_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] &&
    source "$PLUGIN_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh"
[[ -f "$PLUGIN_DIR/zsh-completions/zsh-completions.plugin.zsh" ]] &&
    source "$PLUGIN_DIR/zsh-completions/zsh-completions.plugin.zsh"

if [[ -d ~/.config/zsh ]] then
for file in ~/.config/zsh/*.zsh; do
	[[ -r "$file" ]] && source "$file"
done

fi



#Look Shell
PS1='%F{cyan}%n@%m%f:%F{yellow}%~%f$ '

#Shortcut uri
jrj(){
 git add .
 git commit -m "Commit #$(git rev-list --count HEAD) at $(date '+%Y-%m-%d %H:%M:%S')"
 git push 

}

