cd $HOME
rm -rf Ansible-Vpc
git clone https://github.com/bbz94/Ansible-Vpc
cd Ansible-Vpc
#ansible-playbook -i ansible_hosts gce-instances.yml
ansible-playbook -e "subnetname=testvpc2 subnetaddress=10.164.4.48/28 sharedvpcname=aisarch-common-host sharedvpcprojectid=aisarch-common-host networkuser=kristians.voronics@if.lv serviceprojectid=aisarch-security-hub-prod" -i ansible_hosts gce-instances.yml