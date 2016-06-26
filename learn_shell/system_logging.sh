# commands about system restarting, messaging etc.

# system reboot time
who -b

# or better
last -x | grep reboot

# system general logs
less /var/log/messages

# authentication logs
less /var/log/auth.log

# cron logs
less /var/log/cron.log

# mail logs
less /var/log/maillog
