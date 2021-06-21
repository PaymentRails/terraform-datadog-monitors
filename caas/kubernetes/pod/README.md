# CAAS KUBERNETES POD DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-caas-kubernetes-pod" {
  source      = "claranet/monitors/datadog//caas/kubernetes/pod"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Kubernetes Pod phase status failed
- Kubernetes Pod terminated abnormally
- Kubernetes Pod waiting errors

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                             | Description                                                                                                                      | Type           | Default      | Required |
| -------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- | -------------- | ------------ | :------: |
| environment                      | Architecture environment                                                                                                         | `any`          | n/a          |   yes    |
| error_enabled                    | Flag to enable Pod errors monitor                                                                                                | `string`       | `"true"`     |    no    |
| error_extra_tags                 | Extra tags for Pod errors monitor                                                                                                | `list(string)` | `[]`         |    no    |
| error_message                    | Custom message for Pod errors monitor                                                                                            | `string`       | `""`         |    no    |
| error_threshold_critical         | error critical threshold                                                                                                         | `number`       | `0.5`        |    no    |
| error_threshold_warning          | error warning threshold                                                                                                          | `number`       | `0`          |    no    |
| error_time_aggregator            | Monitor aggregator for Pod errors [available values: min, max or avg]                                                            | `string`       | `"min"`      |    no    |
| error_timeframe                  | Monitor timeframe for Pod errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]       | `string`       | `"last_15m"` |    no    |
| evaluation_delay                 | Delay in seconds for the metric evaluation                                                                                       | `number`       | `15`         |    no    |
| filter_tags_custom               | Tags used for custom filtering when filter_tags_use_defaults is false                                                            | `string`       | `"*"`        |    no    |
| filter_tags_custom_excluded      | Tags excluded for custom filtering when filter_tags_use_defaults is false                                                        | `string`       | `""`         |    no    |
| filter_tags_use_defaults         | Use default filter tags convention                                                                                               | `string`       | `"true"`     |    no    |
| message                          | Message sent when a monitor is triggered                                                                                         | `any`          | n/a          |   yes    |
| new_host_delay                   | Delay in seconds before monitor new resource                                                                                     | `number`       | `300`        |    no    |
| notify_no_data                   | Will raise no data alert if set to true                                                                                          | `bool`         | `true`       |    no    |
| pod_phase_status_enabled         | Flag to enable Pod phase status monitor                                                                                          | `string`       | `"true"`     |    no    |
| pod_phase_status_extra_tags      | Extra tags for Pod phase status monitor                                                                                          | `list(string)` | `[]`         |    no    |
| pod_phase_status_message         | Custom message for Pod phase status monitor                                                                                      | `string`       | `""`         |    no    |
| pod_phase_status_time_aggregator | Monitor aggregator for Pod phase status [available values: min, max or avg]                                                      | `string`       | `"max"`      |    no    |
| pod_phase_status_timeframe       | Monitor timeframe for Pod phase status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string`       | `"last_5m"`  |    no    |
| prefix_slug                      | Prefix string to prepend between brackets on every monitors names                                                                | `string`       | `""`         |    no    |
| terminated_enabled               | Flag to enable Pod terminated monitor                                                                                            | `string`       | `"true"`     |    no    |
| terminated_extra_tags            | Extra tags for Pod terminated monitor                                                                                            | `list(string)` | `[]`         |    no    |
| terminated_message               | Custom message for Pod terminated monitor                                                                                        | `string`       | `""`         |    no    |
| terminated_threshold_critical    | terminated critical threshold                                                                                                    | `number`       | `0.5`        |    no    |
| terminated_threshold_warning     | terminated warning threshold                                                                                                     | `number`       | `0`          |    no    |
| terminated_time_aggregator       | Monitor aggregator for Pod terminated [available values: min, max or avg]                                                        | `string`       | `"sum"`      |    no    |
| terminated_timeframe             | Monitor timeframe for Pod terminated [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]   | `string`       | `"last_10m"` |    no    |

## Outputs

| Name                | Description                     |
| ------------------- | ------------------------------- |
| error_id            | id for monitor error            |
| pod_phase_status_id | id for monitor pod_phase_status |
| terminated_id       | id for monitor terminated       |

## Related documentation

- [Datadog metrics](https://docs.datadoghq.com/agent/kubernetes/metrics/)
- [Datadog documentation](https://docs.datadoghq.com/integrations/kubernetes/)
- [Datadog Blog](https://www.datadoghq.com/blog/monitor-kubernetes-docker/)

## Requirements

- Datadog Agent > v7.2
