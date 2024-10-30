# Excersice-1
Spin a kubernetes cluster with 2 node pools using terraform and scale the second nodepool with increase in traffic.


To create a Kubernetes cluster with two node pools in Google Cloud using Terraform, and to configure the second node pool to auto-scale with traffic demand, follow these steps. This setup includes:

1. Provisioning a GKE cluster with two node pools.
2. Configuring auto-scaling on the second node pool.

Step 1: Set Up Provider Configuration
Ensure you have Google Cloud Provider and Kubernetes Provider configured in your Terraform project.

Step 2: Define Variables
Create a variables.tf file for easy customization.

Step 3: Create the GKE Cluster with Two Node Pools
Define the main.tf configuration file to set up the cluster and node pools.

Step 4: Output Information (Optional)
Create an outputs.tf to display cluster details after deployment.

Step 5: Initialize and Apply Terraform Configuration
Run the following commands to initialize and deploy the cluster:

==> terraform init
==> terraform apply -var="project_id=<YOUR_PROJECT_ID>" -var="region=us-west1"

Explanation of Auto-scaling
The second node pool (autoscale-pool) is set up with auto-scaling parameters:

min_node_count = 1: Minimum node count to handle baseline traffic.
max_node_count = 5: Maximum node count to handle increased traffic.
Google Kubernetes Engine will automatically add nodes to this pool as demand increases and scale down during periods of low traffic.

