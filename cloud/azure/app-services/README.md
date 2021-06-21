# CLOUD AZURE APP-SERVICES DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-azure-app-services" {
  source      = "claranet/monitors/datadog//cloud/azure/app-services"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- App Services HTTP 4xx errors too high
- App Services HTTP 5xx errors too high
- App Services HTTP successful responses too low
- App Services is down
- App Services memory usage
- App Services response time too high

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                                        | Description                                                                                                                                      | Type           | Default      | Required |
| ------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------ | -------------- | ------------ | :------: |
| appservices_status_no_data_timeframe        | Number of minutes before reporting no data                                                                                                       | `string`       | `10`         |    no    |
| environment                                 | Architecture environment                                                                                                                         | `string`       | n/a          |   yes    |
| evaluation_delay                            | Delay in seconds for the metric evaluation                                                                                                       | `number`       | `900`        |    no    |
| filter_tags_custom                          | Tags used for custom filtering when filter_tags_use_defaults is false                                                                            | `string`       | `"*"`        |    no    |
| filter_tags_custom_excluded                 | Tags excluded for custom filtering when filter_tags_use_defaults is false                                                                        | `string`       | `""`         |    no    |
| filter_tags_use_defaults                    | Use default filter tags convention                                                                                                               | `string`       | `"true"`     |    no    |
| http_4xx_requests_enabled                   | Flag to enable App Services 4xx requests monitor                                                                                                 | `string`       | `"true"`     |    no    |
| http_4xx_requests_extra_tags                | Extra tags for App Services 4xx requests monitor                                                                                                 | `list(string)` | `[]`         |    no    |
| http_4xx_requests_message                   | Custom message for App Services 4xx requests monitor                                                                                             | `string`       | `""`         |    no    |
| http_4xx_requests_threshold_critical        | Maximum critical acceptable percent of 4xx errors                                                                                                | `number`       | `90`         |    no    |
| http_4xx_requests_threshold_warning         | Warning regarding acceptable percent of 4xx errors                                                                                               | `number`       | `50`         |    no    |
| http_4xx_requests_time_aggregator           | Monitor aggregator for App Services 4xx requests [available values: min, max or avg]                                                             | `string`       | `"min"`      |    no    |
| http_4xx_requests_timeframe                 | Monitor timeframe for App Services 4xx requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]        | `string`       | `"last_5m"`  |    no    |
| http_5xx_requests_enabled                   | Flag to enable App Services 5xx requests monitor                                                                                                 | `string`       | `"true"`     |    no    |
| http_5xx_requests_extra_tags                | Extra tags for App Services 5xx requests monitor                                                                                                 | `list(string)` | `[]`         |    no    |
| http_5xx_requests_message                   | Custom message for App Services 5xx requests monitor                                                                                             | `string`       | `""`         |    no    |
| http_5xx_requests_threshold_critical        | Maximum critical acceptable percent of 5xx errors                                                                                                | `number`       | `90`         |    no    |
| http_5xx_requests_threshold_warning         | Warning regarding acceptable percent of 5xx errors                                                                                               | `number`       | `50`         |    no    |
| http_5xx_requests_time_aggregator           | Monitor aggregator for App Services 5xx requests [available values: min, max or avg]                                                             | `string`       | `"min"`      |    no    |
| http_5xx_requests_timeframe                 | Monitor timeframe for App Services 5xx requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]        | `string`       | `"last_5m"`  |    no    |
| http_successful_requests_enabled            | Flag to enable App Services successful requests monitor                                                                                          | `string`       | `"true"`     |    no    |
| http_successful_requests_extra_tags         | Extra tags for App Services successful requests monitor                                                                                          | `list(string)` | `[]`         |    no    |
| http_successful_requests_message            | Custom message for App Services successful requests monitor                                                                                      | `string`       | `""`         |    no    |
| http_successful_requests_threshold_critical | Minimum critical acceptable percent of 2xx & 3xx requests                                                                                        | `number`       | `10`         |    no    |
| http_successful_requests_threshold_warning  | Warning regarding acceptable percent of 2xx & 3xx requests                                                                                       | `number`       | `30`         |    no    |
| http_successful_requests_time_aggregator    | Monitor aggregator for App Services successful requests [available values: min, max or avg]                                                      | `string`       | `"max"`      |    no    |
| http_successful_requests_timeframe          | Monitor timeframe for App Services successful requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string`       | `"last_5m"`  |    no    |
| memory_usage_enabled                        | Flag to enable App Services memory usage monitor                                                                                                 | `string`       | `"true"`     |    no    |
| memory_usage_extra_tags                     | Extra tags for App Services memory usage monitor                                                                                                 | `list(string)` | `[]`         |    no    |
| memory_usage_message                        | Custom message for App Services memory usage monitor                                                                                             | `string`       | `""`         |    no    |
| memory_usage_threshold_critical             | Alerting threshold in Mib                                                                                                                        | `number`       | `1073741824` |    no    |
| memory_usage_threshold_warning              | Warning threshold in MiB                                                                                                                         | `number`       | `536870912`  |    no    |
| memory_usage_time_aggregator                | Monitor aggregator for App Services memory usage [available values: min, max or avg]                                                             | `string`       | `"min"`      |    no    |
| memory_usage_timeframe                      | Monitor timeframe for App Services memory usage [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]        | `string`       | `"last_5m"`  |    no    |
| message                                     | Message sent when a monitor is triggered                                                                                                         | `any`          | n/a          |   yes    |
| new_host_delay                              | Delay in seconds before monitor new resource                                                                                                     | `number`       | `300`        |    no    |
| notify_no_data                              | Will raise no data alert if set to true                                                                                                          | `bool`         | `true`       |    no    |
| prefix_slug                                 | Prefix string to prepend between brackets on every monitors names                                                                                | `string`       | `""`         |    no    |
| response_time_enabled                       | Flag to enable App Services response time monitor                                                                                                | `string`       | `"true"`     |    no    |
| response_time_extra_tags                    | Extra tags for App Services response time monitor                                                                                                | `list(string)` | `[]`         |    no    |
| response_time_message                       | Custom message for App Services response time monitor                                                                                            | `string`       | `""`         |    no    |
| response_time_threshold_critical            | Alerting threshold for response time in seconds                                                                                                  | `number`       | `10`         |    no    |
| response_time_threshold_warning             | Warning threshold for response time in seconds                                                                                                   | `number`       | `5`          |    no    |
| response_time_time_aggregator               | Monitor aggregator for App Services response time [available values: min, max or avg]                                                            | `string`       | `"min"`      |    no    |
| response_time_timeframe                     | Monitor timeframe for App Services response time [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]       | `string`       | `"last_5m"`  |    no    |
| status_enabled                              | Flag to enable App Services status monitor                                                                                                       | `string`       | `"true"`     |    no    |
| status_extra_tags                           | Extra tags for App Services status monitor                                                                                                       | `list(string)` | `[]`         |    no    |
| status_message                              | Custom message for App Services status monitor                                                                                                   | `string`       | `""`         |    no    |
| status_time_aggregator                      | Monitor aggregator for App Services status [available values: min, max or avg]                                                                   | `string`       | `"max"`      |    no    |
| status_timeframe                            | Monitor timeframe for App Services status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]              | `string`       | `"last_5m"`  |    no    |

## Outputs

| Name                                    | Description                                         |
| --------------------------------------- | --------------------------------------------------- |
| appservices_http_4xx_errors_count_id    | id for monitor appservices_http_4xx_errors_count    |
| appservices_http_5xx_errors_count_id    | id for monitor appservices_http_5xx_errors_count    |
| appservices_http_success_status_rate_id | id for monitor appservices_http_success_status_rate |
| appservices_memory_usage_count_id       | id for monitor appservices_memory_usage_count       |
| appservices_response_time_id            | id for monitor appservices_response_time            |
| appservices_status_id                   | id for monitor appservices_status                   |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/azure_app_services](https://docs.datadoghq.com/integrations/azure_app_services)
