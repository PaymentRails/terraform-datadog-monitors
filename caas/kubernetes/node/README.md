# CAAS KUBERNETES NODE DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-caas-kubernetes-node" {
  source      = "claranet/monitors/datadog//caas/kubernetes/node"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Kubernetes Node Disk pressure
- Kubernetes Node Frequent unregister net device
- Kubernetes Node Kubelet API does not respond
- Kubernetes Node Kubelet sync loop that updates containers does not work
- Kubernetes Node Memory pressure
- Kubernetes Node not ready
- Kubernetes Node Out of disk
- Kubernetes Node unschedulable
- Kubernetes Node volume inodes usage
- Kubernetes Node volume space usage

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                                     | Description                                                                                                                           | Type           | Default     | Required |
| ---------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------- | -------------- | ----------- | :------: |
| disk_out_enabled                         | Flag to enable Out of disk monitor                                                                                                    | `string`       | `"true"`    |    no    |
| disk_out_extra_tags                      | Extra tags for Out of disk monitor                                                                                                    | `list(string)` | `[]`        |    no    |
| disk_out_message                         | Custom message for Out of disk monitor                                                                                                | `string`       | `""`        |    no    |
| disk_out_threshold_warning               | Out of disk monitor (warning threshold)                                                                                               | `string`       | `3`         |    no    |
| disk_pressure_enabled                    | Flag to enable Disk pressure monitor                                                                                                  | `string`       | `"true"`    |    no    |
| disk_pressure_extra_tags                 | Extra tags for Disk pressure monitor                                                                                                  | `list(string)` | `[]`        |    no    |
| disk_pressure_message                    | Custom message for Disk pressure monitor                                                                                              | `string`       | `""`        |    no    |
| disk_pressure_threshold_warning          | Disk pressure monitor (warning threshold)                                                                                             | `string`       | `3`         |    no    |
| environment                              | Architecture environment                                                                                                              | `any`          | n/a         |   yes    |
| evaluation_delay                         | Delay in seconds for the metric evaluation                                                                                            | `number`       | `15`        |    no    |
| filter_tags_custom                       | Tags used for custom filtering when filter_tags_use_defaults is false                                                                 | `string`       | `"*"`       |    no    |
| filter_tags_custom_excluded              | Tags excluded for custom filtering when filter_tags_use_defaults is false                                                             | `string`       | `""`        |    no    |
| filter_tags_use_defaults                 | Use default filter tags convention                                                                                                    | `string`       | `"true"`    |    no    |
| kubelet_ping_enabled                     | Flag to enable Kubelet ping monitor                                                                                                   | `string`       | `"true"`    |    no    |
| kubelet_ping_extra_tags                  | Extra tags for Kubelet ping monitor                                                                                                   | `list(string)` | `[]`        |    no    |
| kubelet_ping_message                     | Custom message for Kubelet ping monitor                                                                                               | `string`       | `""`        |    no    |
| kubelet_ping_no_data_timeframe           | Number of minutes before reporting no data                                                                                            | `string`       | `10`        |    no    |
| kubelet_ping_threshold_warning           | Kubelet ping monitor (warning threshold)                                                                                              | `string`       | `3`         |    no    |
| kubelet_syncloop_enabled                 | Flag to enable Kubelet sync loop monitor                                                                                              | `string`       | `"true"`    |    no    |
| kubelet_syncloop_extra_tags              | Extra tags for Kubelet sync loop monitor                                                                                              | `list(string)` | `[]`        |    no    |
| kubelet_syncloop_message                 | Custom message for Kubelet sync loop monitor                                                                                          | `string`       | `""`        |    no    |
| kubelet_syncloop_threshold_warning       | Kubelet sync loop monitor (warning threshold)                                                                                         | `string`       | `3`         |    no    |
| memory_pressure_enabled                  | Flag to enable Memory pressure monitor                                                                                                | `string`       | `"true"`    |    no    |
| memory_pressure_extra_tags               | Extra tags for Memory pressure monitor                                                                                                | `list(string)` | `[]`        |    no    |
| memory_pressure_message                  | Custom message for Memory pressure monitor                                                                                            | `string`       | `""`        |    no    |
| memory_pressure_threshold_warning        | Memory pressure monitor (warning threshold)                                                                                           | `string`       | `3`         |    no    |
| message                                  | Message sent when a monitor is triggered                                                                                              | `any`          | n/a         |   yes    |
| new_host_delay                           | Delay in seconds before monitor new resource                                                                                          | `number`       | `300`       |    no    |
| node_unschedulable_enabled               | Flag to enable node unschedulable monitor                                                                                             | `string`       | `"true"`    |    no    |
| node_unschedulable_extra_tags            | Extra tags for node unschedulable monitor                                                                                             | `list(string)` | `[]`        |    no    |
| node_unschedulable_message               | Custom message for node unschedulable monitor                                                                                         | `string`       | `""`        |    no    |
| node_unschedulable_time_aggregator       | Monitor aggregator for node unschedulable [available values: min, max or avg]                                                         | `string`       | `"min"`     |    no    |
| node_unschedulable_timeframe             | Monitor timeframe for node unschedulable [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]    | `string`       | `"last_1h"` |    no    |
| notify_no_data                           | Will raise no data alert if set to true                                                                                               | `bool`         | `true`      |    no    |
| prefix_slug                              | Prefix string to prepend between brackets on every monitors names                                                                     | `string`       | `""`        |    no    |
| ready_enabled                            | Flag to enable Node ready monitor                                                                                                     | `string`       | `"true"`    |    no    |
| ready_extra_tags                         | Extra tags for Node ready monitor                                                                                                     | `list(string)` | `[]`        |    no    |
| ready_message                            | Custom message for Node ready monitor                                                                                                 | `string`       | `""`        |    no    |
| ready_threshold_warning                  | Node ready monitor (warning threshold)                                                                                                | `string`       | `3`         |    no    |
| unregister_net_device_enabled            | Flag to enable Unregister net device monitor                                                                                          | `string`       | `"true"`    |    no    |
| unregister_net_device_extra_tags         | Extra tags for Unregister net device monitor                                                                                          | `list(string)` | `[]`        |    no    |
| unregister_net_device_message            | Custom message for Unregister net device monitor                                                                                      | `string`       | `""`        |    no    |
| unregister_net_device_threshold_critical | Unregister net device critical threshold                                                                                              | `number`       | `3`         |    no    |
| unregister_net_device_time_aggregator    | Monitor aggregator for Unregister net device [available values: min, max or avg]                                                      | `string`       | `"min"`     |    no    |
| unregister_net_device_timeframe          | Monitor timeframe for Unregister net device [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string`       | `"15m"`     |    no    |
| volume_inodes_enabled                    | Flag to enable Volume inodes monitor                                                                                                  | `string`       | `"true"`    |    no    |
| volume_inodes_extra_tags                 | Extra tags for Volume inodes monitor                                                                                                  | `list(string)` | `[]`        |    no    |
| volume_inodes_message                    | Custom message for Volume inodes monitor                                                                                              | `string`       | `""`        |    no    |
| volume_inodes_threshold_critical         | Volume inodes critical threshold                                                                                                      | `number`       | `95`        |    no    |
| volume_inodes_threshold_warning          | Volume inodes warning threshold                                                                                                       | `number`       | `90`        |    no    |
| volume_inodes_time_aggregator            | Monitor aggregator for Volume inodes [available values: min, max or avg]                                                              | `string`       | `"min"`     |    no    |
| volume_inodes_timeframe                  | Monitor timeframe for Volume inodes [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]         | `string`       | `"last_5m"` |    no    |
| volume_space_enabled                     | Flag to enable Volume space monitor                                                                                                   | `string`       | `"true"`    |    no    |
| volume_space_extra_tags                  | Extra tags for Volume space monitor                                                                                                   | `list(string)` | `[]`        |    no    |
| volume_space_message                     | Custom message for Volume space monitor                                                                                               | `string`       | `""`        |    no    |
| volume_space_threshold_critical          | Volume space critical threshold                                                                                                       | `number`       | `95`        |    no    |
| volume_space_threshold_warning           | Volume space warning threshold                                                                                                        | `number`       | `90`        |    no    |
| volume_space_time_aggregator             | Monitor aggregator for Volume space [available values: min, max or avg]                                                               | `string`       | `"min"`     |    no    |
| volume_space_timeframe                   | Monitor timeframe for Volume space [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]          | `string`       | `"last_5m"` |    no    |

## Outputs

| Name                     | Description                          |
| ------------------------ | ------------------------------------ |
| disk_out_id              | id for monitor disk_out              |
| disk_pressure_id         | id for monitor disk_pressure         |
| kubelet_ping_id          | id for monitor kubelet_ping          |
| kubelet_syncloop_id      | id for monitor kubelet_syncloop      |
| memory_pressure_id       | id for monitor memory_pressure       |
| node_unschedulable_id    | id for monitor node_unschedulable    |
| ready_id                 | id for monitor ready                 |
| unregister_net_device_id | id for monitor unregister_net_device |
| volume_inodes_id         | id for monitor volume_inodes         |
| volume_space_id          | id for monitor volume_space          |

## Related documentation

- [Datadog metrics](https://docs.datadoghq.com/agent/kubernetes/metrics/)
- [Datadog documentation](https://docs.datadoghq.com/integrations/kubernetes/)
- [Datadog Blog](https://www.datadoghq.com/blog/monitor-kubernetes-docker/)

## Requirements

- Datadog Agent > v6.6
