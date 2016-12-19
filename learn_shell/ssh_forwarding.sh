## SSH forwarding configurations

# local port 8080 forwarding to remote 80
ssh -N -f -L 8080:localhost:80 guest@joes-pc

# remote port 5900 forwarding to local 5900
ssh -N -f -R 5900:localhost:5900 guest@joes-pc

# multihop port forwarding
host1=username@login_node.com
host2=username@dest.ination.com
ssh -L 7777:localhost:7777 $host1 ssh -L 7777:localhost:7777 -N $host2

# dynamic port forwarding, SOCKS, port 1080 may be perferred by some apps.
# Ref. https://help.ubuntu.com/community/SSH/OpenSSH/PortForwarding
ssh -fqNC -D 1080 guest@joes-pc
ssh -vNC -D 1080 guest@joes-pc
ssh -C -D 1080 guest@joes-pc

# SCP via tunnel
# user2@gateway:port2 -> user3@remote-host:port3
# Project port3 of remote-host to port 4321 of gateway
ssh -L 4321:remote-host:port3 -p port2 user2@gateway cat -

# Send commands to remote host via port 4321
scp -P 4321 user3@127.0.0.1:/path/to/file/of/remote local/path
