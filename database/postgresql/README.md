# DATABASE POSTGRESQL DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-database-postgresql" {
  source      = "claranet/monitors/datadog//database/postgresql"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- PostgreSQL Connections
- PostgreSQL server does not respond
- PostgreSQL too many locks

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                                      | Description                                                                                                                                   | Type           | Default      | Required |
| ----------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------- | -------------- | ------------ | :------: |
| environment                               | Environment                                                                                                                                   | `string`       | n/a          |   yes    |
| evaluation_delay                          | Delay in seconds for the metric evaluation                                                                                                    | `number`       | `15`         |    no    |
| filter_tags_custom                        | Tags used for custom filtering when filter_tags_use_defaults is false                                                                         | `string`       | `"*"`        |    no    |
| filter_tags_custom_excluded               | Tags excluded for custom filtering when filter_tags_use_defaults is false                                                                     | `string`       | `""`         |    no    |
| filter_tags_use_defaults                  | Use default filter tags convention                                                                                                            | `string`       | `"true"`     |    no    |
| message                                   | Message sent when an alert is triggered                                                                                                       | `any`          | n/a          |   yes    |
| new_host_delay                            | Delay in seconds for the metric evaluation                                                                                                    | `number`       | `300`        |    no    |
| notify_no_data                            | Will raise no data alert if set to true                                                                                                       | `bool`         | `true`       |    no    |
| postgresql_availability_enabled           | Flag to enable PostgreSQL availability monitor                                                                                                | `string`       | `"true"`     |    no    |
| postgresql_availability_extra_tags        | Extra tags for PostgreSQL availability monitor                                                                                                | `list(string)` | `[]`         |    no    |
| postgresql_availability_message           | Custom message for PostgreSQL availability monitor                                                                                            | `string`       | `""`         |    no    |
| postgresql_availability_no_data_timeframe | PostgreSQL availability monitor no data timeframe                                                                                             | `string`       | `10`         |    no    |
| postgresql_availability_threshold_warning | PostgreSQL availability monitor (warning threshold)                                                                                           | `string`       | `3`          |    no    |
| postgresql_connection_enabled             | Flag to enable PostgreSQL connection monitor                                                                                                  | `string`       | `"true"`     |    no    |
| postgresql_connection_extra_tags          | Extra tags for PostgreSQL connection connects monitor                                                                                         | `list(string)` | `[]`         |    no    |
| postgresql_connection_message             | Custom message for PostgreSQL connection monitor                                                                                              | `string`       | `""`         |    no    |
| postgresql_connection_threshold_critical  | Maximum critical acceptable percent of connections                                                                                            | `number`       | `80`         |    no    |
| postgresql_connection_threshold_warning   | Maximum warning acceptable percent of connections                                                                                             | `number`       | `70`         |    no    |
| postgresql_connection_time_aggregator     | Monitor time aggregator for PostgreSQL connection monitor [available values: min, max or avg]                                                 | `string`       | `"avg"`      |    no    |
| postgresql_connection_timeframe           | Monitor timeframe for PostgreSQL connection monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string`       | `"last_15m"` |    no    |
| postgresql_lock_enabled                   | Flag to enable PostgreSQL lock monitor                                                                                                        | `string`       | `"true"`     |    no    |
| postgresql_lock_extra_tags                | Extra tags for PostgreSQL lock connects monitor                                                                                               | `list(string)` | `[]`         |    no    |
| postgresql_lock_message                   | Custom message for PostgreSQL lock monitor                                                                                                    | `string`       | `""`         |    no    |
| postgresql_lock_threshold_critical        | Maximum critical acceptable number of locks                                                                                                   | `number`       | `99`         |    no    |
| postgresql_lock_threshold_warning         | Maximum warning acceptable number of locks                                                                                                    | `number`       | `70`         |    no    |
| postgresql_lock_time_aggregator           | Monitor time aggregator for PostgreSQL lock monitor [available values: min, max or avg]                                                       | `string`       | `"min"`      |    no    |
| postgresql_lock_timeframe                 | Monitor timeframe for PostgreSQL lock monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]       | `string`       | `"last_5m"`  |    no    |
| prefix_slug                               | Prefix string to prepend between brackets on every monitors names                                                                             | `string`       | `""`         |    no    |

## Outputs

| Name                              | Description                                   |
| --------------------------------- | --------------------------------------------- |
| postgresql_availability_id        | id for monitor postgresql_availability        |
| postgresql_connection_too_high_id | id for monitor postgresql_connection_too_high |
| postgresql_too_many_locks_id      | id for monitor postgresql_too_many_locks      |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/postgres/](https://docs.datadoghq.com/integrations/postgres/)
