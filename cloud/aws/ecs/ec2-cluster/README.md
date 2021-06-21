# CLOUD AWS ECS EC2-CLUSTER DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-aws-ecs-ec2-cluster" {
  source      = "claranet/monitors/datadog//cloud/aws/ecs/ec2-cluster"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- ECS Agent disconnected
- ECS Cluster CPU Utilization High (disabled by default)
- ECS Cluster Memory Reservation High (disabled by default)

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                                          | Description                                                                           | Type           | Default     | Required |
| --------------------------------------------- | ------------------------------------------------------------------------------------- | -------------- | ----------- | :------: |
| agent_status_enabled                          | Flag to enable Agent Status monitor                                                   | `string`       | `"true"`    |    no    |
| agent_status_extra_tags                       | Extra tags for Agent Status monitor                                                   | `list(string)` | `[]`        |    no    |
| agent_status_message                          | Custom message for the Agent Status monitor                                           | `string`       | `""`        |    no    |
| agent_status_no_data_timeframe                | Agent status does not respond monitor no data timeframe                               | `string`       | `10`        |    no    |
| agent_status_threshold_warning                | Warning threshold for the Agent Status monitor                                        | `string`       | `3`         |    no    |
| cluster_cpu_utilization_enabled               | Flag to enable Cluster CPU utilization monitor                                        | `string`       | `"false"`   |    no    |
| cluster_cpu_utilization_extra_tags            | Extra tags for Cluster CPU utilization monitor                                        | `list(string)` | `[]`        |    no    |
| cluster_cpu_utilization_message               | Custom message for the Cluster CPU Utilization monitor                                | `string`       | `""`        |    no    |
| cluster_cpu_utilization_threshold_critical    | Critical threshold for the Cluster CPU Utilization monitor                            | `string`       | `90`        |    no    |
| cluster_cpu_utilization_threshold_warning     | Warning threshold for the Cluster CPU Utilization monitor                             | `string`       | `85`        |    no    |
| cluster_cpu_utilization_time_aggregator       | Monitor aggregator for Cluster CPU Utilization [available values: min, max or avg]    | `string`       | `"min"`     |    no    |
| cluster_cpu_utilization_timeframe             | Timeframe for the Cluster CPU Utilization monitor                                     | `string`       | `"last_5m"` |    no    |
| cluster_memory_reservation_enabled            | Flag to enable Cluster memory reservation monitor                                     | `string`       | `"false"`   |    no    |
| cluster_memory_reservation_extra_tags         | Extra tags for Cluster Memory Reservation monitor                                     | `list(string)` | `[]`        |    no    |
| cluster_memory_reservation_message            | Custom message for the Cluster Memory Reservation monitor                             | `string`       | `""`        |    no    |
| cluster_memory_reservation_threshold_critical | Critical threshold for the Cluster Memory Reservation monitor                         | `string`       | `90`        |    no    |
| cluster_memory_reservation_threshold_warning  | Warning threshold for the Cluster Memory Reservation monitor                          | `string`       | `85`        |    no    |
| cluster_memory_reservation_time_aggregator    | Monitor aggregator for Cluster Memory Reservation [available values: min, max or avg] | `string`       | `"min"`     |    no    |
| cluster_memory_reservation_timeframe          | Timeframe for the Cluster Memory Reservation monitor                                  | `string`       | `"last_5m"` |    no    |
| environment                                   | Architecture environment                                                              | `string`       | n/a         |   yes    |
| evaluation_delay                              | Delay in seconds for the metric evaluation                                            | `number`       | `900`       |    no    |
| filter_tags_custom                            | Tags used for custom filtering when filter_tags_use_defaults is false                 | `string`       | `"*"`       |    no    |
| filter_tags_custom_excluded                   | Tags excluded for custom filtering when filter_tags_use_defaults is false             | `string`       | `""`        |    no    |
| filter_tags_use_defaults                      | Use default filter tags convention                                                    | `string`       | `"true"`    |    no    |
| message                                       | Message sent when a monitor is triggered                                              | `any`          | n/a         |   yes    |
| new_host_delay                                | Delay in seconds before monitor new resource                                          | `number`       | `300`       |    no    |
| notify_no_data                                | Will raise no data alert if set to true                                               | `bool`         | `true`      |    no    |
| prefix_slug                                   | Prefix string to prepend between brackets on every monitors names                     | `string`       | `""`        |    no    |

## Outputs

| Name                          | Description                               |
| ----------------------------- | ----------------------------------------- |
| cluster_cpu_utilization_id    | id for monitor cluster_cpu_utilization    |
| cluster_memory_reservation_id | id for monitor cluster_memory_reservation |
| ecs_agent_status_id           | id for monitor ecs_agent_status           |

## Related documentation
