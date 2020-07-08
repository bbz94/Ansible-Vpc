# Variables
credentials_file=$1
project=$2
subnetname=$3

cd "/mnt/c/Program Files (x86)/Google/Cloud SDK/google-cloud-sdk/bin"
gcloud auth activate-service-account id-vpc-network-peering@aisarch-security-hub-prod.iam.gserviceaccount.com --key-file=$credentials_file

echo $credentials_file
echo $project