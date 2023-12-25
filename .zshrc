#environment variables
HISTFILE=~/.histfile
HISTSIZE=1500
SAVEHIST=1500
export GITLAB_TOKEN="glpat-FFSvt-U7GywvNoZRe1ky"
export GITLAB_URI="https://git.apsolutions.ru"
export EDITOR=nvim
export ANDROID_NDK=/opt/android-ndk
export NDK_TOOLCHAIN_DIR=$ANDROID_NDK/toolchains/llvm/prebuilt/linux-x86_64
VIRTUAL_ENV_DISABLE_PROMPT=true
fpath+=~/.zfunc
PATH=/home/asu/software:/home/asu/go/bin:/home/asu/.local/bin:/home/asu/.myapps:/home/asu/.scripts:$(pyenv root)/bin:$PATH
PYENV_ROOT=$(pyenv root)
eval "$(pyenv init -)"
alias gurl="grpc_cli"
alias k="kubectl"
alias v="nvim"
alias jgv="json-glib-validate"
alias gcam="git commit -am"
alias dprune='docker rm $(docker stop $(docker container ls -aq))'
alias d="docker"
alias ze="zellij"
alias zs="zellij"
alias pvim="poetry run nvim"
alias library="calibre"
alias post='curl -X POST -H "Content-Type: application\json"'
alias get='curl -X GET'
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

#shell addons
eval "$(zoxide init zsh)"


#hooks
add-zsh-hook precmd pr 
add-zsh-hook chpwd prechpwdls 
