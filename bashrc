PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:/usr/local/bin
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh

PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

export GREP_OPTIONS='--color=auto --line-number --recursive'
export GREP_COLOR='1;32;'

alias flushdns='dscacheutil -flushcache;sudo killall -HUP mDNSResponder'
alias tmux='tmux -2'

if [[ -s $HOME/.rvm/scripts/rvm ]]; then
  source $HOME/.rvm/scripts/rvm;
fi