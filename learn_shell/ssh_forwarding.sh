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

# my ssh tunnal to desktop
function mxc_ssh_tunnels() {
  # cmd [guest@remote.host] [PORT1 PORT2 ...]

  CTRSKT=/tmp/mxc_tunnels2desktop.socket
  REMOTE=chenxm@desktop.me
  PORTS="8787 8888"

  if [ $# -gt 0 ]; then
    REMOTE=$1
    PORTS_=${@:2}
    if [ $PORTS_ != "" ]; then
      PORTS=$PORTS_
    fi
  fi

  PAIRS=""
  for i in $PORTS; do PAIRS="-L $i:localhost:$i $PAIRS"; done

  echo "  Host: $REMOTE"
  echo "  Ports: $PORTS"

  echo "Stopping previous sessions ..."
  if [ -e $CTRSKT ]; then
    ssh -S $CTRSKT -O exit $REMOTE
  fi

  echo "Connecting to desktop in omnilab ..."
  ssh -M -S $CTRSKT -fnNT $PAIRS $REMOTE
  ssh -S $CTRSKT -O check $REMOTE
}
