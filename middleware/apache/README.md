# MIDDLEWARE APACHE DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-middleware-apache" {
  source      = "claranet/monitors/datadog//middleware/apache"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Apache vhost status does not respond

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                                     | Description                                                               | Type           | Default  | Required |
| ---------------------------------------- | ------------------------------------------------------------------------- | -------------- | -------- | :------: |
| apache_connect_enabled                   | Flag to enable Apache status monitor                                      | `string`       | `"true"` |    no    |
| apache_connect_extra_tags                | Extra tags for Apache process monitor                                     | `list(string)` | `[]`     |    no    |
| apache_connect_message                   | Custom message for Apache status monitor                                  | `string`       | `""`     |    no    |
| apache_connect_threshold_warning         | Apache status monitor (warning threshold)                                 | `string`       | `3`      |    no    |
| datadog_apache_process_no_data_timeframe | Number of minutes before reporting no data                                | `string`       | `10`     |    no    |
| environment                              | Architecture Environment                                                  | `string`       | n/a      |   yes    |
| evaluation_delay                         | Delay in seconds for the metric evaluation                                | `number`       | `15`     |    no    |
| filter_tags_custom                       | Tags used for custom filtering when filter_tags_use_defaults is false     | `string`       | `"*"`    |    no    |
| filter_tags_custom_excluded              | Tags excluded for custom filtering when filter_tags_use_defaults is false | `string`       | `""`     |    no    |
| filter_tags_use_defaults                 | Use default filter tags convention                                        | `string`       | `"true"` |    no    |
| message                                  | Message sent when an alert is triggered                                   | `any`          | n/a      |   yes    |
| new_host_delay                           | Delay in seconds before monitor new resource                              | `number`       | `300`    |    no    |
| notify_no_data                           | Will raise no data alert if set to true                                   | `bool`         | `true`   |    no    |
| prefix_slug                              | Prefix string to prepend between brackets on every monitors names         | `string`       | `""`     |    no    |

## Outputs

| Name                      | Description                           |
| ------------------------- | ------------------------------------- |
| datadog_apache_process_id | id for monitor datadog_apache_process |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/apache/](https://docs.datadoghq.com/integrations/apache/)
