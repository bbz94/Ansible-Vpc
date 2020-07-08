# Variables
credentials_file=$1
sharedvpcprojectid=$2
serviceprojectid=$3
networkuser=$4
subnetname=$5
region=$6
replace_user=kristians.voronics@if.lv
replace_etag=BwWp6v8fxEo=
subnet_policy_path=/root/Ansible-Vpc/subnet-policy.json 


# Auth
cd "/mnt/c/Program Files (x86)/Google/Cloud SDK/google-cloud-sdk/bin"
bash gcloud auth activate-service-account id-vpc-network-peering@aisarch-security-hub-prod.iam.gserviceaccount.com --key-file=$credentials_file

# Attach project to shared VPC
bash gcloud compute shared-vpc associated-projects add $serviceprojectid --host-project=$sharedvpcprojectid

# Service Project Admins for all subnets
sed -i "s/replace_user/$replace_user/g" $subnet_policy_path
sed -i "s/replace_etag/$replace_etag/g" $subnet_policy_path
bash gcloud compute networks subnets set-iam-policy $subnetname $subnet_policy_path --region $region --project $sharedvpcprojectid

echo $credentials_file
echo $sharedvpcprojectid
echo $serviceprojectid
echo $networkuser
echo $subnetname
echo $region
echo $replace_user
echo $subnet_policy_path
