{
    "widgets": [
        {
            "height": 1,
            "width": 24,
            "y": 0,
            "x": 0,
            "type": "text",
            "properties": {
                "markdown": "# EKS Cluster Metrics Overall"
            }
        },
        {
            "height": 6,
            "width": 6,
            "y": 1,
            "x": 0,
            "type": "metric",
            "properties": {
                "region": "us-east-1",
                "title": "CPU Utilization",
                "legend": {
                    "position": "bottom"
                },
                "timezone": "Local",
                "metrics": [
                    [
                        {
                            "id": "expr1m0",
                            "label": "${cluster_name}",
                            "expression": "mm1m0 * 100 / mm0m0",
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "node_cpu_limit",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "id": "mm0m0",
                            "visible": false,
                            "stat": "Sum"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "node_cpu_usage_total",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "id": "mm1m0",
                            "visible": false,
                            "stat": "Sum"
                        }
                    ]
                ],
                "start": "-P0DT6H0M0S",
                "end": "P0D",
                "liveData": false,
                "period": 60,
                "yAxis": {
                    "left": {
                        "min": 0,
                        "showUnits": false,
                        "label": "Percent"
                    }
                },
                "view": "timeSeries",
                "stacked": false
            }
        },
        {
            "height": 6,
            "width": 6,
            "y": 1,
            "x": 6,
            "type": "metric",
            "properties": {
                "region": "us-east-1",
                "title": "Memory Utilization",
                "legend": {
                    "position": "bottom"
                },
                "timezone": "Local",
                "metrics": [
                    [
                        {
                            "id": "expr1m0",
                            "label": "${cluster_name}",
                            "expression": "mm1m0 * 100 / mm0m0",
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "node_memory_limit",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "id": "mm0m0",
                            "visible": false,
                            "stat": "Sum"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "node_memory_working_set",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "id": "mm1m0",
                            "visible": false,
                            "stat": "Sum"
                        }
                    ]
                ],
                "start": "-P0DT6H0M0S",
                "end": "P0D",
                "liveData": false,
                "period": 60,
                "yAxis": {
                    "left": {
                        "min": 0,
                        "showUnits": false,
                        "label": "Percent"
                    }
                },
                "view": "timeSeries",
                "stacked": false
            }
        },
        {
            "height": 6,
            "width": 6,
            "y": 1,
            "x": 12,
            "type": "metric",
            "properties": {
                "region": "us-east-1",
                "title": "Network",
                "legend": {
                    "position": "bottom"
                },
                "timezone": "Local",
                "metrics": [
                    [
                        "ContainerInsights",
                        "node_network_total_bytes",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ]
                ],
                "start": "-P0DT6H0M0S",
                "end": "P0D",
                "liveData": false,
                "period": 60,
                "view": "timeSeries",
                "stacked": false
            }
        },
        {
            "height": 6,
            "width": 6,
            "y": 1,
            "x": 18,
            "type": "metric",
            "properties": {
                "region": "us-east-1",
                "title": "Disk Utilization",
                "legend": {
                    "position": "bottom"
                },
                "timezone": "Local",
                "metrics": [
                    [
                        "ContainerInsights",
                        "node_filesystem_utilization",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "p90"
                        }
                    ]
                ],
                "start": "-P0DT6H0M0S",
                "end": "P0D",
                "liveData": false,
                "period": 60,
                "view": "timeSeries",
                "stacked": false
            }
        },
        {
            "height": 3,
            "width": 12,
            "y": 7,
            "x": 0,
            "type": "metric",
            "properties": {
                "region": "us-east-1",
                "title": "Cluster Failures",
                "legend": {
                    "position": "bottom"
                },
                "timezone": "Local",
                "metrics": [
                    [
                        "ContainerInsights",
                        "cluster_failed_node_count",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ]
                ],
                "start": "-P0DT6H0M0S",
                "end": "P0D",
                "liveData": false,
                "period": 60,
                "view": "singleValue",
                "stacked": false
            }
        },
        {
            "height": 3,
            "width": 12,
            "y": 7,
            "x": 12,
            "type": "metric",
            "properties": {
                "region": "us-east-1",
                "title": "Number of Nodes",
                "legend": {
                    "position": "bottom"
                },
                "timezone": "Local",
                "metrics": [
                    [
                        "ContainerInsights",
                        "cluster_node_count",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ]
                ],
                "start": "-P0DT6H0M0S",
                "end": "P0D",
                "liveData": false,
                "period": 60,
                "view": "singleValue",
                "stacked": false
            }
        },
        {
            "height": 1,
            "width": 24,
            "y": 10,
            "x": 0,
            "type": "text",
            "properties": {
                "markdown": "# EKS Cluster Resources Metrics"
            }
        },
        {
            "height": 6,
            "width": 6,
            "y": 12,
            "x": 0,
            "type": "metric",
            "properties": {
                "region": "us-east-1",
                "title": "CPU Utilization",
                "legend": {
                    "position": "bottom"
                },
                "timezone": "Local",
                "metrics": [
                    [
                        "ContainerInsights",
                        "node_cpu_utilization",
                        "InstanceId",
                        "i-08281e9f628acd9cf",
                        "NodeName",
                        "ip-10-102-33-157.ec2.internal",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "node_cpu_utilization",
                        "InstanceId",
                        "i-0df4be98fedda75af",
                        "NodeName",
                        "ip-10-102-62-43.ec2.internal",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "node_cpu_utilization",
                        "InstanceId",
                        "i-0db7ceb5d54d3890c",
                        "NodeName",
                        "ip-10-102-25-90.ec2.internal",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ]
                ],
                "start": "-P0DT6H0M0S",
                "end": "P0D",
                "liveData": false,
                "period": 60,
                "view": "timeSeries",
                "stacked": false
            }
        },
        {
            "height": 6,
            "width": 6,
            "y": 12,
            "x": 6,
            "type": "metric",
            "properties": {
                "region": "us-east-1",
                "title": "Memory Utilization",
                "legend": {
                    "position": "bottom"
                },
                "timezone": "Local",
                "metrics": [
                    [
                        "ContainerInsights",
                        "node_memory_utilization",
                        "InstanceId",
                        "i-08281e9f628acd9cf",
                        "NodeName",
                        "ip-10-102-33-157.ec2.internal",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "node_memory_utilization",
                        "InstanceId",
                        "i-0df4be98fedda75af",
                        "NodeName",
                        "ip-10-102-62-43.ec2.internal",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "node_memory_utilization",
                        "InstanceId",
                        "i-0db7ceb5d54d3890c",
                        "NodeName",
                        "ip-10-102-25-90.ec2.internal",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ]
                ],
                "start": "-P0DT6H0M0S",
                "end": "P0D",
                "liveData": false,
                "period": 60,
                "view": "timeSeries",
                "stacked": false
            }
        },
        {
            "height": 6,
            "width": 6,
            "y": 12,
            "x": 12,
            "type": "metric",
            "properties": {
                "region": "us-east-1",
                "title": "Disk Utilization",
                "legend": {
                    "position": "bottom"
                },
                "timezone": "Local",
                "metrics": [
                    [
                        "ContainerInsights",
                        "node_filesystem_utilization",
                        "InstanceId",
                        "i-08281e9f628acd9cf",
                        "NodeName",
                        "ip-10-102-33-157.ec2.internal",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "node_filesystem_utilization",
                        "InstanceId",
                        "i-0df4be98fedda75af",
                        "NodeName",
                        "ip-10-102-62-43.ec2.internal",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "node_filesystem_utilization",
                        "InstanceId",
                        "i-0db7ceb5d54d3890c",
                        "NodeName",
                        "ip-10-102-25-90.ec2.internal",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ]
                ],
                "start": "-P0DT6H0M0S",
                "end": "P0D",
                "liveData": false,
                "period": 60,
                "view": "timeSeries",
                "stacked": false
            }
        },
        {
            "height": 6,
            "width": 6,
            "y": 12,
            "x": 18,
            "type": "metric",
            "properties": {
                "region": "us-east-1",
                "title": "Network",
                "legend": {
                    "position": "bottom"
                },
                "timezone": "Local",
                "metrics": [
                    [
                        "ContainerInsights",
                        "node_network_total_bytes",
                        "InstanceId",
                        "i-0df4be98fedda75af",
                        "NodeName",
                        "ip-10-102-62-43.ec2.internal",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "node_network_total_bytes",
                        "InstanceId",
                        "i-0db7ceb5d54d3890c",
                        "NodeName",
                        "ip-10-102-25-90.ec2.internal",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "node_network_total_bytes",
                        "InstanceId",
                        "i-08281e9f628acd9cf",
                        "NodeName",
                        "ip-10-102-33-157.ec2.internal",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ]
                ],
                "start": "-P0DT6H0M0S",
                "end": "P0D",
                "liveData": false,
                "period": 60,
                "view": "timeSeries",
                "stacked": false
            }
        },
        {
            "height": 6,
            "width": 6,
            "y": 18,
            "x": 0,
            "type": "metric",
            "properties": {
                "region": "us-east-1",
                "title": "Reserved CPU Compute Capacity",
                "legend": {
                    "position": "bottom"
                },
                "timezone": "Local",
                "metrics": [
                    [
                        "ContainerInsights",
                        "node_cpu_reserved_capacity",
                        "InstanceId",
                        "i-08281e9f628acd9cf",
                        "NodeName",
                        "ip-10-102-33-157.ec2.internal",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "node_cpu_reserved_capacity",
                        "InstanceId",
                        "i-0df4be98fedda75af",
                        "NodeName",
                        "ip-10-102-62-43.ec2.internal",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "node_cpu_reserved_capacity",
                        "InstanceId",
                        "i-0db7ceb5d54d3890c",
                        "NodeName",
                        "ip-10-102-25-90.ec2.internal",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ]
                ],
                "start": "-P0DT6H0M0S",
                "end": "P0D",
                "liveData": false,
                "period": 60,
                "view": "timeSeries",
                "stacked": false
            }
        },
        {
            "height": 6,
            "width": 6,
            "y": 18,
            "x": 6,
            "type": "metric",
            "properties": {
                "region": "us-east-1",
                "title": "Reserved Memory Compute Capacity",
                "legend": {
                    "position": "bottom"
                },
                "timezone": "Local",
                "metrics": [
                    [
                        "ContainerInsights",
                        "node_memory_reserved_capacity",
                        "InstanceId",
                        "i-0df4be98fedda75af",
                        "NodeName",
                        "ip-10-102-62-43.ec2.internal",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "node_memory_reserved_capacity",
                        "InstanceId",
                        "i-0db7ceb5d54d3890c",
                        "NodeName",
                        "ip-10-102-25-90.ec2.internal",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "node_memory_reserved_capacity",
                        "InstanceId",
                        "i-08281e9f628acd9cf",
                        "NodeName",
                        "ip-10-102-33-157.ec2.internal",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ]
                ],
                "start": "-P0DT6H0M0S",
                "end": "P0D",
                "liveData": false,
                "period": 60,
                "view": "timeSeries",
                "stacked": false
            }
        },
        {
            "height": 6,
            "width": 6,
            "y": 18,
            "x": 12,
            "type": "metric",
            "properties": {
                "region": "us-east-1",
                "title": "Number of Pods",
                "legend": {
                    "position": "bottom"
                },
                "timezone": "Local",
                "metrics": [
                    [
                        "ContainerInsights",
                        "node_number_of_running_pods",
                        "InstanceId",
                        "i-08281e9f628acd9cf",
                        "NodeName",
                        "ip-10-102-33-157.ec2.internal",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "node_number_of_running_pods",
                        "InstanceId",
                        "i-0df4be98fedda75af",
                        "NodeName",
                        "ip-10-102-62-43.ec2.internal",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "node_number_of_running_pods",
                        "InstanceId",
                        "i-0db7ceb5d54d3890c",
                        "NodeName",
                        "ip-10-102-25-90.ec2.internal",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ]
                ],
                "start": "-P0DT6H0M0S",
                "end": "P0D",
                "liveData": false,
                "period": 60,
                "view": "timeSeries",
                "stacked": false
            }
        },
        {
            "height": 6,
            "width": 6,
            "y": 18,
            "x": 18,
            "type": "metric",
            "properties": {
                "region": "us-east-1",
                "title": "Number of Containers",
                "legend": {
                    "position": "bottom"
                },
                "timezone": "Local",
                "metrics": [
                    [
                        "ContainerInsights",
                        "node_number_of_running_containers",
                        "InstanceId",
                        "i-0df4be98fedda75af",
                        "NodeName",
                        "ip-10-102-62-43.ec2.internal",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "node_number_of_running_containers",
                        "InstanceId",
                        "i-0db7ceb5d54d3890c",
                        "NodeName",
                        "ip-10-102-25-90.ec2.internal",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "node_number_of_running_containers",
                        "InstanceId",
                        "i-08281e9f628acd9cf",
                        "NodeName",
                        "ip-10-102-33-157.ec2.internal",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ]
                ],
                "start": "-P0DT6H0M0S",
                "end": "P0D",
                "liveData": false,
                "period": 60,
                "view": "timeSeries",
                "stacked": false
            }
        },
        {
            "height": 1,
            "width": 24,
            "y": 50,
            "x": 0,
            "type": "text",
            "properties": {
                "markdown": "## Per Pods"
            }
        },
        {
            "height": 1,
            "width": 24,
            "y": 11,
            "x": 0,
            "type": "text",
            "properties": {
                "markdown": "## Per Nodes"
            }
        },
        {
            "height": 6,
            "width": 9,
            "y": 25,
            "x": 0,
            "type": "metric",
            "properties": {
                "region": "us-east-1",
                "title": "CPU Utilization",
                "legend": {
                    "position": "bottom"
                },
                "timezone": "Local",
                "metrics": [
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization",
                        "Service",
                        "redis-cluster-ip-service",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization",
                        "Service",
                        "rabbitmq-ui",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization",
                        "Service",
                        "metric-server-metrics-server",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization",
                        "Service",
                        "aws-load-balancer-webhook-service",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization",
                        "Service",
                        "cenit-cluster-ip-service",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization",
                        "Service",
                        "external-secrets-kubernetes-external-secrets",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization",
                        "Service",
                        "nri-bundle-nri-metadata-injection",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization",
                        "Service",
                        "external-dns",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization",
                        "Service",
                        "kube-dns",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization",
                        "Service",
                        "cluster-autoscaler-aws-cluster-autoscaler",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization",
                        "Service",
                        "rabbitmq-cluster-ip-service",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ]
                ],
                "start": "-P0DT6H0M0S",
                "end": "P0D",
                "liveData": false,
                "period": 60,
                "view": "timeSeries",
                "stacked": false
            }
        },
        {
            "height": 6,
            "width": 9,
            "y": 25,
            "x": 9,
            "type": "metric",
            "properties": {
                "region": "us-east-1",
                "title": "Memory Utilization",
                "legend": {
                    "position": "bottom"
                },
                "timezone": "Local",
                "metrics": [
                    [
                        "ContainerInsights",
                        "pod_memory_utilization",
                        "Service",
                        "rabbitmq-ui",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization",
                        "Service",
                        "metric-server-metrics-server",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization",
                        "Service",
                        "aws-load-balancer-webhook-service",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization",
                        "Service",
                        "cenit-cluster-ip-service",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization",
                        "Service",
                        "external-secrets-kubernetes-external-secrets",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization",
                        "Service",
                        "nri-bundle-nri-metadata-injection",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization",
                        "Service",
                        "external-dns",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization",
                        "Service",
                        "kube-dns",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization",
                        "Service",
                        "cluster-autoscaler-aws-cluster-autoscaler",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization",
                        "Service",
                        "redis-cluster-ip-service",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization",
                        "Service",
                        "rabbitmq-cluster-ip-service",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ]
                ],
                "start": "-P0DT6H0M0S",
                "end": "P0D",
                "liveData": false,
                "period": 60,
                "view": "timeSeries",
                "stacked": false
            }
        },
        {
            "height": 6,
            "width": 6,
            "y": 31,
            "x": 18,
            "type": "metric",
            "properties": {
                "region": "us-east-1",
                "title": "Network",
                "legend": {
                    "position": "bottom"
                },
                "timezone": "Local",
                "metrics": [
                    [
                        "ContainerInsights",
                        "pod_network_tx_bytes",
                        "Service",
                        "aws-load-balancer-webhook-service",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_tx_bytes",
                        "Service",
                        "cenit-cluster-ip-service",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_tx_bytes",
                        "Service",
                        "external-secrets-kubernetes-external-secrets",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_tx_bytes",
                        "Service",
                        "nri-bundle-nri-metadata-injection",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_tx_bytes",
                        "Service",
                        "kube-dns",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_tx_bytes",
                        "Service",
                        "cluster-autoscaler-aws-cluster-autoscaler",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_tx_bytes",
                        "Service",
                        "redis-cluster-ip-service",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_tx_bytes",
                        "Service",
                        "rabbitmq-cluster-ip-service",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_tx_bytes",
                        "Service",
                        "external-dns",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_tx_bytes",
                        "Service",
                        "rabbitmq-ui",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_tx_bytes",
                        "Service",
                        "metric-server-metrics-server",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_rx_bytes",
                        "Service",
                        "aws-load-balancer-webhook-service",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_rx_bytes",
                        "Service",
                        "cenit-cluster-ip-service",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_rx_bytes",
                        "Service",
                        "external-secrets-kubernetes-external-secrets",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_rx_bytes",
                        "Service",
                        "nri-bundle-nri-metadata-injection",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_rx_bytes",
                        "Service",
                        "kube-dns",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_rx_bytes",
                        "Service",
                        "cluster-autoscaler-aws-cluster-autoscaler",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_rx_bytes",
                        "Service",
                        "redis-cluster-ip-service",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_rx_bytes",
                        "Service",
                        "rabbitmq-cluster-ip-service",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_rx_bytes",
                        "Service",
                        "external-dns",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_rx_bytes",
                        "Service",
                        "rabbitmq-ui",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_rx_bytes",
                        "Service",
                        "metric-server-metrics-server",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ]
                ],
                "start": "-P0DT6H0M0S",
                "end": "P0D",
                "liveData": false,
                "period": 60,
                "view": "timeSeries",
                "stacked": false
            }
        },
        {
            "height": 6,
            "width": 9,
            "y": 31,
            "x": 9,
            "type": "metric",
            "properties": {
                "region": "us-east-1",
                "title": "CPU Utilization (Over Limit)",
                "legend": {
                    "position": "bottom"
                },
                "timezone": "Local",
                "metrics": [
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization_over_pod_limit",
                        "Service",
                        "redis-cluster-ip-service",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization_over_pod_limit",
                        "Service",
                        "rabbitmq-ui",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization_over_pod_limit",
                        "Service",
                        "metric-server-metrics-server",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization_over_pod_limit",
                        "Service",
                        "aws-load-balancer-webhook-service",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization_over_pod_limit",
                        "Service",
                        "cenit-cluster-ip-service",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization_over_pod_limit",
                        "Service",
                        "external-secrets-kubernetes-external-secrets",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization_over_pod_limit",
                        "Service",
                        "nri-bundle-nri-metadata-injection",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization_over_pod_limit",
                        "Service",
                        "external-dns",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization_over_pod_limit",
                        "Service",
                        "kube-dns",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization_over_pod_limit",
                        "Service",
                        "cluster-autoscaler-aws-cluster-autoscaler",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization_over_pod_limit",
                        "Service",
                        "rabbitmq-cluster-ip-service",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ]
                ],
                "start": "-P0DT6H0M0S",
                "end": "P0D",
                "liveData": false,
                "period": 60,
                "view": "timeSeries",
                "stacked": false
            }
        },
        {
            "height": 6,
            "width": 9,
            "y": 31,
            "x": 0,
            "type": "metric",
            "properties": {
                "region": "us-east-1",
                "title": "Memory Utilization (Over Limit)",
                "legend": {
                    "position": "bottom"
                },
                "timezone": "Local",
                "metrics": [
                    [
                        "ContainerInsights",
                        "pod_memory_utilization_over_pod_limit",
                        "Service",
                        "redis-cluster-ip-service",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization_over_pod_limit",
                        "Service",
                        "rabbitmq-ui",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization_over_pod_limit",
                        "Service",
                        "metric-server-metrics-server",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization_over_pod_limit",
                        "Service",
                        "aws-load-balancer-webhook-service",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization_over_pod_limit",
                        "Service",
                        "cenit-cluster-ip-service",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization_over_pod_limit",
                        "Service",
                        "external-secrets-kubernetes-external-secrets",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization_over_pod_limit",
                        "Service",
                        "nri-bundle-nri-metadata-injection",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization_over_pod_limit",
                        "Service",
                        "external-dns",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization_over_pod_limit",
                        "Service",
                        "kube-dns",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization_over_pod_limit",
                        "Service",
                        "cluster-autoscaler-aws-cluster-autoscaler",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization_over_pod_limit",
                        "Service",
                        "rabbitmq-cluster-ip-service",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ]
                ],
                "start": "-P0DT6H0M0S",
                "end": "P0D",
                "liveData": false,
                "period": 60,
                "view": "timeSeries",
                "stacked": false
            }
        },
        {
            "height": 6,
            "width": 6,
            "y": 25,
            "x": 18,
            "type": "metric",
            "properties": {
                "region": "us-east-1",
                "title": "Number of Pods",
                "legend": {
                    "position": "bottom"
                },
                "timezone": "Local",
                "metrics": [
                    [
                        "ContainerInsights",
                        "service_number_of_running_pods",
                        "Service",
                        "rabbitmq-ui",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "service_number_of_running_pods",
                        "Service",
                        "metric-server-metrics-server",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "service_number_of_running_pods",
                        "Service",
                        "aws-load-balancer-webhook-service",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "service_number_of_running_pods",
                        "Service",
                        "cenit-cluster-ip-service",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "service_number_of_running_pods",
                        "Service",
                        "external-secrets-kubernetes-external-secrets",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "service_number_of_running_pods",
                        "Service",
                        "nri-bundle-nri-metadata-injection",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "service_number_of_running_pods",
                        "Service",
                        "external-dns",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "service_number_of_running_pods",
                        "Service",
                        "kube-dns",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "service_number_of_running_pods",
                        "Service",
                        "cluster-autoscaler-aws-cluster-autoscaler",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "service_number_of_running_pods",
                        "Service",
                        "redis-cluster-ip-service",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "service_number_of_running_pods",
                        "Service",
                        "rabbitmq-cluster-ip-service",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ]
                ],
                "start": "-P0DT6H0M0S",
                "end": "P0D",
                "liveData": false,
                "period": 60,
                "view": "timeSeries",
                "stacked": false
            }
        },
        {
            "height": 1,
            "width": 24,
            "y": 24,
            "x": 0,
            "type": "text",
            "properties": {
                "markdown": "## Per Services"
            }
        },
        {
            "height": 6,
            "width": 9,
            "y": 38,
            "x": 0,
            "type": "metric",
            "properties": {
                "region": "us-east-1",
                "title": "CPU Utilization",
                "legend": {
                    "position": "bottom"
                },
                "timezone": "Local",
                "metrics": [
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization",
                        "Namespace",
                        "amazon-cloudwatch",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ]
                ],
                "start": "-P0DT6H0M0S",
                "end": "P0D",
                "liveData": false,
                "period": 60,
                "view": "timeSeries",
                "stacked": false
            }
        },
        {
            "height": 6,
            "width": 9,
            "y": 38,
            "x": 9,
            "type": "metric",
            "properties": {
                "region": "us-east-1",
                "title": "Memory Utilization",
                "legend": {
                    "position": "bottom"
                },
                "timezone": "Local",
                "metrics": [
                    [
                        "ContainerInsights",
                        "pod_memory_utilization",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization",
                        "Namespace",
                        "amazon-cloudwatch",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ]
                ],
                "start": "-P0DT6H0M0S",
                "end": "P0D",
                "liveData": false,
                "period": 60,
                "view": "timeSeries",
                "stacked": false
            }
        },
        {
            "height": 6,
            "width": 6,
            "y": 38,
            "x": 18,
            "type": "metric",
            "properties": {
                "region": "us-east-1",
                "title": "Network",
                "legend": {
                    "position": "bottom"
                },
                "timezone": "Local",
                "metrics": [
                    [
                        "ContainerInsights",
                        "node_network_total_bytes",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ]
                ],
                "start": "-P0DT6H0M0S",
                "end": "P0D",
                "liveData": false,
                "period": 60,
                "view": "timeSeries",
                "stacked": false
            }
        },
        {
            "height": 6,
            "width": 9,
            "y": 44,
            "x": 0,
            "type": "metric",
            "properties": {
                "region": "us-east-1",
                "title": "CPU Utilization (Over Limit)",
                "legend": {
                    "position": "bottom"
                },
                "timezone": "Local",
                "metrics": [
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization_over_pod_limit",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization_over_pod_limit",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization_over_pod_limit",
                        "Namespace",
                        "amazon-cloudwatch",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ]
                ],
                "start": "-P0DT6H0M0S",
                "end": "P0D",
                "liveData": false,
                "period": 60,
                "view": "timeSeries",
                "stacked": false
            }
        },
        {
            "height": 6,
            "width": 9,
            "y": 44,
            "x": 9,
            "type": "metric",
            "properties": {
                "region": "us-east-1",
                "title": "Memory Utilization (Over Limit)",
                "legend": {
                    "position": "bottom"
                },
                "timezone": "Local",
                "metrics": [
                    [
                        "ContainerInsights",
                        "pod_memory_utilization_over_pod_limit",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization_over_pod_limit",
                        "Namespace",
                        "amazon-cloudwatch",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization_over_pod_limit",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ]
                ],
                "start": "-P0DT6H0M0S",
                "end": "P0D",
                "liveData": false,
                "period": 60,
                "view": "timeSeries",
                "stacked": false
            }
        },
        {
            "height": 6,
            "width": 6,
            "y": 44,
            "x": 18,
            "type": "metric",
            "properties": {
                "region": "us-east-1",
                "title": "Number of Pods",
                "legend": {
                    "position": "bottom"
                },
                "timezone": "Local",
                "metrics": [
                    [
                        "ContainerInsights",
                        "namespace_number_of_running_pods",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "namespace_number_of_running_pods",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "namespace_number_of_running_pods",
                        "Namespace",
                        "amazon-cloudwatch",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ]
                ],
                "start": "-P0DT6H0M0S",
                "end": "P0D",
                "liveData": false,
                "period": 60,
                "view": "timeSeries",
                "stacked": false
            }
        },
        {
            "height": 1,
            "width": 24,
            "y": 37,
            "x": 0,
            "type": "text",
            "properties": {
                "markdown": "## Per Namespaces"
            }
        },
        {
            "height": 6,
            "width": 12,
            "y": 51,
            "x": 0,
            "type": "metric",
            "properties": {
                "region": "us-east-1",
                "title": "CPU Utilization",
                "legend": {
                    "position": "right"
                },
                "timezone": "Local",
                "metrics": [
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization",
                        "PodName",
                        "rabbitmq-deployment",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization",
                        "PodName",
                        "nri-bundle-newrelic-infrastructure",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization",
                        "PodName",
                        "nri-bundle-nri-kube-events",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization",
                        "PodName",
                        "cenit-deployment-backend",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization",
                        "PodName",
                        "nri-bundle-nri-prometheus",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization",
                        "PodName",
                        "kube-proxy",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization",
                        "PodName",
                        "coredns",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization",
                        "PodName",
                        "aws-cloudwatch-metrics",
                        "Namespace",
                        "amazon-cloudwatch",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization",
                        "PodName",
                        "nri-bundle-nri-metadata-injection",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization",
                        "PodName",
                        "aws-node",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization",
                        "PodName",
                        "aws-load-balancer-controller",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization",
                        "PodName",
                        "ebs-csi-controller",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization",
                        "PodName",
                        "ebs-csi-node",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization",
                        "PodName",
                        "external-dns",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization",
                        "PodName",
                        "redis-deployment",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization",
                        "PodName",
                        "external-secrets-kubernetes-external-secrets",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization",
                        "PodName",
                        "cluster-autoscaler-aws-cluster-autoscaler",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization",
                        "PodName",
                        "ebs-snapshot-controller-0",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization",
                        "PodName",
                        "metric-server-metrics-server",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization",
                        "PodName",
                        "cenit-deployment-frontend",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ]
                ],
                "start": "-P0DT6H0M0S",
                "end": "P0D",
                "liveData": false,
                "period": 60,
                "view": "timeSeries",
                "stacked": false
            }
        },
        {
            "height": 6,
            "width": 12,
            "y": 57,
            "x": 0,
            "type": "metric",
            "properties": {
                "region": "us-east-1",
                "title": "Memory Utilization",
                "legend": {
                    "position": "right"
                },
                "timezone": "Local",
                "metrics": [
                    [
                        "ContainerInsights",
                        "pod_memory_utilization",
                        "PodName",
                        "ebs-snapshot-controller-0",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization",
                        "PodName",
                        "metric-server-metrics-server",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization",
                        "PodName",
                        "cenit-deployment-frontend",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization",
                        "PodName",
                        "rabbitmq-deployment",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization",
                        "PodName",
                        "nri-bundle-newrelic-infrastructure",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization",
                        "PodName",
                        "nri-bundle-nri-kube-events",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization",
                        "PodName",
                        "cenit-deployment-backend",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization",
                        "PodName",
                        "nri-bundle-nri-prometheus",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization",
                        "PodName",
                        "kube-proxy",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization",
                        "PodName",
                        "coredns",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization",
                        "PodName",
                        "aws-cloudwatch-metrics",
                        "Namespace",
                        "amazon-cloudwatch",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization",
                        "PodName",
                        "aws-node",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization",
                        "PodName",
                        "aws-load-balancer-controller",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization",
                        "PodName",
                        "ebs-csi-controller",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization",
                        "PodName",
                        "ebs-csi-node",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization",
                        "PodName",
                        "external-dns",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization",
                        "PodName",
                        "nri-bundle-nri-metadata-injection",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization",
                        "PodName",
                        "redis-deployment",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization",
                        "PodName",
                        "external-secrets-kubernetes-external-secrets",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization",
                        "PodName",
                        "cluster-autoscaler-aws-cluster-autoscaler",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ]
                ],
                "start": "-P0DT6H0M0S",
                "end": "P0D",
                "liveData": false,
                "period": 60,
                "view": "timeSeries",
                "stacked": false
            }
        },
        {
            "height": 6,
            "width": 12,
            "y": 63,
            "x": 0,
            "type": "metric",
            "properties": {
                "region": "us-east-1",
                "title": "Network",
                "legend": {
                    "position": "right"
                },
                "timezone": "Local",
                "metrics": [
                    [
                        "ContainerInsights",
                        "pod_network_tx_bytes",
                        "PodName",
                        "kube-proxy",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_tx_bytes",
                        "PodName",
                        "coredns",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_tx_bytes",
                        "PodName",
                        "aws-node",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_tx_bytes",
                        "PodName",
                        "aws-load-balancer-controller",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_tx_bytes",
                        "PodName",
                        "ebs-csi-controller",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_tx_bytes",
                        "PodName",
                        "ebs-csi-node",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_tx_bytes",
                        "PodName",
                        "external-dns",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_tx_bytes",
                        "PodName",
                        "redis-deployment",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_tx_bytes",
                        "PodName",
                        "external-secrets-kubernetes-external-secrets",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_tx_bytes",
                        "PodName",
                        "cluster-autoscaler-aws-cluster-autoscaler",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_tx_bytes",
                        "PodName",
                        "ebs-snapshot-controller-0",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_tx_bytes",
                        "PodName",
                        "metric-server-metrics-server",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_tx_bytes",
                        "PodName",
                        "cenit-deployment-frontend",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_tx_bytes",
                        "PodName",
                        "aws-cloudwatch-metrics",
                        "Namespace",
                        "amazon-cloudwatch",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_tx_bytes",
                        "PodName",
                        "nri-bundle-nri-metadata-injection",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_tx_bytes",
                        "PodName",
                        "rabbitmq-deployment",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_tx_bytes",
                        "PodName",
                        "nri-bundle-newrelic-infrastructure",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_tx_bytes",
                        "PodName",
                        "nri-bundle-nri-kube-events",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_tx_bytes",
                        "PodName",
                        "cenit-deployment-backend",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_tx_bytes",
                        "PodName",
                        "nri-bundle-nri-prometheus",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_rx_bytes",
                        "PodName",
                        "kube-proxy",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_rx_bytes",
                        "PodName",
                        "coredns",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_rx_bytes",
                        "PodName",
                        "aws-node",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_rx_bytes",
                        "PodName",
                        "aws-load-balancer-controller",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_rx_bytes",
                        "PodName",
                        "ebs-csi-controller",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_rx_bytes",
                        "PodName",
                        "ebs-csi-node",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_rx_bytes",
                        "PodName",
                        "external-dns",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_rx_bytes",
                        "PodName",
                        "redis-deployment",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_rx_bytes",
                        "PodName",
                        "external-secrets-kubernetes-external-secrets",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_rx_bytes",
                        "PodName",
                        "cluster-autoscaler-aws-cluster-autoscaler",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_rx_bytes",
                        "PodName",
                        "ebs-snapshot-controller-0",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_rx_bytes",
                        "PodName",
                        "metric-server-metrics-server",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_rx_bytes",
                        "PodName",
                        "cenit-deployment-frontend",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_rx_bytes",
                        "PodName",
                        "aws-cloudwatch-metrics",
                        "Namespace",
                        "amazon-cloudwatch",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_rx_bytes",
                        "PodName",
                        "nri-bundle-nri-metadata-injection",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_rx_bytes",
                        "PodName",
                        "rabbitmq-deployment",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_rx_bytes",
                        "PodName",
                        "nri-bundle-newrelic-infrastructure",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_rx_bytes",
                        "PodName",
                        "nri-bundle-nri-kube-events",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_rx_bytes",
                        "PodName",
                        "cenit-deployment-backend",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_network_rx_bytes",
                        "PodName",
                        "nri-bundle-nri-prometheus",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ]
                ],
                "start": "-P0DT6H0M0S",
                "end": "P0D",
                "liveData": false,
                "period": 60,
                "view": "timeSeries",
                "stacked": false
            }
        },
        {
            "height": 6,
            "width": 6,
            "y": 51,
            "x": 12,
            "type": "metric",
            "properties": {
                "region": "us-east-1",
                "title": "CPU Utilization (Over Limit)",
                "legend": {
                    "position": "right"
                },
                "timezone": "Local",
                "metrics": [
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization_over_pod_limit",
                        "PodName",
                        "rabbitmq-deployment",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization_over_pod_limit",
                        "PodName",
                        "nri-bundle-newrelic-infrastructure",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization_over_pod_limit",
                        "PodName",
                        "nri-bundle-nri-kube-events",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization_over_pod_limit",
                        "PodName",
                        "cenit-deployment-backend",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization_over_pod_limit",
                        "PodName",
                        "nri-bundle-nri-prometheus",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization_over_pod_limit",
                        "PodName",
                        "kube-proxy",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization_over_pod_limit",
                        "PodName",
                        "coredns",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization_over_pod_limit",
                        "PodName",
                        "aws-cloudwatch-metrics",
                        "Namespace",
                        "amazon-cloudwatch",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization_over_pod_limit",
                        "PodName",
                        "nri-bundle-nri-metadata-injection",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization_over_pod_limit",
                        "PodName",
                        "aws-node",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization_over_pod_limit",
                        "PodName",
                        "aws-load-balancer-controller",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization_over_pod_limit",
                        "PodName",
                        "ebs-csi-controller",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization_over_pod_limit",
                        "PodName",
                        "ebs-csi-node",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization_over_pod_limit",
                        "PodName",
                        "external-dns",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization_over_pod_limit",
                        "PodName",
                        "redis-deployment",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization_over_pod_limit",
                        "PodName",
                        "external-secrets-kubernetes-external-secrets",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization_over_pod_limit",
                        "PodName",
                        "cluster-autoscaler-aws-cluster-autoscaler",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization_over_pod_limit",
                        "PodName",
                        "ebs-snapshot-controller-0",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization_over_pod_limit",
                        "PodName",
                        "metric-server-metrics-server",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_utilization_over_pod_limit",
                        "PodName",
                        "cenit-deployment-frontend",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ]
                ],
                "start": "-P0DT6H0M0S",
                "end": "P0D",
                "liveData": false,
                "period": 60,
                "view": "timeSeries",
                "stacked": false
            }
        },
        {
            "height": 6,
            "width": 6,
            "y": 57,
            "x": 12,
            "type": "metric",
            "properties": {
                "region": "us-east-1",
                "title": "Memory Utilization (Over Limit)",
                "legend": {
                    "position": "right"
                },
                "timezone": "Local",
                "metrics": [
                    [
                        "ContainerInsights",
                        "pod_memory_utilization_over_pod_limit",
                        "PodName",
                        "rabbitmq-deployment",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization_over_pod_limit",
                        "PodName",
                        "nri-bundle-newrelic-infrastructure",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization_over_pod_limit",
                        "PodName",
                        "nri-bundle-nri-kube-events",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization_over_pod_limit",
                        "PodName",
                        "cenit-deployment-backend",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization_over_pod_limit",
                        "PodName",
                        "nri-bundle-nri-prometheus",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization_over_pod_limit",
                        "PodName",
                        "kube-proxy",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization_over_pod_limit",
                        "PodName",
                        "coredns",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization_over_pod_limit",
                        "PodName",
                        "aws-cloudwatch-metrics",
                        "Namespace",
                        "amazon-cloudwatch",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization_over_pod_limit",
                        "PodName",
                        "nri-bundle-nri-metadata-injection",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization_over_pod_limit",
                        "PodName",
                        "aws-node",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization_over_pod_limit",
                        "PodName",
                        "aws-load-balancer-controller",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization_over_pod_limit",
                        "PodName",
                        "ebs-csi-controller",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization_over_pod_limit",
                        "PodName",
                        "ebs-csi-node",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization_over_pod_limit",
                        "PodName",
                        "external-dns",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization_over_pod_limit",
                        "PodName",
                        "redis-deployment",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization_over_pod_limit",
                        "PodName",
                        "external-secrets-kubernetes-external-secrets",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization_over_pod_limit",
                        "PodName",
                        "cluster-autoscaler-aws-cluster-autoscaler",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization_over_pod_limit",
                        "PodName",
                        "ebs-snapshot-controller-0",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization_over_pod_limit",
                        "PodName",
                        "metric-server-metrics-server",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_utilization_over_pod_limit",
                        "PodName",
                        "cenit-deployment-frontend",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ]
                ],
                "start": "-P0DT6H0M0S",
                "end": "P0D",
                "liveData": false,
                "period": 60,
                "view": "timeSeries",
                "stacked": false
            }
        },
        {
            "height": 6,
            "width": 6,
            "y": 51,
            "x": 18,
            "type": "metric",
            "properties": {
                "region": "us-east-1",
                "title": "Reserved CPU Compute Capacity",
                "legend": {
                    "position": "right"
                },
                "timezone": "Local",
                "metrics": [
                    [
                        "ContainerInsights",
                        "pod_cpu_reserved_capacity",
                        "PodName",
                        "ebs-snapshot-controller-0",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_reserved_capacity",
                        "PodName",
                        "metric-server-metrics-server",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_reserved_capacity",
                        "PodName",
                        "cenit-deployment-frontend",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_reserved_capacity",
                        "PodName",
                        "rabbitmq-deployment",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_reserved_capacity",
                        "PodName",
                        "nri-bundle-newrelic-infrastructure",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_reserved_capacity",
                        "PodName",
                        "nri-bundle-nri-kube-events",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_reserved_capacity",
                        "PodName",
                        "cenit-deployment-backend",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_reserved_capacity",
                        "PodName",
                        "nri-bundle-nri-prometheus",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_reserved_capacity",
                        "PodName",
                        "kube-proxy",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_reserved_capacity",
                        "PodName",
                        "coredns",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_reserved_capacity",
                        "PodName",
                        "aws-cloudwatch-metrics",
                        "Namespace",
                        "amazon-cloudwatch",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_reserved_capacity",
                        "PodName",
                        "aws-node",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_reserved_capacity",
                        "PodName",
                        "aws-load-balancer-controller",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_reserved_capacity",
                        "PodName",
                        "ebs-csi-controller",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_reserved_capacity",
                        "PodName",
                        "ebs-csi-node",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_reserved_capacity",
                        "PodName",
                        "external-dns",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_reserved_capacity",
                        "PodName",
                        "nri-bundle-nri-metadata-injection",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_reserved_capacity",
                        "PodName",
                        "redis-deployment",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_reserved_capacity",
                        "PodName",
                        "external-secrets-kubernetes-external-secrets",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_cpu_reserved_capacity",
                        "PodName",
                        "cluster-autoscaler-aws-cluster-autoscaler",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ]
                ],
                "start": "-P0DT6H0M0S",
                "end": "P0D",
                "liveData": false,
                "period": 60,
                "view": "timeSeries",
                "stacked": false
            }
        },
        {
            "height": 6,
            "width": 6,
            "y": 57,
            "x": 18,
            "type": "metric",
            "properties": {
                "region": "us-east-1",
                "title": "Reserved Memory Compute Capacity",
                "legend": {
                    "position": "right"
                },
                "timezone": "Local",
                "metrics": [
                    [
                        "ContainerInsights",
                        "pod_memory_reserved_capacity",
                        "PodName",
                        "rabbitmq-deployment",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_reserved_capacity",
                        "PodName",
                        "nri-bundle-newrelic-infrastructure",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_reserved_capacity",
                        "PodName",
                        "nri-bundle-nri-kube-events",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_reserved_capacity",
                        "PodName",
                        "cenit-deployment-backend",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_reserved_capacity",
                        "PodName",
                        "nri-bundle-nri-prometheus",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_reserved_capacity",
                        "PodName",
                        "kube-proxy",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_reserved_capacity",
                        "PodName",
                        "coredns",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_reserved_capacity",
                        "PodName",
                        "aws-cloudwatch-metrics",
                        "Namespace",
                        "amazon-cloudwatch",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_reserved_capacity",
                        "PodName",
                        "nri-bundle-nri-metadata-injection",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_reserved_capacity",
                        "PodName",
                        "aws-node",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_reserved_capacity",
                        "PodName",
                        "aws-load-balancer-controller",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_reserved_capacity",
                        "PodName",
                        "ebs-csi-controller",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_reserved_capacity",
                        "PodName",
                        "ebs-csi-node",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_reserved_capacity",
                        "PodName",
                        "external-dns",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_reserved_capacity",
                        "PodName",
                        "redis-deployment",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_reserved_capacity",
                        "PodName",
                        "external-secrets-kubernetes-external-secrets",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_reserved_capacity",
                        "PodName",
                        "cluster-autoscaler-aws-cluster-autoscaler",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_reserved_capacity",
                        "PodName",
                        "ebs-snapshot-controller-0",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_reserved_capacity",
                        "PodName",
                        "metric-server-metrics-server",
                        "Namespace",
                        "kube-system",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ],
                    [
                        "ContainerInsights",
                        "pod_memory_reserved_capacity",
                        "PodName",
                        "cenit-deployment-frontend",
                        "Namespace",
                        "default",
                        "ClusterName",
                        "${cluster_name}",
                        {
                            "stat": "Average"
                        }
                    ]
                ],
                "start": "-P0DT6H0M0S",
                "end": "P0D",
                "liveData": false,
                "period": 60,
                "view": "timeSeries",
                "stacked": false
            }
        }
    ]
}