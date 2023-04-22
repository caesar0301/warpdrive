# Deploy tikv

## Prepare

A control machine, one or three PD servers, three tikv servers.

## Deploy tiup on control node

```
curl --proto '=https' --tlsv1.2 -sSf https://tiup-mirrors.pingcap.com/install.sh
| sh
source .bash_profile
tiup
```

## Create topology and validate env

```
tiup cluster template > topology.yaml
```

For example:
```
global:
  user: "tikv"
  ssh_port: 22
  deploy_dir: "/tikv-deploy"
  data_dir: "/tikv-data"
server_configs: {}
pd_servers:
  - host: 10.0.1.1
  - host: 10.0.1.2
  - host: 10.0.1.3
tikv_servers:
  - host: 10.0.1.4
  - host: 10.0.1.5
  - host: 10.0.1.6
monitoring_servers:
  - host: 10.0.1.7
grafana_servers:
  - host: 10.0.1.7
```

Validate env configuration. Use `--apply` to fix detected flaws automatically.
```
tiup cluster check ./topology.yaml --user root [-p] [-i /home/root/.ssh/gcp_rsa]
```

## Deploy tikv cluster
```
tiup cluster deploy tikv-test v6.5.1 ./topology.yaml --user admin
tiup cluster list
tiup cluster display tikv-test
tiup cluster start tikv-test
```
