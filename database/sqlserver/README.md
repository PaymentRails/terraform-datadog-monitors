# DATABASE SQLSERVER DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-database-sqlserver" {
  source      = "claranet/monitors/datadog//database/sqlserver"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- SQL Server server does not respond

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                                     | Description                                                               | Type           | Default  | Required |
| ---------------------------------------- | ------------------------------------------------------------------------- | -------------- | -------- | :------: |
| environment                              | Environment                                                               | `string`       | n/a      |   yes    |
| evaluation_delay                         | Delay in seconds for the metric evaluation                                | `number`       | `15`     |    no    |
| filter_tags_custom                       | Tags used for custom filtering when filter_tags_use_defaults is false     | `string`       | `"*"`    |    no    |
| filter_tags_custom_excluded              | Tags excluded for custom filtering when filter_tags_use_defaults is false | `string`       | `""`     |    no    |
| filter_tags_use_defaults                 | Use default filter tags convention                                        | `string`       | `"true"` |    no    |
| message                                  | Message sent when an alert is triggered                                   | `any`          | n/a      |   yes    |
| new_host_delay                           | Delay in seconds for the metric evaluation                                | `number`       | `300`    |    no    |
| notify_no_data                           | Will raise no data alert if set to true                                   | `bool`         | `true`   |    no    |
| prefix_slug                              | Prefix string to prepend between brackets on every monitors names         | `string`       | `""`     |    no    |
| sqlserver_availability_enabled           | Flag to enable SQL Server availability monitor                            | `string`       | `"true"` |    no    |
| sqlserver_availability_extra_tags        | Extra tags for SQL Server availability monitor                            | `list(string)` | `[]`     |    no    |
| sqlserver_availability_message           | Custom message for SQL Server availability monitor                        | `string`       | `""`     |    no    |
| sqlserver_availability_no_data_timeframe | SQL Server availability monitor no data timeframe                         | `string`       | `10`     |    no    |
| sqlserver_availability_threshold_warning | SQL Server availability monitor (warning threshold)                       | `string`       | `3`      |    no    |

## Outputs

| Name                      | Description                           |
| ------------------------- | ------------------------------------- |
| sqlserver_availability_id | id for monitor sqlserver_availability |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/sqlserver/](https://docs.datadoghq.com/integrations/sqlserver/)
