# CLOUD AZURE EVENTHUB DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-azure-eventhub" {
  source      = "claranet/monitors/datadog//cloud/azure/eventhub"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Event Hub is down
- Event Hub too many errors
- Event Hub too many failed requests

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                                   | Description                                                                                                                               | Type           | Default     | Required |
| -------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- | -------------- | ----------- | :------: |
| environment                            | Architecture environment                                                                                                                  | `string`       | n/a         |   yes    |
| errors_rate_enabled                    | Flag to enable Event Hub errors monitor                                                                                                   | `string`       | `"true"`    |    no    |
| errors_rate_extra_tags                 | Extra tags for Event Hub errors monitor                                                                                                   | `list(string)` | `[]`        |    no    |
| errors_rate_message                    | Custom message for Event Hub errors monitor                                                                                               | `string`       | `""`        |    no    |
| errors_rate_thresold_critical          | Errors ratio (percentage) to trigger the critical alert                                                                                   | `number`       | `90`        |    no    |
| errors_rate_thresold_warning           | Errors ratio (percentage) to trigger a warning alert                                                                                      | `number`       | `50`        |    no    |
| errors_rate_time_aggregator            | Monitor aggregator for Event Hub errors [available values: min, max or avg]                                                               | `string`       | `"min"`     |    no    |
| errors_rate_timeframe                  | Monitor timeframe for Event Hub errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]          | `string`       | `"last_5m"` |    no    |
| evaluation_delay                       | Delay in seconds for the metric evaluation                                                                                                | `number`       | `900`       |    no    |
| eventhub_status_no_data_timeframe      | Number of minutes before reporting no data                                                                                                | `string`       | `10`        |    no    |
| failed_requests_rate_enabled           | Flag to enable Event Hub failed requests monitor                                                                                          | `string`       | `"true"`    |    no    |
| failed_requests_rate_extra_tags        | Extra tags for Event Hub failed requests monitor                                                                                          | `list(string)` | `[]`        |    no    |
| failed_requests_rate_message           | Custom message for Event Hub failed requests monitor                                                                                      | `string`       | `""`        |    no    |
| failed_requests_rate_thresold_critical | Failed requests ratio (percentage) to trigger the critical alert                                                                          | `number`       | `90`        |    no    |
| failed_requests_rate_thresold_warning  | Failed requests ratio (percentage) to trigger a warning alert                                                                             | `number`       | `50`        |    no    |
| failed_requests_rate_time_aggregator   | Monitor aggregator for Event Hub failed requests [available values: min, max or avg]                                                      | `string`       | `"min"`     |    no    |
| failed_requests_rate_timeframe         | Monitor timeframe for Event Hub failed requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string`       | `"last_5m"` |    no    |
| filter_tags_custom                     | Tags used for custom filtering when filter_tags_use_defaults is false                                                                     | `string`       | `"*"`       |    no    |
| filter_tags_custom_excluded            | Tags excluded for custom filtering when filter_tags_use_defaults is false                                                                 | `string`       | `""`        |    no    |
| filter_tags_use_defaults               | Use default filter tags convention                                                                                                        | `string`       | `"true"`    |    no    |
| message                                | Message sent when an alert is triggered                                                                                                   | `any`          | n/a         |   yes    |
| new_host_delay                         | Delay in seconds before monitor new resource                                                                                              | `number`       | `300`       |    no    |
| notify_no_data                         | Will raise no data alert if set to true                                                                                                   | `bool`         | `true`      |    no    |
| prefix_slug                            | Prefix string to prepend between brackets on every monitors names                                                                         | `string`       | `""`        |    no    |
| status_enabled                         | Flag to enable Event Hub status monitor                                                                                                   | `string`       | `"true"`    |    no    |
| status_extra_tags                      | Extra tags for Event Hub status monitor                                                                                                   | `list(string)` | `[]`        |    no    |
| status_message                         | Custom message for Event Hub status monitor                                                                                               | `string`       | `""`        |    no    |
| status_time_aggregator                 | Monitor aggregator for Event Hub status [available values: min, max or avg]                                                               | `string`       | `"max"`     |    no    |
| status_timeframe                       | Monitor timeframe for Event Hub status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]          | `string`       | `"last_5m"` |    no    |

## Outputs

| Name                        | Description                             |
| --------------------------- | --------------------------------------- |
| eventhub_errors_id          | id for monitor eventhub_errors          |
| eventhub_failed_requests_id | id for monitor eventhub_failed_requests |
| eventhub_status_id          | id for monitor eventhub_status          |

## Related documentation

Datadog documentation : [https://docs.datadoghq.com/integrations/azure_event_hub/](https://docs.datadoghq.com/integrations/azure_event_hub/)

Azure metrics documentation : [https://docs.microsoft.com/en-us/azure/event-hubs/event-hubs-metrics-azure-monitor](https://docs.microsoft.com/en-us/azure/event-hubs/event-hubs-metrics-azure-monitor)
