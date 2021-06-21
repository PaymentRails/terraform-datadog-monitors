# CLOUD AZURE APP-GATEWAY DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-azure-app-gateway" {
  source      = "claranet/monitors/datadog//cloud/azure/app-gateway"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- App Gateway backend connect time is too high
- App Gateway backend HTTP 4xx errors rate is too high
- App Gateway backend HTTP 5xx errors rate is too high
- App Gateway backend unhealthy host ratio is too high
- App Gateway failed requests
- App Gateway has no requests
- App Gateway HTTP 4xx errors rate is too high
- App Gateway HTTP 5xx errors rate is too high
- App Gateway is down

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                                                  | Description                                                                                                                                      | Type           | Default      | Required |
| ----------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------ | -------------- | ------------ | :------: |
| appgateway_backend_connect_time_enabled               | Flag to enable App Gateway backend_connect_time monitor                                                                                          | `string`       | `"true"`     |    no    |
| appgateway_backend_connect_time_extra_tags            | Extra tags for App Gateway backend_connect_time monitor                                                                                          | `list(string)` | `[]`         |    no    |
| appgateway_backend_connect_time_message               | Custom message for App Gateway backend_connect_time monitor                                                                                      | `string`       | `""`         |    no    |
| appgateway_backend_connect_time_threshold_critical    | Maximum critical backend_connect_time errors in milliseconds                                                                                     | `number`       | `50`         |    no    |
| appgateway_backend_connect_time_threshold_warning     | Warning regarding backend_connect_time errors in milliseconds                                                                                    | `number`       | `40`         |    no    |
| appgateway_backend_connect_time_time_aggregator       | Monitor aggregator for App Gateway backend_connect_time [available values: min, max or avg]                                                      | `string`       | `"max"`      |    no    |
| appgateway_backend_connect_time_timeframe             | Monitor timeframe for App Gateway backend_connect_time [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string`       | `"last_5m"`  |    no    |
| appgateway_backend_http_4xx_errors_enabled            | Flag to enable App Gateway http 4xx errors monitor                                                                                               | `string`       | `"true"`     |    no    |
| appgateway_backend_http_4xx_errors_extra_tags         | Extra tags for App Gateway http 4xx errors monitor                                                                                               | `list(string)` | `[]`         |    no    |
| appgateway_backend_http_4xx_errors_message            | Custom message for App Gateway http 4xx errors monitor                                                                                           | `string`       | `""`         |    no    |
| appgateway_backend_http_4xx_errors_threshold_critical | Minimum critical acceptable percent of 4xx error                                                                                                 | `number`       | `95`         |    no    |
| appgateway_backend_http_4xx_errors_threshold_warning  | Warning regarding acceptable percent of 4xx error                                                                                                | `number`       | `80`         |    no    |
| appgateway_backend_http_4xx_errors_time_aggregator    | Monitor aggregator for App Gateway http 4xx errors [available values: min, max or avg]                                                           | `string`       | `"max"`      |    no    |
| appgateway_backend_http_4xx_errors_timeframe          | Monitor timeframe for App Gateway http 4xx errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]      | `string`       | `"last_5m"`  |    no    |
| appgateway_backend_http_5xx_errors_enabled            | Flag to enable App Gateway http 5xx errors monitor                                                                                               | `string`       | `"true"`     |    no    |
| appgateway_backend_http_5xx_errors_extra_tags         | Extra tags for App Gateway http 5xx errors monitor                                                                                               | `list(string)` | `[]`         |    no    |
| appgateway_backend_http_5xx_errors_message            | Custom message for App Gateway http 5xx errors monitor                                                                                           | `string`       | `""`         |    no    |
| appgateway_backend_http_5xx_errors_threshold_critical | Minimum critical acceptable percent of 5xx error                                                                                                 | `number`       | `95`         |    no    |
| appgateway_backend_http_5xx_errors_threshold_warning  | Warning regarding acceptable percent of 5xx error                                                                                                | `number`       | `80`         |    no    |
| appgateway_backend_http_5xx_errors_time_aggregator    | Monitor aggregator for App Gateway http 5xx errors [available values: min, max or avg]                                                           | `string`       | `"max"`      |    no    |
| appgateway_backend_http_5xx_errors_timeframe          | Monitor timeframe for App Gateway http 5xx errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]      | `string`       | `"last_5m"`  |    no    |
| appgateway_failed_requests_enabled                    | Flag to enable App Gateway failed requests monitor                                                                                               | `string`       | `"true"`     |    no    |
| appgateway_failed_requests_extra_tags                 | Extra tags for App Gateway failed requests monitor                                                                                               | `list(string)` | `[]`         |    no    |
| appgateway_failed_requests_message                    | Custom message for App Gateway failed requests monitor                                                                                           | `string`       | `""`         |    no    |
| appgateway_failed_requests_threshold_critical         | Maximum critical acceptable percent of failed errors                                                                                             | `number`       | `95`         |    no    |
| appgateway_failed_requests_threshold_warning          | Warning regarding acceptable percent of failed errors                                                                                            | `number`       | `80`         |    no    |
| appgateway_failed_requests_time_aggregator            | Monitor aggregator for App Gateway failed requests [available values: min, max or avg]                                                           | `string`       | `"min"`      |    no    |
| appgateway_failed_requests_timeframe                  | Monitor timeframe for App Gateway failed requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]      | `string`       | `"last_5m"`  |    no    |
| appgateway_http_4xx_errors_enabled                    | Flag to enable App Gateway http 4xx errors monitor                                                                                               | `string`       | `"true"`     |    no    |
| appgateway_http_4xx_errors_extra_tags                 | Extra tags for App Gateway http 4xx errors monitor                                                                                               | `list(string)` | `[]`         |    no    |
| appgateway_http_4xx_errors_message                    | Custom message for App Gateway http 4xx errors monitor                                                                                           | `string`       | `""`         |    no    |
| appgateway_http_4xx_errors_threshold_critical         | Maximum critical acceptable percent of 4xx error                                                                                                 | `number`       | `95`         |    no    |
| appgateway_http_4xx_errors_threshold_warning          | Warning regarding acceptable percent of 4xx error                                                                                                | `number`       | `80`         |    no    |
| appgateway_http_4xx_errors_time_aggregator            | Monitor aggregator for App Gateway http 4xx errors [available values: min, max or avg]                                                           | `string`       | `"max"`      |    no    |
| appgateway_http_4xx_errors_timeframe                  | Monitor timeframe for App Gateway http 4xx errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]      | `string`       | `"last_5m"`  |    no    |
| appgateway_http_5xx_errors_enabled                    | Flag to enable App Gateway http 5xx errors monitor                                                                                               | `string`       | `"true"`     |    no    |
| appgateway_http_5xx_errors_extra_tags                 | Extra tags for App Gateway http 5xx errors monitor                                                                                               | `list(string)` | `[]`         |    no    |
| appgateway_http_5xx_errors_message                    | Custom message for App Gateway http 5xx errors monitor                                                                                           | `string`       | `""`         |    no    |
| appgateway_http_5xx_errors_threshold_critical         | Maximum critical acceptable percent of 5xx error                                                                                                 | `number`       | `95`         |    no    |
| appgateway_http_5xx_errors_threshold_warning          | Warning regarding acceptable percent of 5xx error                                                                                                | `number`       | `80`         |    no    |
| appgateway_http_5xx_errors_time_aggregator            | Monitor aggregator for App Gateway http 5xx errors [available values: min, max or avg]                                                           | `string`       | `"max"`      |    no    |
| appgateway_http_5xx_errors_timeframe                  | Monitor timeframe for App Gateway http 5xx errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]      | `string`       | `"last_5m"`  |    no    |
| appgateway_status_no_data_timeframe                   | Number of minutes before reporting no data                                                                                                       | `string`       | `10`         |    no    |
| appgateway_unhealthy_host_ratio_enabled               | Flag to enable App Gateway unhealthy host ratio monitor                                                                                          | `string`       | `"true"`     |    no    |
| appgateway_unhealthy_host_ratio_extra_tags            | Extra tags for App Gateway unhealthy host ratio monitor                                                                                          | `list(string)` | `[]`         |    no    |
| appgateway_unhealthy_host_ratio_message               | Custom message for App Gateway unhealthy host ratio monitor                                                                                      | `string`       | `""`         |    no    |
| appgateway_unhealthy_host_ratio_threshold_critical    | Maximum critical acceptable ratio of unhealthy host                                                                                              | `number`       | `75`         |    no    |
| appgateway_unhealthy_host_ratio_threshold_warning     | Warning regarding acceptable ratio of unhealthy host                                                                                             | `number`       | `50`         |    no    |
| appgateway_unhealthy_host_ratio_time_aggregator       | Monitor aggregator for App Gateway unhealthy host ratio [available values: min, max or avg]                                                      | `string`       | `"max"`      |    no    |
| appgateway_unhealthy_host_ratio_timeframe             | Monitor timeframe for App Gateway unhealthy host ratio [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string`       | `"last_5m"`  |    no    |
| environment                                           | Architecture environment                                                                                                                         | `string`       | n/a          |   yes    |
| evaluation_delay                                      | Delay in seconds for the metric evaluation                                                                                                       | `number`       | `900`        |    no    |
| filter_tags_custom                                    | Tags used for custom filtering when filter_tags_use_defaults is false                                                                            | `string`       | `"*"`        |    no    |
| filter_tags_custom_excluded                           | Tags excluded for custom filtering when filter_tags_use_defaults is false                                                                        | `string`       | `""`         |    no    |
| filter_tags_use_defaults                              | Use default filter tags convention                                                                                                               | `string`       | `"true"`     |    no    |
| message                                               | Message sent when a monitor is triggered                                                                                                         | `any`          | n/a          |   yes    |
| new_host_delay                                        | Delay in seconds before monitor new resource                                                                                                     | `number`       | `300`        |    no    |
| notify_no_data                                        | Will raise no data alert if set to true                                                                                                          | `bool`         | `true`       |    no    |
| prefix_slug                                           | Prefix string to prepend between brackets on every monitors names                                                                                | `string`       | `""`         |    no    |
| status_enabled                                        | Flag to enable App Gateway status                                                                                                                | `string`       | `"true"`     |    no    |
| status_extra_tags                                     | Extra tags for App Gateway status                                                                                                                | `list(string)` | `[]`         |    no    |
| status_message                                        | Custom message for App Gateway status                                                                                                            | `string`       | `""`         |    no    |
| status_time_aggregator                                | Monitor aggregator for App Gateway status [available values: min, max or avg]                                                                    | `string`       | `"max"`      |    no    |
| status_timeframe                                      | Monitor timeframe for App Gateway status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]               | `string`       | `"last_5m"`  |    no    |
| total_requests_enabled                                | Flag to enable App Gateway current connections monitor                                                                                           | `string`       | `"true"`     |    no    |
| total_requests_extra_tags                             | Extra tags for App Gateway current connections monitor                                                                                           | `list(string)` | `[]`         |    no    |
| total_requests_message                                | Custom message for App Gateway current connections monitor                                                                                       | `string`       | `""`         |    no    |
| total_requests_time_aggregator                        | Monitor aggregator for App Gateway current connections [available values: min, max or avg]                                                       | `string`       | `"max"`      |    no    |
| total_requests_timeframe                              | Monitor timeframe for App Gateway current connections [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]  | `string`       | `"last_15m"` |    no    |

## Outputs

| Name                                  | Description                                       |
| ------------------------------------- | ------------------------------------------------- |
| appgateway_backend_connect_time_id    | id for monitor appgateway_backend_connect_time    |
| appgateway_backend_http_4xx_errors_id | id for monitor appgateway_backend_http_4xx_errors |
| appgateway_backend_http_5xx_errors_id | id for monitor appgateway_backend_http_5xx_errors |
| appgateway_failed_requests_id         | id for monitor appgateway_failed_requests         |
| appgateway_healthy_host_ratio_id      | id for monitor appgateway_healthy_host_ratio      |
| appgateway_http_4xx_errors_id         | id for monitor appgateway_http_4xx_errors         |
| appgateway_http_5xx_errors_id         | id for monitor appgateway_http_5xx_errors         |
| appgateway_status_id                  | id for monitor appgateway_status                  |
| total_requests_id                     | id for monitor total_requests                     |

## Related documentation
