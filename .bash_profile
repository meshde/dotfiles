export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
PATH=$PATH:/opt/metasploit-framework/bin
export PATH=$PATH:/opt/metasploit-framework/bin
export PATH=$PATH:/Users/meshde/Mehmood
export PATH=$PATH:/usr/local/sbin

alias python35='/usr/local/bin/python3.5'
alias python36='/usr/local/bin/python3.6'

alias firstec2='cd ~/SSH/;ssh -i "FirstEC2.pem" ec2-user@ec2-18-219-153-115.us-east-2.compute.amazonaws.com'

alias virtenv27='virtualenv'
alias virtenv35='virtualenv -p /usr/local/bin/python3.5'
alias virtenv36='virtualenv -p /usr/local/bin/python3.6'

alias erudite='cd /Users/meshde/Mehmood/EruditeX/;source bin/activate'
alias hell='erudite;cd tests/;python hell2.py'
alias algo='cd /Users/meshde/Mehmood/AlgoDS/;source bin/activate;cd Python'
alias gists='cd /Users/meshde/Mehmood/Gists'
alias pro='open /Users/meshde/Mehmood/Profile'

alias loadbash='source ~/.bash_profile'
alias editbash='vim ~/.bash_profile'

alias openhere='open -a /Applications/Utilities/Terminal.app .'
alias gaana='open /Applications/Safari.app https://gaana.com'
alias plist='pip list --format=columns'
alias check='git remote update'
alias vimtree='vim -c "NERDTree"'
alias pyignore='printf "bin/\ninclude/\nlib/\n.Python\npip-selfcheck.json\n*.pyc\n" > .gitignore'

github() {
if [ $# -ne 1 ];then
open /Applications/Safari.app https://github.com/meshde/;
else
open /Applications/Safari.app https://github.com/meshde/$1;
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
	x='/Users/meshde/Desktop/KJSCE/SEM VIII/'
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
break() {
timer 8
say Back to work
}
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

# Setting PATH for Python 3.5
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH


source .bash_secret
