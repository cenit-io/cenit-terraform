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
                        "metricName": "Invocations",
                        "resourceType": "AWS::Lambda::Function",
                        "stat": "Sum"
                    },
                    {
                        "metricName": "Duration",
                        "resourceType": "AWS::Lambda::Function",
                        "stat": "Average"
                    },
                    {
                        "metricName": "Errors",
                        "resourceType": "AWS::Lambda::Function",
                        "stat": "Sum"
                    },
                    {
                        "metricName": "Throttles",
                        "resourceType": "AWS::Lambda::Function",
                        "stat": "Sum"
                    }
                ],
                "labels": [
                    {
                        "key": "FunctionName"
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
                "splitBy": "FunctionName",
                "region": "us-east-1"
            }
        }
    ]
}