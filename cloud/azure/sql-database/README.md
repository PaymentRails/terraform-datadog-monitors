# CLOUD AZURE SQL-DATABASE DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-azure-sql-database" {
  source      = "claranet/monitors/datadog//cloud/azure/sql-database"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- SQL Database CPU too high
- SQL Database Deadlocks too high
- SQL Database DTU Consumption too high
- SQL Database high disk usage
- SQL Database is down

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                         | Description                                                                                                                    | Type           | Default      | Required |
| ---------------------------- | ------------------------------------------------------------------------------------------------------------------------------ | -------------- | ------------ | :------: |
| cpu_enabled                  | Flag to enable SQL CPU monitor                                                                                                 | `string`       | `"true"`     |    no    |
| cpu_extra_tags               | Extra tags for SQL CPU monitor                                                                                                 | `list(string)` | `[]`         |    no    |
| cpu_message                  | Custom message for SQL CPU monitor                                                                                             | `string`       | `""`         |    no    |
| cpu_threshold_critical       | CPU usage in percent (critical threshold)                                                                                      | `string`       | `"90"`       |    no    |
| cpu_threshold_warning        | CPU usage in percent (warning threshold)                                                                                       | `string`       | `"80"`       |    no    |
| cpu_time_aggregator          | Monitor aggregator for SQL CPU [available values: min, max or avg]                                                             | `string`       | `"min"`      |    no    |
| cpu_timeframe                | Monitor timeframe for SQL CPU [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]        | `string`       | `"last_15m"` |    no    |
| deadlock_enabled             | Flag to enable SQL Deadlock monitor                                                                                            | `string`       | `"true"`     |    no    |
| deadlock_extra_tags          | Extra tags for SQL Deadlock monitor                                                                                            | `list(string)` | `[]`         |    no    |
| deadlock_message             | Custom message for SQL Deadlock monitor                                                                                        | `string`       | `""`         |    no    |
| deadlock_threshold_critical  | Amount of Deadlocks (critical threshold)                                                                                       | `string`       | `"1"`        |    no    |
| deadlock_timeframe           | Monitor timeframe for SQL Deadlock [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]   | `string`       | `"last_5m"`  |    no    |
| diskspace_enabled            | Flag to enable SQL disk space monitor                                                                                          | `string`       | `"true"`     |    no    |
| diskspace_extra_tags         | Extra tags for SQL disk space monitor                                                                                          | `list(string)` | `[]`         |    no    |
| diskspace_message            | Custom message for SQL disk space monitor                                                                                      | `string`       | `""`         |    no    |
| diskspace_threshold_critical | Disk space used in percent (critical threshold)                                                                                | `string`       | `"90"`       |    no    |
| diskspace_threshold_warning  | Disk space used in percent (warning threshold)                                                                                 | `string`       | `"80"`       |    no    |
| diskspace_time_aggregator    | Monitor aggregator for SQL disk space [available values: min, max or avg]                                                      | `string`       | `"max"`      |    no    |
| diskspace_timeframe          | Monitor timeframe for SQL disk space [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string`       | `"last_15m"` |    no    |
| dtu_enabled                  | Flag to enable SQL DTU monitor                                                                                                 | `string`       | `"true"`     |    no    |
| dtu_extra_tags               | Extra tags for SQL DTU monitor                                                                                                 | `list(string)` | `[]`         |    no    |
| dtu_message                  | Custom message for SQL DTU monitor                                                                                             | `string`       | `""`         |    no    |
| dtu_threshold_critical       | Amount of DTU used (critical threshold)                                                                                        | `string`       | `"90"`       |    no    |
| dtu_threshold_warning        | Amount of DTU used (warning threshold)                                                                                         | `string`       | `"85"`       |    no    |
| dtu_time_aggregator          | Monitor aggregator for SQL DTU [available values: min, max or avg]                                                             | `string`       | `"avg"`      |    no    |
| dtu_timeframe                | Monitor timeframe for SQL DTU [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]        | `string`       | `"last_15m"` |    no    |
| environment                  | Architecture Environment                                                                                                       | `string`       | n/a          |   yes    |
| evaluation_delay             | Delay in seconds for the metric evaluation                                                                                     | `number`       | `900`        |    no    |
| filter_tags_custom           | Tags used for custom filtering when filter_tags_use_defaults is false                                                          | `string`       | `"*"`        |    no    |
| filter_tags_custom_excluded  | Tags excluded for custom filtering when filter_tags_use_defaults is false                                                      | `string`       | `""`         |    no    |
| filter_tags_use_defaults     | Use default filter tags convention                                                                                             | `string`       | `"true"`     |    no    |
| message                      | Message sent when an alert is triggered                                                                                        | `any`          | n/a          |   yes    |
| new_host_delay               | Delay in seconds before monitor new resource                                                                                   | `number`       | `300`        |    no    |
| notify_no_data               | Will raise no data alert if set to true                                                                                        | `bool`         | `true`       |    no    |
| prefix_slug                  | Prefix string to prepend between brackets on every monitors names                                                              | `string`       | `""`         |    no    |
| status_enabled               | Flag to enable Redis status monitor                                                                                            | `string`       | `"true"`     |    no    |
| status_extra_tags            | Extra tags for Redis status monitor                                                                                            | `list(string)` | `[]`         |    no    |
| status_message               | Custom message for Redis status monitor                                                                                        | `string`       | `""`         |    no    |
| status_no_data_timeframe     | Number of minutes before reporting no data                                                                                     | `string`       | `10`         |    no    |
| status_time_aggregator       | Monitor aggregator for Redis status [available values: min, max or avg]                                                        | `string`       | `"max"`      |    no    |
| status_timeframe             | Monitor timeframe for Redis status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]   | `string`       | `"last_5m"`  |    no    |

## Outputs

| Name                                 | Description                                      |
| ------------------------------------ | ------------------------------------------------ |
| sql-database_cpu_id                  | id for monitor sql-database_cpu                  |
| sql-database_deadlocks_count_id      | id for monitor sql-database_deadlocks_count      |
| sql-database_dtu_consumption_high_id | id for monitor sql-database_dtu_consumption_high |
| sql-database_free_space_low_id       | id for monitor sql-database_free_space_low       |
| status_id                            | id for monitor status                            |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/azure_sql_database/](https://docs.datadoghq.com/integrations/azure_sql_database/)

Azure SQL Database metrics documentation: [https://docs.microsoft.com/en-us/azure/azure-monitor/platform/metrics-supported#microsoftsqlserversdatabases](https://docs.microsoft.com/en-us/azure/azure-monitor/platform/metrics-supported#microsoftsqlserversdatabases)
