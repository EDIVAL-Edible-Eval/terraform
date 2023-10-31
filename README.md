# terraform
Automation script for EDIVAL's Google Cloud infrastructure configuration


## How to Run
1. Make sure you have installed terraform (v1.6.2) and [Google Cloud SDK](https://cloud.google.com/sdk/docs/install-sdk)
2. Navigate to src/ directory
3. Run `gcloud auth application-default login` to use your gcloud credentials
4. Login with your Goggle Account
5. Run the following command to configure selected project 
```
gcloud config set project edival-402305
gcloud auth application-default set-quota-project edival-402305
```
6. Run following command to execute the script
```
terraform init
terraform plan
terraform apply
```