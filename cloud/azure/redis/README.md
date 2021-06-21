# CLOUD AZURE REDIS DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-azure-redis" {
  source      = "claranet/monitors/datadog//cloud/azure/redis"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Redis {{name}} is down
- Redis processor time too high
- Redis server load too high
- Redis too many evictedkeys

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                                      | Description                                                                                                                        | Type           | Default     | Required |
| ----------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------- | -------------- | ----------- | :------: |
| environment                               | Architecture environment                                                                                                           | `string`       | n/a         |   yes    |
| evaluation_delay                          | Delay in seconds for the metric evaluation                                                                                         | `number`       | `900`       |    no    |
| evictedkeys_limit_enabled                 | Flag to enable Redis evicted keys monitor                                                                                          | `string`       | `"true"`    |    no    |
| evictedkeys_limit_extra_tags              | Extra tags for Redis evicted keys monitor                                                                                          | `list(string)` | `[]`        |    no    |
| evictedkeys_limit_message                 | Custom message for Redis evicted keys monitor                                                                                      | `string`       | `""`        |    no    |
| evictedkeys_limit_threshold_critical      | Evicted keys limit (critical threshold)                                                                                            | `number`       | `100`       |    no    |
| evictedkeys_limit_threshold_warning       | Evicted keys limit (warning threshold)                                                                                             | `number`       | `0`         |    no    |
| evictedkeys_limit_time_aggregator         | Monitor aggregator for Redis evicted keys [available values: min, max or avg]                                                      | `string`       | `"avg"`     |    no    |
| evictedkeys_limit_timeframe               | Monitor timeframe for Redis evicted keys [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string`       | `"last_5m"` |    no    |
| filter_tags_custom                        | Tags used for custom filtering when filter_tags_use_defaults is false                                                              | `string`       | `"*"`       |    no    |
| filter_tags_custom_excluded               | Tags excluded for custom filtering when filter_tags_use_defaults is false                                                          | `string`       | `""`        |    no    |
| filter_tags_use_defaults                  | Use default filter tags convention                                                                                                 | `string`       | `"true"`    |    no    |
| message                                   | Message sent when a Redis monitor is triggered                                                                                     | `any`          | n/a         |   yes    |
| new_host_delay                            | Delay in seconds before monitor new resource                                                                                       | `number`       | `300`       |    no    |
| notify_no_data                            | Will raise no data alert if set to true                                                                                            | `bool`         | `true`      |    no    |
| percent_processor_time_enabled            | Flag to enable Redis processor monitor                                                                                             | `string`       | `"true"`    |    no    |
| percent_processor_time_extra_tags         | Extra tags for Redis processor monitor                                                                                             | `list(string)` | `[]`        |    no    |
| percent_processor_time_message            | Custom message for Redis processor monitor                                                                                         | `string`       | `""`        |    no    |
| percent_processor_time_threshold_critical | Processor time percent (critical threshold)                                                                                        | `number`       | `80`        |    no    |
| percent_processor_time_threshold_warning  | Processor time percent (warning threshold)                                                                                         | `number`       | `60`        |    no    |
| percent_processor_time_time_aggregator    | Monitor aggregator for Redis processor [available values: min, max or avg]                                                         | `string`       | `"min"`     |    no    |
| percent_processor_time_timeframe          | Monitor timeframe for Redis processor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]    | `string`       | `"last_5m"` |    no    |
| prefix_slug                               | Prefix string to prepend between brackets on every monitors names                                                                  | `string`       | `""`        |    no    |
| server_load_rate_enabled                  | Flag to enable Redis server load monitor                                                                                           | `string`       | `"true"`    |    no    |
| server_load_rate_extra_tags               | Extra tags for Redis server load monitor                                                                                           | `list(string)` | `[]`        |    no    |
| server_load_rate_message                  | Custom message for Redis server load monitor                                                                                       | `string`       | `""`        |    no    |
| server_load_rate_threshold_critical       | Server CPU load rate (critical threshold)                                                                                          | `number`       | `90`        |    no    |
| server_load_rate_threshold_warning        | Server CPU load rate (warning threshold)                                                                                           | `number`       | `70`        |    no    |
| server_load_rate_time_aggregator          | Monitor aggregator for Redis server load [available values: min, max or avg]                                                       | `string`       | `"min"`     |    no    |
| server_load_rate_timeframe                | Monitor timeframe for Redis server load [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]  | `string`       | `"last_5m"` |    no    |
| status_enabled                            | Flag to enable Redis status monitor                                                                                                | `string`       | `"true"`    |    no    |
| status_extra_tags                         | Extra tags for Redis status monitor                                                                                                | `list(string)` | `[]`        |    no    |
| status_message                            | Custom message for Redis status monitor                                                                                            | `string`       | `""`        |    no    |
| status_no_data_timeframe                  | Number of minutes before reporting no data                                                                                         | `string`       | `10`        |    no    |
| status_time_aggregator                    | Monitor aggregator for Redis status [available values: min, max or avg]                                                            | `string`       | `"max"`     |    no    |
| status_timeframe                          | Monitor timeframe for Redis status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]       | `string`       | `"last_5m"` |    no    |

## Outputs

| Name                      | Description                           |
| ------------------------- | ------------------------------------- |
| evictedkeys_id            | id for monitor evictedkeys            |
| percent_processor_time_id | id for monitor percent_processor_time |
| server_load_id            | id for monitor server_load            |
| status_id                 | id for monitor status                 |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/azure_redis_cache/](https://docs.datadoghq.com/integrations/azure_redis_cache/)

Azure Redis metrics documentation: [https://docs.microsoft.com/en-us/azure/redis-cache/cache-how-to-monitor](https://docs.microsoft.com/en-us/azure/redis-cache/cache-how-to-monitor)
