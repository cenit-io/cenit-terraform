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
                        "metricName": "ActiveConnectionCount",
                        "resourceType": "AWS::EC2::NatGateway",
                        "stat": "Maximum"
                    },
                    {
                        "metricName": "PacketsDropCount",
                        "resourceType": "AWS::EC2::NatGateway",
                        "stat": "Sum"
                    },
                    {
                        "metricName": "BytesInFromDestination",
                        "resourceType": "AWS::EC2::NatGateway",
                        "stat": "Sum"
                    },
                    {
                        "metricName": "BytesInFromSource",
                        "resourceType": "AWS::EC2::NatGateway",
                        "stat": "Sum"
                    },
                    {
                        "metricName": "BytesOutToDestination",
                        "resourceType": "AWS::EC2::NatGateway",
                        "stat": "Sum"
                    },
                    {
                        "metricName": "BytesOutToSource",
                        "resourceType": "AWS::EC2::NatGateway",
                        "stat": "Sum"
                    },
                    {
                        "metricName": "ConnectionAttemptCount",
                        "resourceType": "AWS::EC2::NatGateway",
                        "stat": "Sum"
                    },
                    {
                        "metricName": "ConnectionEstablishedCount",
                        "resourceType": "AWS::EC2::NatGateway",
                        "stat": "Sum"
                    },
                    {
                        "metricName": "ErrorPortAllocation",
                        "resourceType": "AWS::EC2::NatGateway",
                        "stat": "Sum"
                    },
                    {
                        "metricName": "IdleTimeoutCount",
                        "resourceType": "AWS::EC2::NatGateway",
                        "stat": "Sum"
                    },
                    {
                        "metricName": "PacketsInFromDestination",
                        "resourceType": "AWS::EC2::NatGateway",
                        "stat": "Sum"
                    },
                    {
                        "metricName": "PacketsInFromSource",
                        "resourceType": "AWS::EC2::NatGateway",
                        "stat": "Sum"
                    },
                    {
                        "metricName": "PacketsOutToDestination",
                        "resourceType": "AWS::EC2::NatGateway",
                        "stat": "Sum"
                    },
                    {
                        "metricName": "PacketsOutToSource",
                        "resourceType": "AWS::EC2::NatGateway",
                        "stat": "Sum"
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
                "splitBy": "",
                "region": "us-east-1",
                "title": "NAT Gateway Explorer"
            }
        }
    ]
}