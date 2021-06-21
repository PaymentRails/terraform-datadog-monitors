# NETWORK DNS DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-network-dns" {
  source      = "claranet/monitors/datadog//network/dns"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- DNS cannot resolve

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                             | Description                                                               | Type           | Default  | Required |
| -------------------------------- | ------------------------------------------------------------------------- | -------------- | -------- | :------: |
| cannot_resolve_enabled           | Flag to enable DNS cannot resolve monitor                                 | `string`       | `"true"` |    no    |
| cannot_resolve_extra_tags        | Extra tags for DNS cannot resolve monitor                                 | `list(string)` | `[]`     |    no    |
| cannot_resolve_message           | Custom message for DNS cannot resolve monitor                             | `string`       | `""`     |    no    |
| cannot_resolve_no_data_timeframe | DNS cannot resolve monitor no data timeframe                              | `string`       | `10`     |    no    |
| cannot_resolve_threshold_warning | DNS cannot resolve monitor (warning threshold)                            | `string`       | `3`      |    no    |
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
| cannot_resolve_id | id for monitor cannot_resolve |

## Related documentation

- [Datadog DNS integration](https://docs.datadoghq.com/integrations/dns_check/)
