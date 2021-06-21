# MIDDLEWARE KONG DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-middleware-kong" {
  source      = "claranet/monitors/datadog//middleware/kong"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Kong does not respond
- Kong exceeded its treatment limit

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                               | Description                                                               | Type           | Default      | Required |
| ---------------------------------- | ------------------------------------------------------------------------- | -------------- | ------------ | :------: |
| environment                        | Architecture Environment                                                  | `string`       | n/a          |   yes    |
| evaluation_delay                   | Delay in seconds for the metric evaluation                                | `number`       | `15`         |    no    |
| filter_tags_custom                 | Tags used for custom filtering when filter_tags_use_defaults is false     | `string`       | `"*"`        |    no    |
| filter_tags_custom_excluded        | Tags excluded for custom filtering when filter_tags_use_defaults is false | `string`       | `""`         |    no    |
| filter_tags_use_defaults           | Use default filter tags convention                                        | `string`       | `"true"`     |    no    |
| message                            | Message sent when an alert is triggered                                   | `any`          | n/a          |   yes    |
| new_host_delay                     | Delay in seconds before monitor new resource                              | `number`       | `300`        |    no    |
| not_responding_enabled             | Flag to enable Kong does not respond monitor                              | `string`       | `"true"`     |    no    |
| not_responding_extra_tags          | Extra tags for Kong does not respond monitor                              | `list(string)` | `[]`         |    no    |
| not_responding_message             | Custom message for Kong does not respond monitor                          | `string`       | `""`         |    no    |
| not_responding_no_data_timeframe   | Kong does not respond monitor no data timeframe                           | `string`       | `10`         |    no    |
| not_responding_threshold_warning   | Warning threshold for the service check                                   | `string`       | `3`          |    no    |
| notify_no_data                     | Will raise no data alert if set to true                                   | `bool`         | `true`       |    no    |
| prefix_slug                        | Prefix string to prepend between brackets on every monitors names         | `string`       | `""`         |    no    |
| treatment_limit_enabled            | Flag to enable Kong Treatment Limit monitor                               | `string`       | `"true"`     |    no    |
| treatment_limit_extra_tags         | Extra tags for Kong Treatment Limit monitor                               | `list(string)` | `[]`         |    no    |
| treatment_limit_message            | Custom message for the Kong Treatment Limit monitor                       | `string`       | `""`         |    no    |
| treatment_limit_threshold_critical | Docker Container Memory Usage critical threshold                          | `string`       | `20`         |    no    |
| treatment_limit_threshold_warning  | Docker Container Memory Usage warning threshold                           | `string`       | `0`          |    no    |
| treatment_limit_time_aggregator    | Time aggregator for the Kong Treatment Limit monitor                      | `string`       | `"min"`      |    no    |
| treatment_limit_timeframe          | Timeframe for the Kong Treatment Limit monitor                            | `string`       | `"last_15m"` |    no    |

## Outputs

| Name               | Description                    |
| ------------------ | ------------------------------ |
| not_responding_id  | id for monitor not_responding  |
| treatment_limit_id | id for monitor treatment_limit |

## Related documentation

- [Datadog Kong integration](https://docs.datadoghq.com/integrations/kong/)
