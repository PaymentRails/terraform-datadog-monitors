# CLOUD AWS APIGATEWAY DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-aws-apigateway" {
  source      = "claranet/monitors/datadog//cloud/aws/apigateway"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- API Gateway HTTP 4xx errors
- API Gateway HTTP 5xx errors
- API Gateway latency

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                                 | Description                                                                                                                           | Type           | Default     | Required |
| ------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------- | -------------- | ----------- | :------: |
| artificial_requests_count            | Number of false requests used to mitigate false positive in case of low trafic                                                        | `number`       | `5`         |    no    |
| environment                          | Environment                                                                                                                           | `string`       | n/a         |   yes    |
| evaluation_delay                     | Delay in seconds for the metric evaluation                                                                                            | `number`       | `900`       |    no    |
| filter_tags                          | Tags used for filtering                                                                                                               | `string`       | `"*"`       |    no    |
| http_4xx_requests_enabled            | Flag to enable API Gateway HTTP 4xx requests monitor                                                                                  | `string`       | `"true"`    |    no    |
| http_4xx_requests_extra_tags         | Extra tags for API Gateway HTTP 4xx requests monitor                                                                                  | `list(string)` | `[]`        |    no    |
| http_4xx_requests_message            | Custom message for API Gateway HTTP 4xx requests monitor                                                                              | `string`       | `""`        |    no    |
| http_4xx_requests_threshold_critical | Maximum critical acceptable percent of 4xx errors                                                                                     | `number`       | `30`        |    no    |
| http_4xx_requests_threshold_warning  | Maximum warning acceptable percent of 4xx errors                                                                                      | `number`       | `15`        |    no    |
| http_4xx_requests_time_aggregator    | Monitor aggregator for API HTTP 4xx requests [available values: min, max or avg]                                                      | `string`       | `"min"`     |    no    |
| http_4xx_requests_timeframe          | Monitor timeframe for API HTTP 4xx requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string`       | `"last_5m"` |    no    |
| http_5xx_requests_enabled            | Flag to enable API Gateway HTTP 5xx requests monitor                                                                                  | `string`       | `"true"`    |    no    |
| http_5xx_requests_extra_tags         | Extra tags for API Gateway HTTP 5xx requests monitor                                                                                  | `list(string)` | `[]`        |    no    |
| http_5xx_requests_message            | Custom message for API Gateway HTTP 5xx requests monitor                                                                              | `string`       | `""`        |    no    |
| http_5xx_requests_threshold_critical | Maximum critical acceptable percent of 5xx errors                                                                                     | `number`       | `20`        |    no    |
| http_5xx_requests_threshold_warning  | Maximum warning acceptable percent of 5xx errors                                                                                      | `number`       | `10`        |    no    |
| http_5xx_requests_time_aggregator    | Monitor aggregator for API HTTP 5xx requests [available values: min, max or avg]                                                      | `string`       | `"min"`     |    no    |
| http_5xx_requests_timeframe          | Monitor timeframe for API HTTP 5xx requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string`       | `"last_5m"` |    no    |
| latency_enabled                      | Flag to enable API Gateway latency monitor                                                                                            | `string`       | `"true"`    |    no    |
| latency_extra_tags                   | Extra tags for API Gateway latency monitor                                                                                            | `list(string)` | `[]`        |    no    |
| latency_message                      | Custom message for API Gateway latency monitor                                                                                        | `string`       | `""`        |    no    |
| latency_threshold_critical           | Alerting threshold in milliseconds                                                                                                    | `number`       | `3000`      |    no    |
| latency_threshold_warning            | Warning threshold in milliseconds                                                                                                     | `number`       | `1000`      |    no    |
| latency_time_aggregator              | Monitor aggregator for API Gateway latency [available values: min, max or avg]                                                        | `string`       | `"min"`     |    no    |
| latency_timeframe                    | Monitor timeframe for API latency [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]           | `string`       | `"last_5m"` |    no    |
| message                              | Message sent when a monitor is triggered                                                                                              | `any`          | n/a         |   yes    |
| new_host_delay                       | Delay in seconds before monitor new resource                                                                                          | `number`       | `300`       |    no    |
| notify_no_data                       | Will raise no data alert if set to true                                                                                               | `bool`         | `true`      |    no    |
| prefix_slug                          | Prefix string to prepend between brackets on every monitors names                                                                     | `string`       | `""`        |    no    |

## Outputs

| Name                         | Description                              |
| ---------------------------- | ---------------------------------------- |
| API_Gateway_latency_id       | id for monitor API_Gateway_latency       |
| API_http_4xx_errors_count_id | id for monitor API_http_4xx_errors_count |
| API_http_5xx_errors_count_id | id for monitor API_http_5xx_errors_count |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/amazon_api_gateway/](https://docs.datadoghq.com/integrations/amazon_api_gateway/)

AWS API Gateway metrics documentation: [https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/api-gateway-metrics-dimensions.html](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/api-gateway-metrics-dimensions.html)
