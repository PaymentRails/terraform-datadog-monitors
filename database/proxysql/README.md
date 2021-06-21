# DATABASE PROXYSQL DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-database-proxysql" {
  source      = "claranet/monitors/datadog//database/proxysql"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- ProxySQL Client connections aborted
- ProxySQL Pool connections failure
- ProxySQL Server connections aborted
- ProxySQL Slow queries
- ProxySQL Thread Worker

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                                            | Description                                                                                                                                                 | Type           | Default      | Required |
| ----------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------- | ------------ | :------: |
| environment                                     | Environment                                                                                                                                                 | `string`       | n/a          |   yes    |
| evaluation_delay                                | Delay in seconds for the metric evaluation                                                                                                                  | `number`       | `15`         |    no    |
| filter_tags_custom                              | Tags used for custom filtering when filter_tags_use_defaults is false                                                                                       | `string`       | `"*"`        |    no    |
| filter_tags_custom_excluded                     | Tags excluded for custom filtering when filter_tags_use_defaults is false                                                                                   | `string`       | `""`         |    no    |
| filter_tags_use_defaults                        | Use default filter tags convention                                                                                                                          | `string`       | `"true"`     |    no    |
| message                                         | Message sent when an alert is triggered                                                                                                                     | `any`          | n/a          |   yes    |
| new_host_delay                                  | Delay in seconds for the metric evaluation                                                                                                                  | `number`       | `300`        |    no    |
| notify_no_data                                  | Will raise no data alert if set to true                                                                                                                     | `bool`         | `false`      |    no    |
| prefix_slug                                     | Prefix string to prepend between brackets on every monitors names                                                                                           | `string`       | `""`         |    no    |
| proxysql_client_conn_aborted_enabled            | Flag to enable ProxySQL client connections aborted monitor                                                                                                  | `string`       | `"true"`     |    no    |
| proxysql_client_conn_aborted_extra_tags         | Extra tags for ProxySQL client connections aborted monitor                                                                                                  | `list(string)` | `[]`         |    no    |
| proxysql_client_conn_aborted_message            | Custom message for ProxySQL client connections aborted monitor                                                                                              | `string`       | `""`         |    no    |
| proxysql_client_conn_aborted_threshold_critical | Maximum critical acceptable percent of aborted connects                                                                                                     | `number`       | `10`         |    no    |
| proxysql_client_conn_aborted_threshold_warning  | Maximum warning acceptable percent of aborted connects                                                                                                      | `number`       | `1`          |    no    |
| proxysql_client_conn_aborted_time_aggregator    | Monitor time aggregator for ProxySQL client connections aborted monitor [available values: min, max or avg]                                                 | `string`       | `"avg"`      |    no    |
| proxysql_client_conn_aborted_timeframe          | Monitor timeframe for ProxySQL client connections aborted monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string`       | `"last_10m"` |    no    |
| proxysql_pool_conn_failure_enabled              | Flag to enable ProxySQL pool connections failure monitor                                                                                                    | `string`       | `"true"`     |    no    |
| proxysql_pool_conn_failure_extra_tags           | Extra tags for ProxySQL pool connections failure monitor                                                                                                    | `list(string)` | `[]`         |    no    |
| proxysql_pool_conn_failure_message              | Custom message for ProxySQL pool connections failure monitor                                                                                                | `string`       | `""`         |    no    |
| proxysql_pool_conn_failure_threshold_critical   | Maximum critical acceptable of pool connections failure                                                                                                     | `number`       | `20`         |    no    |
| proxysql_pool_conn_failure_threshold_warning    | Maximum warning acceptable of pool connections failure                                                                                                      | `number`       | `1`          |    no    |
| proxysql_pool_conn_failure_time_aggregator      | Monitor time aggregator for ProxySQL pool connections failure monitor [available values: min, max or avg]                                                   | `string`       | `"avg"`      |    no    |
| proxysql_pool_conn_failure_timeframe            | Monitor timeframe for ProxySQL pool connections failure monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]   | `string`       | `"last_15m"` |    no    |
| proxysql_server_conn_aborted_enabled            | Flag to enable ProxySQL server connections aborted monitor                                                                                                  | `string`       | `"true"`     |    no    |
| proxysql_server_conn_aborted_extra_tags         | Extra tags for ProxySQL server connections aborted monitor                                                                                                  | `list(string)` | `[]`         |    no    |
| proxysql_server_conn_aborted_message            | Custom message for ProxySQL server connections aborted monitor                                                                                              | `string`       | `""`         |    no    |
| proxysql_server_conn_aborted_threshold_critical | Maximum critical acceptable percent of aborted connects                                                                                                     | `number`       | `10`         |    no    |
| proxysql_server_conn_aborted_threshold_warning  | Maximum warning acceptable percent of aborted connects                                                                                                      | `number`       | `1`          |    no    |
| proxysql_server_conn_aborted_time_aggregator    | Monitor time aggregator for ProxySQL server connections aborted monitor [available values: min, max or avg]                                                 | `string`       | `"avg"`      |    no    |
| proxysql_server_conn_aborted_timeframe          | Monitor timeframe for ProxySQL server connections aborted monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string`       | `"last_10m"` |    no    |
| proxysql_slow_enabled                           | Flag to enable ProxySQL slow queries monitor                                                                                                                | `string`       | `"true"`     |    no    |
| proxysql_slow_extra_tags                        | Extra tags for ProxySQL slow queries monitor                                                                                                                | `list(string)` | `[]`         |    no    |
| proxysql_slow_message                           | Custom message for ProxySQL slow queries monitor                                                                                                            | `string`       | `""`         |    no    |
| proxysql_slow_threshold_critical                | Maximum critical acceptable of slow queries                                                                                                                 | `number`       | `20`         |    no    |
| proxysql_slow_threshold_warning                 | Maximum warning acceptable of slow queries                                                                                                                  | `number`       | `1`          |    no    |
| proxysql_slow_time_aggregator                   | Monitor time aggregator for ProxySQL slow queries monitor [available values: min, max or avg]                                                               | `string`       | `"avg"`      |    no    |
| proxysql_slow_timeframe                         | Monitor timeframe for ProxySQL slow queries monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]               | `string`       | `"last_15m"` |    no    |
| proxysql_thread_worker_enabled                  | Flag to enable ProxySQL thread worker monitor                                                                                                               | `string`       | `"true"`     |    no    |
| proxysql_thread_worker_extra_tags               | Extra tags for ProxySQL thread worker monitor                                                                                                               | `list(string)` | `[]`         |    no    |
| proxysql_thread_worker_message                  | Custom message for ProxySQL thread worker monitor                                                                                                           | `string`       | `""`         |    no    |
| proxysql_thread_worker_threshold_critical       | Minimum critical acceptable of thread worker running                                                                                                        | `number`       | `1`          |    no    |
| proxysql_thread_worker_threshold_warning        | Minimum warning acceptable of thread worker running                                                                                                         | `number`       | `4`          |    no    |
| proxysql_thread_worker_time_aggregator          | Monitor time aggregator for ProxySQL thread worker monitor [available values: min, max or avg]                                                              | `string`       | `"avg"`      |    no    |
| proxysql_thread_worker_timeframe                | Monitor timeframe for ProxySQL thread worker monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]              | `string`       | `"last_5m"`  |    no    |

## Outputs

| Name                            | Description                                 |
| ------------------------------- | ------------------------------------------- |
| proxysql_client_conn_aborted_id | id for monitor proxysql_client_conn_aborted |
| proxysql_pool_conn_failure_id   | id for monitor proxysql_pool_conn_failure   |
| proxysql_server_conn_aborted_id | id for monitor proxysql_server_conn_aborted |
| proxysql_slow_id                | id for monitor proxysql_slow                |
| proxysql_thread_worker_id       | id for monitor proxysql_thread_worker       |

## Related documentation

- [Datadog documentation](https://docs.datadoghq.com/integrations/proxysql/)
- [ProxySQL documentation](https://proxysql.com/documentation/)
