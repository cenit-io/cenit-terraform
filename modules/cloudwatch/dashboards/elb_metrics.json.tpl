{
    "widgets": [
        {
            "type": "explorer",
            "x": 0,
            "y": 0,
            "width": 24,
            "height": 15,
            "properties": {
                "metrics": [
                    {
                        "metricName": "RequestCount",
                        "resourceType": "AWS::ElasticLoadBalancingV2::LoadBalancer/ApplicationELB",
                        "stat": "Sum"
                    },
                    {
                        "metricName": "HTTPCode_ELB_5XX_Count",
                        "resourceType": "AWS::ElasticLoadBalancingV2::LoadBalancer/ApplicationELB",
                        "stat": "Sum"
                    },
                    {
                        "metricName": "ActiveConnectionCount",
                        "resourceType": "AWS::ElasticLoadBalancingV2::LoadBalancer/ApplicationELB",
                        "stat": "Sum"
                    },
                    {
                        "metricName": "ClientTLSNegotiationErrorCount",
                        "resourceType": "AWS::ElasticLoadBalancingV2::LoadBalancer/ApplicationELB",
                        "stat": "Sum"
                    },
                    {
                        "metricName": "ConsumedLCUs",
                        "resourceType": "AWS::ElasticLoadBalancingV2::LoadBalancer/ApplicationELB",
                        "stat": "Average"
                    },
                    {
                        "metricName": "HTTP_Fixed_Response_Count",
                        "resourceType": "AWS::ElasticLoadBalancingV2::LoadBalancer/ApplicationELB",
                        "stat": "Sum"
                    },
                    {
                        "metricName": "HTTP_Redirect_Count",
                        "resourceType": "AWS::ElasticLoadBalancingV2::LoadBalancer/ApplicationELB",
                        "stat": "Sum"
                    },
                    {
                        "metricName": "HTTP_Redirect_Url_Limit_Exceeded_Count",
                        "resourceType": "AWS::ElasticLoadBalancingV2::LoadBalancer/ApplicationELB",
                        "stat": "Sum"
                    },
                    {
                        "metricName": "HTTPCode_ELB_3XX_Count",
                        "resourceType": "AWS::ElasticLoadBalancingV2::LoadBalancer/ApplicationELB",
                        "stat": "Sum"
                    },
                    {
                        "metricName": "HTTPCode_ELB_4XX_Count",
                        "resourceType": "AWS::ElasticLoadBalancingV2::LoadBalancer/ApplicationELB",
                        "stat": "Sum"
                    },
                    {
                        "metricName": "IPv6ProcessedBytes",
                        "resourceType": "AWS::ElasticLoadBalancingV2::LoadBalancer/ApplicationELB",
                        "stat": "Sum"
                    },
                    {
                        "metricName": "IPv6RequestCount",
                        "resourceType": "AWS::ElasticLoadBalancingV2::LoadBalancer/ApplicationELB",
                        "stat": "Sum"
                    },
                    {
                        "metricName": "NewConnectionCount",
                        "resourceType": "AWS::ElasticLoadBalancingV2::LoadBalancer/ApplicationELB",
                        "stat": "Sum"
                    },
                    {
                        "metricName": "ProcessedBytes",
                        "resourceType": "AWS::ElasticLoadBalancingV2::LoadBalancer/ApplicationELB",
                        "stat": "Sum"
                    },
                    {
                        "metricName": "RejectedConnectionCount",
                        "resourceType": "AWS::ElasticLoadBalancingV2::LoadBalancer/ApplicationELB",
                        "stat": "Sum"
                    },
                    {
                        "metricName": "RuleEvaluations",
                        "resourceType": "AWS::ElasticLoadBalancingV2::LoadBalancer/ApplicationELB",
                        "stat": "Sum"
                    }
                ],
                "aggregateBy": {
                    "key": "elbv2.k8s.aws/cluster",
                    "func": "AVG"
                },
                "labels": [
                    {
                        "key": "elbv2.k8s.aws/cluster",
                        "value": "${cluster_name}"
                    }
                ],
                "widgetOptions": {
                    "legend": {
                        "position": "bottom"
                    },
                    "view": "timeSeries",
                    "stacked": false,
                    "rowsPerPage": 50,
                    "widgetsPerRow": 2
                },
                "period": 300,
                "splitBy": "#",
                "region": "us-east-1",
                "title": "ELB_Metrics"
            }
        }
    ]
}