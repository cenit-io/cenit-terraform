locals {
  default_tags = {
    Environment = var.environment
    ManagedBy   = "terraform"
    Name        = var.cluster_name
  }

  eks-node-private-userdata = <<USERDATA
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="==MYBOUNDARY=="
--==MYBOUNDARY==
Content-Type: text/x-shellscript; charset="us-ascii"
#!/bin/bash -xe
sudo /etc/eks/bootstrap.sh --apiserver-endpoint '${aws_eks_cluster.cluster.endpoint}' --b64-cluster-ca '${aws_eks_cluster.cluster.certificate_authority[0].data}' '${aws_eks_cluster.cluster.name}'
echo "Running custom user data script" > /tmp/me.txt
yum install -y amazon-ssm-agent
echo "yum'd agent" >> /tmp/me.txt
systemctl enable amazon-ssm-agent && systemctl start amazon-ssm-agent
date >> /tmp/me.txt
--==MYBOUNDARY==--
USERDATA

  kubeconfig = <<KUBECONFIG
apiVersion: v1
clusters:
- cluster:
  server: aws_eks_cluster.eks-cluster.endpoint
  certificate-authority-data: aws_eks_cluster.eks-cluster.certificate_authority.0.data
name: kubernetes
contexts:
- context:
  cluster: kubernetes
  user: aws
name: aws
current-context: aws
kind: Config
preferences: {}
users:
- name: aws
user:
  exec:
    apiVersion: client.authentication.k8s.io/v1alpha1
    command: aws-iam-authenticator
    args:
      - "token"
      - "-i"
      - "aws_eks_cluster.eks-cluster.name"
KUBECONFIG

}
