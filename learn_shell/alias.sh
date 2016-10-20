# Create alias of commands
unalias hfs &> /dev/null
alias hfs="hadoop fs"

alias goodbye="spd-say 'Goodbbye captain' && sleep 3 && shutdown -t -h now"

hosts="host1,host2"
alias team="pdsh -w $hosts"
alias team-scp="pdcp -R ssh -w $hosts"