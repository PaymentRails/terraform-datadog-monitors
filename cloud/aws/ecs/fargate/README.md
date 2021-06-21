# CLOUD AWS ECS FARGATE DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-aws-ecs-fargate" {
  source      = "claranet/monitors/datadog//cloud/aws/ecs/fargate"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Fargate CPU Utilization High (disabled by default)
- Fargate memory Utilization High (disabled by default)
- Fargate service does not respond.

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                                  | Description                                                                           | Type           | Default     | Required |
| ------------------------------------- | ------------------------------------------------------------------------------------- | -------------- | ----------- | :------: |
| cpu_utilization_enabled               | Flag to enable monitor                                                                | `string`       | `"false"`   |    no    |
| cpu_utilization_extra_tags            | Extra tags for the monitor                                                            | `list(string)` | `[]`        |    no    |
| cpu_utilization_message               | Custom message for the monitor                                                        | `string`       | `""`        |    no    |
| cpu_utilization_threshold_critical    | Critical threshold for the monitor                                                    | `string`       | `90`        |    no    |
| cpu_utilization_threshold_warning     | Warning threshold for the monitor                                                     | `string`       | `85`        |    no    |
| cpu_utilization_time_aggregator       | Monitor aggregator (min, max or avg)                                                  | `string`       | `"min"`     |    no    |
| cpu_utilization_timeframe             | Timeframe for the monitor                                                             | `string`       | `"last_5m"` |    no    |
| environment                           | Architecture environment                                                              | `string`       | n/a         |   yes    |
| evaluation_delay                      | Delay in seconds for the metric evaluation                                            | `number`       | `15`        |    no    |
| filter_tags_custom                    | Tags used for custom filtering when filter_tags_use_defaults is false                 | `string`       | `"*"`       |    no    |
| filter_tags_custom_excluded           | Tags excluded for custom filtering when filter_tags_use_defaults is false             | `string`       | `""`        |    no    |
| filter_tags_use_defaults              | Use default filter tags convention                                                    | `bool`         | `true`      |    no    |
| memory_utilization_enabled            | Flag to enable Fargate Memory utilization monitor                                     | `string`       | `"false"`   |    no    |
| memory_utilization_extra_tags         | Extra tags for Fargate Memory utilization monitor                                     | `list(string)` | `[]`        |    no    |
| memory_utilization_message            | Custom message for the Fargate Memory Utilization monitor                             | `string`       | `""`        |    no    |
| memory_utilization_threshold_critical | Critical threshold for the Fargate Memory Utilization monitor                         | `string`       | `90`        |    no    |
| memory_utilization_threshold_warning  | Warning threshold for the Fargate Memory Utilization monitor                          | `string`       | `85`        |    no    |
| memory_utilization_time_aggregator    | Monitor aggregator for Fargate Memory Utilization [available values: min, max or avg] | `string`       | `"min"`     |    no    |
| memory_utilization_timeframe          | Timeframe for the Fargate Memory Utilization monitor                                  | `string`       | `"last_5m"` |    no    |
| message                               | Message sent when a monitor is triggered                                              | `string`       | n/a         |   yes    |
| new_host_delay                        | Delay in seconds before monitor new resource                                          | `number`       | `300`       |    no    |
| notify_no_data                        | Will raise no data alert if set to true                                               | `bool`         | `true`      |    no    |
| prefix_slug                           | Prefix string to prepend between brackets on every monitors names                     | `string`       | `""`        |    no    |
| service_check_enabled                 | Flag to enable monitor                                                                | `bool`         | `true`      |    no    |
| service_check_extra_tags              | Extra tags for the monitor                                                            | `list(string)` | `[]`        |    no    |
| service_check_message                 | Custom message for the monitor                                                        | `string`       | `""`        |    no    |
| service_check_no_data_timeframe       | No data timeframe in minutes                                                          | `number`       | `10`        |    no    |
| service_check_threshold_warning       | Warning threshold                                                                     | `number`       | `3`         |    no    |

## Outputs

| Name                  | Description                       |
| --------------------- | --------------------------------- |
| cpu_utilization_id    | id for monitor cpu_utilization    |
| memory_utilization_id | id for monitor memory_utilization |
| service_check_id      | id for monitor service_check      |

## Related documentation

[Official DataDog documentation on ECS Fargate](https://docs.datadoghq.com/integrations/ecs_fargate/)

### Specific configuration due to agent limitations

CPU & memory monitors will be usable only when deploying datadog agent as a sidecar in task definitions.

In order to avoid clutter on monitors, datadog agent & ECS internal containers are always excluded from filtering to be on par with Kubernetes way of work. A bug is [currently opened](https://github.com/DataDog/datadog-agent/issues/2722) on agent repository on this matter.
