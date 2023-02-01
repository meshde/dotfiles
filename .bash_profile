export EDITOR=vim
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
PATH=$PATH:/opt/metasploit-framework/bin
export PATH=$PATH:/opt/homebrew/bin
export PATH=$PATH:/opt/metasploit-framework/bin
export PATH=$PATH:~/Mehmood
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:~/Mehmood/depot_tools
export mn=media-net
export PS1='\[\033[0;32m\]\[\033[0m\033[0;32m\]\u\[\033[0;36m\] \w\[\033[0;32m\] ($(git branch 2>/dev/null | grep '^*' | colrm 1 2))\n\[\033[0;32m\]└─\[\033[0m\033[0;32m\] \$\[\033[0m\033[0;32m\] ▶\[\033[0m\] '
export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
export PUPPETEER_EXECUTABLE_PATH=`which chromium`
set -o vi

alias dc='docker-compose'
alias python35='/usr/local/bin/python3.5'
alias python36='/usr/local/bin/python3.6'

alias ctags='/opt/homebrew/bin/ctags'

alias httpb='http --print=b'

alias firstec2='cd ~/SSH/;ssh -i "FirstEC2.pem" ec2-user@ec2-18-219-153-115.us-east-2.compute.amazonaws.com'

alias virtenv27='virtualenv'
alias virtenv35='virtualenv -p /usr/local/bin/python3.5'
alias virtenv36='virtualenv -p /usr/local/Cellar/python/3.6.1/bin/python3.6'

alias erudite='cd ~/Mehmood/EruditeX/;source bin/activate'
alias hell='erudite;cd tests/;python hell2.py'
alias algo='cd ~/Mehmood/AlgoDS/;source bin/activate;cd Python'
alias gists='cd ~/Mehmood/Gists'
alias pro='open ~/Mehmood/Profile'
alias safari='cd ~/Mehmood/safari-ext-demo'
alias ls='ls -1'

test -f ~/.git-completion.bash && . $_

alias g='git'
__git_complete g git
alias gs='g s'
alias gm='g m'
alias ga='g a'
alias gd='g d'
alias gp='g p'
alias gu='g u'
alias gl='g l'
alias go='g co'
__git_complete go _git_checkout

alias swaggered='docker run -dp 8081:8080 swaggerapi/swagger-editor'
alias swagger='docker run -p 8082:8080 swaggerapi/swagger-ui'
alias dockerkill='docker kill $(docker ps -q)'
alias nodebug='node --inspect-brk'

alias loadbash='source ~/.bash_profile'
alias editbash='vim ~/.bash_profile'

alias editvim='vim ~/.vimrc'
alias editgit='vim ~/.gitconfig'

alias search='grep -inr'

alias openhere='open -a /Applications/Utilities/Terminal.app .'
alias gaana='open /Applications/Safari.app https://gaana.com'
alias plist='pip list --format=columns'
alias check='git remote update'
alias vimtree='vim -c "NERDTree"'
alias pyignore='printf "bin/\ninclude/\nlib/\n.Python\npip-selfcheck.json\n*.pyc\n" > .gitignore'
alias excludes='vim .git/info/exclude'
alias tnew='tmux new -s'
alias nodebug='node --inspect-brk'

