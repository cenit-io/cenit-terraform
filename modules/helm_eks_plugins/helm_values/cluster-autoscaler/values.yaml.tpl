image:
  repository: k8s.gcr.io/autoscaling/cluster-autoscaler
  tag: v1.19.1
  pullPolicy: IfNotPresent

extraArgs:
  stderrthreshold: info
  logtostderr: true
  scale-down-enabled: true
  scale-down-unneeded-time: 10m
  scale-down-delay-after-add: 10m
  scale-down-delay-after-delete: 10m
  skip-nodes-with-local-storage: false
  expander: least-waste
  skip-nodes-with-system-pods: false