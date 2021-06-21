# CLOUD GCP GCE INSTANCE DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-gcp-gce-instance" {
  source      = "claranet/monitors/datadog//cloud/gcp/gce/instance"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Compute Engine instance CPU Utilization
- Compute Engine instance Disk Throttled Bps
- Compute Engine instance Disk Throttled OPS

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                                  | Description                                                       | Type           | Default      | Required |
| ------------------------------------- | ----------------------------------------------------------------- | -------------- | ------------ | :------: |
| cpu_utilization_enabled               | Flag to enable CPU Utilization monitor                            | `string`       | `"true"`     |    no    |
| cpu_utilization_extra_tags            | Extra tags for CPU Utilization monitor                            | `list(string)` | `[]`         |    no    |
| cpu_utilization_message               | Custom message for the CPU Utilization monitor                    | `string`       | `""`         |    no    |
| cpu_utilization_no_data_timeframe     | Number of minutes before reporting no data                        | `string`       | `30`         |    no    |
| cpu_utilization_threshold_critical    | CPU Utilization in percentage (critical threshold)                | `string`       | `90`         |    no    |
| cpu_utilization_threshold_warning     | CPU Utilization in percentage (warning threshold)                 | `string`       | `80`         |    no    |
| cpu_utilization_time_aggregator       | Time aggregator for the CPU Utilization monitor                   | `string`       | `"avg"`      |    no    |
| cpu_utilization_timeframe             | Timeframe for the CPU Utilization monitor                         | `string`       | `"last_15m"` |    no    |
| disk_throttled_bps_enabled            | Flag to enable Disk Throttled Bps monitor                         | `string`       | `"true"`     |    no    |
| disk_throttled_bps_extra_tags         | Extra tags for Disk Throttled Bps monitor                         | `list(string)` | `[]`         |    no    |
| disk_throttled_bps_message            | Custom message for the Disk Throttled Bps monitor                 | `string`       | `""`         |    no    |
| disk_throttled_bps_threshold_critical | Disk Throttled Bps in percentage (critical threshold)             | `string`       | `50`         |    no    |
| disk_throttled_bps_threshold_warning  | Disk Throttled Bps in percentage (warning threshold)              | `string`       | `30`         |    no    |
| disk_throttled_bps_time_aggregator    | Time aggregator for the Disk Throttled Bps monitor                | `string`       | `"min"`      |    no    |
| disk_throttled_bps_timeframe          | Timeframe for the Disk Throttled Bps monitor                      | `string`       | `"last_15m"` |    no    |
| disk_throttled_ops_enabled            | Flag to enable Disk Throttled OPS monitor                         | `string`       | `"true"`     |    no    |
| disk_throttled_ops_extra_tags         | Extra tags for Disk Throttled OPS monitor                         | `list(string)` | `[]`         |    no    |
| disk_throttled_ops_message            | Custom message for the Disk Throttled OPS monitor                 | `string`       | `""`         |    no    |
| disk_throttled_ops_threshold_critical | Disk Throttled OPS in percentage (critical threshold)             | `string`       | `50`         |    no    |
| disk_throttled_ops_threshold_warning  | Disk Throttled OPS in percentage (warning threshold)              | `string`       | `30`         |    no    |
| disk_throttled_ops_time_aggregator    | Time aggregator for the Disk Throttled OPS monitor                | `string`       | `"min"`      |    no    |
| disk_throttled_ops_timeframe          | Timeframe for the Disk Throttled OPS monitor                      | `string`       | `"last_15m"` |    no    |
| environment                           | Architecture environment                                          | `string`       | n/a          |   yes    |
| evaluation_delay                      | Delay in seconds for the metric evaluation                        | `number`       | `900`        |    no    |
| filter_tags                           | Tags used for filtering                                           | `string`       | `"*"`        |    no    |
| message                               | Message sent when a monitor is triggered                          | `any`          | n/a          |   yes    |
| new_host_delay                        | Delay in seconds for the new host evaluation                      | `number`       | `300`        |    no    |
| notify_no_data                        | Will raise no data alert if set to true                           | `bool`         | `true`       |    no    |
| prefix_slug                           | Prefix string to prepend between brackets on every monitors names | `string`       | `""`         |    no    |

## Outputs

| Name                  | Description                       |
| --------------------- | --------------------------------- |
| cpu_utilization_id    | id for monitor cpu_utilization    |
| disk_throttled_bps_id | id for monitor disk_throttled_bps |
| disk_throttled_ops_id | id for monitor disk_throttled_ops |

## Related documentation

- [Datadog GCE Instance metrics](https://www.datadoghq.com/blog/monitoring-google-compute-engine-performance/#instance-metrics)
- [GCP Maximum OPS and Bps by device type and size](https://cloud.google.com/compute/docs/disks/)