github() {
if [ $# -eq 0 ];then
open /Applications/Safari.app https://github.com/meshde/;
elif [ $# -eq 1 ];then
open /Applications/Safari.app https://github.com/meshde/$1;
elif [ $# -eq 2 ];then
open /Applications/Safari.app https://github.com/$1/$2;
fi
}

newRepo() {
if [ $# -ne 1 ]
then 
echo "USAGE: $(basename $0) <repo name>"
else
curl -u 'meshde' https://api.github.com/user/repos -d '{"name":"'"$1"'"}'
fi
}

os() {
	if [ $# -ne 1 ]
	then
		cd ~/Mehmood/OpenSource;
	else
		cd ~/Mehmood/OpenSource/$1;
		source bin/activate;
	fi
}

sem8() {
	x='~/Desktop/KJSCE/SEM VIII/'
	if [ $# -ne 1 ]
	then
		open "$x";
	else
		y=`echo $1 | awk '{ print toupper($0) }'`;
		open "$x$y";
	fi
}

sec2min() {
printf "%02d:%02d\n" $(($1%3600/60)) $(($1%60))
}
timer() {
sec=$(($1*60))
now=`date +%s`
end=$(($now + $sec))
while [ $end -ne `date +%s` ]
do
diff=$(($end - `date +%s`))
echo -ne "`sec2min $diff`\r";
done
say it\'s over
} 
work() {
timer 22
say Take a break
}
# break() {
# timer 8
# say Back to work
# }
work_two_hours() {
for i in {1..4}
do
work
break
done
}

move() {
  cp ~/Desktop/PDF/NLP/$1 '~/Desktop/Erudite Related Work/'
}

rubber_docker() {
	ssh -i ~/Mehmood/docker.pem ubuntu@18.144.67.197
}

ubuntu () {
	ssh -i ~/Mehmood/docker.pem ubuntu@54.153.33.51
}

address() {
  cat ~/Mehmood/Profile/address.txt
  echo ""
}

prettify() {
  cat $1 | python -m json.tool
}

goto() {
  if [ $# -ne 1 ]
  then
    cd ~/Mehmood
  else
    cd ~/Mehmood/$1
  fi
}

tc() {
  if [ $# -ne 1 ]
  then
    cd ~/Mehmood/TopCoder
  else
    cd ~/Mehmood/TopCoder/$1
  fi
}

agr() {
  ag -0 -l "$1" | xargs -0 perl -pi.bak -e "s/$1/$2/g";
}

set_aws_profile() {
  export AWS_PROFILE=$1
}

set_tc_token() {
  export TC_TOKEN=$(printf "{
    \"grant_type\": \"client_credentials\",
    \"client_id\": \"$AUTH0_CLIENT_ID\",
    \"client_secret\": \"$AUTH0_CLIENT_SECRET\",
    \"audience\": \"$AUTH0_AUDIENCE\",
    \"auth0_url\": \"$AUTH0_URL\"
    }"| http --follow POST $AUTH0_URL Content-Type:'application/json' | jq -r '.access_token')
}

# Setting PATH for Python 3.5
# The original version is saved in .bash_profile.pysave
# PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
# export PATH

set editing-mode vi
bind -m vi-insert "\C-l":clear-screen

source ~/.bash_secret
source ~/.bash_completions
source ~/kube.sh
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"

load_nvm() {
  export NVM_DIR="$HOME/.nvm"
    [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
    [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
}

notify() {
  time $* && say done
}

function img-data() {
  TYPE=$(file --mime-type -b "$1")
  ENC=$(base64 "$1")
  echo "data:$TYPE;base64,$ENC"
}

_print_progress_bar_instance() {
  _BAR_LEN=40
  _BARS=$(( $1 * $_BAR_LEN / $2 ))
  echo -ne "\r"
  printf '|'
  [ $_BARS -ne 0 ] && printf "▇%.0s" $(seq 0 $(( $_BARS - 1 )));
  [ $_BARS -ne $_BAR_LEN ] && printf " %.0s" $(seq $(( $_BARS + 1 )) $_BAR_LEN);
  printf '|'
  printf ' %d%%' $(( $1 * 100 / $2 ))
  printf ' %s/%s' $1 $2
}

progress() {
  arr=( `cat $1` )
  shift
  COMMAND_TO_RUN="$@";
  len=${#arr[@]}
  for index in ${!arr[@]}; do
    _print_progress_bar_instance $index $len;
    item=${arr[$index]};
   eval $COMMAND_TO_RUN;
  done
  _print_progress_bar_instance $len $len;
  echo ""
}

function cd {
    # actually change the directory with all args passed to the function
    builtin cd "$@"
    if [ -f ".env" ] ; then
      tmpfile=`uuidgen`
     sed 's/^/export /' .env > /tmp/$tmpfile
     source /tmp/$tmpfile
    fi
    # if there's a regular file named ".todo.sh"...
    if [ -f ".todo.sh" ] ; then
        # source it
        source .todo.sh
    fi
}
. "$HOME/.cargo/env"
