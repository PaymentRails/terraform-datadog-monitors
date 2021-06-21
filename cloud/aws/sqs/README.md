# CLOUD AWS SQS DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-aws-sqs" {
  source      = "claranet/monitors/datadog//cloud/aws/sqs"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- SQS Age of the oldest message
- SQS Visible messages (disabled by default)

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                                     | Description                                                                                                                                | Type           | Default      | Required |
| ---------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------ | -------------- | ------------ | :------: |
| age_of_oldest_message_enabled            | Flag to enable Age of Oldest Message monitor                                                                                               | `string`       | `"true"`     |    no    |
| age_of_oldest_message_extra_tags         | Extra tags for Age of Oldest Message monitor                                                                                               | `list(string)` | `[]`         |    no    |
| age_of_oldest_message_message            | Custom message for Age of Oldest Message monitor                                                                                           | `string`       | `""`         |    no    |
| age_of_oldest_message_threshold_critical | Alerting threshold in seconds                                                                                                              | `number`       | `600`        |    no    |
| age_of_oldest_message_threshold_warning  | Warning threshold in seconds                                                                                                               | `number`       | `300`        |    no    |
| age_of_oldest_message_time_aggregator    | Monitor aggregator for Age of Oldest Message [available values: min, max or avg]                                                           | `string`       | `"min"`      |    no    |
| age_of_oldest_message_timeframe          | Monitor timeframe for Age of Oldest Message [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]      | `string`       | `"last_30m"` |    no    |
| environment                              | Architecture environment                                                                                                                   | `string`       | n/a          |   yes    |
| evaluation_delay                         | Delay in seconds for the metric evaluation                                                                                                 | `number`       | `900`        |    no    |
| filter_tags_custom                       | Tags used for custom filtering when filter_tags_use_defaults is false                                                                      | `string`       | `"*"`        |    no    |
| filter_tags_custom_excluded              | Tags excluded for custom filtering when filter_tags_use_defaults is false                                                                  | `string`       | `""`         |    no    |
| filter_tags_use_defaults                 | Use default filter tags convention                                                                                                         | `string`       | `"true"`     |    no    |
| message                                  | Message sent when a monitor is triggered                                                                                                   | `any`          | n/a          |   yes    |
| new_host_delay                           | Delay in seconds before monitor new resource                                                                                               | `number`       | `300`        |    no    |
| notify_no_data                           | Will raise no data alert if set to true                                                                                                    | `bool`         | `true`       |    no    |
| prefix_slug                              | Prefix string to prepend between brackets on every monitors names                                                                          | `string`       | `""`         |    no    |
| visible_messages_enabled                 | Flag to enable Number of Visible Messages monitor                                                                                          | `string`       | `"false"`    |    no    |
| visible_messages_extra_tags              | Extra tags for Number of Visible Messages monitor                                                                                          | `list(string)` | `[]`         |    no    |
| visible_messages_message                 | Custom message for Number of Visible Messages monitor                                                                                      | `string`       | `""`         |    no    |
| visible_messages_threshold_critical      | Alerting threshold in number of messages                                                                                                   | `number`       | `2`          |    no    |
| visible_messages_threshold_warning       | Warning threshold in number of messages                                                                                                    | `number`       | `1`          |    no    |
| visible_messages_time_aggregator         | Monitor aggregator for Number of Visible Messages [available values: min, max or avg]                                                      | `string`       | `"min"`      |    no    |
| visible_messages_timeframe               | Monitor timeframe for Number of Visible Messages [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string`       | `"last_30m"` |    no    |

## Outputs

| Name                     | Description                          |
| ------------------------ | ------------------------------------ |
| age_of_oldest_message_id | id for monitor age_of_oldest_message |
| visible_messages_id      | id for monitor visible_messages      |

## Related documentation

- [Datadog Documentation](https://docs.datadoghq.com/integrations/amazon_sqs/)
- [Service Documentation](https://docs.aws.amazon.com/sqs/index.html)
