# CLOUD AWS KINESIS-FIREHOSE DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-aws-kinesis-firehose" {
  source      = "claranet/monitors/datadog//cloud/aws/kinesis-firehose"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Kinesis Firehose No incoming records

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                                        | Description                                                                                                                                         | Type           | Default      | Required |
| ------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------- | -------------- | ------------ | :------: |
| environment                                 | Environment                                                                                                                                         | `string`       | n/a          |   yes    |
| evaluation_delay                            | Delay in seconds for the metric evaluation                                                                                                          | `number`       | `900`        |    no    |
| filter_tags_custom                          | Tags used for custom filtering when filter_tags_use_defaults is false                                                                               | `string`       | `"*"`        |    no    |
| filter_tags_custom_excluded                 | Tags excluded for custom filtering when filter_tags_use_defaults is false                                                                           | `string`       | `""`         |    no    |
| filter_tags_use_defaults                    | Use default filter tags convention                                                                                                                  | `string`       | `"true"`     |    no    |
| firehose_incoming_records_no_data_timeframe | Number of minutes before reporting no data                                                                                                          | `string`       | `30`         |    no    |
| incoming_records_enabled                    | Flag to enable Kinesis Firehorse incoming records monitor                                                                                           | `string`       | `"true"`     |    no    |
| incoming_records_extra_tags                 | Extra tags for Kinesis Firehorse incoming records monitor                                                                                           | `list(string)` | `[]`         |    no    |
| incoming_records_message                    | Custom message for Kinesis Firehorse incoming records monitor                                                                                       | `string`       | `""`         |    no    |
| incoming_records_timeframe                  | Monitor timeframe for incoming records metrics evaluation [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string`       | `"last_15m"` |    no    |
| message                                     | Message sent when an alert is triggered                                                                                                             | `any`          | n/a          |   yes    |
| new_host_delay                              | Delay in seconds before monitor new resource                                                                                                        | `number`       | `300`        |    no    |
| notify_no_data                              | Will raise no data alert if set to true                                                                                                             | `bool`         | `true`       |    no    |
| prefix_slug                                 | Prefix string to prepend between brackets on every monitors names                                                                                   | `string`       | `""`         |    no    |

## Outputs

| Name                         | Description                              |
| ---------------------------- | ---------------------------------------- |
| firehose_incoming_records_id | id for monitor firehose_incoming_records |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/amazon_firehose/](https://docs.datadoghq.com/integrations/amazon_firehose/)

AWS Kinesis Firehose metrics documentation: [https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/akf-metricscollected.html](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/akf-metricscollected.html)
