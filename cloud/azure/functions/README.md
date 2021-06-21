# CLOUD AZURE FUNCTIONS DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-azure-functions" {
  source      = "claranet/monitors/datadog//cloud/azure/functions"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Function App connections count too high
- Function App HTTP 5xx errors too high
- Function App threads count too high

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                                      | Description                                                                                                                                      | Type           | Default     | Required |
| ----------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------ | -------------- | ----------- | :------: |
| environment                               | Architecture environment                                                                                                                         | `string`       | n/a         |   yes    |
| evaluation_delay                          | Delay in seconds for the metric evaluation                                                                                                       | `number`       | `900`       |    no    |
| filter_tags_custom                        | Tags used for custom filtering when filter_tags_use_defaults is false                                                                            | `string`       | `"*"`       |    no    |
| filter_tags_custom_excluded               | Tags excluded for custom filtering when filter_tags_use_defaults is false                                                                        | `string`       | `""`        |    no    |
| filter_tags_use_defaults                  | Use default filter tags convention                                                                                                               | `string`       | `"true"`    |    no    |
| high_connections_count_enabled            | Flag to enable Functions high connections count monitor                                                                                          | `string`       | `"true"`    |    no    |
| high_connections_count_extra_tags         | Extra tags for Functions high connections count monitor                                                                                          | `list(string)` | `[]`        |    no    |
| high_connections_count_message            | Custom message for Functions high connections count monitor                                                                                      | `string`       | `""`        |    no    |
| high_connections_count_threshold_critical | Alerting threshold for Functions high connections count                                                                                          | `number`       | `590`       |    no    |
| high_connections_count_threshold_warning  | Warning threshold for Functions high connections count                                                                                           | `number`       | `550`       |    no    |
| high_connections_count_time_aggregator    | Monitor aggregator for Functions high connections count [available values: min, max or avg]                                                      | `string`       | `"min"`     |    no    |
| high_connections_count_timeframe          | Monitor timeframe for Functions high connections count [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string`       | `"last_5m"` |    no    |
| high_threads_count_enabled                | Flag to enable Functions high threads count monitor                                                                                              | `string`       | `"true"`    |    no    |
| high_threads_count_extra_tags             | Extra tags for Functions high threads count monitor                                                                                              | `list(string)` | `[]`        |    no    |
| high_threads_count_message                | Custom message for Functions high threads count monitor                                                                                          | `string`       | `""`        |    no    |
| high_threads_count_threshold_critical     | Alerting threshold for Functions high threads count                                                                                              | `number`       | `510`       |    no    |
| high_threads_count_threshold_warning      | Warning threshold for Functions high threads count                                                                                               | `number`       | `490`       |    no    |
| high_threads_count_time_aggregator        | Monitor aggregator for Functions high threads count [available values: min, max or avg]                                                          | `string`       | `"min"`     |    no    |
| high_threads_count_timeframe              | Monitor timeframe for Functions high threads count [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]     | `string`       | `"last_5m"` |    no    |
| http_5xx_errors_rate_enabled              | Flag to enable Functions Http 5xx errors rate monitor                                                                                            | `string`       | `"true"`    |    no    |
| http_5xx_errors_rate_extra_tags           | Extra tags for Functions Http 5xx errors rate monitor                                                                                            | `list(string)` | `[]`        |    no    |
| http_5xx_errors_rate_message              | Custom message for Functions Http 5xx errors rate monitor                                                                                        | `string`       | `""`        |    no    |
| http_5xx_errors_rate_threshold_critical   | Alerting threshold for Functions Http 5xx errors rate                                                                                            | `number`       | `20`        |    no    |
| http_5xx_errors_rate_threshold_warning    | Warning threshold for Functions Http 5xx errors rate                                                                                             | `number`       | `10`        |    no    |
| http_5xx_errors_rate_time_aggregator      | Monitor aggregator for Functions Http 5xx errors rate [available values: min, max or avg]                                                        | `string`       | `"min"`     |    no    |
| http_5xx_errors_rate_timeframe            | Monitor timeframe for Functions Http 5xx errors rate [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]   | `string`       | `"last_5m"` |    no    |
| message                                   | Message sent when a monitor is triggered                                                                                                         | `any`          | n/a         |   yes    |
| new_host_delay                            | Delay in seconds before monitor new resource                                                                                                     | `number`       | `300`       |    no    |
| notify_no_data                            | Will raise no data alert if set to true                                                                                                          | `bool`         | `true`      |    no    |
| prefix_slug                               | Prefix string to prepend between brackets on every monitors names                                                                                | `string`       | `""`        |    no    |

## Outputs

| Name                               | Description                                    |
| ---------------------------------- | ---------------------------------------------- |
| function_high_connections_count_id | id for monitor function_high_connections_count |
| function_high_threads_count_id     | id for monitor function_high_threads_count     |
| function_http_5xx_errors_rate_id   | id for monitor function_http_5xx_errors_rate   |

## Related documentation

Datadog Azure documentation: [https://docs.datadoghq.com/integrations/azure/](https://docs.datadoghq.com/integrations/azure/)

Azure Monitor metrics: [https://docs.microsoft.com/en-us/azure/azure-monitor/platform/metrics-supported#microsoftwebsites-functions](https://docs.microsoft.com/en-us/azure/azure-monitor/platform/metrics-supported#microsoftwebsites-functions)

Azure Functions connections limits: [https://docs.microsoft.com/en-us/azure/azure-functions/manage-connections#connections-limit](https://docs.microsoft.com/en-us/azure/azure-functions/manage-connections#connections-limit)
