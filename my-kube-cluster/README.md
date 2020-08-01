# This terraform module will create a kube cluster with one kube master and two slaves.

## How to create token on kube master 

kubeadm token create --print-join-command

## How to join slaves to master 

Example 

kubeadm join 172.31.73.171:6443 --token omn2r6.pj63jskbs4t04y7a     --discovery-token-ca-cert-hash sha256:d6371b3f09e3819efa7d5053823ced31207c223d96f485b13bbb98d815551ace
