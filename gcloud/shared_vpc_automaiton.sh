# Variables
credentials_file=$1
sharedvpcprojectid=$2
serviceprojectid=$3
networkuser=$4
subnetname=$5
region=$6
subnet_policy_path=/root/Ansible-Vpc/subnet-policy.json 

# Auth
cd "/mnt/c/Program Files (x86)/Google/Cloud SDK/google-cloud-sdk/bin"
bash gcloud auth activate-service-account id-vpc-network-peering@aisarch-security-hub-prod.iam.gserviceaccount.com --key-file=$credentials_file

# Attach project to shared VPC
gcloud compute shared-vpc associated-projects add $serviceprojectid --host-project=$sharedvpcprojectid

# Get e tag for subnet
etag=$(bash gcloud compute networks subnets get-iam-policy $subnetname --region $region --project $sharedvpcprojectid --format json | jq .etag)

# Service Project Admins for all subnets
sed -i "s/replace_user/$networkuser/g" $subnet_policy_path
sed -i "s/replace_etag/$etag/g" $subnet_policy_path
bash gcloud compute networks subnets set-iam-policy $subnetname $subnet_policy_path --region $region --project $sharedvpcprojectid

echo $credentials_file
echo $sharedvpcprojectid
echo $serviceprojectid
echo $networkuser
echo $subnetname
echo $region
echo $subnet_policy_path


