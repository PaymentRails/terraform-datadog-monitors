# CLOUD GCP MEMORYSTORE REDIS DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-gcp-memorystore-redis" {
  source      = "claranet/monitors/datadog//cloud/gcp/memorystore/redis"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Memorystore Redis system memory usage ratio

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                                         | Description                                                             | Type           | Default      | Required |
| -------------------------------------------- | ----------------------------------------------------------------------- | -------------- | ------------ | :------: |
| environment                                  | Architecture environment                                                | `string`       | n/a          |   yes    |
| evaluation_delay                             | Delay in seconds for the metric evaluation                              | `number`       | `900`        |    no    |
| filter_tags                                  | Tags used for filtering                                                 | `string`       | `"*"`        |    no    |
| message                                      | Message sent when a monitor is triggered                                | `any`          | n/a          |   yes    |
| new_host_delay                               | Delay in seconds for the new host evaluation                            | `number`       | `300`        |    no    |
| notify_no_data                               | Will raise no data alert if set to true                                 | `bool`         | `true`       |    no    |
| prefix_slug                                  | Prefix string to prepend between brackets on every monitors names       | `string`       | `""`         |    no    |
| system_memory_usage_ratio_enabled            | Flag to enable GCP Memorystore Redis System memory usage ratio monitor  | `string`       | `"true"`     |    no    |
| system_memory_usage_ratio_extra_tags         | Extra tags for GCP Memorystore Redis System memory usage ratio monitor  | `list(string)` | `[]`         |    no    |
| system_memory_usage_ratio_message            | Custom message for Memorystore Redis System memory usage ratio monitor  | `string`       | `""`         |    no    |
| system_memory_usage_ratio_no_data_timeframe  | Number of minutes before reporting no data                              | `string`       | `20`         |    no    |
| system_memory_usage_ratio_threshold_critical | Memorystore Redis System memory usage ratio critical threshold          | `string`       | `90`         |    no    |
| system_memory_usage_ratio_threshold_warning  | Memorystore Redis System memory usage ratio warning threshold           | `string`       | `80`         |    no    |
| system_memory_usage_ratio_time_aggregator    | Time aggregator for Memorystore Redis System memory usage ratio monitor | `string`       | `"min"`      |    no    |
| system_memory_usage_ratio_timeframe          | Timeframe for Memorystore Redis System memory usage ratio monitor       | `string`       | `"last_10m"` |    no    |

## Outputs

| Name                         | Description                              |
| ---------------------------- | ---------------------------------------- |
| system_memory_usage_ratio_id | id for monitor system_memory_usage_ratio |

## Related documentation

- [GCP Metrics for Memorystore Redis](https://cloud.google.com/monitoring/api/metrics_gcp#gcp-redis)
- [Datadog integration for GCP Memorystore Redis](https://docs.datadoghq.com/integrations/google_cloud_redis/)
- [Memory management best practices](https://cloud.google.com/memorystore/docs/redis/memory-management-best-practices#monitor_your_instances_memory_usage)
- [Monitoring System memory usage ratio](https://cloud.google.com/memorystore/docs/redis/memory-management-best-practices#system_memory_usage_ratio_2)
