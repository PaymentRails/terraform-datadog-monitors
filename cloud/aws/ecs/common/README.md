# CLOUD AWS ECS COMMON DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-aws-ecs-common" {
  source      = "claranet/monitors/datadog//cloud/aws/ecs/common"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- ECS Service CPU Utilization High (disabled by default)
- ECS Service Memory Utilization High (disabled by default)
- ECS Service not healthy enough

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                                          | Description                                                                           | Type           | Default     | Required |
| --------------------------------------------- | ------------------------------------------------------------------------------------- | -------------- | ----------- | :------: |
| environment                                   | Architecture environment                                                              | `string`       | n/a         |   yes    |
| evaluation_delay                              | Delay in seconds for the metric evaluation                                            | `number`       | `900`       |    no    |
| filter_tags                                   | Tags used for filtering                                                               | `string`       | `"*"`       |    no    |
| filter_tags_custom                            | Tags used for custom filtering when filter_tags_use_defaults is false                 | `string`       | `"*"`       |    no    |
| filter_tags_custom_excluded                   | Tags excluded for custom filtering when filter_tags_use_defaults is false             | `string`       | `""`        |    no    |
| filter_tags_use_defaults                      | Use default filter tags convention                                                    | `string`       | `"true"`    |    no    |
| message                                       | Message sent when a monitor is triggered                                              | `any`          | n/a         |   yes    |
| new_host_delay                                | Delay in seconds before monitor new resource                                          | `number`       | `300`       |    no    |
| notify_no_data                                | Will raise no data alert if set to true                                               | `bool`         | `true`      |    no    |
| prefix_slug                                   | Prefix string to prepend between brackets on every monitors names                     | `string`       | `""`        |    no    |
| service_cpu_utilization_enabled               | Flag to enable Service CPU Utilization monitor                                        | `string`       | `"false"`   |    no    |
| service_cpu_utilization_extra_tags            | Extra tags for Service CPU Utilization monitor                                        | `list(string)` | `[]`        |    no    |
| service_cpu_utilization_message               | Custom message for the Service CPU Utilization monitor                                | `string`       | `""`        |    no    |
| service_cpu_utilization_threshold_critical    | Critical threshold for the Service CPU Utilization monitor                            | `string`       | `"90"`      |    no    |
| service_cpu_utilization_threshold_warning     | Warning threshold for the Service CPU Utilization monitor                             | `string`       | `"80"`      |    no    |
| service_cpu_utilization_time_aggregator       | Monitor aggregator for Service CPU Utilization [available values: min, max or avg]    | `string`       | `"min"`     |    no    |
| service_cpu_utilization_timeframe             | Timeframe for the Service CPU Utilization monitor                                     | `string`       | `"last_5m"` |    no    |
| service_memory_utilization_enabled            | Flag to enable Service Memory Utilization monitor                                     | `string`       | `"false"`   |    no    |
| service_memory_utilization_extra_tags         | Extra tags for Service Memory Utilization monitor                                     | `list(string)` | `[]`        |    no    |
| service_memory_utilization_message            | Custom message for the Service Memory Utilization monitor                             | `string`       | `""`        |    no    |
| service_memory_utilization_threshold_critical | Critical threshold for the Service Memory Utilization monitor                         | `string`       | `90`        |    no    |
| service_memory_utilization_threshold_warning  | Warning threshold for the Service Memory Utilization monitor                          | `string`       | `85`        |    no    |
| service_memory_utilization_time_aggregator    | Monitor aggregator for Service Memory Utilization [available values: min, max or avg] | `string`       | `"min"`     |    no    |
| service_memory_utilization_timeframe          | Timeframe for the Service Memory Utilization monitor                                  | `string`       | `"last_5m"` |    no    |
| service_missing_tasks_enabled                 | Flag to enable Service Missing Tasks monitor                                          | `string`       | `"true"`    |    no    |
| service_missing_tasks_extra_tags              | Extra tags for Service Missing Tasks monitor                                          | `list(string)` | `[]`        |    no    |
| service_missing_tasks_message                 | Custom message for the Service Missing Tasks monitor                                  | `string`       | `""`        |    no    |
| service_missing_tasks_threshold_critical      | Critical threshold for the Service Missing Tasks monitor                              | `string`       | `60`        |    no    |
| service_missing_tasks_threshold_warning       | Warning threshold for the Service Missing Tasks monitor                               | `string`       | `80`        |    no    |
| service_missing_tasks_time_aggregator         | Monitor aggregator for Service Missing Tasks [available values: min, max or avg]      | `string`       | `"min"`     |    no    |
| service_missing_tasks_timeframe               | Timeframe for the Service Missing Tasks monitor                                       | `string`       | `"last_5m"` |    no    |

## Outputs

| Name                          | Description                               |
| ----------------------------- | ----------------------------------------- |
| service_cpu_utilization_id    | id for monitor service_cpu_utilization    |
| service_memory_utilization_id | id for monitor service_memory_utilization |
| service_missing_tasks_id      | id for monitor service_missing_tasks      |

## Related documentation
