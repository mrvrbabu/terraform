Example : Run the terraform apply 
1) 
aws_instance.kubemaster01 (remote-exec): Then you can join any number of worker nodes by running the following on each as root:

aws_instance.kubemaster01 (remote-exec): kubeadm join 172.31.73.172:6443 --token 4f0pj4.tgz4y1ja99f3kjgz \
aws_instance.kubemaster01 (remote-exec):     --discovery-token-ca-cert-hash sha256:1560cc7dec993898743c0fe4cdc14b5718ec0eabc3021bd23d00b84684adcd40

2) Deploy the pod on master "kubectl run --image=nginx nginx-server --port=80 --env="DOMAIN=cluster""

3) Expose the deployment expose the port "kubectl expose deployment nginx-server --port=80 --name=nginx-http"

4) Get the svc details "kubectl get svc"
$ kubectl get svc -A 
NAMESPACE     NAME         TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)                  AGE
default       kubernetes   ClusterIP   10.96.0.1        <none>        443/TCP                  6m50s
default       nginx-http   ClusterIP   10.100.228.159   <none>        80/TCP                   7s
kube-system   kube-dns     ClusterIP   10.96.0.10       <none>        53/UDP,53/TCP,9153/TCP   6m49s
ubuntu@ip-172-31-73-172:~/.kube$ 

5) Do curl of ip to verify the connection  

$ curl -I 10.100.228.159
HTTP/1.1 200 OK
Server: nginx/1.19.1
Date: Wed, 22 Jul 2020 19:33:08 GMT
Content-Type: text/html
Content-Length: 612
Last-Modified: Tue, 07 Jul 2020 15:52:25 GMT
Connection: keep-alive
ETag: "5f049a39-264"
Accept-Ranges: bytes

ubuntu@ip-172-31-73-172:~/.kube$

