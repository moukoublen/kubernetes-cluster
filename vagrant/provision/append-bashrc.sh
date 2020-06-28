echo '' >> /home/vagrant/.bashrc
echo 'command -v kubectl 1>/dev/null 2>&1 && source <(kubectl completion bash)' >> /home/vagrant/.bashrc
echo 'command -v kubeadm 1>/dev/null 2>&1 && source <(kubeadm completion bash)' >> /home/vagrant/.bashrc
echo '' >> /home/vagrant/.bashrc
