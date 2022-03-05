apiVersion: v1
clusters:
- cluster:
    server: ${cluster_endpoint}
    certificate-authority-data: "${cluster_cert}"
  name: ${cluster_name}
contexts:
- context:
    cluster: ${cluster_name}
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
        - "${cluster_name}"