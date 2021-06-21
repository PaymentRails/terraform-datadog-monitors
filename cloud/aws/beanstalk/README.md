# CLOUD AWS BEANSTALK DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-aws-beanstalk" {
  source      = "claranet/monitors/datadog//cloud/aws/beanstalk"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Beanstalk Application 5xx error rate
- Beanstalk Application latency p90
- Beanstalk Environment health
- Beanstalk Instance root file system usage

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                                          | Description                                                                                                                                          | Type           | Default      | Required |
| --------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- | -------------- | ------------ | :------: |
| application_5xx_error_rate_enabled            | Flag to enable Beanstalk application 5xx error ratemonitor                                                                                           | `string`       | `"true"`     |    no    |
| application_5xx_error_rate_extra_tags         | Extra tags for application 5xx error rate monitor                                                                                                    | `list(string)` | `[]`         |    no    |
| application_5xx_error_rate_message            | Custom message for application 5xx error rate                                                                                                        | `string`       | `""`         |    no    |
| application_5xx_error_rate_threshold_critical | 5xx Error rate critical threshold in percent                                                                                                         | `number`       | `5`          |    no    |
| application_5xx_error_rate_threshold_warning  | 5xx Error rate warning threshold in percent                                                                                                          | `string`       | `3`          |    no    |
| application_5xx_error_rate_time_aggregator    | Monitor aggregator for beanstalk application 5xx error rate [available values: min, max or avg]                                                      | `string`       | `"sum"`      |    no    |
| application_5xx_error_rate_timeframe          | Monitor timeframe for beanstalk application 5xx error rate [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string`       | `"last_15m"` |    no    |
| application_latency_p90_enabled               | Flag to enable Beanstalk application latency P90 monitor                                                                                             | `string`       | `"true"`     |    no    |
| application_latency_p90_extra_tags            | Extra tags for application latency P90 monitor                                                                                                       | `list(string)` | `[]`         |    no    |
| application_latency_p90_message               | Custom message for application latency P90 monitor                                                                                                   | `string`       | `""`         |    no    |
| application_latency_p90_threshold_critical    | P90 Latency critical threshold in seconds                                                                                                            | `number`       | `0.5`        |    no    |
| application_latency_p90_threshold_warning     | P90 Latency warning threshold in seconds                                                                                                             | `string`       | `0.3`        |    no    |
| application_latency_p90_time_aggregator       | Monitor aggregator for beanstalk application latency P90 [available values: min, max or avg]                                                         | `string`       | `"min"`      |    no    |
| application_latency_p90_timeframe             | Monitor timeframe for beanstalk application latency P90 [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]    | `string`       | `"last_15m"` |    no    |
| environment                                   | Architecture Environment                                                                                                                             | `string`       | n/a          |   yes    |
| evaluation_delay                              | Delay in seconds for the metric evaluation                                                                                                           | `number`       | `900`        |    no    |
| filter_tags_custom                            | Tags used for custom filtering when filter_tags_use_defaults is false                                                                                | `string`       | `"*"`        |    no    |
| filter_tags_custom_excluded                   | Tags excluded for custom filtering when filter_tags_use_defaults is false                                                                            | `string`       | `""`         |    no    |
| filter_tags_use_defaults                      | Use default filter tags convention                                                                                                                   | `string`       | `"true"`     |    no    |
| health_enabled                                | Flag to enable Beanstalk Health monitor                                                                                                              | `string`       | `"true"`     |    no    |
| health_extra_tags                             | Extra tags for health monitor                                                                                                                        | `list(string)` | `[]`         |    no    |
| health_message                                | Custom message for health monitor                                                                                                                    | `string`       | `""`         |    no    |
| health_no_data_timeframe                      | Number of minutes before reporting no data                                                                                                           | `string`       | `20`         |    no    |
| health_threshold_critical                     | Health critical threshold (see the `aws.elasticbeanstalk.environment_health` values in the Datadog documentation)                                    | `number`       | `20`         |    no    |
| health_threshold_warning                      | Health critical threshold (see the `aws.elasticbeanstalk.environment_health` values in the Datadog documentation)                                    | `number`       | `15`         |    no    |
| health_time_aggregator                        | Monitor aggregator for beanstalk health [available values: min, max or avg]                                                                          | `string`       | `"min"`      |    no    |
| health_timeframe                              | Monitor timeframe for beanstalk health [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]                     | `string`       | `"last_10m"` |    no    |
| message                                       | Message sent when an alert is triggered                                                                                                              | `any`          | n/a          |   yes    |
| new_host_delay                                | Delay in seconds before monitor new resource                                                                                                         | `number`       | `300`        |    no    |
| notify_no_data                                | Will raise no data alert if set to true                                                                                                              | `bool`         | `true`       |    no    |
| prefix_slug                                   | Prefix string to prepend between brackets on every monitors names                                                                                    | `string`       | `""`         |    no    |
| root_filesystem_usage_aggregator              | Monitor aggregator for beanstalk instance file system usage [available values: min, max or avg]                                                      | `string`       | `"max"`      |    no    |
| root_filesystem_usage_enabled                 | Flag to enable Beanstalk instance file system usage monitor                                                                                          | `string`       | `"true"`     |    no    |
| root_filesystem_usage_extra_tags              | Extra tags for file system usage monitor                                                                                                             | `list(string)` | `[]`         |    no    |
| root_filesystem_usage_message                 | Custom message for application file system usage                                                                                                     | `string`       | `""`         |    no    |
| root_filesystem_usage_threshold_critical      | File system usage critical threshold in percent                                                                                                      | `string`       | `90`         |    no    |
| root_filesystem_usage_threshold_warning       | File system usage warning threshold in percent                                                                                                       | `string`       | `80`         |    no    |
| root_filesystem_usage_timeframe               | Monitor timeframe for beanstalk instance file system usage [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string`       | `"last_5m"`  |    no    |
| root_filesystem_usage_timeout_h               | File system usage auto-resolving state (in hours)                                                                                                    | `number`       | `0`          |    no    |

## Outputs

| Name                          | Description                               |
| ----------------------------- | ----------------------------------------- |
| application_5xx_error_rate_id | id for monitor application_5xx_error_rate |
| application_latency_p90_id    | id for monitor application_latency_p90    |
| health_id                     | id for monitor health                     |
| root_filesystem_usage_id      | id for monitor root_filesystem_usage      |

## Related documentation

Datadog documentation: [https://docs.datadoghq.com/integrations/amazon_elasticbeanstalk/](https://docs.datadoghq.com/integrations/amazon_elasticbeanstalk/)

AWS Beanstalk Environment monitoring : [https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/environments-health.html](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/environments-health.html)
