# CLOUD AWS ELASTICACHE COMMON DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-aws-elasticache-common" {
  source      = "claranet/monitors/datadog//cloud/aws/elasticache/common"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Elasticache connections
- Elasticache eviction
- Elasticache evictions is growing
- Elasticache free memory
- Elasticache max connections reached
- Elasticache swap

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                                         | Description                                                                                                                                            | Type           | Default      | Required |
| -------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------ | -------------- | ------------ | :------: |
| elasticache_max_connection_no_data_timeframe | Number of minutes before reporting no data                                                                                                             | `string`       | `10`         |    no    |
| environment                                  | Infrastructure Environment                                                                                                                             | `string`       | n/a          |   yes    |
| evaluation_delay                             | Delay in seconds for the metric evaluation                                                                                                             | `number`       | `900`        |    no    |
| eviction_enabled                             | Flag to enable Elasticache eviction monitor                                                                                                            | `string`       | `"true"`     |    no    |
| eviction_extra_tags                          | Extra tags for Elasticache eviction monitor                                                                                                            | `list(string)` | `[]`         |    no    |
| eviction_growing_condition_timeframe         | Monitor condition timeframe for Elasticache eviction growing [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string`       | `"last_5m"`  |    no    |
| eviction_growing_enabled                     | Flag to enable Elasticache eviction growing monitor                                                                                                    | `string`       | `"true"`     |    no    |
| eviction_growing_extra_tags                  | Extra tags for Elasticache eviction growing monitor                                                                                                    | `list(string)` | `[]`         |    no    |
| eviction_growing_message                     | Custom message for Elasticache eviction growing monitor                                                                                                | `string`       | `""`         |    no    |
| eviction_growing_threshold_critical          | Elasticache eviction growing critical threshold in percentage                                                                                          | `string`       | `30`         |    no    |
| eviction_growing_threshold_warning           | Elasticache eviction growing warning threshold in percentage                                                                                           | `string`       | `10`         |    no    |
| eviction_growing_timeframe                   | Monitor timeframe for Elasticache eviction growing [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]           | `string`       | `"last_5m"`  |    no    |
| eviction_message                             | Custom message for Elasticache eviction monitor                                                                                                        | `string`       | `""`         |    no    |
| eviction_threshold_critical                  | Elasticache free memory critical threshold in percentage                                                                                               | `string`       | `30`         |    no    |
| eviction_threshold_warning                   | Elasticache free memory warning threshold in percentage                                                                                                | `string`       | `0`          |    no    |
| eviction_timeframe                           | Monitor timeframe for Elasticache eviction [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]                   | `string`       | `"last_15m"` |    no    |
| filter_tags_custom                           | Tags used for custom filtering when filter_tags_use_defaults is false                                                                                  | `string`       | `"*"`        |    no    |
| filter_tags_custom_excluded                  | Tags excluded for custom filtering when filter_tags_use_defaults is false                                                                              | `string`       | `""`         |    no    |
| filter_tags_use_defaults                     | Use default filter tags convention                                                                                                                     | `string`       | `"true"`     |    no    |
| free_memory_condition_timeframe              | Monitor condition timeframe for Elasticache free memory [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]      | `string`       | `"last_15m"` |    no    |
| free_memory_enabled                          | Flag to enable Elasticache free memory monitor                                                                                                         | `string`       | `"true"`     |    no    |
| free_memory_extra_tags                       | Extra tags for Elasticache free memory monitor                                                                                                         | `list(string)` | `[]`         |    no    |
| free_memory_message                          | Custom message for Elasticache free memory monitor                                                                                                     | `string`       | `""`         |    no    |
| free_memory_threshold_critical               | Elasticache free memory critical threshold in percentage                                                                                               | `string`       | `-70`        |    no    |
| free_memory_threshold_warning                | Elasticache free memory warning threshold in percentage                                                                                                | `string`       | `-50`        |    no    |
| free_memory_timeframe                        | Monitor timeframe for Elasticache free memory [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]                | `string`       | `"last_15m"` |    no    |
| max_connection_enabled                       | Flag to enable Elasticache max connection monitor                                                                                                      | `string`       | `"true"`     |    no    |
| max_connection_extra_tags                    | Extra tags for Elasticache max connection monitor                                                                                                      | `list(string)` | `[]`         |    no    |
| max_connection_message                       | Custom message for Elasticache max connection monitor                                                                                                  | `string`       | `""`         |    no    |
| max_connection_time_aggregator               | Monitor aggregator for Elasticache max connection [available values: min, max or avg]                                                                  | `string`       | `"max"`      |    no    |
| max_connection_timeframe                     | Monitor timeframe for Elasticache max connection [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]             | `string`       | `"last_5m"`  |    no    |
| message                                      | Message sent when an alert is triggered                                                                                                                | `any`          | n/a          |   yes    |
| new_host_delay                               | Delay in seconds before monitor new resource                                                                                                           | `number`       | `300`        |    no    |
| no_connection_enabled                        | Flag to enable Elasticache no connection monitor                                                                                                       | `string`       | `"true"`     |    no    |
| no_connection_extra_tags                     | Extra tags for Elasticache no connection monitor                                                                                                       | `list(string)` | `[]`         |    no    |
| no_connection_message                        | Custom message for Elasticache no connection monitor                                                                                                   | `string`       | `""`         |    no    |
| no_connection_time_aggregator                | Monitor aggregator for Elasticache no connection [available values: min, max or avg]                                                                   | `string`       | `"min"`      |    no    |
| no_connection_timeframe                      | Monitor timeframe for Elasticache no connection [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]              | `string`       | `"last_5m"`  |    no    |
| notify_no_data                               | Will raise no data alert if set to true                                                                                                                | `bool`         | `true`       |    no    |
| prefix_slug                                  | Prefix string to prepend between brackets on every monitors names                                                                                      | `string`       | `""`         |    no    |
| swap_enabled                                 | Flag to enable Elasticache swap monitor                                                                                                                | `string`       | `"true"`     |    no    |
| swap_extra_tags                              | Extra tags for Elasticache swap monitor                                                                                                                | `list(string)` | `[]`         |    no    |
| swap_message                                 | Custom message for Elasticache swap monitor                                                                                                            | `string`       | `""`         |    no    |
| swap_threshold_critical                      | Elasticache swap critical threshold in bytes                                                                                                           | `string`       | `50000000`   |    no    |
| swap_threshold_warning                       | Elasticache swap warning threshold in bytes                                                                                                            | `string`       | `0`          |    no    |
| swap_time_aggregator                         | Monitor aggregator for Elasticache memcached swap [available values: min, max or avg]                                                                  | `string`       | `"min"`      |    no    |
| swap_timeframe                               | Monitor timeframe for Elasticache swap [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]                       | `string`       | `"last_5m"`  |    no    |

## Outputs

| Name                            | Description                                 |
| ------------------------------- | ------------------------------------------- |
| elasticache_eviction_growing_id | id for monitor elasticache_eviction_growing |
| elasticache_eviction_id         | id for monitor elasticache_eviction         |
| elasticache_free_memory_id      | id for monitor elasticache_free_memory      |
| elasticache_max_connection_id   | id for monitor elasticache_max_connection   |
| elasticache_no_connection_id    | id for monitor elasticache_no_connection    |
| elasticache_swap_id             | id for monitor elasticache_swap             |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/amazon_elasticache/](https://docs.datadoghq.com/integrations/amazon_elasticache/)
