# CLOUD AZURE SQL-ELASTICPOOL DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-azure-sql-elasticpool" {
  source      = "claranet/monitors/datadog//cloud/azure/sql-elasticpool"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- SQL Elastic Pool CPU too high
- SQL Elastic Pool DTU Consumption too high
- SQL Elastic Pool high disk usage

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                                  | Description                                                                                                                                 | Type           | Default      | Required |
| ------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- | -------------- | ------------ | :------: |
| cpu_enabled                           | Flag to enable SQL Elastic Pool CPU monitor                                                                                                 | `string`       | `"true"`     |    no    |
| cpu_extra_tags                        | Extra tags for SQL Elastic Pool CPU monitor                                                                                                 | `list(string)` | `[]`         |    no    |
| cpu_message                           | Custom message for SQL Elastic Pool CPU monitor                                                                                             | `string`       | `""`         |    no    |
| cpu_threshold_critical                | CPU usage in percent (critical threshold)                                                                                                   | `string`       | `"90"`       |    no    |
| cpu_threshold_warning                 | CPU usage in percent (warning threshold)                                                                                                    | `string`       | `"80"`       |    no    |
| cpu_time_aggregator                   | Monitor aggregator for SQL Elastic Pool CPU [available values: min, max or avg]                                                             | `string`       | `"min"`      |    no    |
| cpu_timeframe                         | Monitor timeframe for SQL Elastic Pool CPU [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]        | `string`       | `"last_15m"` |    no    |
| diskspace_enabled                     | Flag to enable SQL Elastic Pool disk space monitor                                                                                          | `string`       | `"true"`     |    no    |
| diskspace_extra_tags                  | Extra tags for SQL Elastic Pool disk space monitor                                                                                          | `list(string)` | `[]`         |    no    |
| diskspace_message                     | Custom message for SQL Elastic Pool disk space monitor                                                                                      | `string`       | `""`         |    no    |
| diskspace_threshold_critical          | Disk space used in percent (critical threshold)                                                                                             | `string`       | `"90"`       |    no    |
| diskspace_threshold_warning           | Disk space used in percent (warning threshold)                                                                                              | `string`       | `"80"`       |    no    |
| diskspace_time_aggregator             | Monitor aggregator for SQL Elastic Pool disk space [available values: min, max or avg]                                                      | `string`       | `"max"`      |    no    |
| diskspace_timeframe                   | Monitor timeframe for SQL Elastic Pool disk space [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string`       | `"last_15m"` |    no    |
| dtu_enabled                           | Flag to enable SQL Elastic Pool DTU monitor                                                                                                 | `string`       | `"true"`     |    no    |
| dtu_extra_tags                        | Extra tags for SQL Elastic Pool DTU monitor                                                                                                 | `list(string)` | `[]`         |    no    |
| dtu_message                           | Custom message for SQL Elastic Pool DTU monitor                                                                                             | `string`       | `""`         |    no    |
| dtu_threshold_critical                | Amount of DTU used (critical threshold)                                                                                                     | `string`       | `"90"`       |    no    |
| dtu_threshold_warning                 | Amount of DTU used (warning threshold)                                                                                                      | `string`       | `"85"`       |    no    |
| dtu_time_aggregator                   | Monitor aggregator for SQL Elastic Pool DTU [available values: min, max or avg]                                                             | `string`       | `"avg"`      |    no    |
| dtu_timeframe                         | Monitor timeframe for SQL Elastic Pool DTU [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]        | `string`       | `"last_15m"` |    no    |
| environment                           | Architecture Environment                                                                                                                    | `string`       | n/a          |   yes    |
| evaluation_delay                      | Delay in seconds for the metric evaluation                                                                                                  | `number`       | `900`        |    no    |
| filter_tags_custom                    | Tags used for custom filtering when filter_tags_use_defaults is false                                                                       | `string`       | `"*"`        |    no    |
| filter_tags_custom_excluded           | Tags excluded for custom filtering when filter_tags_use_defaults is false                                                                   | `string`       | `""`         |    no    |
| filter_tags_use_defaults              | Use default filter tags convention                                                                                                          | `string`       | `"true"`     |    no    |
| message                               | Message sent when an alert is triggered                                                                                                     | `any`          | n/a          |   yes    |
| new_host_delay                        | Delay in seconds before monitor new resource                                                                                                | `number`       | `300`        |    no    |
| notify_no_data                        | Will raise no data alert if set to true                                                                                                     | `bool`         | `true`       |    no    |
| prefix_slug                           | Prefix string to prepend between brackets on every monitors names                                                                           | `string`       | `""`         |    no    |
| sql_elasticpool_cpu_no_data_timeframe | Number of minutes before reporting no data                                                                                                  | `string`       | `30`         |    no    |

## Outputs

| Name                                    | Description                                         |
| --------------------------------------- | --------------------------------------------------- |
| sql_elasticpool_cpu_id                  | id for monitor sql_elasticpool_cpu                  |
| sql_elasticpool_dtu_consumption_high_id | id for monitor sql_elasticpool_dtu_consumption_high |
| sql_elasticpool_free_space_low_id       | id for monitor sql_elasticpool_free_space_low       |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/azure_sql_elastic_pool/](https://docs.datadoghq.com/integrations/azure_sql_elastic_pool/)

Azure SQL Elastic Pool metrics documentation: [https://docs.microsoft.com/en-us/azure/azure-monitor/platform/metrics-supported#microsoftsqlserverselasticpools](https://docs.microsoft.com/en-us/azure/azure-monitor/platform/metrics-supported#microsoftsqlserverselasticpools)
