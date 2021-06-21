# DATABASE REDIS DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-database-redis" {
  source      = "claranet/monitors/datadog//database/redis"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Redis blocked clients
- Redis does not respond
- Redis evicted keys
- Redis expired keys
- Redis hitrate
- Redis keyspace seems full (no changes since ${var.keyspace_timeframe})
- Redis latency
- Redis memory fragmented
- Redis memory used
- Redis rejected connections

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                                  | Description                                                                                                                                       | Type           | Default     | Required |
| ------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------- | -------------- | ----------- | :------: |
| blocked_clients_enabled               | Flag to enable Redis Blocked clients monitor                                                                                                      | `string`       | `"true"`    |    no    |
| blocked_clients_extra_tags            | Extra tags for Redis Blocked clients monitor                                                                                                      | `list(string)` | `[]`        |    no    |
| blocked_clients_message               | Custom message for Redis Blocked clients monitor                                                                                                  | `string`       | `""`        |    no    |
| blocked_clients_threshold_critical    | Blocked clients rate (critical threshold)                                                                                                         | `number`       | `30`        |    no    |
| blocked_clients_threshold_warning     | Blocked clients rate (warning threshold)                                                                                                          | `number`       | `10`        |    no    |
| blocked_clients_time_aggregator       | Monitor aggregator for Redis Blocked clients [available values: min, max or avg]                                                                  | `string`       | `"min"`     |    no    |
| blocked_clients_timeframe             | Monitor timeframe for Redis Blocked clients [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]             | `string`       | `"last_5m"` |    no    |
| environment                           | Architecture environment                                                                                                                          | `string`       | n/a         |   yes    |
| evaluation_delay                      | Delay in seconds for the metric evaluation                                                                                                        | `number`       | `15`        |    no    |
| evictedkeys_change_enabled            | Flag to enable Redis evicted keys monitor                                                                                                         | `string`       | `"true"`    |    no    |
| evictedkeys_change_extra_tags         | Extra tags for Redis evicted keys monitor                                                                                                         | `list(string)` | `[]`        |    no    |
| evictedkeys_change_message            | Custom message for Redis evicted keys monitor                                                                                                     | `string`       | `""`        |    no    |
| evictedkeys_change_threshold_critical | Evicted keys change (critical threshold)                                                                                                          | `number`       | `100`       |    no    |
| evictedkeys_change_threshold_warning  | Evicted keys change (warning threshold)                                                                                                           | `number`       | `20`        |    no    |
| evictedkeys_change_time_aggregator    | Monitor aggregator for Redis evicted keys [available values: min, max or avg]                                                                     | `string`       | `"avg"`     |    no    |
| evictedkeys_change_timeframe          | Monitor timeframe for Redis evicted keys [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]                | `string`       | `"last_5m"` |    no    |
| expirations_rate_enabled              | Flag to enable Redis keys expirations monitor                                                                                                     | `string`       | `"true"`    |    no    |
| expirations_rate_extra_tags           | Extra tags for Redis keys expirations monitor                                                                                                     | `list(string)` | `[]`        |    no    |
| expirations_rate_message              | Custom message for Redis keys expirations monitor                                                                                                 | `string`       | `""`        |    no    |
| expirations_rate_threshold_critical   | Expirations percent (critical threshold)                                                                                                          | `number`       | `80`        |    no    |
| expirations_rate_threshold_warning    | Expirations percent (warning threshold)                                                                                                           | `number`       | `60`        |    no    |
| expirations_rate_time_aggregator      | Monitor aggregator for Redis keys expirations [available values: min, max or avg]                                                                 | `string`       | `"min"`     |    no    |
| expirations_rate_timeframe            | Monitor timeframe for Redis keys expirations [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]            | `string`       | `"last_5m"` |    no    |
| filter_tags_custom                    | Tags used for custom filtering when filter_tags_use_defaults is false                                                                             | `string`       | `"*"`       |    no    |
| filter_tags_custom_excluded           | Tags excluded for custom filtering when filter_tags_use_defaults is false                                                                         | `string`       | `""`        |    no    |
| filter_tags_use_defaults              | Use default filter tags convention                                                                                                                | `string`       | `"true"`    |    no    |
| hitrate_enabled                       | Flag to enable Redis hitrate monitor                                                                                                              | `string`       | `"true"`    |    no    |
| hitrate_extra_tags                    | Extra tags for Redis hitrate monitor                                                                                                              | `list(string)` | `[]`        |    no    |
| hitrate_message                       | Custom message for Redis hitrate monitor                                                                                                          | `string`       | `""`        |    no    |
| hitrate_threshold_critical            | hitrate limit (critical threshold)                                                                                                                | `number`       | `10`        |    no    |
| hitrate_threshold_warning             | hitrate limit (warning threshold)                                                                                                                 | `number`       | `30`        |    no    |
| hitrate_time_aggregator               | Monitor aggregator for Redis hitrate [available values: min, max or avg]                                                                          | `string`       | `"max"`     |    no    |
| hitrate_timeframe                     | Monitor timeframe for Redis hitrate [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]                     | `string`       | `"last_5m"` |    no    |
| keyspace_enabled                      | Flag to enable Redis keyspace monitor                                                                                                             | `string`       | `"true"`    |    no    |
| keyspace_extra_tags                   | Extra tags for Redis keyspace monitor                                                                                                             | `list(string)` | `[]`        |    no    |
| keyspace_message                      | Custom message for Redis keyspace monitor                                                                                                         | `string`       | `""`        |    no    |
| keyspace_threshold_critical           | Keyspace no changement (critical threshold)                                                                                                       | `number`       | `0`         |    no    |
| keyspace_threshold_warning            | Keyspace no changement (warning threshold)                                                                                                        | `number`       | `1`         |    no    |
| keyspace_time_aggregator              | Monitor aggregator for Redis keyspace [available values: min, max or avg]                                                                         | `string`       | `"min"`     |    no    |
| keyspace_timeframe                    | Monitor timeframe for Redis keyspace [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]                    | `string`       | `"last_5m"` |    no    |
| latency_enabled                       | Flag to enable Redis latency monitor                                                                                                              | `string`       | `"true"`    |    no    |
| latency_extra_tags                    | Extra tags for Redis latency monitor                                                                                                              | `list(string)` | `[]`        |    no    |
| latency_message                       | Custom message for Redis latency monitor                                                                                                          | `string`       | `""`        |    no    |
| latency_threshold_critical            | latency limit (critical threshold)                                                                                                                | `number`       | `100`       |    no    |
| latency_threshold_warning             | latency limit (warning threshold)                                                                                                                 | `number`       | `50`        |    no    |
| latency_time_aggregator               | Monitor aggregator for Redis latency [available values: min, max or avg]                                                                          | `string`       | `"min"`     |    no    |
| latency_timeframe                     | Monitor timeframe for Redis latency [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]                     | `string`       | `"last_5m"` |    no    |
| mem_frag_enabled                      | Flag to enable Redis memory RAM fragmentation monitor                                                                                             | `string`       | `"true"`    |    no    |
| mem_frag_extra_tags                   | Extra tags for Redis memory RAM fragmentation monitor                                                                                             | `list(string)` | `[]`        |    no    |
| mem_frag_message                      | Custom message for Redis memory RAM fragmentation monitor                                                                                         | `string`       | `""`        |    no    |
| mem_frag_threshold_critical           | memory RAM fragmentation limit (critical threshold)                                                                                               | `number`       | `150`       |    no    |
| mem_frag_threshold_warning            | memory RAM fragmentation limit (warning threshold)                                                                                                | `number`       | `130`       |    no    |
| mem_frag_time_aggregator              | Monitor aggregator for Redis memory RAM fragmentation [available values: min, max or avg]                                                         | `string`       | `"min"`     |    no    |
| mem_frag_timeframe                    | Monitor timeframe for Redis memory RAM fragmentation [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]    | `string`       | `"last_5m"` |    no    |
| mem_used_enabled                      | Flag to enable Redis RAM memory used monitor                                                                                                      | `string`       | `"true"`    |    no    |
| mem_used_extra_tags                   | Extra tags for Redis RAM memory used monitor                                                                                                      | `list(string)` | `[]`        |    no    |
| mem_used_message                      | Custom message for Redis RAM memory used monitor                                                                                                  | `string`       | `""`        |    no    |
| mem_used_threshold_critical           | RAM memory used limit (critical threshold)                                                                                                        | `number`       | `95`        |    no    |
| mem_used_threshold_warning            | RAM memory used limit (warning threshold)                                                                                                         | `number`       | `85`        |    no    |
| mem_used_time_aggregator              | Monitor aggregator for Redis RAM memory used [available values: min, max or avg]                                                                  | `string`       | `"min"`     |    no    |
| mem_used_timeframe                    | Monitor timeframe for Redis RAM memory used [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]             | `string`       | `"last_5m"` |    no    |
| message                               | Message sent when a Redis monitor is triggered                                                                                                    | `any`          | n/a         |   yes    |
| new_host_delay                        | Delay in seconds for the metric evaluation                                                                                                        | `number`       | `300`       |    no    |
| not_responding_enabled                | Flag to enable Redis does not respond monitor                                                                                                     | `string`       | `"true"`    |    no    |
| not_responding_extra_tags             | Extra tags for Redis does not respond monitor                                                                                                     | `list(string)` | `[]`        |    no    |
| not_responding_message                | Custom message for Redis does not respond monitor                                                                                                 | `string`       | `""`        |    no    |
| not_responding_no_data_timeframe      | Redis does not respond monitor no data timeframe                                                                                                  | `string`       | `10`        |    no    |
| not_responding_threshold_warning      | Redis does not respond monitor (warning threshold)                                                                                                | `string`       | `3`         |    no    |
| notify_no_data                        | Will raise no data alert if set to true                                                                                                           | `bool`         | `true`      |    no    |
| prefix_slug                           | Prefix string to prepend between brackets on every monitors names                                                                                 | `string`       | `""`        |    no    |
| rejected_con_enabled                  | Flag to enable Redis rejected connections errors monitor                                                                                          | `string`       | `"true"`    |    no    |
| rejected_con_extra_tags               | Extra tags for Redis rejected connections errors monitor                                                                                          | `list(string)` | `[]`        |    no    |
| rejected_con_message                  | Custom message for Redis rejected connections errors monitor                                                                                      | `string`       | `""`        |    no    |
| rejected_con_threshold_critical       | rejected connections errors limit (critical threshold)                                                                                            | `number`       | `50`        |    no    |
| rejected_con_threshold_warning        | rejected connections errors limit (warning threshold)                                                                                             | `number`       | `10`        |    no    |
| rejected_con_time_aggregator          | Monitor aggregator for Redis rejected connections errors [available values: min, max or avg]                                                      | `string`       | `"min"`     |    no    |
| rejected_con_timeframe                | Monitor timeframe for Redis rejected connections errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string`       | `"last_5m"` |    no    |

## Outputs

| Name                    | Description                         |
| ----------------------- | ----------------------------------- |
| blocked_clients_id      | id for monitor blocked_clients      |
| evicted_keys_id         | id for monitor evicted_keys         |
| expirations_id          | id for monitor expirations          |
| hitrate_id              | id for monitor hitrate              |
| keyspace_full_id        | id for monitor keyspace_full        |
| latency_id              | id for monitor latency              |
| memory_frag_id          | id for monitor memory_frag          |
| memory_used_id          | id for monitor memory_used          |
| not_responding_id       | id for monitor not_responding       |
| rejected_connections_id | id for monitor rejected_connections |

## Related documentation

[Datadog blog: How to monitor Redis](https://www.datadoghq.com/blog/how-to-monitor-redis-performance-metrics/)

[Datadog Redis integration doc](https://docs.datadoghq.com/integrations/redisdb/)
