# Kubernetes Cluster
Create a kubernetes cluster from scratch with [multipass](https://multipass.run/install) vms and [ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html).


## A) Create the ubuntu vms with multipass

To create the vms run the `up` script (`./up`)

This script will:
* Create and start 3 vms (with names `kube-node-0`, `kube-node-1`, `kube-node-2`)
* Add the public key `./keys/key.pub` in each vm's `authorized_keys`
* Create the ansible `inventory` file by getting each vm's ip.


## B) Create kubernetes cluster with ansible

Every ansible playbook must be run from `./ansible` directory (`cd ansible`).

### Install ansible and virtual environment
 - Create and activate virtual env (optional)
```bash
python3 -m venv --clear ./venv
source ./venv/bin/activate
pip install -U pip setuptools wheel # Optionally
```
- Install ansible and tools
```bash
pip install -U ansible-core ansible ansible-lint ansible-navigator
```


* `./bin/install-ansible-collections-and-roles` Installs ansible collections and roles.
* `./bin/ansible-playbook 00-prequirements.yml` Installs basic configuration requirements for each node.
* `./bin/ansible-playbook 01-crio.yml` Installs [cri-o](https://cri-o.io/) as [container runtime](https://kubernetes.io/docs/setup/production-environment/container-runtimes/)
* `./bin/ansible-playbook 02-kube-install.yml` Installs kubernetes deployment tools ([kubeadm, kubelet, kubectl](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/#installing-kubeadm-kubelet-and-kubectl)).
* `./bin/ansible-playbook 03-kube-cluster.yml` Setups the kubernetes cluster and installs [Calico](https://projectcalico.docs.tigera.io/about/about-calico) networking.


_______________________

## Access cluster

### A) From kube-node-0 (`multipass shell kube-node-0`)
You can access kubernetes cluster through `kube-node-0` by opening a shell to it with `multipass shell kube-node-0`.
```bash
multipass shell kube-node-0
kubectl get nodes
```

### B) From host (get .kube/config from `kube-node-0`)
You can access the cluster directly with `kubectl` from the host machine by getting the `~/.kube/config` from `kube-node-0`
```bash
mkdir -p ~/.kube/
multipass transfer kube-node-0:/home/ubuntu/.kube/config - > ~/.kube/config
kubectl get nodes
```
