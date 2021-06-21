# CLOUD AZURE APIMANAGEMENT DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-azure-apimanagement" {
  source      = "claranet/monitors/datadog//cloud/azure/apimanagement"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- API Management is down
- API Management successful requests rate too low
- API Management too many failed requests
- API Management too many other requests
- API Management too many unauthorized requests

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                                     | Description                                                                                                                                          | Type           | Default     | Required |
| ---------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- | -------------- | ----------- | :------: |
| apimgt_status_no_data_timeframe          | Number of minutes before reporting no data                                                                                                           | `string`       | `10`        |    no    |
| environment                              | Architecture environment                                                                                                                             | `string`       | n/a         |   yes    |
| evaluation_delay                         | Delay in seconds for the metric evaluation                                                                                                           | `number`       | `900`       |    no    |
| failed_requests_enabled                  | Flag to enable API Management failed requests monitor                                                                                                | `string`       | `"true"`    |    no    |
| failed_requests_extra_tags               | Extra tags for API Management failed requests monitor                                                                                                | `list(string)` | `[]`        |    no    |
| failed_requests_message                  | Custom message for API Management failed requests monitor                                                                                            | `string`       | `""`        |    no    |
| failed_requests_threshold_critical       | Maximum acceptable percent of failed requests                                                                                                        | `number`       | `90`        |    no    |
| failed_requests_threshold_warning        | Warning regarding acceptable percent of failed requests                                                                                              | `number`       | `50`        |    no    |
| failed_requests_time_aggregator          | Monitor aggregator for API Management failed requests [available values: min, max or avg]                                                            | `string`       | `"min"`     |    no    |
| failed_requests_timeframe                | Monitor timeframe for API Management failed requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]       | `string`       | `"last_5m"` |    no    |
| filter_tags_custom                       | Tags used for custom filtering when filter_tags_use_defaults is false                                                                                | `string`       | `"*"`       |    no    |
| filter_tags_custom_excluded              | Tags excluded for custom filtering when filter_tags_use_defaults is false                                                                            | `string`       | `""`        |    no    |
| filter_tags_use_defaults                 | Use default filter tags convention                                                                                                                   | `string`       | `"true"`    |    no    |
| message                                  | Message sent when a Redis monitor is triggered                                                                                                       | `any`          | n/a         |   yes    |
| new_host_delay                           | Delay in seconds before monitor new resource                                                                                                         | `number`       | `300`       |    no    |
| notify_no_data                           | Will raise no data alert if set to true                                                                                                              | `bool`         | `true`      |    no    |
| other_requests_enabled                   | Flag to enable API Management other requests monitor                                                                                                 | `string`       | `"true"`    |    no    |
| other_requests_extra_tags                | Extra tags for API Management other requests monitor                                                                                                 | `list(string)` | `[]`        |    no    |
| other_requests_message                   | Custom message for API Management other requests monitor                                                                                             | `string`       | `""`        |    no    |
| other_requests_threshold_critical        | Maximum acceptable percent of other requests                                                                                                         | `number`       | `90`        |    no    |
| other_requests_threshold_warning         | Warning regarding acceptable percent of other requests                                                                                               | `number`       | `50`        |    no    |
| other_requests_time_aggregator           | Monitor aggregator for API Management other requests [available values: min, max or avg]                                                             | `string`       | `"min"`     |    no    |
| other_requests_timeframe                 | Monitor timeframe for API Management other requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]        | `string`       | `"last_5m"` |    no    |
| prefix_slug                              | Prefix string to prepend between brackets on every monitors names                                                                                    | `string`       | `""`        |    no    |
| status_enabled                           | Flag to enable API Management status monitor                                                                                                         | `string`       | `"true"`    |    no    |
| status_extra_tags                        | Extra tags for API Management status monitor                                                                                                         | `list(string)` | `[]`        |    no    |
| status_message                           | Custom message for API Management status monitor                                                                                                     | `string`       | `""`        |    no    |
| status_time_aggregator                   | Monitor aggregator for API Management status [available values: min, max or avg]                                                                     | `string`       | `"max"`     |    no    |
| status_timeframe                         | Monitor timeframe for API Management status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]                | `string`       | `"last_5m"` |    no    |
| successful_requests_enabled              | Flag to enable API Management successful requests monitor                                                                                            | `string`       | `"true"`    |    no    |
| successful_requests_extra_tags           | Extra tags for API Management successful requests monitor                                                                                            | `list(string)` | `[]`        |    no    |
| successful_requests_message              | Custom message for API Management successful requests monitor                                                                                        | `string`       | `""`        |    no    |
| successful_requests_threshold_critical   | Minimum acceptable percent of successful requests                                                                                                    | `number`       | `10`        |    no    |
| successful_requests_threshold_warning    | Warning regarding acceptable percent of successful requests                                                                                          | `number`       | `30`        |    no    |
| successful_requests_time_aggregator      | Monitor aggregator for API Management successful requests [available values: min, max or avg]                                                        | `string`       | `"max"`     |    no    |
| successful_requests_timeframe            | Monitor timeframe for API Management successful requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]   | `string`       | `"last_5m"` |    no    |
| unauthorized_requests_enabled            | Flag to enable API Management unauthorized requests monitor                                                                                          | `string`       | `"true"`    |    no    |
| unauthorized_requests_extra_tags         | Extra tags for API Management unauthorized requests monitor                                                                                          | `list(string)` | `[]`        |    no    |
| unauthorized_requests_message            | Custom message for API Management unauthorized requests monitor                                                                                      | `string`       | `""`        |    no    |
| unauthorized_requests_threshold_critical | Maximum acceptable percent of unauthorized requests                                                                                                  | `number`       | `90`        |    no    |
| unauthorized_requests_threshold_warning  | Warning regarding acceptable percent of unauthorized requests                                                                                        | `number`       | `50`        |    no    |
| unauthorized_requests_time_aggregator    | Monitor aggregator for API Management unauthorized requests [available values: min, max or avg]                                                      | `string`       | `"min"`     |    no    |
| unauthorized_requests_timeframe          | Monitor timeframe for API Management unauthorized requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string`       | `"last_5m"` |    no    |

## Outputs

| Name                            | Description                                 |
| ------------------------------- | ------------------------------------------- |
| apimgt_failed_requests_id       | id for monitor apimgt_failed_requests       |
| apimgt_other_requests_id        | id for monitor apimgt_other_requests        |
| apimgt_status_id                | id for monitor apimgt_status                |
| apimgt_successful_requests_id   | id for monitor apimgt_successful_requests   |
| apimgt_unauthorized_requests_id | id for monitor apimgt_unauthorized_requests |

## Related documentation

Azure API Management metrics documentation: [https://docs.microsoft.com/en-us/azure/api-management/api-management-howto-use-azure-monitor](https://docs.microsoft.com/en-us/azure/api-management/api-management-howto-use-azure-monitor)
