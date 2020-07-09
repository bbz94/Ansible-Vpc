cd $HOME
rm -rf Ansible-Vpc
git clone https://github.com/bbz94/Ansible-Vpc
cd Ansible-Vpc
ansible-playbook -e "subnetname=testvpc2 subnetaddress=10.164.4.48/28 sharedvpcname=aisarch-common-host sharedvpcprojectid=aisarch-common-host networkuser=kristians.voronics@if.lv serviceprojectid=aisarch-security-hub-prod region=europe-north1 zone=europe-north1-a auth_kind=serviceaccount credentials_file=/root/compute-video-demo-ansible/gce_vars/secret.json" -i ansible_hosts shared_vpc_automaiton.yml