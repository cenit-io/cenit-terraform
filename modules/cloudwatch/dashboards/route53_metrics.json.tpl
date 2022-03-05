{
    "widgets": [
        {
            "height": 15,
            "width": 24,
            "y": 0,
            "x": 0,
            "type": "explorer",
            "properties": {
                "metrics": [
                    {
                        "metricName": "HealthCheckPercentageHealthy",
                        "resourceType": "AWS::Route53::HealthCheck",
                        "stat": "Average"
                    },
                    {
                        "metricName": "ConnectionTime",
                        "resourceType": "AWS::Route53::HealthCheck",
                        "stat": "Average"
                    },
                    {
                        "metricName": "HealthCheckStatus",
                        "resourceType": "AWS::Route53::HealthCheck",
                        "stat": "Minimum"
                    },
                    {
                        "metricName": "SSLHandshakeTime",
                        "resourceType": "AWS::Route53::HealthCheck",
                        "stat": "Average"
                    },
                    {
                        "metricName": "ChildHealthCheckHealthyCount",
                        "resourceType": "AWS::Route53::HealthCheck",
                        "stat": "Average"
                    },
                    {
                        "metricName": "TimeToFirstByte",
                        "resourceType": "AWS::Route53::HealthCheck",
                        "stat": "Average"
                    }
                ],
                "labels": [
                    {
                        "key": "Name"
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
                "splitBy": "Name",
                "region": "us-east-1"
            }
        }
    ]
}