# MIDDLEWARE PHP-FPM DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-middleware-php-fpm" {
  source      = "claranet/monitors/datadog//middleware/php-fpm"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Php-fpm busy worker
- Php-fpm ping url does not respond

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                              | Description                                                                                                                         | Type           | Default      | Required |
| --------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------- | -------------- | ------------ | :------: |
| environment                       | Architecture Environment                                                                                                            | `string`       | n/a          |   yes    |
| evaluation_delay                  | Delay in seconds for the metric evaluation                                                                                          | `number`       | `15`         |    no    |
| filter_tags_custom                | Tags used for custom filtering when filter_tags_use_defaults is false                                                               | `string`       | `"*"`        |    no    |
| filter_tags_custom_excluded       | Tags excluded for custom filtering when filter_tags_use_defaults is false                                                           | `string`       | `""`         |    no    |
| filter_tags_use_defaults          | Use default filter tags convention                                                                                                  | `string`       | `"true"`     |    no    |
| message                           | Message sent when an alert is triggered                                                                                             | `any`          | n/a          |   yes    |
| new_host_delay                    | Delay in seconds before monitor new resource                                                                                        | `number`       | `300`        |    no    |
| notify_no_data                    | Will raise no data alert if set to true                                                                                             | `bool`         | `true`       |    no    |
| php_fpm_busy_enabled              | Flag to enable PHP FPM busy worker monitor                                                                                          | `string`       | `"true"`     |    no    |
| php_fpm_busy_extra_tags           | Extra tags for PHP FPM busy worker monitor                                                                                          | `list(string)` | `[]`         |    no    |
| php_fpm_busy_message              | Custom message for PHP FPM busy worker monitor                                                                                      | `string`       | `""`         |    no    |
| php_fpm_busy_threshold_critical   | php fpm busy critical threshold                                                                                                     | `number`       | `90`         |    no    |
| php_fpm_busy_threshold_warning    | php fpm busy warning threshold                                                                                                      | `number`       | `80`         |    no    |
| php_fpm_busy_time_aggregator      | Monitor aggregator for PHP FPM busy worker [available values: min, max or avg]                                                      | `string`       | `"avg"`      |    no    |
| php_fpm_busy_timeframe            | Monitor timeframe for PHP FPM busy worker [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string`       | `"last_10m"` |    no    |
| php_fpm_connect_enabled           | Flag to enable PHP FPM status monitor                                                                                               | `string`       | `"true"`     |    no    |
| php_fpm_connect_extra_tags        | Extra tags for PHP FPM status monitor                                                                                               | `list(string)` | `[]`         |    no    |
| php_fpm_connect_message           | Custom message for PHP FPM status monitor                                                                                           | `string`       | `""`         |    no    |
| php_fpm_connect_no_data_timeframe | PHP FPM status monitor no data timeframe                                                                                            | `string`       | `10`         |    no    |
| php_fpm_connect_threshold_warning | PHP FPM status monitor (warning threshold)                                                                                          | `string`       | `3`          |    no    |
| prefix_slug                       | Prefix string to prepend between brackets on every monitors names                                                                   | `string`       | `""`         |    no    |

## Outputs

| Name                    | Description                         |
| ----------------------- | ----------------------------------- |
| php_fpm_connect_id      | id for monitor php_fpm_connect      |
| php_fpm_connect_idle_id | id for monitor php_fpm_connect_idle |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/php_fpm/](https://docs.datadoghq.com/integrations/php_fpm/)
