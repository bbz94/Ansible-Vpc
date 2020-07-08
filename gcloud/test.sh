# Variables
credentials_file=$1
sharedvpcprojectid=$2
serviceprojectid=$3
subnetname=$4

# Auth
cd "/mnt/c/Program Files (x86)/Google/Cloud SDK/google-cloud-sdk/bin"
bash gcloud auth activate-service-account id-vpc-network-peering@aisarch-security-hub-prod.iam.gserviceaccount.com --key-file=$credentials_file

# Attach project to shared VPC
gcloud compute shared-vpc associated-projects add $serviceprojectid --host-project=$sharedvpcprojectid

echo $credentials_file
echo $sharedvpcprojectid
echo $serviceprojectid
echo $subnetname