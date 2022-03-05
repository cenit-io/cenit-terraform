{
    "widgets": [
        {
            "type": "metric",
            "x": 0,
            "y": 0,
            "width": 6,
            "height": 6,
            "properties": {
                "metrics": [
                    [
                        "AWS/TransitGateway",
                        "PacketsOut",
                        "TransitGatewayAttachment",
                        "${tgw-attachment-id}",
                        "TransitGateway",
                        "${tgw-id}",
                        {
                            "label": "$${PROP('Dim.TransitGatewayAttachment')}"
                        }
                    ]
                ],
                "view": "timeSeries",
                "stacked": false,
                "region": "us-east-1",
                "stat": "Average",
                "period": 300,
                "title": "TGW - PacketsOut"
            }
        },
        {
            "type": "metric",
            "x": 6,
            "y": 0,
            "width": 6,
            "height": 6,
            "properties": {
                "metrics": [
                    [
                        "AWS/TransitGateway",
                        "BytesOut",
                        "TransitGatewayAttachment",
                        "${tgw-attachment-id}",
                        "TransitGateway",
                        "${tgw-id}",
                        {
                            "label": "$${PROP('Dim.TransitGatewayAttachment')}"
                        }
                    ]
                ],
                "view": "timeSeries",
                "stacked": false,
                "region": "us-east-1",
                "stat": "Average",
                "period": 300,
                "title": "TGW - BytesOut"
            }
        },
        {
            "type": "metric",
            "x": 12,
            "y": 0,
            "width": 6,
            "height": 6,
            "properties": {
                "metrics": [
                    [
                        "AWS/TransitGateway",
                        "PacketsIn",
                        "TransitGatewayAttachment",
                        "${tgw-attachment-id}",
                        "TransitGateway",
                        "${tgw-id}",
                        {
                            "label": "$${PROP('Dim.TransitGatewayAttachment')}"
                        }
                    ]
                ],
                "view": "timeSeries",
                "stacked": false,
                "region": "us-east-1",
                "stat": "Average",
                "period": 300,
                "title": "TGW - PacketsIn"
            }
        },
        {
            "type": "metric",
            "x": 18,
            "y": 0,
            "width": 6,
            "height": 6,
            "properties": {
                "metrics": [
                    [
                        "AWS/TransitGateway",
                        "BytesIn",
                        "TransitGatewayAttachment",
                        "${tgw-attachment-id}",
                        "TransitGateway",
                        "${tgw-id}",
                        {
                            "label": "$${PROP('Dim.TransitGatewayAttachment')}"
                        }
                    ]
                ],
                "view": "timeSeries",
                "stacked": false,
                "region": "us-east-1",
                "stat": "Average",
                "period": 300,
                "title": "TGW - BytesIn"
            }
        },
        {
            "type": "metric",
            "x": 0,
            "y": 6,
            "width": 6,
            "height": 6,
            "properties": {
                "metrics": [
                    [
                        "AWS/TransitGateway",
                        "PacketDropCountNoRoute",
                        "TransitGatewayAttachment",
                        "${tgw-attachment-id}",
                        "TransitGateway",
                        "${tgw-id}",
                        {
                            "label": "$${PROP('Dim.TransitGatewayAttachment')}"
                        }
                    ]
                ],
                "view": "timeSeries",
                "stacked": false,
                "region": "us-east-1",
                "stat": "Average",
                "period": 300,
                "title": "TGW - PacketDropCountNoRoute"
            }
        },
        {
            "type": "metric",
            "x": 6,
            "y": 6,
            "width": 6,
            "height": 6,
            "properties": {
                "metrics": [
                    [
                        "AWS/TransitGateway",
                        "BytesDropCountNoRoute",
                        "TransitGatewayAttachment",
                        "${tgw-attachment-id}",
                        "TransitGateway",
                        "${tgw-id}",
                        {
                            "label": "$${PROP('Dim.TransitGatewayAttachment')}"
                        }
                    ]
                ],
                "view": "timeSeries",
                "stacked": false,
                "region": "us-east-1",
                "stat": "Average",
                "period": 300,
                "title": "TGW - BytesDropCountNoRoute"
            }
        },
        {
            "type": "metric",
            "x": 12,
            "y": 6,
            "width": 6,
            "height": 6,
            "properties": {
                "metrics": [
                    [
                        "AWS/TransitGateway",
                        "PacketDropCountBlackhole",
                        "TransitGatewayAttachment",
                        "${tgw-attachment-id}",
                        "TransitGateway",
                        "${tgw-id}",
                        {
                            "label": "$${PROP('Dim.TransitGatewayAttachment')}"
                        }
                    ]
                ],
                "view": "timeSeries",
                "stacked": false,
                "region": "us-east-1",
                "stat": "Average",
                "period": 300,
                "title": "TGW - PacketDropCountBlackhole"
            }
        },
        {
            "type": "metric",
            "x": 18,
            "y": 6,
            "width": 6,
            "height": 6,
            "properties": {
                "metrics": [
                    [
                        "AWS/TransitGateway",
                        "BytesDropCountBlackhole",
                        "TransitGatewayAttachment",
                        "${tgw-attachment-id}",
                        "TransitGateway",
                        "${tgw-id}",
                        {
                            "label": "$${PROP('Dim.TransitGatewayAttachment')}"
                        }
                    ]
                ],
                "view": "timeSeries",
                "stacked": false,
                "region": "us-east-1",
                "stat": "Average",
                "period": 300,
                "title": "TGW - BytesDropCountBlackhole"
            }
        }
    ]
}