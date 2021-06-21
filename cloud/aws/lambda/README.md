# CLOUD AWS LAMBDA DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-aws-lambda" {
  source      = "claranet/monitors/datadog//cloud/aws/lambda"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Lambda Invocations throttled due to concurrent limit reached
- Lambda Number of errors
- Lambda Number of invocations (disabled by default)
- Lambda Percentage of errors

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                           | Description                                                                                                                          | Type           | Default      | Required |
| ------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------ | -------------- | ------------ | :------: |
| environment                    | Architecture environment                                                                                                             | `string`       | n/a          |   yes    |
| errors_enabled                 | Flag to enable Errors monitor                                                                                                        | `string`       | `"false"`    |    no    |
| errors_extra_tags              | Extra tags for Errors monitor                                                                                                        | `list(string)` | `[]`         |    no    |
| errors_message                 | Custom message for Errors monitor                                                                                                    | `string`       | `""`         |    no    |
| errors_threshold_critical      | Alerting threshold in milliseconds                                                                                                   | `number`       | `3`          |    no    |
| errors_threshold_warning       | Warning threshold in milliseconds                                                                                                    | `number`       | `1`          |    no    |
| errors_time_aggregator         | Monitor aggregator for Errors [available values: min, max or avg]                                                                    | `string`       | `"sum"`      |    no    |
| errors_timeframe               | Monitor timeframe for Errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]               | `string`       | `"last_1h"`  |    no    |
| evaluation_delay               | Delay in seconds for the metric evaluation                                                                                           | `number`       | `900`        |    no    |
| filter_tags_custom             | Tags used for custom filtering when filter_tags_use_defaults is false                                                                | `string`       | `"*"`        |    no    |
| filter_tags_custom_excluded    | Tags excluded for custom filtering when filter_tags_use_defaults is false                                                            | `string`       | `""`         |    no    |
| filter_tags_use_defaults       | Use default filter tags convention                                                                                                   | `string`       | `"true"`     |    no    |
| invocations_enabled            | Flag to enable Invocations monitor                                                                                                   | `string`       | `"false"`    |    no    |
| invocations_extra_tags         | Extra tags for Invocations monitor                                                                                                   | `list(string)` | `[]`         |    no    |
| invocations_message            | Custom message for Invocations monitor                                                                                               | `string`       | `""`         |    no    |
| invocations_no_data_timeframe  | Timeframe to check before alerting on no data in minutes                                                                             | `number`       | `120`        |    no    |
| invocations_threshold_critical | Alerting threshold in number of invocations                                                                                          | `number`       | `1`          |    no    |
| invocations_threshold_warning  | Warning threshold in number of invocations                                                                                           | `number`       | `2`          |    no    |
| invocations_time_aggregator    | Monitor aggregator for Invocations [available values: min, max or avg]                                                               | `string`       | `"sum"`      |    no    |
| invocations_timeframe          | Monitor timeframe for Invocations [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]          | `string`       | `"last_30m"` |    no    |
| message                        | Message sent when a monitor is triggered                                                                                             | `any`          | n/a          |   yes    |
| new_host_delay                 | Delay in seconds before monitor new resource                                                                                         | `number`       | `300`        |    no    |
| notify_no_data                 | Will raise no data alert if set to true                                                                                              | `bool`         | `true`       |    no    |
| pct_errors_enabled             | Flag to enable Percentage of errors monitor                                                                                          | `string`       | `"true"`     |    no    |
| pct_errors_extra_tags          | Extra tags for Percentage of errors monitor                                                                                          | `list(string)` | `[]`         |    no    |
| pct_errors_message             | Custom message for Percentage of errors monitor                                                                                      | `string`       | `""`         |    no    |
| pct_errors_threshold_critical  | Alerting threshold in percentage                                                                                                     | `number`       | `30`         |    no    |
| pct_errors_threshold_warning   | Warning threshold in percentage                                                                                                      | `number`       | `20`         |    no    |
| pct_errors_time_aggregator     | Monitor aggregator for Percentage of errors [available values: min, max or avg]                                                      | `string`       | `"sum"`      |    no    |
| pct_errors_timeframe           | Monitor timeframe for Percentage of errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string`       | `"last_1h"`  |    no    |
| prefix_slug                    | Prefix string to prepend between brackets on every monitors names                                                                    | `string`       | `""`         |    no    |
| throttles_enabled              | Flag to enable Throttles monitor                                                                                                     | `string`       | `"true"`     |    no    |
| throttles_extra_tags           | Extra tags for Throttles monitor                                                                                                     | `list(string)` | `[]`         |    no    |
| throttles_message              | Custom message for Throttles monitor                                                                                                 | `string`       | `""`         |    no    |
| throttles_threshold_critical   | Alerting threshold in number of throttles                                                                                            | `number`       | `3`          |    no    |
| throttles_threshold_warning    | Warning threshold in number of throttles                                                                                             | `number`       | `1`          |    no    |
| throttles_time_aggregator      | Monitor aggregator for Throttles [available values: min, max or avg]                                                                 | `string`       | `"sum"`      |    no    |
| throttles_timeframe            | Monitor timeframe for Throttles [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]            | `string`       | `"last_1h"`  |    no    |

## Outputs

| Name           | Description                |
| -------------- | -------------------------- |
| errors_id      | id for monitor errors      |
| invocations_id | id for monitor invocations |
| pct_errors_id  | id for monitor pct_errors  |
| throttles_id   | id for monitor throttles   |

## Related documentation

- [Datadog Documentation](https://docs.datadoghq.com/integrations/amazon_lambda/)
- [Service documentation](https://docs.aws.amazon.com/lambda/index.html)
