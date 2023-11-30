#!/usr/bin/env bash
kubeadm init --pod-network-cidr=10.244.0.0/16 --cri-socket=/run/containerd/containerd.sock
mkdir -p $HOME/.kube
cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config
kubectl apply -f https://raw.githubusercontent.com/flannel-io/flannel/a7017961b64e6a4c381141e654220235fd1910cf/Documentation/kube-flannel.yml
kubectl taint nodes --all node-role.kubernetes.io/control-plane-
sleep 30
kubectl get nodes
echo "[+] Please wait for a few seconds and check if the K8s Cluster is running successfully"
