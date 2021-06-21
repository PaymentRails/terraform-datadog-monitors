# CLOUD AZURE VIRTUAL-MACHINE DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-azure-virtual-machine" {
  source      = "claranet/monitors/datadog//cloud/azure/virtual-machine"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Virtual Machine CPU usage
- Virtual Machine credit CPU
- Virtual Machine disk space
- Virtual Machine is unreachable
- Virtual Machine RAM reserved
- Virtual Machine requests failed

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                                    | Description                                                                                                                                             | Type           | Default      | Required |
| --------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------- | ------------ | :------: |
| cpu_remaining_rate_enabled              | Flag to enable Virtual Machine CPU remaining monitor                                                                                                    | `string`       | `"true"`     |    no    |
| cpu_remaining_rate_extra_tags           | Extra tags for Virtual Machine CPU remaining monitor                                                                                                    | `list(string)` | `[]`         |    no    |
| cpu_remaining_rate_message              | Custom message for Virtual Machine CPU remaining monitor                                                                                                | `string`       | `""`         |    no    |
| cpu_remaining_rate_threshold_critical   | Virtual Machine CPU rate limit (critical threshold)                                                                                                     | `number`       | `15`         |    no    |
| cpu_remaining_rate_threshold_warning    | Virtual Machine CPU rate limit (warning threshold)                                                                                                      | `number`       | `30`         |    no    |
| cpu_remaining_rate_time_aggregator      | Monitor aggregator for Virtual Machine CPU remaining [available values: min, max, sum or avg]                                                           | `string`       | `"min"`      |    no    |
| cpu_remaining_rate_timeframe            | Monitor timeframe for Virtual Machine CPU remaining [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]           | `string`       | `"last_5m"`  |    no    |
| cpu_usage_enabled                       | Flag to enable Virtual Machine status monitor                                                                                                           | `string`       | `"true"`     |    no    |
| cpu_usage_extra_tags                    | Extra tags for Virtual Machine status monitor                                                                                                           | `list(string)` | `[]`         |    no    |
| cpu_usage_message                       | Custom message for Virtual Machine CPU monitor                                                                                                          | `string`       | `""`         |    no    |
| cpu_usage_threshold_critical            | Virtual Machine CPU usage in percent (critical threshold)                                                                                               | `string`       | `"90"`       |    no    |
| cpu_usage_threshold_warning             | Virtual Machine CPU usage in percent (warning threshold)                                                                                                | `string`       | `"80"`       |    no    |
| cpu_usage_time_aggregator               | Monitor aggregator for Virtual Machine CPU [available values: min, max or avg]                                                                          | `string`       | `"min"`      |    no    |
| cpu_usage_timeframe                     | Monitor timeframe for Virtual Machine CPU [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]                     | `string`       | `"last_15m"` |    no    |
| disk_space_enabled                      | Flag to enable Virtual Machine status monitor                                                                                                           | `string`       | `"true"`     |    no    |
| disk_space_extra_tags                   | Extra tags for Virtual Machine free disk space monitor                                                                                                  | `list(string)` | `[]`         |    no    |
| disk_space_message                      | Custom message for Virtual Machine CPU free disk space monitor                                                                                          | `string`       | `""`         |    no    |
| disk_space_threshold_critical           | Virtual Machine free disk space in percent (critical threshold)                                                                                         | `string`       | `"95"`       |    no    |
| disk_space_threshold_warning            | Virtual Machine free disk space in percent (warning threshold)                                                                                          | `string`       | `"90"`       |    no    |
| disk_space_time_aggregator              | Monitor aggregator for Virtual Machine free disk space [available values: min, max or avg]                                                              | `string`       | `"max"`      |    no    |
| disk_space_timeframe                    | Monitor timeframe for Virtual Machine free disk space too low [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string`       | `"last_5m"`  |    no    |
| environment                             | Architecture environment                                                                                                                                | `string`       | n/a          |   yes    |
| evaluation_delay                        | Delay in seconds for the metric evaluation                                                                                                              | `number`       | `900`        |    no    |
| filter_tags_custom                      | Tags used for custom filtering when filter_tags_use_defaults is false                                                                                   | `string`       | `"*"`        |    no    |
| filter_tags_custom_excluded             | Tags excluded for custom filtering when filter_tags_use_defaults is false                                                                               | `string`       | `""`         |    no    |
| filter_tags_use_defaults                | Use default filter tags convention                                                                                                                      | `string`       | `"true"`     |    no    |
| message                                 | Message sent when a Redis monitor is triggered                                                                                                          | `any`          | n/a          |   yes    |
| new_host_delay                          | Delay in seconds before monitor new resource                                                                                                            | `number`       | `300`        |    no    |
| notify_no_data                          | Will raise no data alert if set to true                                                                                                                 | `bool`         | `true`       |    no    |
| prefix_slug                             | Prefix string to prepend between brackets on every monitors names                                                                                       | `string`       | `""`         |    no    |
| ram_reserved_enabled                    | Flag to enable Virtual Machine RAM reserved monitor                                                                                                     | `string`       | `"true"`     |    no    |
| ram_reserved_extra_tags                 | Extra tags for Virtual Machine RAM reserved monitor                                                                                                     | `list(string)` | `[]`         |    no    |
| ram_reserved_message                    | Custom message for Virtual Machine RAM reserved monitor                                                                                                 | `string`       | `""`         |    no    |
| ram_reserved_threshold_critical         | Virtual Machine RAM reserved limit (critical threshold)                                                                                                 | `number`       | `95`         |    no    |
| ram_reserved_threshold_warning          | Virtual Machine RAM reserved limit (warning threshold)                                                                                                  | `number`       | `90`         |    no    |
| ram_reserved_time_aggregator            | Monitor aggregator for Virtual Machine RAM reserved [available values: min, max, sum or avg]                                                            | `string`       | `"min"`      |    no    |
| ram_reserved_timeframe                  | Monitor timeframe for Virtual Machine RAM reserved [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]            | `string`       | `"last_15m"` |    no    |
| requests_failed_enabled                 | Flag to enable Virtual Machine requests failed monitor                                                                                                  | `string`       | `"true"`     |    no    |
| requests_failed_extra_tags              | Extra tags for Virtual Machine requests failed monitor                                                                                                  | `list(string)` | `[]`         |    no    |
| requests_failed_message                 | Custom message for Virtual Machine requests failed monitor                                                                                              | `string`       | `""`         |    no    |
| requests_failed_threshold_critical      | Virtual Machine requests failed limit (critical threshold)                                                                                              | `number`       | `95`         |    no    |
| requests_failed_threshold_warning       | Virtual Machine requests failed limit (warning threshold)                                                                                               | `number`       | `90`         |    no    |
| requests_failed_time_aggregator         | Monitor aggregator for Virtual Machine requests failed [available values: min, max, sum or avg]                                                         | `string`       | `"min"`      |    no    |
| requests_failed_timeframe               | Monitor timeframe for Virtual Machine requests failed [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]         | `string`       | `"last_10m"` |    no    |
| status_enabled                          | Flag to enable Virtual Machine status monitor                                                                                                           | `string`       | `"true"`     |    no    |
| status_extra_tags                       | Extra tags for Virtual Machine status monitor                                                                                                           | `list(string)` | `[]`         |    no    |
| status_message                          | Custom message for Virtual Machine status monitor                                                                                                       | `string`       | `""`         |    no    |
| status_time_aggregator                  | Monitor aggregator for Virtual Machine status [available values: min, max or avg]                                                                       | `string`       | `"max"`      |    no    |
| status_timeframe                        | Monitor timeframe for Virtual Machine status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]                  | `string`       | `"last_5m"`  |    no    |
| virtualmachine_status_no_data_timeframe | Number of minutes before reporting no data                                                                                                              | `string`       | `10`         |    no    |

## Outputs

| Name                                           | Description                                                |
| ---------------------------------------------- | ---------------------------------------------------------- |
| virtualmachine_cpu_usage_id                    | id for monitor virtualmachine_cpu_usage                    |
| virtualmachine_credit_cpu_remaining_too_low_id | id for monitor virtualmachine_credit_cpu_remaining_too_low |
| virtualmachine_disk_space_id                   | id for monitor virtualmachine_disk_space                   |
| virtualmachine_ram_reserved_id                 | id for monitor virtualmachine_ram_reserved                 |
| virtualmachine_requests_failed_id              | id for monitor virtualmachine_requests_failed              |
| virtualmachine_status_id                       | id for monitor virtualmachine_status                       |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/azure_vm/](https://docs.datadoghq.com/integrations/azure_vm/)
