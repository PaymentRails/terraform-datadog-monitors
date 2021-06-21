# CLOUD AWS ELB DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-aws-elb" {
  source      = "claranet/monitors/datadog//cloud/aws/elb"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- ELB 4xx errors too high
- ELB 5xx errors too high
- ELB backend 4xx errors too high
- ELB backend 5xx errors too high
- ELB healthy instances
- ELB latency too high

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                                      | Description                                                                                                                            | Type           | Default     | Required |
| ----------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------- | -------------- | ----------- | :------: |
| artificial_requests_count                 | Number of false requests used to mitigate false positive in case of low trafic                                                         | `number`       | `5`         |    no    |
| elb_4xx_enabled                           | Flag to enable ELB 4xx errors monitor                                                                                                  | `string`       | `"true"`    |    no    |
| elb_4xx_extra_tags                        | Extra tags for ELB 4xx errors monitor                                                                                                  | `list(string)` | `[]`        |    no    |
| elb_4xx_message                           | Custom message for ELB 4xx errors monitor                                                                                              | `string`       | `""`        |    no    |
| elb_4xx_threshold_critical                | loadbalancer 4xx critical threshold in percentage                                                                                      | `number`       | `10`        |    no    |
| elb_4xx_threshold_warning                 | loadbalancer 4xx warning threshold in percentage                                                                                       | `number`       | `5`         |    no    |
| elb_4xx_timeframe                         | Monitor timeframe for ELB 4xx errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]         | `string`       | `"last_5m"` |    no    |
| elb_5xx_enabled                           | Flag to enable ELB 5xx errors monitor                                                                                                  | `string`       | `"true"`    |    no    |
| elb_5xx_extra_tags                        | Extra tags for ELB 5xx errors monitor                                                                                                  | `list(string)` | `[]`        |    no    |
| elb_5xx_message                           | Custom message for ELB 5xx errors monitor                                                                                              | `string`       | `""`        |    no    |
| elb_5xx_threshold_critical                | loadbalancer 5xx critical threshold in percentage                                                                                      | `number`       | `10`        |    no    |
| elb_5xx_threshold_warning                 | loadbalancer 5xx warning threshold in percentage                                                                                       | `number`       | `5`         |    no    |
| elb_5xx_timeframe                         | Monitor timeframe for ELB 5xx errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]         | `string`       | `"last_5m"` |    no    |
| elb_backend_4xx_enabled                   | Flag to enable ELB backend 4xx errors monitor                                                                                          | `string`       | `"true"`    |    no    |
| elb_backend_4xx_extra_tags                | Extra tags for ELB backend 4xx errors monitor                                                                                          | `list(string)` | `[]`        |    no    |
| elb_backend_4xx_message                   | Custom message for ELB backend 4xx errors monitor                                                                                      | `string`       | `""`        |    no    |
| elb_backend_4xx_threshold_critical        | loadbalancer backend 4xx critical threshold in percentage                                                                              | `number`       | `10`        |    no    |
| elb_backend_4xx_threshold_warning         | loadbalancer backend 4xx warning threshold in percentage                                                                               | `number`       | `5`         |    no    |
| elb_backend_4xx_timeframe                 | Monitor timeframe for ELB backend 4xx errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string`       | `"last_5m"` |    no    |
| elb_backend_5xx_enabled                   | Flag to enable ELB backend 5xx errors monitor                                                                                          | `string`       | `"true"`    |    no    |
| elb_backend_5xx_extra_tags                | Extra tags for ELB backend 5xx errors monitor                                                                                          | `list(string)` | `[]`        |    no    |
| elb_backend_5xx_message                   | Custom message for ELB backend 5xx errors monitor                                                                                      | `string`       | `""`        |    no    |
| elb_backend_5xx_threshold_critical        | loadbalancer backend 5xx critical threshold in percentage                                                                              | `number`       | `10`        |    no    |
| elb_backend_5xx_threshold_warning         | loadbalancer backend 5xx warning threshold in percentage                                                                               | `number`       | `5`         |    no    |
| elb_backend_5xx_timeframe                 | Monitor timeframe for ELB backend 5xx errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string`       | `"last_5m"` |    no    |
| elb_backend_latency_critical              | latency critical threshold in seconds                                                                                                  | `number`       | `3`         |    no    |
| elb_backend_latency_enabled               | Flag to enable ELB backend latency monitor                                                                                             | `string`       | `"true"`    |    no    |
| elb_backend_latency_extra_tags            | Extra tags for ELB backend latency monitor                                                                                             | `list(string)` | `[]`        |    no    |
| elb_backend_latency_message               | Custom message for ELB backend latency monitor                                                                                         | `string`       | `""`        |    no    |
| elb_backend_latency_time_aggregator       | Monitor aggregator for ELB backend latency [available values: min, max or avg]                                                         | `string`       | `"min"`     |    no    |
| elb_backend_latency_timeframe             | Monitor timeframe for ELB backend latency [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]    | `string`       | `"last_5m"` |    no    |
| elb_backend_latency_warning               | latency warning threshold in seconds                                                                                                   | `number`       | `1`         |    no    |
| elb_no_healthy_instance_enabled           | Flag to enable ELB no healty instance monitor                                                                                          | `string`       | `"true"`    |    no    |
| elb_no_healthy_instance_extra_tags        | Extra tags for ELB no healty instance monitor                                                                                          | `list(string)` | `[]`        |    no    |
| elb_no_healthy_instance_message           | Custom message for ELB no healty instance monitor                                                                                      | `string`       | `""`        |    no    |
| elb_no_healthy_instance_no_data_timeframe | Number of minutes before reporting no data                                                                                             | `string`       | `10`        |    no    |
| elb_no_healthy_instance_threshold_warning | ELB no healthy instances warning threshold in percentage                                                                               | `number`       | `100`       |    no    |
| elb_no_healthy_instance_time_aggregator   | Monitor aggregator for ELB no healty instance [available values: min or max]                                                           | `string`       | `"min"`     |    no    |
| elb_no_healthy_instance_timeframe         | Monitor timeframe for ELB no healty instance [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string`       | `"last_5m"` |    no    |
| environment                               | Architecture Environment                                                                                                               | `string`       | n/a         |   yes    |
| evaluation_delay                          | Delay in seconds for the metric evaluation                                                                                             | `number`       | `900`       |    no    |
| filter_tags_custom                        | Tags used for custom filtering when filter_tags_use_defaults is false                                                                  | `string`       | `"*"`       |    no    |
| filter_tags_custom_excluded               | Tags excluded for custom filtering when filter_tags_use_defaults is false                                                              | `string`       | `""`        |    no    |
| filter_tags_use_defaults                  | Use default filter tags convention                                                                                                     | `string`       | `"true"`    |    no    |
| message                                   | Message sent when an alert is triggered                                                                                                | `any`          | n/a         |   yes    |
| new_host_delay                            | Delay in seconds before monitor new resource                                                                                           | `number`       | `300`       |    no    |
| notify_no_data                            | Will raise no data alert if set to true                                                                                                | `bool`         | `true`      |    no    |
| prefix_slug                               | Prefix string to prepend between brackets on every monitors names                                                                      | `string`       | `""`        |    no    |

## Outputs

| Name                        | Description                             |
| --------------------------- | --------------------------------------- |
| ELB_backend_latency_id      | id for monitor ELB_backend_latency      |
| ELB_no_healthy_instances_id | id for monitor ELB_no_healthy_instances |
| ELB_too_much_4xx_backend_id | id for monitor ELB_too_much_4xx_backend |
| ELB_too_much_4xx_id         | id for monitor ELB_too_much_4xx         |
| ELB_too_much_5xx_backend_id | id for monitor ELB_too_much_5xx_backend |
| ELB_too_much_5xx_id         | id for monitor ELB_too_much_5xx         |

## Related documentation

DataDog blog: [https://www.datadoghq.com/blog/monitor-application-load-balancer/](https://www.datadoghq.com/blog/monitor-application-load-balancer/)

AWS ELB metrics documentation: [https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-cloudwatch-metrics.html](https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-cloudwatch-metrics.html)
