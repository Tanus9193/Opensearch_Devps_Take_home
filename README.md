
# OpenSearch operators and opensearch Cluster Automate Deployment on AWS EKS using Terraform

Prerequisites

The below dependicies should be installed on your machine to execute this terraform solution.

1: Terraform

2: AWS CLI (with required AWS Access Configured)

3: kubectl

The terraform script will be deploy below resources.

1: VPC ( With public private subnets)

2: EKS Cluster with Nodes

3: ALB Ingres Controller

4: Kubernets deployments, secrets, Services, Ingress.

Explanation:

1: This terraform script Automatically deployed all required resources on AWS to deploy OpenSearch Operators and OpenSearch Cluster.

2: While execute terraform apply, it will ask us to input the username and password on runtime to ingest them into kubernetes secrets that further used in Opensearch Deployment and we will use them to access the Opensearch Dasboard.

3: We are using 2 Kubernetes services.

1: Node Port ----> service that will help us to expose our Opensearch Dasboard externally with ingress.

2: Cluster IP ----> Service will be use to internal cummunication between Opensearch Cluster and OpenSearch Operators 

4: To access the Openserch dashboard we can edit the ingress.yaml file reside in manifest diretory to add our domain.  




## Deployment


Execute below commands to deploy terraform Solution

terraform init

terraform apply  -auto-approve

Input Username and Password to use with Opensearch Cluster

If somehow any error happens that mostly due to timeout, So we can reexecute 

terraform apply  -auto-approve


```


## Destroy Terraform

To destroy the terraform follow the below

Remove ingress rule using below command before destoy the terraform.

Command: kubectl delete ingress ( Ingress name)
or
To check the running ingress
Command:  kubectl get ingress

Now we can Destroy terraform

Command:  terraform destroy -auto-approve
