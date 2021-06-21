# SYSTEM UNREACHABLE DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-system-unreachable" {
  source      = "claranet/monitors/datadog//system/unreachable"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Host unreachable

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                          | Description                                                               | Type           | Default  | Required |
| ----------------------------- | ------------------------------------------------------------------------- | -------------- | -------- | :------: |
| environment                   | Architecture Environment                                                  | `string`       | n/a      |   yes    |
| evaluation_delay              | Delay in seconds for the metric evaluation                                | `number`       | `15`     |    no    |
| filter_tags_custom            | Tags used for custom filtering when filter_tags_use_defaults is false     | `string`       | `"*"`    |    no    |
| filter_tags_custom_excluded   | Tags excluded for custom filtering when filter_tags_use_defaults is false | `string`       | `""`     |    no    |
| filter_tags_use_defaults      | Use default filter tags convention                                        | `string`       | `"true"` |    no    |
| message                       | Message sent when an alert is triggered                                   | `any`          | n/a      |   yes    |
| new_host_delay                | Delay in seconds before monitor new resource                              | `number`       | `300`    |    no    |
| notify_no_data                | Will raise no data alert if set to true                                   | `bool`         | `true`   |    no    |
| prefix_slug                   | Prefix string to prepend between brackets on every monitors names         | `string`       | `""`     |    no    |
| unreachable_enabled           | Flag to enable Host unreachable monitor                                   | `string`       | `"true"` |    no    |
| unreachable_extra_tags        | Extra tags for Host unreachable monitor                                   | `list(string)` | `[]`     |    no    |
| unreachable_message           | Custom message for Host unreachable monitor                               | `string`       | `""`     |    no    |
| unreachable_no_data_timeframe | Timeframe for Host unreachable monitor to alert on no data                | `string`       | `20`     |    no    |

## Outputs

| Name                | Description                     |
| ------------------- | ------------------------------- |
| host_unreachable_id | id for monitor host_unreachable |

## Related documentation
