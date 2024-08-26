# Securing API Gateway Access with Cloud Armor

## 1. Enable the Cloud Armor API:

gcloud services enable compute.googleapis.com

## 2. Create a Firewall Policy:

gcloud compute firewall-policies create 

my-api-gateway-policy \
  --description "Firewall policy for API Gateway"

## 3. Create Firewall Rules:

gcloud compute firewall-policies add-rule 

my-api-gateway-policy \
  --action allow \
  --description "Allow traffic from specific IPs" \
  --enable-logging \
  --match "SRC_IP_RANGES: 192.168.1.0/24, 10.0.0.0/16"

  Replace 192.168.1.0/24, 10.0.0.0/16 with your allowed IP addresses or ranges.

## 4. Attach Firewall Policy to API Gateway:

gcloud compute firewall-policies set-iam-policy 

my-api-gateway-policy \
  --project your-project-id \
  --member "serviceAccount:your-api-gateway-service-account@your-project-id.iam.gserviceaccount.com" \
  --role roles/compute.firewallPolicyEnforcer

  Replace your-project-id with actual project-id Replace your-api-gateway-service-account with actual service account
  The your-api-gateway-service-account is the service account associated with your API Gateway instance group.
  roles/compute.firewallPolicyEnforcer allows the service account to enforce the firewall policy.
  
  After Completing These Steps:
  Your API Gateway will only accept traffic from the IP addresses you specified in the firewall rules.
  You can add more firewall rules to the policy as needed.
  For more fine-grained access control, consider using security groups.