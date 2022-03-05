resource "aws_security_group" "allnodes-sg" {
  description = "Communication between all nodes in the cluster"
  vpc_id      = var.vpc_id
  tags = {
    "Name"  = format("${var.environment}-eks-%s-cluster/ClusterSharedNodeSecurityGroup", var.cluster_name)
    "Label" = "EKS All Nodes Comms"
  }
}

resource "aws_security_group" "cluster-sg" {
  description = "Communication between the control plane and worker nodegroups"
  vpc_id      = var.vpc_id
  tags = {
    "Name"  = format("${var.environment}eks-%s-cluster/ControlPlaneSecurityGroup", var.cluster_name)
    "Label" = "EKS Control Plane & all worker nodes comms"
  }
}

resource "aws_security_group_rule" "eks-all" {
  description       = "Allow control plane communication from remote networks"
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = concat([var.cidr_block], var.administration_cidrs)
  security_group_id = aws_security_group.cluster-sg.id
}

resource "aws_security_group_rule" "eks-all-egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = aws_security_group.cluster-sg.id
  cidr_blocks       = ["0.0.0.0/0"]
}


resource "aws_security_group_rule" "eks-node" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [var.cidr_block]
  security_group_id = aws_security_group.allnodes-sg.id
}

resource "aws_security_group_rule" "eks-node-egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = aws_security_group.allnodes-sg.id
  cidr_blocks       = ["0.0.0.0/0"]
}

#############

resource "aws_security_group_rule" "k8s_worker_ingress_master" {
  description              = "Allow worker Kubelets and pods to receive communication from the master control plane"
  from_port                = 1025
  to_port                  = 65535
  protocol                 = "tcp"
  security_group_id        = aws_security_group.allnodes-sg.id
  source_security_group_id = aws_security_group.cluster-sg.id
  type                     = "ingress"
}

resource "aws_security_group_rule" "k8s-master-ingress-worker" {
  description              = "Allow workers to communicate with the cluster API Server"
  from_port                = 443
  protocol                 = "tcp"
  security_group_id        = aws_security_group.cluster-sg.id
  source_security_group_id = aws_security_group.allnodes-sg.id
  to_port                  = 443
  type                     = "ingress"
}

resource "aws_security_group_rule" "k8s-worker-ingress-ControlPlane" {
  description              = "Allow workers to communicate with the cluster API Server"
  from_port                = 443
  protocol                 = "tcp"
  security_group_id        = aws_security_group.allnodes-sg.id
  source_security_group_id = aws_security_group.cluster-sg.id
  to_port                  = 443
  type                     = "ingress"
}

resource "aws_security_group_rule" "k8s-worker-ingress-self" {
  description              = "Allow node to communicate with each other"
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.allnodes-sg.id
  source_security_group_id = aws_security_group.allnodes-sg.id
  to_port                  = 65535
  type                     = "ingress"
}
