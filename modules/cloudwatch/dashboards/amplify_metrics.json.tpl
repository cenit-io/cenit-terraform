{
    "widgets": [
        {
            "type": "metric",
            "x": 0,
            "y": 0,
            "width": 12,
            "height": 6,
            "properties": {
                "metrics": [
                    [
                        "AWS/AmplifyHosting",
                        "Requests",
                        "App",
                        "${amplify_app_id}"
                    ]
                ],
                "period": 60,
                "region": "us-east-1",
                "stat": "Sum",
                "title": "Requests (sum)",
                "yAxis": {
                    "left": {
                        "min": 0
                    },
                    "showUnits": false
                }
            }
        },
        {
            "type": "metric",
            "x": 12,
            "y": 0,
            "width": 12,
            "height": 6,
            "properties": {
                "metrics": [
                    [
                        "AWS/AmplifyHosting",
                        "BytesDownloaded",
                        "App",
                        "${amplify_app_id}"
                    ],
                    [
                        ".",
                        "BytesUploaded",
                        ".",
                        "."
                    ]
                ],
                "period": 60,
                "region": "us-east-1",
                "stat": "Sum",
                "title": "Data transfer (sum)",
                "yAxis": {
                    "left": {
                        "min": 0
                    },
                    "showUnits": true
                }
            }
        },
        {
            "type": "metric",
            "x": 0,
            "y": 6,
            "width": 12,
            "height": 6,
            "properties": {
                "metrics": [
                    [
                        "AWS/AmplifyHosting",
                        "4xxErrors",
                        "App",
                        "${amplify_app_id}"
                    ]
                ],
                "period": 60,
                "region": "us-east-1",
                "stat": "Sum",
                "title": "4xx errors (sum)",
                "yAxis": {
                    "left": {
                        "min": 0
                    },
                    "showUnits": false
                }
            }
        },
        {
            "type": "metric",
            "x": 12,
            "y": 6,
            "width": 12,
            "height": 6,
            "properties": {
                "metrics": [
                    [
                        "AWS/AmplifyHosting",
                        "5xxErrors",
                        "App",
                        "${amplify_app_id}"
                    ]
                ],
                "period": 60,
                "region": "us-east-1",
                "stat": "Sum",
                "title": "5xx errors (sum)",
                "yAxis": {
                    "left": {
                        "min": 0
                    },
                    "showUnits": false
                }
            }
        },
        {
            "type": "metric",
            "x": 0,
            "y": 12,
            "width": 12,
            "height": 6,
            "properties": {
                "metrics": [
                    [
                        "AWS/AmplifyHosting",
                        "Latency",
                        "App",
                        "${amplify_app_id}"
                    ]
                ],
                "period": 60,
                "region": "us-east-1",
                "stat": "Average",
                "title": "Time to first byte (average)",
                "yAxis": {
                    "left": {
                        "min": 0
                    },
                    "showUnits": true
                }
            }
        }
    ]
}