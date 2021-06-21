# CLOUD GCP PUBSUB TOPIC DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-gcp-pubsub-topic" {
  source      = "claranet/monitors/datadog//cloud/gcp/pubsub/topic"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Pub/Sub Topic ratio of sending messages with result unavailable
- Pub/Sub Topic sending messages operations
- Pub/Sub Topic sending messages with result unavailable (disabled by default)

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                                                    | Description                                                                     | Type           | Default      | Required |
| ------------------------------------------------------- | ------------------------------------------------------------------------------- | -------------- | ------------ | :------: |
| environment                                             | Architecture environment                                                        | `string`       | n/a          |   yes    |
| evaluation_delay                                        | Delay in seconds for the metric evaluation                                      | `number`       | `900`        |    no    |
| filter_tags                                             | Tags used for filtering                                                         | `string`       | `"*"`        |    no    |
| message                                                 | Message sent when a monitor is triggered                                        | `any`          | n/a          |   yes    |
| new_host_delay                                          | Delay in seconds for the new host evaluation                                    | `number`       | `300`        |    no    |
| notify_no_data                                          | Will raise no data alert if set to true                                         | `bool`         | `true`       |    no    |
| prefix_slug                                             | Prefix string to prepend between brackets on every monitors names               | `string`       | `""`         |    no    |
| sending_operations_count_enabled                        | Flag to enable GCP Pub/Sub Unavailable Sending Operations Count monitor         | `string`       | `"true"`     |    no    |
| sending_operations_count_extra_tags                     | Extra tags for GCP Pub/Sub Sending Operations Count monitor                     | `list(string)` | `[]`         |    no    |
| sending_operations_count_message                        | Custom message for the GCP Pub/Sub Sending Operations Count monitor             | `string`       | `""`         |    no    |
| sending_operations_count_threshold_critical             | Critical threshold for the number of sending operations.                        | `string`       | `0`          |    no    |
| sending_operations_count_time_aggregator                | Timeframe for the GCP Pub/Sub Sending Operations Count monitor                  | `string`       | `"sum"`      |    no    |
| sending_operations_count_timeframe                      | Timeframe for the GCP Pub/Sub Sending Operations Count monitor                  | `string`       | `"last_30m"` |    no    |
| unavailable_sending_operations_count_enabled            | Flag to enable GCP Pub/Sub Unavailable Sending Operations Count monitor         | `string`       | `"false"`    |    no    |
| unavailable_sending_operations_count_extra_tags         | Extra tags for GCP Pub/Sub Unavailable Sending Operations Count monitor         | `list(string)` | `[]`         |    no    |
| unavailable_sending_operations_count_message            | Custom message for the GCP Pub/Sub Unavailable Sending Operations Count monitor | `string`       | `""`         |    no    |
| unavailable_sending_operations_count_threshold_critical | Critical threshold for the number of unavailable sending operations             | `string`       | `4`          |    no    |
| unavailable_sending_operations_count_threshold_warning  | Warning threshold for the number of unavailable sending operations              | `string`       | `2`          |    no    |
| unavailable_sending_operations_count_time_aggregator    | Timeframe for the GCP Pub/Sub Unavailable Sending Operations Count monitor      | `string`       | `"sum"`      |    no    |
| unavailable_sending_operations_count_timeframe          | Timeframe for the GCP Pub/Sub Unavailable Sending Operations Count monitor      | `string`       | `"last_10m"` |    no    |
| unavailable_sending_operations_ratio_enabled            | Flag to enable GCP Pub/Sub Unavailable Sending Operations Ratio monitor         | `string`       | `"true"`     |    no    |
| unavailable_sending_operations_ratio_extra_tags         | Extra tags for GCP Pub/Sub Unavailable Sending Operations Ratio monitor         | `list(string)` | `[]`         |    no    |
| unavailable_sending_operations_ratio_message            | Custom message for the GCP Pub/Sub Unavailable Sending Operations Ratio monitor | `string`       | `""`         |    no    |
| unavailable_sending_operations_ratio_threshold_critical | Critical threshold (%) for the ratio of unavailable sending operations          | `string`       | `20`         |    no    |
| unavailable_sending_operations_ratio_threshold_warning  | Warning threshold (%) for the ratio of unavailable sending operations           | `string`       | `10`         |    no    |
| unavailable_sending_operations_ratio_time_aggregator    | Timeframe for the GCP Pub/Sub Unavailable Sending Operations Ratio monitor      | `string`       | `"sum"`      |    no    |
| unavailable_sending_operations_ratio_timeframe          | Timeframe for the GCP Pub/Sub Unavailable Sending Operations Ratio monitor      | `string`       | `"last_10m"` |    no    |

## Outputs

| Name                                    | Description                                         |
| --------------------------------------- | --------------------------------------------------- |
| sending_operations_count_id             | id for monitor sending_operations_count             |
| unavailable_sending_operations_count_id | id for monitor unavailable_sending_operations_count |
| unavailable_sending_operations_ratio_id | id for monitor unavailable_sending_operations_ratio |

## Related documentation

- [GCP Pub/Sub Metrics](https://cloud.google.com/monitoring/api/metrics_gcp#gcp-pubsub)
- [Datadog GCP Pub/Sub integration](https://docs.datadoghq.com/integrations/google_cloud_pubsub/)
