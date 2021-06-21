# CLOUD AZURE DATALAKESTORE DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-azure-datalakestore" {
  source      = "claranet/monitors/datadog//cloud/azure/datalakestore"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Datalake Store is down

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                                   | Description                                                                                                                           | Type           | Default     | Required |
| -------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------- | -------------- | ----------- | :------: |
| datalakestore_status_no_data_timeframe | Number of minutes before reporting no data                                                                                            | `string`       | `10`        |    no    |
| environment                            | Architecture environment                                                                                                              | `string`       | n/a         |   yes    |
| evaluation_delay                       | Delay in seconds for the metric evaluation                                                                                            | `number`       | `900`       |    no    |
| filter_tags_custom                     | Tags used for custom filtering when filter_tags_use_defaults is false                                                                 | `string`       | `"*"`       |    no    |
| filter_tags_custom_excluded            | Tags excluded for custom filtering when filter_tags_use_defaults is false                                                             | `string`       | `""`        |    no    |
| filter_tags_use_defaults               | Use default filter tags convention                                                                                                    | `string`       | `"true"`    |    no    |
| message                                | Message sent when a monitor is triggered                                                                                              | `any`          | n/a         |   yes    |
| new_host_delay                         | Delay in seconds before monitor new resource                                                                                          | `number`       | `300`       |    no    |
| notify_no_data                         | Will raise no data alert if set to true                                                                                               | `bool`         | `true`      |    no    |
| prefix_slug                            | Prefix string to prepend between brackets on every monitors names                                                                     | `string`       | `""`        |    no    |
| status_enabled                         | Flag to enable Datalake Store status monitor                                                                                          | `string`       | `"true"`    |    no    |
| status_extra_tags                      | Extra tags for Datalake Store status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]        | `list(string)` | `[]`        |    no    |
| status_message                         | Custom message for Datalake Store status monitor                                                                                      | `string`       | `""`        |    no    |
| status_time_aggregator                 | Monitor aggregator for Datalake Store status [available values: min, max or avg]                                                      | `string`       | `"max"`     |    no    |
| status_timeframe                       | Monitor timeframe for Datalake Store status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string`       | `"last_5m"` |    no    |

## Outputs

| Name                    | Description                         |
| ----------------------- | ----------------------------------- |
| datalakestore_status_id | id for monitor datalakestore_status |

## Related documentation

DataDog documentation : [https://docs.datadoghq.com/integrations/azure/](https://docs.datadoghq.com/integrations/azure/)  
You must search `datalake`, there is no integration for now.

Azure metrics documentation : [https://docs.microsoft.com/fr-fr/azure/monitoring-and-diagnostics/monitoring-supported-metrics#microsoftdatalakestoreaccounts](https://docs.microsoft.com/fr-fr/azure/monitoring-and-diagnostics/monitoring-supported-metrics#microsoftdatalakestoreaccounts)
