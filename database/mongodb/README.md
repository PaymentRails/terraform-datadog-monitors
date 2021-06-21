# DATABASE MONGODB DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-database-mongodb" {
  source      = "claranet/monitors/datadog//database/mongodb"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- MongoDB primary state
- MongoDB replication lag
- MongoDB secondary missing
- MongoDB too much servers or wrong monitoring config

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                              | Description                                                                                                                                               | Type           | Default      | Required |
| --------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------- | ------------ | :------: |
| environment                       | Architecture Environment                                                                                                                                  | `string`       | n/a          |   yes    |
| evaluation_delay                  | Delay in seconds for the metric evaluation                                                                                                                | `number`       | `15`         |    no    |
| filter_tags_custom                | Tags used for custom filtering when filter_tags_use_defaults is false                                                                                     | `string`       | `"*"`        |    no    |
| filter_tags_custom_excluded       | Tags excluded for custom filtering when filter_tags_use_defaults is false                                                                                 | `string`       | `""`         |    no    |
| filter_tags_use_defaults          | Use default filter tags convention                                                                                                                        | `string`       | `"true"`     |    no    |
| message                           | Message sent when an alert is triggered                                                                                                                   | `any`          | n/a          |   yes    |
| mongodb_desired_servers_count     | Number of servers that should be instanciated for this cluster                                                                                            | `number`       | `3`          |    no    |
| mongodb_lag_critical              | Critical replication lag in s                                                                                                                             | `number`       | `5`          |    no    |
| mongodb_lag_warning               | Warn replication lag in s                                                                                                                                 | `number`       | `2`          |    no    |
| mongodb_primary_aggregator        | Monitor aggregator for MongoDB primary state [available values: min, max]                                                                                 | `string`       | `"max"`      |    no    |
| mongodb_primary_enabled           | Flag to enable MongoDB primary state monitor                                                                                                              | `string`       | `"true"`     |    no    |
| mongodb_primary_extra_tags        | Extra tags for MongoDB primary state monitor                                                                                                              | `list(string)` | `[]`         |    no    |
| mongodb_primary_message           | Custom message for MongoDB primary monitor                                                                                                                | `string`       | `""`         |    no    |
| mongodb_primary_no_data_timeframe | Number of minutes before reporting no data                                                                                                                | `string`       | `10`         |    no    |
| mongodb_primary_timeframe         | Monitor timeframe for MongoDB wrong state for primary node [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]      | `string`       | `"last_1m"`  |    no    |
| mongodb_replication_aggregator    | Monitor aggregator for MongoDB replication lag [available values: min, max, sum or avg]                                                                   | `string`       | `"avg"`      |    no    |
| mongodb_replication_enabled       | Flag to enable MongoDB replication lag monitor                                                                                                            | `string`       | `"true"`     |    no    |
| mongodb_replication_extra_tags    | Extra tags for MongoDB replication lag monitor                                                                                                            | `list(string)` | `[]`         |    no    |
| mongodb_replication_message       | Custom message for MongoDB replication monitor                                                                                                            | `string`       | `""`         |    no    |
| mongodb_replication_timeframe     | Monitor timeframe for MongoDB replication lag [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]                   | `string`       | `"last_1m"`  |    no    |
| mongodb_secondary_aggregator      | Monitor aggregator for MongoDB secondary state [available values: min, max]                                                                               | `string`       | `"max"`      |    no    |
| mongodb_secondary_enabled         | Flag to enable MongoDB secondary state monitor                                                                                                            | `string`       | `"true"`     |    no    |
| mongodb_secondary_extra_tags      | Extra tags for MongoDB secondary state monitor                                                                                                            | `list(string)` | `[]`         |    no    |
| mongodb_secondary_message         | Custom message for MongoDB secondary monitor                                                                                                              | `string`       | `""`         |    no    |
| mongodb_secondary_timeframe       | Monitor timeframe for MongoDB wrong state for secondaries nodes [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string`       | `"last_5m"`  |    no    |
| mongodb_server_count_aggregator   | Monitor aggregator for MongoDB server count [available values: min, max]                                                                                  | `string`       | `"min"`      |    no    |
| mongodb_server_count_enabled      | Flag to enable MongoDB server count monitor                                                                                                               | `string`       | `"true"`     |    no    |
| mongodb_server_count_message      | Custom message for MongoDB server count                                                                                                                   | `string`       | `""`         |    no    |
| mongodb_server_count_timeframe    | Monitor timeframe for MongoDB wrong server count [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]                | `string`       | `"last_15m"` |    no    |
| new_host_delay                    | Delay in seconds before monitor new resource                                                                                                              | `number`       | `300`        |    no    |
| notify_no_data                    | Will raise no data alert if set to true                                                                                                                   | `bool`         | `true`       |    no    |
| prefix_slug                       | Prefix string to prepend between brackets on every monitors names                                                                                         | `string`       | `""`         |    no    |

## Outputs

| Name                    | Description                         |
| ----------------------- | ----------------------------------- |
| mongodb_primary_id      | id for monitor mongodb_primary      |
| mongodb_replication_id  | id for monitor mongodb_replication  |
| mongodb_secondary_id    | id for monitor mongodb_secondary    |
| mongodb_server_count_id | id for monitor mongodb_server_count |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/mongo/](https://docs.datadoghq.com/integrations/mongo/)
MongoDB documentation: [https://docs.mongodb.com/manual/administration/monitoring/](https://docs.mongodb.com/manual/administration/monitoring/)
