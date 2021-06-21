# CLOUD AWS ALB DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-aws-alb" {
  source      = "claranet/monitors/datadog//cloud/aws/alb"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- ALB healthy instances
- ALB HTTP code 4xx
- ALB HTTP code 5xx
- ALB latency
- ALB target HTTP code 4xx
- ALB target HTTP code 5xx

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                                       | Description                                                                                                                              | Type           | Default     | Required |
| ------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------- | -------------- | ----------- | :------: |
| alb_no_healthy_instances_enabled           | Flag to enable ALB no healthy instances monitor                                                                                          | `string`       | `"true"`    |    no    |
| alb_no_healthy_instances_extra_tags        | Extra tags for ALB no healthy instances monitor                                                                                          | `list(string)` | `[]`        |    no    |
| alb_no_healthy_instances_message           | Custom message for ALB no healthy instances monitor                                                                                      | `string`       | `""`        |    no    |
| alb_no_healthy_instances_no_data_timeframe | Number of minutes before reporting no data                                                                                               | `string`       | `10`        |    no    |
| alb_no_healthy_instances_threshold_warning | ALB no healthy instances warning threshold in percentage                                                                                 | `number`       | `100`       |    no    |
| alb_no_healthy_instances_time_aggregator   | Monitor aggregator for ALB no healthy instances [available values: min, max or avg]                                                      | `string`       | `"min"`     |    no    |
| alb_no_healthy_instances_timeframe         | Monitor timeframe for ALB no healthy instances [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string`       | `"last_5m"` |    no    |
| artificial_requests_count                  | Number of false requests used to mitigate false positive in case of low trafic                                                           | `number`       | `5`         |    no    |
| environment                                | Architecture environment                                                                                                                 | `string`       | n/a         |   yes    |
| evaluation_delay                           | Delay in seconds for the metric evaluation                                                                                               | `number`       | `900`       |    no    |
| filter_tags_custom                         | Tags used for custom filtering when filter_tags_use_defaults is false                                                                    | `string`       | `"*"`       |    no    |
| filter_tags_custom_excluded                | Tags excluded for custom filtering when filter_tags_use_defaults is false                                                                | `string`       | `""`        |    no    |
| filter_tags_use_defaults                   | Use default filter tags convention                                                                                                       | `string`       | `"true"`    |    no    |
| httpcode_alb_4xx_enabled                   | Flag to enable ALB httpcode 4xx monitor                                                                                                  | `string`       | `"true"`    |    no    |
| httpcode_alb_4xx_extra_tags                | Extra tags for ALB httpcode 4xx monitor                                                                                                  | `list(string)` | `[]`        |    no    |
| httpcode_alb_4xx_message                   | Custom message for ALB httpcode 4xx monitor                                                                                              | `string`       | `""`        |    no    |
| httpcode_alb_4xx_threshold_critical        | loadbalancer 4xx critical threshold in percentage                                                                                        | `number`       | `80`        |    no    |
| httpcode_alb_4xx_threshold_warning         | loadbalancer 4xx warning threshold in percentage                                                                                         | `number`       | `60`        |    no    |
| httpcode_alb_4xx_time_aggregator           | Monitor aggregator for ALB httpcode 4xx [available values: min, max or avg]                                                              | `string`       | `"min"`     |    no    |
| httpcode_alb_4xx_timeframe                 | Monitor timeframe for ALB httpcode 4xx [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]         | `string`       | `"last_5m"` |    no    |
| httpcode_alb_5xx_enabled                   | Flag to enable ALB httpcode 5xx monitor                                                                                                  | `string`       | `"true"`    |    no    |
| httpcode_alb_5xx_extra_tags                | Extra tags for ALB httpcode 5xx monitor                                                                                                  | `list(string)` | `[]`        |    no    |
| httpcode_alb_5xx_message                   | Custom message for ALB httpcode 5xx monitor                                                                                              | `string`       | `""`        |    no    |
| httpcode_alb_5xx_threshold_critical        | loadbalancer 5xx critical threshold in percentage                                                                                        | `number`       | `80`        |    no    |
| httpcode_alb_5xx_threshold_warning         | loadbalancer 5xx warning threshold in percentage                                                                                         | `number`       | `60`        |    no    |
| httpcode_alb_5xx_time_aggregator           | Monitor aggregator for ALB httpcode 5xx [available values: min, max or avg]                                                              | `string`       | `"min"`     |    no    |
| httpcode_alb_5xx_timeframe                 | Monitor timeframe for ALB httpcode 5xx [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]         | `string`       | `"last_5m"` |    no    |
| httpcode_target_4xx_enabled                | Flag to enable ALB target httpcode 4xx monitor                                                                                           | `string`       | `"true"`    |    no    |
| httpcode_target_4xx_extra_tags             | Extra tags for ALB target httpcode 4xx monitor                                                                                           | `list(string)` | `[]`        |    no    |
| httpcode_target_4xx_message                | Custom message for ALB target httpcode 4xx monitor                                                                                       | `string`       | `""`        |    no    |
| httpcode_target_4xx_threshold_critical     | target 4xx critical threshold in percentage                                                                                              | `number`       | `80`        |    no    |
| httpcode_target_4xx_threshold_warning      | target 4xx warning threshold in percentage                                                                                               | `number`       | `60`        |    no    |
| httpcode_target_4xx_time_aggregator        | Monitor aggregator for ALB target httpcode 4xx [available values: min, max or avg]                                                       | `string`       | `"min"`     |    no    |
| httpcode_target_4xx_timeframe              | Monitor timeframe for ALB target httpcode 4xx [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]  | `string`       | `"last_5m"` |    no    |
| httpcode_target_5xx_enabled                | Flag to enable ALB target httpcode 5xx monitor                                                                                           | `string`       | `"true"`    |    no    |
| httpcode_target_5xx_extra_tags             | Extra tags for ALB target httpcode 5xx monitor                                                                                           | `list(string)` | `[]`        |    no    |
| httpcode_target_5xx_message                | Custom message for ALB target httpcode 5xx monitor                                                                                       | `string`       | `""`        |    no    |
| httpcode_target_5xx_threshold_critical     | target 5xx critical threshold in percentage                                                                                              | `number`       | `80`        |    no    |
| httpcode_target_5xx_threshold_warning      | target 5xx warning threshold in percentage                                                                                               | `number`       | `60`        |    no    |
| httpcode_target_5xx_time_aggregator        | Monitor aggregator for ALB target httpcode 5xx [available values: min, max or avg]                                                       | `string`       | `"min"`     |    no    |
| httpcode_target_5xx_timeframe              | Monitor timeframe for ALB target httpcode 5xx [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]  | `string`       | `"last_5m"` |    no    |
| latency_enabled                            | Flag to enable ALB latency monitor                                                                                                       | `string`       | `"true"`    |    no    |
| latency_extra_tags                         | Extra tags for ALB latency monitor                                                                                                       | `list(string)` | `[]`        |    no    |
| latency_message                            | Custom message for ALB latency monitor                                                                                                   | `string`       | `""`        |    no    |
| latency_threshold_critical                 | latency critical threshold in seconds                                                                                                    | `number`       | `3`         |    no    |
| latency_threshold_warning                  | latency warning threshold in seconds                                                                                                     | `number`       | `1`         |    no    |
| latency_time_aggregator                    | Monitor aggregator for ALB latency [available values: min, max or avg]                                                                   | `string`       | `"min"`     |    no    |
| latency_timeframe                          | Monitor timeframe for ALB latency [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]              | `string`       | `"last_5m"` |    no    |
| message                                    | Message sent when a monitor is triggered                                                                                                 | `any`          | n/a         |   yes    |
| new_host_delay                             | Delay in seconds before monitor new resource                                                                                             | `number`       | `300`       |    no    |
| notify_no_data                             | Will raise no data alert if set to true                                                                                                  | `bool`         | `true`      |    no    |
| prefix_slug                                | Prefix string to prepend between brackets on every monitors names                                                                        | `string`       | `""`        |    no    |

## Outputs

| Name                        | Description                             |
| --------------------------- | --------------------------------------- |
| ALB_httpcode_4xx_id         | id for monitor ALB_httpcode_4xx         |
| ALB_httpcode_5xx_id         | id for monitor ALB_httpcode_5xx         |
| ALB_httpcode_target_4xx_id  | id for monitor ALB_httpcode_target_4xx  |
| ALB_httpcode_target_5xx_id  | id for monitor ALB_httpcode_target_5xx  |
| ALB_latency_id              | id for monitor ALB_latency              |
| ALB_no_healthy_instances_id | id for monitor ALB_no_healthy_instances |

## Related documentation

DataDog blog: [https://www.datadoghq.com/blog/monitor-application-load-balancer/](https://www.datadoghq.com/blog/monitor-application-load-balancer/)

AWS ALB metrics documentation: [https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-cloudwatch-metrics.html](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-cloudwatch-metrics.html)
