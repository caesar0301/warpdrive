# Deploy k8s with kubeadm

NOTE: docker, kubernetes, kubeadm之间有版本依赖的约束，兼容矩阵信息一般在kubernetes更新日志中，例如[CHANGELOG-1.14.md](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.14.md#external-dependencies)

## DOCKER

Install docker community version:
```bash
sudo yum install docker-ce
```

### Configure docker
```
sudo ip link add name docker0 type bridge
sudo ip addr add dev docker0 172.17.0.1/16

sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://ngljipqn.mirror.aliyuncs.com"]
}
EOF

sudo systemctl daemon-reload
sudo systemctl enable docker
sudo systemctl restart docker
```

### Add docker privilege
```
sudo groupadd docker
sudo usermod -aG docker $USER
groups #USER
```

## KUBEADM

### Configure yum repo
Add k8s repo: /etc/yum.repos.d/kubernetes.repo:
```
[kubernetes]
name=Kubernetes Repo
baseurl=https://mirrors.aliyun.com/kubernetes/yum/repos/kubernetes-el7-x86_64/
gpgcheck=0
enable=1
```

### Install kubeadm
```
sudo yum install -y kubeadm-1.23.1 kubectl-1.23.1 kubelet-1.23.1
```

### Configure kubeadm

Generate config:
```
kubeadm config print init-defaults > kubeadm.conf
```

Modify:
* nodeRegistration.name
* localAPIEndpoint.advertiseAddress
* localAPIEndpoint.bindPort

Add kubelet config:
```yaml
kind: KubeletConfiguration
apiVersion: kubelet.config.k8s.io/v1beta1
cgroupDriver: cgroupfs
```

### Pull images
```
kubeadm config images pull --config kubeadm.conf
```

### Deploy master, i.e. apiserver
```
sudo kubeadm init --config=kubeadm.conf --ignore-preflight-errors=all
```

## KUBELET

Reconfigure and reload kubelet
```bash
sudo tee /etc/sysconfig/kubelet <<-'EOF'
KUBELET_EXTRA_ARGS="--fail-swap-on=false"
KUBE_PROXY=MODE=ipvs
EOF

sudo systemctl daemon-reload
sudo systemctl restart kubelet
```

## NETWORK
We use flannel plugin:
```
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
```

## Join working nodes
```
kubeadm join <master-ip>:6443 --token <tokenstring> --discovery-token-ca-cert-hash <sha256string>
```

## Diagnosis

1. Network cni failure

On master and slaves:
```bash
$ kubeadm reset
$ systemctl stop kubelet
$ systemctl stop docker
$ rm -rf /var/lib/cni/
$ rm -rf /var/lib/kubelet/*
$ rm -rf /etc/cni/
$ ifconfig cni0 down
$ ifconfig flannel.1 down
$ ifconfig docker0 down
```
