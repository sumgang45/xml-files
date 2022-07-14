#!/usr/bin/env bash

kubeadm init --pod-network-cidr=10.244.0.0/16
mkdir -p $HOME/.kube
cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config
kubectl apply -f https://raw.githubusercontent.com/flannel-io/flannel/9de10c12c8266b0cfe09bc0d5c969ae28832239f/Documentation/kube-flannel.yml
kubectl apply -f https://raw.githubusercontent.com/flannel-io/flannel/9de10c12c8266b0cfe09bc0d5c969ae28832239f/Documentation/k8s-manifests/kube-flannel-rbac.yml
kubectl taint nodes --all node-role.kubernetes.io/master-
sleep 30
kubectl get nodes

echo "[+] Please wait for a few seconds and check if the K8s Cluster is running successfully"
