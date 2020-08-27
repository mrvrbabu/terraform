#!/bin/bash

#function swapp_off {
#  swapoff -a
#  sed -i '/[^#]/ s/\(^.*swap.*$\)/#\ \1/' /etc/fstab
#}


sudo apt-get update  
sudo apt-get install docker.io -y  
sudo systemctl start docker  
sudo systemctl enable docker  
sudo apt-get install apt-transport-https curl -y  
sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add  
sudo echo \ deb http://apt.kubernetes.io/ kubernetes-xenial main\  | sudo tee -a /etc/apt/sources.list.d/kubernetes.list && sudo apt-get update  
sudo swapoff -a  
sudo apt-get install kubernetes-cni=0.7.5-00 -y  
sudo apt-get install -y kubeadm=1.14.2-00 kubectl=1.14.2-00 kubelet=1.14.2-00  
export MASTERIP=$(hostname -i)
export KUBEVERSION="v1.14.2"  
sudo kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=$MASTERIP --kubernetes-version $KUBEVERSION  
sudo mkdir -p $HOME/.kube  
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config  
sudo chown $(id -u):$(id -g) $HOME/.kube/config  
sudo kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml 
