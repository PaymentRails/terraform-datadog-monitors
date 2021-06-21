# DATABASE ZOOKEEPER DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-database-zookeeper" {
  source      = "claranet/monitors/datadog//database/zookeeper"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Zookeeper latency
- Zookeeper service does not respond

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                                      | Description                                                                                                                                    | Type           | Default                                    | Required |
| ----------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- | -------------- | ------------------------------------------ | :------: |
| environment                               | Architecture environment                                                                                                                       | `string`       | n/a                                        |   yes    |
| evaluation_delay                          | Delay in seconds for the metric evaluation                                                                                                     | `number`       | `15`                                       |    no    |
| filter_tags_custom                        | Tags used for custom filtering when filter_tags_use_defaults is false                                                                          | `string`       | `"*"`                                      |    no    |
| filter_tags_custom_excluded               | Tags excluded for custom filtering when filter_tags_use_defaults is false                                                                      | `string`       | `""`                                       |    no    |
| filter_tags_use_defaults                  | Use default filter tags convention                                                                                                             | `string`       | `"true"`                                   |    no    |
| message                                   | Message sent when a monitor is triggered                                                                                                       | `any`          | n/a                                        |   yes    |
| new_host_delay                            | Delay in seconds before begin to monitor new host                                                                                              | `number`       | `300`                                      |    no    |
| not_responding_group_by                   | List of tags to use to group data                                                                                                              | `list(string)` | <pre>[<br> "host",<br> "server"<br>]</pre> |    no    |
| not_responding_no_data_timeframe          | Zookeeper monitor no_data_timeframe                                                                                                            | `number`       | `10`                                       |    no    |
| not_responding_notify_no_data             | Send notification if not_responding monitor does not retrieve data                                                                             | `bool`         | `true`                                     |    no    |
| not_responding_threshold_warning          | Zookeeper not responding limit (warning threshold)                                                                                             | `number`       | `3`                                        |    no    |
| prefix_slug                               | Prefix string to prepend between brackets on every monitors names                                                                              | `string`       | `""`                                       |    no    |
| zookeeper_latency_availability_extra_tags | Extra tags for zookeeper read latency monitor                                                                                                  | `list(string)` | `[]`                                       |    no    |
| zookeeper_latency_enabled                 | Flag to enable Zookeeper read latency monitor                                                                                                  | `string`       | `"true"`                                   |    no    |
| zookeeper_latency_group_by                | Tags to use to group datas                                                                                                                     | `list(string)` | <pre>[<br> "host"<br>]</pre>               |    no    |
| zookeeper_latency_status_message          | Custom message for Zookeeper read latency monitor                                                                                              | `string`       | `""`                                       |    no    |
| zookeeper_latency_threshold_critical      | Maximum critical acceptable ms of zookeeper latency monitor                                                                                    | `number`       | `300000`                                   |    no    |
| zookeeper_latency_threshold_warning       | Maximum warning acceptable ms of zookeeper latency monitor                                                                                     | `number`       | `250000`                                   |    no    |
| zookeeper_latency_time_aggregator         | Monitor time aggregator for Zookeeper read latency monitor [available values: min, max or avg]                                                 | `string`       | `"avg"`                                    |    no    |
| zookeeper_latency_timeframe               | Monitor timeframe for Zookeeper read latency monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string`       | `"last_15m"`                               |    no    |
| zookeeper_not_responding_enabled          | Flag to enable Zookeeper does not respond monitor                                                                                              | `string`       | `"true"`                                   |    no    |
| zookeeper_not_responding_extra_tags       | Extra tags for Zookeeper does not respond monitor                                                                                              | `list(string)` | `[]`                                       |    no    |
| zookeeper_not_responding_message          | Custom message for Zookeeper does not respond monitor                                                                                          | `string`       | `""`                                       |    no    |
| zookeeper_not_responding_time_aggregator  | Time aggregator for the Zookeeper does not respond monitor                                                                                     | `string`       | `"avg"`                                    |    no    |
| zookeeper_not_responding_timeframe        | Timeframe for the does not respond monitor                                                                                                     | `string`       | `"last_5m"`                                |    no    |

## Outputs

| Name                                 | Description                                      |
| ------------------------------------ | ------------------------------------------------ |
| datadog_monitor_zookeeper_latency_id | id for monitor datadog_monitor_zookeeper_latency |
| not_responding_id                    | id for monitor not_responding                    |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/zk/](https://docs.datadoghq.com/integrations/zk/)
