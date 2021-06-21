# CLOUD AWS ELASTICACHE MEMCACHED DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-aws-elasticache-memcached" {
  source      = "claranet/monitors/datadog//cloud/aws/elasticache/memcached"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Elasticache memcached cache hit ratio
- Elasticache memcached CPU

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                                 | Description                                                                                                                                    | Type           | Default      | Required |
| ------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------- | -------------- | ------------ | :------: |
| cpu_high_enabled                     | Flag to enable Elasticache memcached cpu high monitor                                                                                          | `string`       | `"true"`     |    no    |
| cpu_high_extra_tags                  | Extra tags for Elasticache memcached cpu high monitor                                                                                          | `list(string)` | `[]`         |    no    |
| cpu_high_message                     | Custom message for Elasticache memcached cpu high monitor                                                                                      | `string`       | `""`         |    no    |
| cpu_high_threshold_critical          | Elasticache memcached cpu high critical threshold in percentage                                                                                | `string`       | `90`         |    no    |
| cpu_high_threshold_warning           | Elasticache memcached cpu high warning threshold in percentage                                                                                 | `string`       | `75`         |    no    |
| cpu_high_time_aggregator             | Monitor aggregator for Elasticache memcached cpu high [available values: min, max or avg]                                                      | `string`       | `"min"`      |    no    |
| cpu_high_timeframe                   | Monitor timeframe for Elasticache memcached cpu high [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string`       | `"last_15m"` |    no    |
| environment                          | Infrastructure Environment                                                                                                                     | `string`       | n/a          |   yes    |
| evaluation_delay                     | Delay in seconds for the metric evaluation                                                                                                     | `number`       | `900`        |    no    |
| filter_tags_custom                   | Tags used for custom filtering when filter_tags_use_defaults is false                                                                          | `string`       | `"*"`        |    no    |
| filter_tags_custom_excluded          | Tags excluded for custom filtering when filter_tags_use_defaults is false                                                                      | `string`       | `""`         |    no    |
| filter_tags_use_defaults             | Use default filter tags convention                                                                                                             | `string`       | `"true"`     |    no    |
| get_hits_enabled                     | Flag to enable Elasticache memcached get hits monitor                                                                                          | `string`       | `"true"`     |    no    |
| get_hits_extra_tags                  | Extra tags for Elasticache memcached get hits monitor                                                                                          | `list(string)` | `[]`         |    no    |
| get_hits_message                     | Custom message for Elasticache memcached get hits monitor                                                                                      | `string`       | `""`         |    no    |
| get_hits_threshold_critical          | Elasticache memcached get hits critical threshold in percentage                                                                                | `string`       | `60`         |    no    |
| get_hits_threshold_warning           | Elasticache memcached get hits warning threshold in percentage                                                                                 | `string`       | `80`         |    no    |
| get_hits_time_aggregator             | Monitor aggregator for Elasticache memcached get hits [available values: min, max or avg]                                                      | `string`       | `"max"`      |    no    |
| get_hits_timeframe                   | Monitor timeframe for Elasticache memcached get hits [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string`       | `"last_15m"` |    no    |
| memcached_cpu_high_no_data_timeframe | Number of minutes before reporting no data                                                                                                     | `string`       | `30`         |    no    |
| message                              | Message sent when an alert is triggered                                                                                                        | `any`          | n/a          |   yes    |
| new_host_delay                       | Delay in seconds before monitor new resource                                                                                                   | `number`       | `300`        |    no    |
| notify_no_data                       | Will raise no data alert if set to true                                                                                                        | `bool`         | `true`       |    no    |
| prefix_slug                          | Prefix string to prepend between brackets on every monitors names                                                                              | `string`       | `""`         |    no    |

## Outputs

| Name                  | Description                       |
| --------------------- | --------------------------------- |
| memcached_cpu_high_id | id for monitor memcached_cpu_high |
| memcached_get_hits_id | id for monitor memcached_get_hits |

## Related documentation

DataDog documentation:

- [https://docs.datadoghq.com/integrations/amazon_elasticache/](https://docs.datadoghq.com/integrations/amazon_elasticache/)
- [https://www.datadoghq.com/blog/monitoring-elasticache-performance-metrics-with-redis-or-memcached/](https://www.datadoghq.com/blog/monitoring-elasticache-performance-metrics-with-redis-or-memcached/)
