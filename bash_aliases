alias subl=sublime-text.subl

alias lgrep="grep --color=never -F -i"

alias vi=nvim
alias vim=nvim

alias minicom="minicom --color=on --wrap"
alias miniterm="miniterm.py --eol LF --raw - 115200"
alias picocom="picocom -b115200"

alias clipboard='xclip -sel clip'

alias gitgui='git gui'
alias gitkk='gitk --max-count=1000'
alias gitkkk='gitk --max-count=10000'
alias gitkkkk='gitk --max-count=100000'

alias sshx='ssh -X -A'
alias displayupdate="export DISPLAY=\"`tmux show-env | sed -n 's/^DISPLAY=//p'`\""
alias matrix='cmatrix -b'

alias :q=exit
alias :qa=exit
alias :qw=exit
