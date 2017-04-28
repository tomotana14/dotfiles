#set enviroment variants
export PS1='[\w ]$ '
export PATH="/usr/local/opt/opencv3/bin:$PATH"
export TERM=xterm-256color
export HISTIGNORE=fg*:bg*:history*:cd*
export HISTCONTROL=ignoredups
export HISTSIZE=10000
export HISTTIMEFORMAT='%Y%m%d %T'

#llvm & clang
export LLVM_CONFIG=/usr/local/opt/llvm/bin/llvm-config
export CLANG=/usr/local/opt/llvm/bin/clang

#pyenv
export PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
    export PATH=${PYENV_ROOT}/bin:$PATH
    eval "$(pyenv init -)"
fi


#load bashrc
test -r ~/.bashrc && . ~/.bashrc
