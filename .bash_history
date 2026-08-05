sudo ufw allow 3389/tcp
sudo ufw reload
sudo ufw status
sudo ss -tlnp | grep 3389
netsh interface portproxy reset
sudo ss -tlnp | grep 3389
sudo apt update
sudo apt install                     xrdp -y
sudo systemctl enable xrdp
sudo systemctl start xrdp
sudo adduser xrdp ssl-cert
ping 10.5.11.103
ping 8.8.8.8
ip a
ip link
sudo nano /etc/netplan/01-network-manager-all.yaml 
sudo nano /etc/netplan/01-netcfg.yaml
sudo netplan apply 
sudo nano /etc/netplan/01-netcfg.yaml
sudo netplan apply 
sudo systemctl unmask systemd-networkd
sudo systemctl enable systemd-networkd
sudo systemctl start systemd-networkd
sudo netplan apply 
curl -sfL https://get.k3s.io | sh -
sudo chmod 644 /etc/rancher/k3s/k3s.yaml
curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh" | bash
sudo mv kustomize /usr/local/bin/
mkdir ~/awx-install && cd ~/awx-install
cat << 'EOF' > kustomization.yaml
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
resources:
  - github.com/ansible/awx-operator/config/default?ref=2.19.0
images:
  - name: quay.io/ansible/awx-operator
    newTag: 2.19.0
namespace: awx
EOF

kubectl create namespace awx
kustomize build . | kubectl apply -f -
cat << 'EOF' > awx-demo.yaml
apiVersion: awx.ansible.com/v1beta1
kind: AWX
metadata:
  name: awx
  namespace: awx
spec:
  service_type: nodeport
  nodeport_port: 30080
EOF

kubectl apply -f awx-demo.yaml
kubectl get pods -n awx -w
kubectl get secret awx-admin-password -n awx -o jsonpath="{.data.password}" | base64 --decode; echo
nano requirements.yml
git add requirements.yml
git commit -m "add cisco.ios"
git push origin main
cd ~/cisco_backup_git
find / -name "backup_config.yml" 2>/dev/null
cd $(dirname $(find / -name "backup_config.yml" 2>/dev/null | head -n 1))
cat << 'EOF' > requirements.yml
---
collections:
  - name: cisco.ios
EOF

git add requirements.yml
git commit -m "add requirements.yml for awx"
git push origin main
nano backup_config.yml 
git add backup_config.yml
git commit -m "fix: update scp task and add error check"
git push origin main
nano backup_config.yml 
git add backup_config.yml
git commit -m "fix: update scp task and add error check"
git push origin main
nano backup_config.yml 
git add backup_config.yml
git commit -m "fix: update ansible cisco"
git push origin main
nano backup_config.yml 
git add backup_config.yml
git commit -m "fix: update ansible cisco"
git push origin main
nano backup_config.yml 
git add backup_config.yml
git commit -m "fix: update ansible cisco"
git push origin main
nano backup_config.yml 
git add backup_config.yml
git commit -m "fix: update ansible cisco"
git push origin main
nano backup_config.yml 
git add backup_config.yml
git commit -m "fix: update ansible cisco"
git push origin main
nano backup_config.yml 
git add backup_config.yml
git commit -m "fix: update ansible cisco"
git push origin main
nano backup_config.yml 
git add backup_config.yml
git commit -m "fix: update ansible cisco"
git push origin main
nano backup_config.yml 
git add backup_config.yml
git commit -m "fix: update ansible cisco"
git push origin main
nano backup_config.yml 
git add backup_config.yml
git commit -m "fix: update ansible cisco"
git push origin main
nano backup_config.yml 
git add backup_config.yml
git commit -m "fix: update ansible cisco"
git push origin main
nano backup_config.yml 
git add backup_config.yml
git commit -m "fix: update ansible cisco"
git push origin main
nano backup_config.yml 
git add backup_config.yml
git commit -m "fix: update ansible cisco"
git push origin main
cat backup_config.yml 
git add hosts.yml
git commit -m "add new cisco switches to inventory"
git push origin main
git add hosts.yml
ls -la
cat hosts 
sudo systemctl restart k3s
kubectl get pods -n awx
sudo kubectl get pods -n awx
sudo cp /etc/rancher/k3s/k3s.yaml ~/.kube/config
sudo chown $(id -u):$(id -g) ~/.kube/config
kubectl get pods -n awx
ping -c 3 quay.io
ping -c 3 8.8.8.8
sudo echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf
ping -c 3 quay.io
nslookup quay.io 8.8.8.8
# 1. systemd-resolved 설정에 구글 DNS 추가
sudo bash -c 'cat <<EOF > /etc/systemd/resolved.conf
[Resolve]
DNS=8.8.8.8 1.1.1.1
FallbackDNS=8.8.4.4
EOF'
# 2. DNS 서비스 재시작
sudo systemctl restart systemd-resolved
# 3. resolv.conf 심볼릭 링크 정상화
sudo rm -f /etc/resolv.conf
sudo ln -s /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf
sudo bash -c 'cat <<EOF > /etc/systemd/resolved.conf
[Resolve]
DNS=8.8.8.8 1.1.1.1
FallbackDNS=8.8.4.4
EOF'
sudo systemctl restart systemd-resolved
sudo rm -f /etc/resolv.conf
sudo ln -s /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf
curl -I https://quay.io
sudo systemctl restart k3s
sudo kubectl rollout restart deployment awx-operator-controller-manager -n awx
sudo kubectl get pods -n awx
sudo kubectl describe pod -n awx awx-operator-controller-manager-56f45c658c-4wgqp
sudo kubectl rollout restart deployment coredns -n kube-system
sudo kubectl get pods -n kube-system -l k8s-app=kube-dns
sudo kubectl exec -it deployment/awx-task -n awx -c awx-task -- nslookup github.com
sudo kubectl exec -it deployment/awx-task -n awx -c awx-task -- python3 -c "import socket; print(socket.gethostbyname('github.com'))"
