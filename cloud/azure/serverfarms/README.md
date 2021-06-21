# CLOUD AZURE SERVERFARMS DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-azure-serverfarms" {
  source      = "claranet/monitors/datadog//cloud/azure/serverfarms"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Serverfarm CPU percentage is too high
- Serverfarm is down
- Serverfarm memory percentage is too high

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                                 | Description                                                                                                                                   | Type           | Default      | Required |
| ------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------- | -------------- | ------------ | :------: |
| cpu_percentage_enabled               | Flag to enable the serverfarms cpu_percentage monitor                                                                                         | `string`       | `"true"`     |    no    |
| cpu_percentage_extra_tags            | Extra tags for serverfarms cpu_percentage monitor                                                                                             | `list(string)` | `[]`         |    no    |
| cpu_percentage_message               | Custom message for serverfarm cpu_percentage monitor                                                                                          | `string`       | `""`         |    no    |
| cpu_percentage_threshold_critical    | CPU percentage (critical threshold)                                                                                                           | `number`       | `95`         |    no    |
| cpu_percentage_threshold_warning     | CPU percentage (warning threshold)                                                                                                            | `number`       | `90`         |    no    |
| cpu_percentage_time_aggregator       | Monitor aggregator for serverfarms cpu_percentage [available values: min, max or avg]                                                         | `string`       | `"min"`      |    no    |
| cpu_percentage_timeframe             | Monitor timeframe for serverfarms cpu_percentage [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]    | `string`       | `"last_10m"` |    no    |
| environment                          | Architecture environment                                                                                                                      | `string`       | n/a          |   yes    |
| evaluation_delay                     | Delay in seconds for the metric evaluation                                                                                                    | `number`       | `900`        |    no    |
| filter_tags_custom                   | Tags used for custom filtering when filter_tags_use_defaults is false                                                                         | `string`       | `"*"`        |    no    |
| filter_tags_use_defaults             | Use default filter tags convention                                                                                                            | `string`       | `"true"`     |    no    |
| memory_percentage_enabled            | Flag to enable the serverfarms memory_percentage monitor                                                                                      | `string`       | `"true"`     |    no    |
| memory_percentage_extra_tags         | Extra tags for serverfarms memory_percentage monitor                                                                                          | `list(string)` | `[]`         |    no    |
| memory_percentage_message            | Custom message for serverfarm memory_percentage monitor                                                                                       | `string`       | `""`         |    no    |
| memory_percentage_threshold_critical | Memory percentage (critical threshold)                                                                                                        | `number`       | `95`         |    no    |
| memory_percentage_threshold_warning  | Memory percentage (warning threshold)                                                                                                         | `number`       | `90`         |    no    |
| memory_percentage_time_aggregator    | Monitor aggregator for serverfarms memory_percentage [available values: min, max or avg]                                                      | `string`       | `"min"`      |    no    |
| memory_percentage_timeframe          | Monitor timeframe for serverfarms memory_percentage [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string`       | `"last_5m"`  |    no    |
| message                              | Message sent when a serverfarms monitor is triggered                                                                                          | `any`          | n/a          |   yes    |
| new_host_delay                       | Delay in seconds before monitor new resource                                                                                                  | `number`       | `300`        |    no    |
| notify_no_data                       | Will raise no data alert if set to true                                                                                                       | `bool`         | `true`       |    no    |
| prefix_slug                          | Prefix string to prepend between brackets on every monitors names                                                                             | `string`       | `""`         |    no    |
| status_enabled                       | Flag to enable the serverfarms status monitor                                                                                                 | `string`       | `"true"`     |    no    |
| status_extra_tags                    | Extra tags for serverfarms status monitor                                                                                                     | `list(string)` | `[]`         |    no    |
| status_message                       | Custom message for serverfarm status monitor                                                                                                  | `string`       | `""`         |    no    |
| status_no_data_timeframe             | Number of minutes before reporting no data                                                                                                    | `string`       | `10`         |    no    |
| status_time_aggregator               | Monitor aggregator for serverfarms status [available values: min, max or avg]                                                                 | `string`       | `"max"`      |    no    |
| status_timeframe                     | Monitor timeframe for serverfarms status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]            | `string`       | `"last_5m"`  |    no    |

## Outputs

| Name                 | Description                      |
| -------------------- | -------------------------------- |
| cpu_percentage_id    | id for monitor cpu_percentage    |
| memory_percentage_id | id for monitor memory_percentage |
| status_id            | id for monitor status            |

## Related documentation
