#environment variables
HISTFILE=~/.histfile
HISTSIZE=1500
SAVEHIST=1500
VIRTUAL_ENV_DISABLE_PROMPT=true
export PATH="/home/asura/.local/bin:$PATH"

#bindkeys
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/asura/.zshrc'


#setopts
setopt prompt_subst


#autoloads
autoload -Uz compinit
autoload -U add-zsh-hook


#functions
function pr {
    if [[ -z $VIRTUAL_ENV ]];
    then PROMPT=$'\n'"%F{yellow}%~%f"$'\n'"%F{blue}%m@%n%f %F{%(?.green.red)}%%>%f "
    else PROMPT=$'\n'"%F{yellow}%~%f"$'\n'"(${VIRTUAL_ENV##*/}) %F{blue}%m@%n%f %F{%(?.green.red)}%%>%f ";
    fi
}

function prechpwdls {
    echo $(ls)
}


#function calls
compinit


#hooks
add-zsh-hook precmd pr 
add-zsh-hook chpwd prechpwdls 
