resource "null_resource" "wait_for_kubeconfig" {
  provisioner "local-exec" {
    command = <<-EOT
      #!/bin/bash
      while true
      do
        if [ -f ${path.root}/.kube/config ]
        then
          break
        else
          echo 'waiting for kubeconfig';
          sleep 10s;
        fi
      done
    EOT
  }
}