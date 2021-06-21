# NETWORK HTTP WEBCHECK DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-network-http-webcheck" {
  source      = "claranet/monitors/datadog//network/http/webcheck"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- HTTP cannot connect

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                             | Description                                                               | Type           | Default  | Required |
| -------------------------------- | ------------------------------------------------------------------------- | -------------- | -------- | :------: |
| cannot_connect_enabled           | Flag to enable HTTP cannot connect monitor                                | `string`       | `"true"` |    no    |
| cannot_connect_extra_tags        | Extra tags for HTTP cannot connect monitor                                | `list(string)` | `[]`     |    no    |
| cannot_connect_message           | Custom message for HTTP cannot connect monitor                            | `string`       | `""`     |    no    |
| cannot_connect_no_data_timeframe | HTTP cannot connect monitor no data timeframe                             | `string`       | `10`     |    no    |
| cannot_connect_threshold_warning | HTTP cannot connect monitor (warning threshold)                           | `string`       | `3`      |    no    |
| environment                      | Architecture Environment                                                  | `string`       | n/a      |   yes    |
| evaluation_delay                 | Delay in seconds for the metric evaluation                                | `number`       | `15`     |    no    |
| filter_tags_custom               | Tags used for custom filtering when filter_tags_use_defaults is false     | `string`       | `"*"`    |    no    |
| filter_tags_custom_excluded      | Tags excluded for custom filtering when filter_tags_use_defaults is false | `string`       | `""`     |    no    |
| filter_tags_use_defaults         | Use default filter tags convention                                        | `string`       | `"true"` |    no    |
| message                          | Message sent when an alert is triggered                                   | `any`          | n/a      |   yes    |
| new_host_delay                   | Delay in seconds before monitor new resource                              | `number`       | `300`    |    no    |
| notify_no_data                   | Will raise no data alert if set to true                                   | `bool`         | `true`   |    no    |
| prefix_slug                      | Prefix string to prepend between brackets on every monitors names         | `string`       | `""`     |    no    |

## Outputs

| Name              | Description                   |
| ----------------- | ----------------------------- |
| cannot_connect_id | id for monitor cannot_connect |

## Related documentation
