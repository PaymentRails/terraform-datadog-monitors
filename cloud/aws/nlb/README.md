# CLOUD AWS NLB DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-aws-nlb" {
  source      = "claranet/monitors/datadog//cloud/aws/nlb"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- NLB healthy instances

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                                       | Description                                                                                                                              | Type           | Default     | Required |
| ------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------- | -------------- | ----------- | :------: |
| environment                                | Architecture environment                                                                                                                 | `string`       | n/a         |   yes    |
| evaluation_delay                           | Delay in seconds for the metric evaluation                                                                                               | `number`       | `900`       |    no    |
| filter_tags_custom                         | Tags used for custom filtering when filter_tags_use_defaults is false                                                                    | `string`       | `"*"`       |    no    |
| filter_tags_custom_excluded                | Tags excluded for custom filtering when filter_tags_use_defaults is false                                                                | `string`       | `""`        |    no    |
| filter_tags_use_defaults                   | Use default filter tags convention                                                                                                       | `string`       | `"true"`    |    no    |
| message                                    | Message sent when a monitor is triggered                                                                                                 | `any`          | n/a         |   yes    |
| new_host_delay                             | Delay in seconds before monitor new resource                                                                                             | `number`       | `300`       |    no    |
| nlb_no_healthy_instances_enabled           | Flag to enable NLB no healthy instances monitor                                                                                          | `string`       | `"true"`    |    no    |
| nlb_no_healthy_instances_extra_tags        | Extra tags for NLB no healthy instances monitor                                                                                          | `list(string)` | `[]`        |    no    |
| nlb_no_healthy_instances_message           | Custom message for NLB no healthy instances monitor                                                                                      | `string`       | `""`        |    no    |
| nlb_no_healthy_instances_no_data_timeframe | Number of minutes before reporting no data                                                                                               | `string`       | `10`        |    no    |
| nlb_no_healthy_instances_threshold_warning | NLB no healthy instances warning threshold in percentage                                                                                 | `number`       | `100`       |    no    |
| nlb_no_healthy_instances_time_aggregator   | Monitor aggregator for NLB no healthy instances [available values: min, max or avg]                                                      | `string`       | `"min"`     |    no    |
| nlb_no_healthy_instances_timeframe         | Monitor timeframe for NLB no healthy instances [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string`       | `"last_5m"` |    no    |
| notify_no_data                             | Will raise no data alert if set to true                                                                                                  | `bool`         | `true`      |    no    |
| prefix_slug                                | Prefix string to prepend between brackets on every monitors names                                                                        | `string`       | `""`        |    no    |

## Outputs

| Name                        | Description                             |
| --------------------------- | --------------------------------------- |
| NLB_no_healthy_instances_id | id for monitor NLB_no_healthy_instances |

## Related documentation

DataDog blog: [https://www.datadoghq.com/blog/monitor-aws-network-load-balancer/](https://www.datadoghq.com/blog/monitor-aws-network-load-balancer/)

AWS NLB metrics documentation: [https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-cloudwatch-metrics.html](https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-cloudwatch-metrics.html)
