# CLOUD AZURE AZURE-SEARCH DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-azure-azure-search" {
  source      = "claranet/monitors/datadog//cloud/azure/azure-search"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Azure Search latency too high
- Azure Search throttled queries rate is too high

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                                      | Description                                                                                                                                         | Type           | Default     | Required |
| ----------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------- | -------------- | ----------- | :------: |
| azure_search_latency_no_data_timeframe    | Number of minutes before reporting no data                                                                                                          | `string`       | `10`        |    no    |
| environment                               | Architecture environment                                                                                                                            | `string`       | n/a         |   yes    |
| evaluation_delay                          | Delay in seconds for the metric evaluation                                                                                                          | `number`       | `900`       |    no    |
| filter_tags_custom                        | Tags used for custom filtering when filter_tags_use_defaults is false                                                                               | `string`       | `"*"`       |    no    |
| filter_tags_custom_excluded               | Tags excluded for custom filtering when filter_tags_use_defaults is false                                                                           | `string`       | `""`        |    no    |
| filter_tags_use_defaults                  | Use default filter tags convention                                                                                                                  | `string`       | `"true"`    |    no    |
| latency_enabled                           | Flag to enable Azure Search latency monitor                                                                                                         | `string`       | `"true"`    |    no    |
| latency_extra_tags                        | Extra tags for Azure Search latency monitor                                                                                                         | `list(string)` | `[]`        |    no    |
| latency_message                           | Custom message for Azure Search latency monitor                                                                                                     | `string`       | `""`        |    no    |
| latency_threshold_critical                | Alerting threshold for Azure Search latency in seconds                                                                                              | `number`       | `4`         |    no    |
| latency_threshold_warning                 | Warning threshold for Azure Search latency in seconds                                                                                               | `number`       | `2`         |    no    |
| latency_time_aggregator                   | Monitor aggregator for Azure Search latency [available values: min, max or avg]                                                                     | `string`       | `"min"`     |    no    |
| latency_timeframe                         | Monitor timeframe for Azure Search latency [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]                | `string`       | `"last_5m"` |    no    |
| message                                   | Message sent when a monitor is triggered                                                                                                            | `any`          | n/a         |   yes    |
| new_host_delay                            | Delay in seconds before monitor new resource                                                                                                        | `number`       | `300`       |    no    |
| notify_no_data                            | Will raise no data alert if set to true                                                                                                             | `bool`         | `true`      |    no    |
| prefix_slug                               | Prefix string to prepend between brackets on every monitors names                                                                                   | `string`       | `""`        |    no    |
| throttled_queries_rate_enabled            | Flag to enable Azure Search throttled queries rate monitor                                                                                          | `string`       | `"true"`    |    no    |
| throttled_queries_rate_extra_tags         | Extra tags for Azure Search throttled queries rate monitor                                                                                          | `list(string)` | `[]`        |    no    |
| throttled_queries_rate_message            | Custom message for Azure Search throttled queries rate monitor                                                                                      | `string`       | `""`        |    no    |
| throttled_queries_rate_threshold_critical | Alerting threshold for Azure Search throttled queries rate                                                                                          | `number`       | `50`        |    no    |
| throttled_queries_rate_threshold_warning  | Warning threshold for Azure Search throttled queries rate                                                                                           | `number`       | `25`        |    no    |
| throttled_queries_rate_time_aggregator    | Monitor aggregator for Azure Search throttled queries rate [available values: min, max or avg]                                                      | `string`       | `"min"`     |    no    |
| throttled_queries_rate_timeframe          | Monitor timeframe for Azure Search throttled queries rate [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string`       | `"last_5m"` |    no    |

## Outputs

| Name                                   | Description                                        |
| -------------------------------------- | -------------------------------------------------- |
| azure_search_latency_id                | id for monitor azure_search_latency                |
| azure_search_throttled_queries_rate_id | id for monitor azure_search_throttled_queries_rate |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/azure_app_services](https://docs.datadoghq.com/integrations/azure_app_services)

Azure Documentation [https://docs.microsoft.com/en-us/azure/search/search-monitor-usage](https://docs.microsoft.com/en-us/azure/search/search-monitor-usage)

Azure monitor metrics [https://docs.microsoft.com/en-us/azure/azure-monitor/platform/metrics-supported#microsoftsearchsearchservices](https://docs.microsoft.com/en-us/azure/azure-monitor/platform/metrics-supported#microsoftsearchsearchservices)
