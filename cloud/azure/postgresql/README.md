# CLOUD AZURE POSTGRESQL DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-azure-postgresql" {
  source      = "claranet/monitors/datadog//cloud/azure/postgresql"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Postgresql Server CPU usage
- Postgresql Server has no connection
- Postgresql Server IO consumption
- Postgresql Server memory usage
- Postgresql Server storage

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                                       | Description                                                                                                                               | Type           | Default      | Required |
| ------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------- | -------------- | ------------ | :------: |
| cpu_usage_enabled                          | Flag to enable PostgreSQL status monitor                                                                                                  | `string`       | `"true"`     |    no    |
| cpu_usage_extra_tags                       | Extra tags for PostgreSQL status monitor                                                                                                  | `list(string)` | `[]`         |    no    |
| cpu_usage_message                          | Custom message for PostgreSQL CPU monitor                                                                                                 | `string`       | `""`         |    no    |
| cpu_usage_threshold_critical               | PostgreSQL CPU usage in percent (critical threshold)                                                                                      | `string`       | `"90"`       |    no    |
| cpu_usage_threshold_warning                | PostgreSQL CPU usage in percent (warning threshold)                                                                                       | `string`       | `"80"`       |    no    |
| cpu_usage_time_aggregator                  | Monitor aggregator for PostgreSQL CPU [available values: min, max or avg]                                                                 | `string`       | `"min"`      |    no    |
| cpu_usage_timeframe                        | Monitor timeframe for PostgreSQL CPU [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]            | `string`       | `"last_15m"` |    no    |
| environment                                | Architecture environment                                                                                                                  | `string`       | n/a          |   yes    |
| evaluation_delay                           | Delay in seconds for the metric evaluation                                                                                                | `number`       | `900`        |    no    |
| filter_tags_custom                         | Tags used for custom filtering when filter_tags_use_defaults is false                                                                     | `string`       | `"*"`        |    no    |
| filter_tags_use_defaults                   | Use default filter tags convention                                                                                                        | `string`       | `"true"`     |    no    |
| free_storage_enabled                       | Flag to enable PostgreSQL status monitor                                                                                                  | `string`       | `"true"`     |    no    |
| free_storage_extra_tags                    | Extra tags for PostgreSQL status monitor                                                                                                  | `list(string)` | `[]`         |    no    |
| free_storage_message                       | Custom message for PostgreSQL Free Storage monitor                                                                                        | `string`       | `""`         |    no    |
| free_storage_threshold_critical            | PostgreSQL Free Storage remaining in percent (critical threshold)                                                                         | `string`       | `"10"`       |    no    |
| free_storage_threshold_warning             | PostgreSQL Free Storage remaining in percent (warning threshold)                                                                          | `string`       | `"20"`       |    no    |
| free_storage_time_aggregator               | Monitor aggregator for PostgreSQL Free Storage [available values: min, max or avg]                                                        | `string`       | `"min"`      |    no    |
| free_storage_timeframe                     | Monitor timeframe for PostgreSQL Free Storage [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]   | `string`       | `"last_15m"` |    no    |
| io_consumption_enabled                     | Flag to enable PostgreSQL status monitor                                                                                                  | `string`       | `"true"`     |    no    |
| io_consumption_extra_tags                  | Extra tags for PostgreSQL status monitor                                                                                                  | `list(string)` | `[]`         |    no    |
| io_consumption_message                     | Custom message for PostgreSQL IO consumption monitor                                                                                      | `string`       | `""`         |    no    |
| io_consumption_threshold_critical          | PostgreSQL IO consumption in percent (critical threshold)                                                                                 | `string`       | `"90"`       |    no    |
| io_consumption_threshold_warning           | PostgreSQL IO consumption in percent (warning threshold)                                                                                  | `string`       | `"80"`       |    no    |
| io_consumption_time_aggregator             | Monitor aggregator for PostgreSQL IO consumption [available values: min, max or avg]                                                      | `string`       | `"min"`      |    no    |
| io_consumption_timeframe                   | Monitor timeframe for PostgreSQL IO consumption [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string`       | `"last_15m"` |    no    |
| memory_usage_enabled                       | Flag to enable PostgreSQL status monitor                                                                                                  | `string`       | `"true"`     |    no    |
| memory_usage_extra_tags                    | Extra tags for PostgreSQL status monitor                                                                                                  | `list(string)` | `[]`         |    no    |
| memory_usage_message                       | Custom message for PostgreSQL memory monitor                                                                                              | `string`       | `""`         |    no    |
| memory_usage_threshold_critical            | PostgreSQL memory usage in percent (critical threshold)                                                                                   | `string`       | `"90"`       |    no    |
| memory_usage_threshold_warning             | PostgreSQL memory usage in percent (warning threshold)                                                                                    | `string`       | `"80"`       |    no    |
| memory_usage_time_aggregator               | Monitor aggregator for PostgreSQL memory [available values: min, max or avg]                                                              | `string`       | `"min"`      |    no    |
| memory_usage_timeframe                     | Monitor timeframe for PostgreSQL memory [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]         | `string`       | `"last_15m"` |    no    |
| message                                    | Message sent when an alert is triggered                                                                                                   | `any`          | n/a          |   yes    |
| new_host_delay                             | Delay in seconds before monitor new resource                                                                                              | `number`       | `300`        |    no    |
| no_connection_enabled                      | Flag to enable PostgreSQL status monitor                                                                                                  | `string`       | `"true"`     |    no    |
| no_connection_extra_tags                   | Extra tags for PostgreSQL status monitor                                                                                                  | `list(string)` | `[]`         |    no    |
| no_connection_message                      | Custom message for PostgreSQL no connection monitor                                                                                       | `string`       | `""`         |    no    |
| no_connection_time_aggregator              | Monitor aggregator for PostgreSQL no connection [available values: min, max or avg]                                                       | `string`       | `"min"`      |    no    |
| no_connection_timeframe                    | Monitor timeframe for PostgreSQL no connection [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]  | `string`       | `"last_5m"`  |    no    |
| notify_no_data                             | Will raise no data alert if set to true                                                                                                   | `bool`         | `true`       |    no    |
| postgresql_no_connection_no_data_timeframe | Number of minutes before reporting no data                                                                                                | `string`       | `10`         |    no    |
| prefix_slug                                | Prefix string to prepend between brackets on every monitors names                                                                         | `string`       | `""`         |    no    |

## Outputs

| Name                         | Description                              |
| ---------------------------- | ---------------------------------------- |
| postgresql_cpu_usage_id      | id for monitor postgresql_cpu_usage      |
| postgresql_free_storage_id   | id for monitor postgresql_free_storage   |
| postgresql_io_consumption_id | id for monitor postgresql_io_consumption |
| postgresql_memory_usage_id   | id for monitor postgresql_memory_usage   |
| postgresql_no_connection_id  | id for monitor postgresql_no_connection  |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/azure/](https://docs.datadoghq.com/integrations/azure/)
You have to search `mysql`
