# CLOUD AZURE LOAD-BALANCER DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-azure-load-balancer" {
  source      = "claranet/monitors/datadog//cloud/azure/load-balancer"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Load Balancer is unreachable

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                                  | Description                                                                                                                          | Type           | Default     | Required |
| ------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------ | -------------- | ----------- | :------: |
| environment                           | Architecture environment                                                                                                             | `string`       | n/a         |   yes    |
| evaluation_delay                      | Delay in seconds for the metric evaluation                                                                                           | `number`       | `900`       |    no    |
| filter_tags_custom                    | Tags used for custom filtering when filter_tags_use_defaults is false                                                                | `string`       | `"*"`       |    no    |
| filter_tags_custom_excluded           | Tags excluded for custom filtering when filter_tags_use_defaults is false                                                            | `string`       | `""`        |    no    |
| filter_tags_use_defaults              | Use default filter tags convention                                                                                                   | `string`       | `"true"`    |    no    |
| loadbalancer_status_no_data_timeframe | Number of minutes before reporting no data                                                                                           | `string`       | `10`        |    no    |
| message                               | Message sent when a monitor is triggered                                                                                             | `any`          | n/a         |   yes    |
| new_host_delay                        | Delay in seconds before monitor new resource                                                                                         | `number`       | `300`       |    no    |
| notify_no_data                        | Will raise no data alert if set to true                                                                                              | `bool`         | `true`      |    no    |
| prefix_slug                           | Prefix string to prepend between brackets on every monitors names                                                                    | `string`       | `""`        |    no    |
| status_enabled                        | Flag to enable Load Balancer status monitor                                                                                          | `string`       | `"true"`    |    no    |
| status_extra_tags                     | Extra tags for Load Balancer status monitor                                                                                          | `list(string)` | `[]`        |    no    |
| status_message                        | Custom message for Load Balancer status monitor                                                                                      | `string`       | `""`        |    no    |
| status_time_aggregator                | Monitor aggregator for Load Balancer status [available values: min, max or avg]                                                      | `string`       | `"max"`     |    no    |
| status_timeframe                      | Monitor timeframe for Load Balancer status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string`       | `"last_5m"` |    no    |

## Outputs

| Name                   | Description                        |
| ---------------------- | ---------------------------------- |
| loadbalancer_status_id | id for monitor loadbalancer_status |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/azure/?tab=azurecliv20](https://docs.datadoghq.com/integrations/azure/?tab=azurecliv20)
