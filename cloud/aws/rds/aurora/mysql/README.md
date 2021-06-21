# CLOUD AWS RDS AURORA MYSQL DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-aws-rds-aurora-mysql" {
  source      = "claranet/monitors/datadog//cloud/aws/rds/aurora/mysql"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- RDS Aurora Mysql replica lag

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                                           | Description                                                                                                                                    | Type           | Default     | Required |
| ---------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- | -------------- | ----------- | :------: |
| aurora_replicalag_enabled                      | Flag to enable RDS Aurora replica lag monitor                                                                                                  | `string`       | `"true"`    |    no    |
| aurora_replicalag_extra_tags                   | Extra tags for RDS Aurora replica lag monitor                                                                                                  | `list(string)` | `[]`        |    no    |
| aurora_replicalag_message                      | Custom message for RDS Aurora replica lag monitor                                                                                              | `string`       | `""`        |    no    |
| aurora_replicalag_threshold_critical           | Aurora replica lag in milliseconds (critical threshold)                                                                                        | `string`       | `"200"`     |    no    |
| aurora_replicalag_threshold_warning            | Aurora replica lag in milliseconds (warning threshold)                                                                                         | `string`       | `"100"`     |    no    |
| aurora_replicalag_time_aggregator              | Monitor aggregator for RDS Aurora replica lag [available values: min, max or avg]                                                              | `string`       | `"min"`     |    no    |
| aurora_replicalag_timeframe                    | Monitor timeframe for RDS Aurora replica lag monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string`       | `"last_5m"` |    no    |
| environment                                    | Architecture Environment                                                                                                                       | `string`       | n/a         |   yes    |
| evaluation_delay                               | Delay in seconds for the metric evaluation                                                                                                     | `number`       | `900`       |    no    |
| filter_tags_custom                             | Tags used for custom filtering when filter_tags_use_defaults is false                                                                          | `string`       | `"*"`       |    no    |
| filter_tags_custom_excluded                    | Tags excluded for custom filtering when filter_tags_use_defaults is false                                                                      | `string`       | `""`        |    no    |
| filter_tags_use_defaults                       | Use default filter tags convention                                                                                                             | `string`       | `"true"`    |    no    |
| message                                        | Message sent when an alert is triggered                                                                                                        | `any`          | n/a         |   yes    |
| new_host_delay                                 | Delay in seconds before monitor new resource                                                                                                   | `number`       | `300`       |    no    |
| notify_no_data                                 | Will raise no data alert if set to true                                                                                                        | `bool`         | `true`      |    no    |
| prefix_slug                                    | Prefix string to prepend between brackets on every monitors names                                                                              | `string`       | `""`        |    no    |
| rds_aurora_mysql_replica_lag_no_data_timeframe | Number of minutes before reporting no data                                                                                                     | `string`       | `10`        |    no    |

## Outputs

| Name                            | Description                                 |
| ------------------------------- | ------------------------------------------- |
| rds_aurora_mysql_replica_lag_id | id for monitor rds_aurora_mysql_replica_lag |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/amazon_rds/](https://docs.datadoghq.com/integrations/amazon_rds/)

AWS RDS Instance metrics documentation: [https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/MonitoringOverview.html#monitoring-cloudwatch](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/MonitoringOverview.html#monitoring-cloudwatch)
