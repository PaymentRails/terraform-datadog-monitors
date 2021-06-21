# CAAS KUBERNETES WORKLOAD DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-caas-kubernetes-workload" {
  source      = "claranet/monitors/datadog//caas/kubernetes/workload"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Kubernetes Available replicas
- Kubernetes cronjob scheduling failed
- Kubernetes Current replicas
- Kubernetes job failed
- Kubernetes Ready replicas

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                                 | Description                                                                                                                       | Type           | Default      | Required |
| ------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------- | -------------- | ------------ | :------: |
| cronjob_enabled                      | Flag to enable Cronjob monitor                                                                                                    | `string`       | `"true"`     |    no    |
| cronjob_extra_tags                   | Extra tags for Cronjob monitor                                                                                                    | `list(string)` | `[]`         |    no    |
| cronjob_message                      | Custom message for Cronjob monitor                                                                                                | `string`       | `""`         |    no    |
| cronjob_threshold_warning            | Cronjob monitor (warning threshold)                                                                                               | `string`       | `3`          |    no    |
| environment                          | Architecture environment                                                                                                          | `any`          | n/a          |   yes    |
| evaluation_delay                     | Delay in seconds for the metric evaluation                                                                                        | `number`       | `15`         |    no    |
| filter_tags_custom                   | Tags used for custom filtering when filter_tags_use_defaults is false                                                             | `string`       | `"*"`        |    no    |
| filter_tags_custom_excluded          | Tags excluded for custom filtering when filter_tags_use_defaults is false                                                         | `string`       | `""`         |    no    |
| filter_tags_use_defaults             | Use default filter tags convention                                                                                                | `string`       | `"true"`     |    no    |
| job_enabled                          | Flag to enable Job monitor                                                                                                        | `string`       | `"true"`     |    no    |
| job_extra_tags                       | Extra tags for Job monitor                                                                                                        | `list(string)` | `[]`         |    no    |
| job_message                          | Custom message for Job monitor                                                                                                    | `string`       | `""`         |    no    |
| job_threshold_warning                | Job monitor (warning threshold)                                                                                                   | `string`       | `3`          |    no    |
| message                              | Message sent when a monitor is triggered                                                                                          | `any`          | n/a          |   yes    |
| new_host_delay                       | Delay in seconds before monitor new resource                                                                                      | `number`       | `300`        |    no    |
| notify_no_data                       | Will raise no data alert if set to true                                                                                           | `bool`         | `true`       |    no    |
| prefix_slug                          | Prefix string to prepend between brackets on every monitors names                                                                 | `string`       | `""`         |    no    |
| replica_available_enabled            | Flag to enable Available replica monitor                                                                                          | `string`       | `"true"`     |    no    |
| replica_available_extra_tags         | Extra tags for Available replicamonitor                                                                                           | `list(string)` | `[]`         |    no    |
| replica_available_message            | Custom message for Available replica monitor                                                                                      | `string`       | `""`         |    no    |
| replica_available_threshold_critical | Available replica critical threshold                                                                                              | `number`       | `1`          |    no    |
| replica_available_time_aggregator    | Monitor aggregator for Available replica [available values: min, max or avg]                                                      | `string`       | `"max"`      |    no    |
| replica_available_timeframe          | Monitor timeframe for Available replica [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string`       | `"last_15m"` |    no    |
| replica_current_enabled              | Flag to enable Current replica monitor                                                                                            | `string`       | `"true"`     |    no    |
| replica_current_extra_tags           | Extra tags for Current replica monitor                                                                                            | `list(string)` | `[]`         |    no    |
| replica_current_message              | Custom message for Current replica monitor                                                                                        | `string`       | `""`         |    no    |
| replica_current_threshold_critical   | Current replica critical threshold                                                                                                | `number`       | `1`          |    no    |
| replica_current_time_aggregator      | Monitor aggregator for Current replica [available values: min, max or avg]                                                        | `string`       | `"max"`      |    no    |
| replica_current_timeframe            | Monitor timeframe for Current replica [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]   | `string`       | `"last_15m"` |    no    |
| replica_ready_enabled                | Flag to enable Ready replica monitor                                                                                              | `string`       | `"true"`     |    no    |
| replica_ready_extra_tags             | Extra tags for Ready replica monitor                                                                                              | `list(string)` | `[]`         |    no    |
| replica_ready_message                | Custom message for Ready replica monitor                                                                                          | `string`       | `""`         |    no    |
| replica_ready_threshold_critical     | Ready replica critical threshold                                                                                                  | `number`       | `1`          |    no    |
| replica_ready_time_aggregator        | Monitor aggregator for Ready replica [available values: min, max or avg]                                                          | `string`       | `"max"`      |    no    |
| replica_ready_timeframe              | Monitor timeframe for Ready replica [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]     | `string`       | `"last_5m"`  |    no    |

## Outputs

| Name                 | Description                      |
| -------------------- | -------------------------------- |
| cronjob_id           | id for monitor cronjob           |
| job_id               | id for monitor job               |
| replica_available_id | id for monitor replica_available |
| replica_current_id   | id for monitor replica_current   |
| replica_ready_id     | id for monitor replica_ready     |

## Related documentation

- [Datadog metrics](https://docs.datadoghq.com/agent/kubernetes/metrics/)
- [Datadog documentation](https://docs.datadoghq.com/integrations/kubernetes/)
- [Datadog Blog](https://www.datadoghq.com/blog/monitor-kubernetes-docker/)

## Requirements

- Datadog Agent > v6.6
