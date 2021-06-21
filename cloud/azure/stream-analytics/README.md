# CLOUD AZURE STREAM-ANALYTICS DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-azure-stream-analytics" {
  source      = "claranet/monitors/datadog//cloud/azure/stream-analytics"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Stream Analytics is down
- Stream Analytics streaming units utilization too high
- Stream Analytics too many conversion errors
- Stream Analytics too many failed requests
- Stream Analytics too many runtime errors

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                                        | Description                                                                                                                                        | Type           | Default     | Required |
| ------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------- | -------------- | ----------- | :------: |
| conversion_errors_enabled                   | Flag to enable Stream Analytics conversion errors monitor                                                                                          | `string`       | `"true"`    |    no    |
| conversion_errors_extra_tags                | Extra tags for Stream Analytics conversion errors monitor                                                                                          | `list(string)` | `[]`        |    no    |
| conversion_errors_message                   | Custom message for Stream Analytics conversion errors monitor                                                                                      | `string`       | `""`        |    no    |
| conversion_errors_threshold_critical        | Conversion errors limit (critical threshold)                                                                                                       | `number`       | `10`        |    no    |
| conversion_errors_threshold_warning         | Conversion errors limit (warning threshold)                                                                                                        | `number`       | `0`         |    no    |
| conversion_errors_time_aggregator           | Monitor aggregator for Stream Analytics conversion errors [available values: min, max or avg]                                                      | `string`       | `"min"`     |    no    |
| conversion_errors_timeframe                 | Monitor timeframe for Stream Analytics conversion errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string`       | `"last_5m"` |    no    |
| environment                                 | Architecture environment                                                                                                                           | `string`       | n/a         |   yes    |
| evaluation_delay                            | Delay in seconds for the metric evaluation                                                                                                         | `number`       | `900`       |    no    |
| failed_function_requests_enabled            | Flag to enable Stream Analytics failed requests monitor                                                                                            | `string`       | `"true"`    |    no    |
| failed_function_requests_extra_tags         | Extra tags for Stream Analytics failed requests monitor                                                                                            | `list(string)` | `[]`        |    no    |
| failed_function_requests_message            | Custom message for Stream Analytics failed requests monitor                                                                                        | `string`       | `""`        |    no    |
| failed_function_requests_threshold_critical | Failed Function Request rate limit (critical threshold)                                                                                            | `number`       | `10`        |    no    |
| failed_function_requests_threshold_warning  | Failed Function Request rate limit (warning threshold)                                                                                             | `number`       | `0`         |    no    |
| failed_function_requests_time_aggregator    | Monitor aggregator for Stream Analytics failed requests [available values: min, max or avg]                                                        | `string`       | `"min"`     |    no    |
| failed_function_requests_timeframe          | Monitor timeframe for Stream Analytics failed requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]   | `string`       | `"last_5m"` |    no    |
| filter_tags_custom                          | Tags used for custom filtering when filter_tags_use_defaults is false                                                                              | `string`       | `"*"`       |    no    |
| filter_tags_custom_excluded                 | Tags excluded for custom filtering when filter_tags_use_defaults is false                                                                          | `string`       | `""`        |    no    |
| filter_tags_use_defaults                    | Use default filter tags convention                                                                                                                 | `string`       | `"true"`    |    no    |
| message                                     | Message sent when a Redis monitor is triggered                                                                                                     | `any`          | n/a         |   yes    |
| new_host_delay                              | Delay in seconds before monitor new resource                                                                                                       | `number`       | `300`       |    no    |
| notify_no_data                              | Will raise no data alert if set to true                                                                                                            | `bool`         | `true`      |    no    |
| prefix_slug                                 | Prefix string to prepend between brackets on every monitors names                                                                                  | `string`       | `""`        |    no    |
| runtime_errors_enabled                      | Flag to enable Stream Analytics runtime errors monitor                                                                                             | `string`       | `"true"`    |    no    |
| runtime_errors_extra_tags                   | Extra tags for Stream Analytics runtime errors monitor                                                                                             | `list(string)` | `[]`        |    no    |
| runtime_errors_message                      | Custom message for Stream Analytics runtime errors monitor                                                                                         | `string`       | `""`        |    no    |
| runtime_errors_threshold_critical           | Runtime errors limit (critical threshold)                                                                                                          | `number`       | `10`        |    no    |
| runtime_errors_threshold_warning            | Runtime errors limit (warning threshold)                                                                                                           | `number`       | `0`         |    no    |
| runtime_errors_time_aggregator              | Monitor aggregator for Stream Analytics runtime errors [available values: min, max or avg]                                                         | `string`       | `"min"`     |    no    |
| runtime_errors_timeframe                    | Monitor timeframe for Stream Analytics runtime errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]    | `string`       | `"last_5m"` |    no    |
| status_enabled                              | Flag to enable Stream Analytics status monitor                                                                                                     | `string`       | `"true"`    |    no    |
| status_extra_tags                           | Extra tags for Stream Analytics status monitor                                                                                                     | `list(string)` | `[]`        |    no    |
| status_message                              | Custom message for Stream Analytics status monitor                                                                                                 | `string`       | `""`        |    no    |
| status_no_data_timeframe                    | Number of minutes before reporting no data                                                                                                         | `string`       | `10`        |    no    |
| status_time_aggregator                      | Monitor aggregator for Stream Analytics status [available values: min, max or avg]                                                                 | `string`       | `"max"`     |    no    |
| status_timeframe                            | Monitor timeframe for Stream Analytics status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]            | `string`       | `"last_5m"` |    no    |
| su_utilization_enabled                      | Flag to enable Stream Analytics utilization monitor                                                                                                | `string`       | `"true"`    |    no    |
| su_utilization_extra_tags                   | Extra tags for Stream Analytics utilization monitor                                                                                                | `list(string)` | `[]`        |    no    |
| su_utilization_message                      | Custom message for Stream Analytics utilization monitor                                                                                            | `string`       | `""`        |    no    |
| su_utilization_threshold_critical           | Streaming Unit utilization rate limit (critical threshold)                                                                                         | `number`       | `95`        |    no    |
| su_utilization_threshold_warning            | Streaming Unit utilization rate limit (warning threshold)                                                                                          | `number`       | `80`        |    no    |
| su_utilization_time_aggregator              | Monitor aggregator for Stream Analytics utilization [available values: min, max or avg]                                                            | `string`       | `"min"`     |    no    |
| su_utilization_timeframe                    | Monitor timeframe for Stream Analytics utilization [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]       | `string`       | `"last_5m"` |    no    |

## Outputs

| Name                        | Description                             |
| --------------------------- | --------------------------------------- |
| conversion_errors_id        | id for monitor conversion_errors        |
| failed_function_requests_id | id for monitor failed_function_requests |
| runtime_errors_id           | id for monitor runtime_errors           |
| status_id                   | id for monitor status                   |
| su_utilization_id           | id for monitor su_utilization           |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/azure/](https://docs.datadoghq.com/integrations/azure/)
