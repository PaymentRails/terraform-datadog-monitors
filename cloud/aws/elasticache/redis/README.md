# CLOUD AWS ELASTICACHE REDIS DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-aws-elasticache-redis" {
  source      = "claranet/monitors/datadog//cloud/aws/elasticache/redis"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Elasticache redis cache hit ratio
- Elasticache redis CPU
- Elasticache redis is receiving no commands
- Elasticache redis replication lag

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                               | Description                                                                                                                                       | Type           | Default      | Required |
| ---------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------- | -------------- | ------------ | :------: |
| cache_hits_enabled                 | Flag to enable Elasticache redis cache hits monitor                                                                                               | `string`       | `"true"`     |    no    |
| cache_hits_extra_tags              | Extra tags for Elasticache redis cache hits monitor                                                                                               | `list(string)` | `[]`         |    no    |
| cache_hits_message                 | Custom message for Elasticache redis cache hits monitor                                                                                           | `string`       | `""`         |    no    |
| cache_hits_threshold_critical      | Elasticache redis cache hits critical threshold in percentage                                                                                     | `string`       | `60`         |    no    |
| cache_hits_threshold_warning       | Elasticache redis cache hits warning threshold in percentage                                                                                      | `string`       | `80`         |    no    |
| cache_hits_time_aggregator         | Monitor aggregator for Elasticache redis cache hits [available values: min, max or avg]                                                           | `string`       | `"max"`      |    no    |
| cache_hits_timeframe               | Monitor timeframe for Elasticache redis cache hits [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]      | `string`       | `"last_15m"` |    no    |
| commands_enabled                   | Flag to enable Elasticache redis commands monitor                                                                                                 | `string`       | `"true"`     |    no    |
| commands_extra_tags                | Extra tags for Elasticache redis commands monitor                                                                                                 | `list(string)` | `[]`         |    no    |
| commands_message                   | Custom message for Elasticache redis commands monitor                                                                                             | `string`       | `""`         |    no    |
| commands_timeframe                 | Monitor timeframe for Elasticache redis commands [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]        | `string`       | `"last_5m"`  |    no    |
| cpu_high_enabled                   | Flag to enable Elasticache redis cpu high monitor                                                                                                 | `string`       | `"true"`     |    no    |
| cpu_high_extra_tags                | Extra tags for Elasticache redis cpu high monitor                                                                                                 | `list(string)` | `[]`         |    no    |
| cpu_high_message                   | Custom message for Elasticache redis cpu high monitor                                                                                             | `string`       | `""`         |    no    |
| cpu_high_threshold_critical        | Elasticache redis cpu high critical threshold in percentage                                                                                       | `string`       | `90`         |    no    |
| cpu_high_threshold_warning         | Elasticache redis cpu high warning threshold in percentage                                                                                        | `string`       | `75`         |    no    |
| cpu_high_time_aggregator           | Monitor aggregator for Elasticache redis cpu high [available values: min, max or avg]                                                             | `string`       | `"min"`      |    no    |
| cpu_high_timeframe                 | Monitor timeframe for Elasticache redis cpu high [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]        | `string`       | `"last_15m"` |    no    |
| environment                        | Infrastructure Environment                                                                                                                        | `string`       | n/a          |   yes    |
| evaluation_delay                   | Delay in seconds for the metric evaluation                                                                                                        | `number`       | `900`        |    no    |
| filter_tags_custom                 | Tags used for custom filtering when filter_tags_use_defaults is false                                                                             | `string`       | `"*"`        |    no    |
| filter_tags_custom_excluded        | Tags excluded for custom filtering when filter_tags_use_defaults is false                                                                         | `string`       | `""`         |    no    |
| filter_tags_use_defaults           | Use default filter tags convention                                                                                                                | `string`       | `"true"`     |    no    |
| message                            | Message sent when an alert is triggered                                                                                                           | `any`          | n/a          |   yes    |
| new_host_delay                     | Delay in seconds before monitor new resource                                                                                                      | `number`       | `300`        |    no    |
| notify_no_data                     | Will raise no data alert if set to true                                                                                                           | `bool`         | `true`       |    no    |
| prefix_slug                        | Prefix string to prepend between brackets on every monitors names                                                                                 | `string`       | `""`         |    no    |
| redis_cpu_high_no_data_timeframe   | Number of minutes before reporting no data                                                                                                        | `string`       | `30`         |    no    |
| replication_lag_enabled            | Flag to enable Elasticache redis replication lag monitor                                                                                          | `string`       | `"true"`     |    no    |
| replication_lag_extra_tags         | Extra tags for Elasticache redis replication lag monitor                                                                                          | `list(string)` | `[]`         |    no    |
| replication_lag_message            | Custom message for Elasticache redis replication lag monitor                                                                                      | `string`       | `""`         |    no    |
| replication_lag_threshold_critical | Elasticache redis replication lag critical threshold in seconds                                                                                   | `string`       | `180`        |    no    |
| replication_lag_threshold_warning  | Elasticache redis replication lag warning threshold in seconds                                                                                    | `string`       | `90`         |    no    |
| replication_lag_time_aggregator    | Monitor aggregator for Elasticache redis replication lag [available values: min, max or avg]                                                      | `string`       | `"min"`      |    no    |
| replication_lag_timeframe          | Monitor timeframe for Elasticache redis replication lag [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string`       | `"last_10m"` |    no    |

## Outputs

| Name                     | Description                          |
| ------------------------ | ------------------------------------ |
| redis_cache_hits_id      | id for monitor redis_cache_hits      |
| redis_commands_id        | id for monitor redis_commands        |
| redis_cpu_high_id        | id for monitor redis_cpu_high        |
| redis_replication_lag_id | id for monitor redis_replication_lag |

## Related documentation

- [https://docs.datadoghq.com/integrations/amazon_elasticache/](https://docs.datadoghq.com/integrations/amazon_elasticache/)
- [https://www.datadoghq.com/blog/monitoring-elasticache-performance-metrics-with-redis-or-memcached/](https://www.datadoghq.com/blog/monitoring-elasticache-performance-metrics-with-redis-or-memcached/)
