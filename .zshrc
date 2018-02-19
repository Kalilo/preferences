alias ll='ls -la'
alias l='ls'

alias gpush='git push -u origin HEAD'
alias gpull='git pull'
alias gps='gpush'
alias gpl='gpull'
alias gs='git status'
alias gb='git branch'
alias gco='git checkout'

alias mkae='make'

function gcom {
	git status
	echo ""
	echo "Are you sure you would like to add all these changes?"
	select yn in "Yes" "No"; do
		case $yn in
			Yes )
				git add .
				if [ -n "$1" ]
					then
						git commit -m "$*"
					else
						git commit -m "auto commit"
				fi
				git push -u origin HEAD # || git push -u origin HEAD
				git status
			break;;
			No ) echo "aborting...";;
		esac
		break;
	done
}

# For WeThinkCode_ MACS
function vpush {
	find . -type f | grep -v '.git' | xargs ruby -e 'ARGV.each { |k| puts "git add #{k}; git commit -m adding #{k}; git push;"}' | bash
}
