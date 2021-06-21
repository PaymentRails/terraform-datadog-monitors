# CLOUD GCP PUBSUB SUBSCRIPTION DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-gcp-pubsub-subscription" {
  source      = "claranet/monitors/datadog//cloud/gcp/pubsub/subscription"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Pub/Sub Subscription latency on push endpoint
- Pub/Sub Subscription latency on push endpoint changed abnormally (disabled by default)
- Pub/Sub Subscription oldest unacknowledged message

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                                                  | Description                                                                         | Type           | Default      | Required |
| ----------------------------------------------------- | ----------------------------------------------------------------------------------- | -------------- | ------------ | :------: |
| environment                                           | Architecture environment                                                            | `string`       | n/a          |   yes    |
| evaluation_delay                                      | Delay in seconds for the metric evaluation                                          | `number`       | `900`        |    no    |
| filter_tags                                           | Tags used for filtering                                                             | `string`       | `"*"`        |    no    |
| message                                               | Message sent when a monitor is triggered                                            | `any`          | n/a          |   yes    |
| new_host_delay                                        | Delay in seconds for the new host evaluation                                        | `number`       | `300`        |    no    |
| notify_no_data                                        | Will raise no data alert if set to true                                             | `bool`         | `true`       |    no    |
| oldest_unacked_message_age_enabled                    | Flag to enable GCP Pub/Sub Subscription Oldest Unacked Message Age monitor          | `string`       | `"true"`     |    no    |
| oldest_unacked_message_age_extra_tags                 | Extra tags for GCP Pub/Sub Subscription Oldest Unacked Message Age monitor          | `list(string)` | `[]`         |    no    |
| oldest_unacked_message_age_message                    | Custom message for the GCP Pub/Sub Subscription Oldest Unacked Message Age monitor  | `string`       | `""`         |    no    |
| oldest_unacked_message_age_threshold_critical         | GCP Pub/Sub Subscription Oldest Unacked Message Age critical threshold              | `string`       | `120`        |    no    |
| oldest_unacked_message_age_threshold_warning          | GCP Pub/Sub Subscription Oldest Unacked Message Age warning threshold               | `string`       | `30`         |    no    |
| oldest_unacked_message_age_time_aggregator            | Time aggregator for the GCP Pub/Sub Subscription Oldest Unacked Message Age monitor | `string`       | `"min"`      |    no    |
| oldest_unacked_message_age_timeframe                  | Timeframe for the GCP Pub/Sub Subscription Oldest Unacked Message Age monitor       | `string`       | `"last_5m"`  |    no    |
| prefix_slug                                           | Prefix string to prepend between brackets on every monitors names                   | `string`       | `""`         |    no    |
| subscription_push_latency_anomaly_alert_window        | Alert window.                                                                       | `string`       | `"last_15m"` |    no    |
| subscription_push_latency_anomaly_count_default_zero  | Count default zero.                                                                 | `string`       | `"true"`     |    no    |
| subscription_push_latency_anomaly_detection_algorithm | Anomaly Detection Algorithm used                                                    | `string`       | `"basic"`    |    no    |
| subscription_push_latency_anomaly_direction           | Direction of the anomaly. It can be both, below or above.                           | `string`       | `"above"`    |    no    |
| subscription_push_latency_anomaly_enabled             | Flag to enable GCP Pub/Sub Subscription Push Latency Anomaly monitor                | `string`       | `"false"`    |    no    |
| subscription_push_latency_anomaly_extra_tags          | Extra tags for GCP Pub/Sub Subscription Push Latency Anomaly monitor                | `list(string)` | `[]`         |    no    |
| subscription_push_latency_anomaly_interval            | Interval.                                                                           | `string`       | `60`         |    no    |
| subscription_push_latency_anomaly_message             | Custom message for the GCP Pub/Sub Subscription Push Latency Anomaly monitor        | `string`       | `""`         |    no    |
| subscription_push_latency_anomaly_seasonality         | Seasonality of the algorithm                                                        | `string`       | `"daily"`    |    no    |
| subscription_push_latency_anomaly_threshold_critical  | GCP Pub/Sub Subscription Push Latency Anomaly critical threshold                    | `string`       | `2`          |    no    |
| subscription_push_latency_anomaly_threshold_warning   | GCP Pub/Sub Subscription Push Latency Anomaly warning threshold                     | `string`       | `1`          |    no    |
| subscription_push_latency_anomaly_time_aggregator     | Time aggregator for the GCP Pub/Sub Subscription Push Latency Anomaly monitor       | `string`       | `"avg"`      |    no    |
| subscription_push_latency_anomaly_timeframe           | Timeframe for the GCP Pub/Sub Subscription Push Latency Anomaly monitor             | `string`       | `"last_10m"` |    no    |
| subscription_push_latency_enabled                     | Flag to enable GCP Pub/Sub Subscription Push Latency High monitor                   | `string`       | `"true"`     |    no    |
| subscription_push_latency_extra_tags                  | Extra tags for GCP Pub/Sub Subscription Push Latency High monitor                   | `list(string)` | `[]`         |    no    |
| subscription_push_latency_message                     | Custom message for the GCP Pub/Sub Subscription Push Latency High monitor           | `string`       | `""`         |    no    |
| subscription_push_latency_threshold_critical          | GCP Pub/Sub Subscription Push Latency High critical threshold                       | `string`       | `5000`       |    no    |
| subscription_push_latency_threshold_warning           | GCP Pub/Sub Subscription Push Latency High warning threshold                        | `string`       | `1000`       |    no    |
| subscription_push_latency_time_aggregator             | Time aggregator for the GCP Pub/Sub Subscription Push Latency High monitor          | `string`       | `"avg"`      |    no    |
| subscription_push_latency_timeframe                   | Timeframe for the GCP Pub/Sub Subscription Push Latency High monitor                | `string`       | `"last_10m"` |    no    |

## Outputs

| Name                                 | Description                                      |
| ------------------------------------ | ------------------------------------------------ |
| oldest_unacked_message_age_id        | id for monitor oldest_unacked_message_age        |
| subscription_push_latency_anomaly_id | id for monitor subscription_push_latency_anomaly |
| subscription_push_latency_id         | id for monitor subscription_push_latency         |

## Related documentation

- [GCP Pub/Sub Metrics](https://cloud.google.com/monitoring/api/metrics_gcp#gcp-pubsub)
- [Datadog GCP Pub/Sub integration](https://docs.datadoghq.com/integrations/google_cloud_pubsub/)
