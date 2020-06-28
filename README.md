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

./bin/ansible-playbook docker.yml
./bin/ansible-playbook kube-reqs.yml
./bin/ansible-playbook kube-cluster.yml
```

