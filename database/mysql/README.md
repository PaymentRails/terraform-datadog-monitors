# DATABASE MYSQL DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-database-mysql" {
  source      = "claranet/monitors/datadog//database/mysql"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Mysql Aborted connects
- Mysql Connections limit
- Mysql Innodb buffer pool efficiency
- Mysql Innodb buffer pool utilization
- Mysql queries changed abnormally
- Mysql replication lag (disabled by default)
- Mysql replication status changed abnormally (disabled by default)
- Mysql server does not respond
- Mysql Slow queries
- Mysql threads changed abnormally

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                                      | Description                                                                                                                                                  | Type           | Default      | Required |
| ----------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------------- | ------------ | :------: |
| environment                               | Environment                                                                                                                                                  | `string`       | n/a          |   yes    |
| evaluation_delay                          | Delay in seconds for the metric evaluation                                                                                                                   | `number`       | `15`         |    no    |
| filter_tags_custom                        | Tags used for custom filtering when filter_tags_use_defaults is false                                                                                        | `string`       | `"*"`        |    no    |
| filter_tags_custom_excluded               | Tags excluded for custom filtering when filter_tags_use_defaults is false                                                                                    | `string`       | `""`         |    no    |
| filter_tags_use_defaults                  | Use default filter tags convention                                                                                                                           | `string`       | `"true"`     |    no    |
| message                                   | Message sent when an alert is triggered                                                                                                                      | `any`          | n/a          |   yes    |
| mysql_aborted_enabled                     | Flag to enable MySQL aborted connects monitor                                                                                                                | `string`       | `"true"`     |    no    |
| mysql_aborted_extra_tags                  | Extra tags for MySQL aborted connects monitor                                                                                                                | `list(string)` | `[]`         |    no    |
| mysql_aborted_message                     | Custom message for MySQL aborted connects monitor                                                                                                            | `string`       | `""`         |    no    |
| mysql_aborted_threshold_critical          | Maximum critical acceptable percent of aborted connects                                                                                                      | `number`       | `10`         |    no    |
| mysql_aborted_threshold_warning           | Maximum warning acceptable percent of aborted connects                                                                                                       | `number`       | `5`          |    no    |
| mysql_aborted_time_aggregator             | Monitor time aggregator for MySQL aborted connects monitor [available values: min, max or avg]                                                               | `string`       | `"avg"`      |    no    |
| mysql_aborted_timeframe                   | Monitor timeframe for MySQL aborted connects monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]               | `string`       | `"last_10m"` |    no    |
| mysql_availability_enabled                | Flag to enable Mysql availability monitor                                                                                                                    | `string`       | `"true"`     |    no    |
| mysql_availability_extra_tags             | Extra tags for Mysql availability monitor                                                                                                                    | `list(string)` | `[]`         |    no    |
| mysql_availability_message                | Custom message for Mysql availability monitor                                                                                                                | `string`       | `""`         |    no    |
| mysql_availability_no_data_timeframe      | Mysql availability monitor no data timeframe                                                                                                                 | `string`       | `10`         |    no    |
| mysql_availability_threshold_warning      | Mysql availability monitor (warning threshold)                                                                                                               | `string`       | `3`          |    no    |
| mysql_connection_enabled                  | Flag to enable MySQL connection monitor                                                                                                                      | `string`       | `"true"`     |    no    |
| mysql_connection_extra_tags               | Extra tags for MySQL connection monitor                                                                                                                      | `list(string)` | `[]`         |    no    |
| mysql_connection_message                  | Custom message for MySQL connection monitor                                                                                                                  | `string`       | `""`         |    no    |
| mysql_connection_threshold_critical       | Maximum critical acceptable percent of connections                                                                                                           | `number`       | `80`         |    no    |
| mysql_connection_threshold_warning        | Maximum warning acceptable percent of connections                                                                                                            | `number`       | `70`         |    no    |
| mysql_connection_time_aggregator          | Monitor time aggregator for MySQL connection monitor [available values: min, max or avg]                                                                     | `string`       | `"avg"`      |    no    |
| mysql_connection_timeframe                | Monitor timeframe for MySQL connection monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]                     | `string`       | `"last_10m"` |    no    |
| mysql_pool_efficiency_enabled             | Flag to enable MySQL innodb buffer pool efficiency monitor                                                                                                   | `string`       | `"true"`     |    no    |
| mysql_pool_efficiency_extra_tags          | Extra tags for MySQL innodb buffer pool efficiency monitor                                                                                                   | `list(string)` | `[]`         |    no    |
| mysql_pool_efficiency_message             | Custom message for MySQL innodb buffer pool efficiency monitor                                                                                               | `string`       | `""`         |    no    |
| mysql_pool_efficiency_threshold_critical  | Maximum critical acceptable percent of innodb buffer pool efficiency                                                                                         | `number`       | `30`         |    no    |
| mysql_pool_efficiency_threshold_warning   | Maximum warning acceptable percent of innodb buffer pool efficiency                                                                                          | `number`       | `20`         |    no    |
| mysql_pool_efficiency_time_aggregator     | Monitor time aggregator for MySQL innodb buffer pool efficiency monitor [available values: min, max or avg]                                                  | `string`       | `"min"`      |    no    |
| mysql_pool_efficiency_timeframe           | Monitor timeframe for MySQL innodb buffer pool efficiency monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]  | `string`       | `"last_1h"`  |    no    |
| mysql_pool_utilization_enabled            | Flag to enable MySQL innodb buffer pool utilization monitor                                                                                                  | `string`       | `"true"`     |    no    |
| mysql_pool_utilization_extra_tags         | Extra tags for MySQL innodb buffer pool utilization monitor                                                                                                  | `list(string)` | `[]`         |    no    |
| mysql_pool_utilization_message            | Custom message for MySQL innodb buffer pool utilization monitor                                                                                              | `string`       | `""`         |    no    |
| mysql_pool_utilization_threshold_critical | Maximum critical acceptable percent of innodb buffer pool utilization                                                                                        | `number`       | `95`         |    no    |
| mysql_pool_utilization_threshold_warning  | Maximum warning acceptable percent of innodb buffer pool utilization                                                                                         | `number`       | `80`         |    no    |
| mysql_pool_utilization_time_aggregator    | Monitor time aggregator for MySQL innodb buffer pool utilization monitor [available values: min, max or avg]                                                 | `string`       | `"min"`      |    no    |
| mysql_pool_utilization_timeframe          | Monitor timeframe for MySQL innodb buffer pool utilization monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string`       | `"last_1h"`  |    no    |
| mysql_questions_alert_window              | Alert window.                                                                                                                                                | `string`       | `"last_15m"` |    no    |
| mysql_questions_count_default_zero        | Count default zero.                                                                                                                                          | `string`       | `"true"`     |    no    |
| mysql_questions_detection_algorithm       | Anomaly Detection Algorithm used                                                                                                                             | `string`       | `"agile"`    |    no    |
| mysql_questions_deviations                | Deviations to detect the anomaly                                                                                                                             | `string`       | `5`          |    no    |
| mysql_questions_direction                 | Direction of the anomaly. It can be both, below or above.                                                                                                    | `string`       | `"both"`     |    no    |
| mysql_questions_enabled                   | Flag to enable mysql queries monitor                                                                                                                         | `string`       | `"true"`     |    no    |
| mysql_questions_extra_tags                | Extra tags for MySQL queries monitor                                                                                                                         | `list(string)` | `[]`         |    no    |
| mysql_questions_interval                  | Interval.                                                                                                                                                    | `string`       | `60`         |    no    |
| mysql_questions_message                   | Custom message for MySQL queries monitor                                                                                                                     | `string`       | `""`         |    no    |
| mysql_questions_seasonality               | Seasonality of the algorithm                                                                                                                                 | `string`       | `"daily"`    |    no    |
| mysql_questions_threshold_critical        | Maximum critical acceptable number of queries                                                                                                                | `number`       | `1`          |    no    |
| mysql_questions_time_aggregator           | Monitor time aggregator for MySQL queries monitor [available values: min, max or avg]                                                                        | `string`       | `"avg"`      |    no    |
| mysql_questions_timeframe                 | Monitor timeframe for MySQL queries monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]                        | `string`       | `"last_4h"`  |    no    |
| mysql_replication_lag_enabled             | Flag to enable mysql replication lag monitor                                                                                                                 | `string`       | `"false"`    |    no    |
| mysql_replication_lag_extra_tags          | Extra tags for MySQL replication lag monitor                                                                                                                 | `list(string)` | `[]`         |    no    |
| mysql_replication_lag_message             | Custom message for MySQL replication lag monitor                                                                                                             | `string`       | `""`         |    no    |
| mysql_replication_lag_threshold_critical  | Maximum critical acceptable seconds of replication lag                                                                                                       | `number`       | `200`        |    no    |
| mysql_replication_lag_threshold_warning   | Maximum warning acceptable seconds of replication lag                                                                                                        | `number`       | `100`        |    no    |
| mysql_replication_lag_time_aggregator     | Monitor time aggregator for MySQL replication lag monitor [available values: min, max or avg]                                                                | `string`       | `"min"`      |    no    |
| mysql_replication_lag_timeframe           | Monitor timeframe for MySQL replication lag monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]                | `string`       | `"last_15m"` |    no    |
| mysql_replication_status_enabled          | Flag to enable mysql replication status monitor                                                                                                              | `string`       | `"false"`    |    no    |
| mysql_replication_status_extra_tags       | Extra tags for MySQL replication status monitor                                                                                                              | `list(string)` | `[]`         |    no    |
| mysql_replication_status_message          | Custom message for MySQL replication status monitor                                                                                                          | `string`       | `""`         |    no    |
| mysql_replication_status_time_aggregator  | Monitor time aggregator for MySQL replication status monitor [available values: min, max or avg]                                                             | `string`       | `"min"`      |    no    |
| mysql_replication_status_timeframe        | Monitor timeframe for MySQL replication status monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]             | `string`       | `"last_5m"`  |    no    |
| mysql_slow_enabled                        | Flag to enable MySQL slow queries monitor                                                                                                                    | `string`       | `"true"`     |    no    |
| mysql_slow_extra_tags                     | Extra tags for MySQL slow queries monitor                                                                                                                    | `list(string)` | `[]`         |    no    |
| mysql_slow_message                        | Custom message for MySQL slow queries monitor                                                                                                                | `string`       | `""`         |    no    |
| mysql_slow_threshold_critical             | Maximum critical acceptable percent of slow queries                                                                                                          | `number`       | `20`         |    no    |
| mysql_slow_threshold_warning              | Maximum warning acceptable percent of slow queries                                                                                                           | `number`       | `5`          |    no    |
| mysql_slow_time_aggregator                | Monitor time aggregator for MySQL slow queries monitor [available values: min, max or avg]                                                                   | `string`       | `"avg"`      |    no    |
| mysql_slow_timeframe                      | Monitor timeframe for MySQL slow queries monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]                   | `string`       | `"last_15m"` |    no    |
| mysql_threads_alert_window                | Alert window.                                                                                                                                                | `string`       | `"last_15m"` |    no    |
| mysql_threads_count_default_zero          | Count default zero.                                                                                                                                          | `string`       | `"true"`     |    no    |
| mysql_threads_detection_algorithm         | Anomaly Detection Algorithm used                                                                                                                             | `string`       | `"basic"`    |    no    |
| mysql_threads_deviations                  | Deviations to detect the anomaly                                                                                                                             | `string`       | `2`          |    no    |
| mysql_threads_direction                   | Direction of the anomaly. It can be both, below or above.                                                                                                    | `string`       | `"above"`    |    no    |
| mysql_threads_enabled                     | Flag to enable mysql threads monitor                                                                                                                         | `string`       | `"true"`     |    no    |
| mysql_threads_extra_tags                  | Extra tags for MySQL threads monitor                                                                                                                         | `list(string)` | `[]`         |    no    |
| mysql_threads_interval                    | Interval.                                                                                                                                                    | `string`       | `60`         |    no    |
| mysql_threads_message                     | Custom message for MySQL threads monitor                                                                                                                     | `string`       | `""`         |    no    |
| mysql_threads_seasonality                 | Seasonality of the algorithm                                                                                                                                 | `string`       | `"daily"`    |    no    |
| mysql_threads_threshold_critical          | Maximum critical acceptable number of threads                                                                                                                | `number`       | `1`          |    no    |
| mysql_threads_time_aggregator             | Monitor time aggregator for MySQL threads monitor [available values: min, max or avg]                                                                        | `string`       | `"avg"`      |    no    |
| mysql_threads_timeframe                   | Monitor timeframe for MySQL threads monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]                        | `string`       | `"last_4h"`  |    no    |
| new_host_delay                            | Delay in seconds for the metric evaluation                                                                                                                   | `number`       | `300`        |    no    |
| notify_no_data                            | Will raise no data alert if set to true                                                                                                                      | `bool`         | `true`       |    no    |
| prefix_slug                               | Prefix string to prepend between brackets on every monitors names                                                                                            | `string`       | `""`         |    no    |

## Outputs

| Name                        | Description                             |
| --------------------------- | --------------------------------------- |
| mysql_aborted_id            | id for monitor mysql_aborted            |
| mysql_availability_id       | id for monitor mysql_availability       |
| mysql_connection_id         | id for monitor mysql_connection         |
| mysql_pool_efficiency_id    | id for monitor mysql_pool_efficiency    |
| mysql_pool_utilization_id   | id for monitor mysql_pool_utilization   |
| mysql_questions_anomaly_id  | id for monitor mysql_questions_anomaly  |
| mysql_replication_lag_id    | id for monitor mysql_replication_lag    |
| mysql_replication_status_id | id for monitor mysql_replication_status |
| mysql_slow_id               | id for monitor mysql_slow               |
| mysql_threads_anomaly_id    | id for monitor mysql_threads_anomaly    |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/mysql/](https://docs.datadoghq.com/integrations/mysql/)

## Notes

It could be not possible to modify `innodb_buffer_pool_size` or `innodb_buffer_pool_instances` mysql parameters (i.e. cloudsql).
In this case, InnoDB Pool monitors could be less useful for optimization even if they could inform when an instance should be upsized.
