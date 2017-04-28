#alias
alias du='du -d 1 -h'
alias df='df -h'
alias ql='qlmanage -p "$@" >& /dev/null'
alias imgsize="mdls -name kMDItemPixelWidth -name kMDItemPixelHeight"
alias ls='ls -G'
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'

#var
LLVM_CONFIG=/usr/local/opt/llvm/bin/llvm-config
CLANG=/usr/local/opt/llvm/bin/clang

#bash_completion
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
