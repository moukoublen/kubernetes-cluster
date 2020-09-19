# Kubernetes Cluster
Create a kubernetes cluster with ansible (and vagrant for vms).
Based on [this](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/) and [this](https://kubernetes.io/blog/2019/03/15/kubernetes-setup-using-ansible-and-vagrant/)


## Vagrant

To create the vms

```bash
cd vagrant
vagrant up --provider=virtualbox
# or
vagrant up --provider=libvirt

# To destroy
vagrant destroy --force
```


## Ansible

```bash
cd ansible

./bin/install-ansible-roles
./bin/install-ansible-collections

./bin/ansible-playbook docker.yml
./bin/ansible-playbook kube-reqs.yml
./bin/ansible-playbook kube-cluster.yml
```

_______________________

## Access cluster

### A) From manager (vagrant ssh)
You can access kubernetes cluster by ssh to manager and use `kubectl`:
```bash
cd vagrant
vagrant ssh manager
kubectl get nodes
```

### B) From host (get .kube/config from manager)
You can access directly with `kubectl` the cluster from host machine by getting the `~/.kube/config` from manager
```bash
scp -i ./vagrant/ssh_keys/key vagrant@192.168.100.10:/home/vagrant/.kube/config ~/.kube/config
kubectl get nodes
```

### C) From another machine that is in tha same network with host
Add tp `/etc/host` this line `<host ip> kube.cluster.local`.

Copy `~/.kube/config` from manager and replace the `server` field (in clusters array) with this `server: https://kube.cluster.local:6443`
