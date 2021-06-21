# CAAS KUBERNETES ARK DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-caas-kubernetes-ark" {
  source      = "claranet/monitors/datadog//caas/kubernetes/ark"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Ark backup failed

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                                    | Description                                                                                                                           | Type           | Default     | Required |
| --------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------- | -------------- | ----------- | :------: |
| ark_schedules_enabled                   | Flag to enable Ark schedules monitor                                                                                                  | `string`       | `"true"`    |    no    |
| ark_schedules_extra_tags                | Extra tags for Ark schedules monitor                                                                                                  | `list(string)` | `[]`        |    no    |
| ark_schedules_monitor_message           | Custom message for Ark schedules monitor                                                                                              | `string`       | `""`        |    no    |
| ark_schedules_monitor_no_data_timeframe | No data timeframe in minutes                                                                                                          | `number`       | `2880`      |    no    |
| ark_schedules_monitor_timeframe         | Monitor timeframe for Ark schedules monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string`       | `"last_1d"` |    no    |
| environment                             | Architecture environment                                                                                                              | `any`          | n/a         |   yes    |
| evaluation_delay                        | Delay in seconds for the metric evaluation                                                                                            | `number`       | `15`        |    no    |
| filter_tags_custom                      | Tags used for custom filtering when filter_tags_use_defaults is false                                                                 | `string`       | `"*"`       |    no    |
| filter_tags_custom_excluded             | Tags excluded for custom filtering when filter_tags_use_defaults is false                                                             | `string`       | `""`        |    no    |
| filter_tags_use_defaults                | Use default filter tags convention                                                                                                    | `string`       | `"true"`    |    no    |
| message                                 | Message sent when a monitor is triggered                                                                                              | `any`          | n/a         |   yes    |
| new_host_delay                          | Delay in seconds before monitor new resource                                                                                          | `number`       | `300`       |    no    |
| notify_no_data                          | Will raise no data alert if set to true                                                                                               | `bool`         | `true`      |    no    |
| prefix_slug                             | Prefix string to prepend between brackets on every monitors names                                                                     | `string`       | `""`        |    no    |

## Outputs

| Name                     | Description                          |
| ------------------------ | ------------------------------------ |
| ark_schedules_monitor_id | id for monitor ark_schedules_monitor |

## Related documentation

DataDog blog: https://www.datadoghq.com/blog/monitor-prometheus-metrics
Heptio Ark minimum release: https://github.com/heptio/ark/releases/tag/v0.9.0

## Ark annotations for Datadog

```
apiVersion: apps/v1beta1
kind: Deployment
metadata:
  namespace: heptio-ark
  name: ark
spec:
  replicas: 1
  template:
    metadata:
      labels:
        component: ark
      annotations:
        prometheus.io/scrape: "true"
        prometheus.io/port: "8085"
        prometheus.io/path: "/metrics"
        ad.datadoghq.com/ark.check_names: |-
          ["prometheus"]
        ad.datadoghq.com/ark.init_configs: |-
          [{}]
        ad.datadoghq.com/ark.instances: |-
          [
            {
              "prometheus_url": "http://%%host%%:8085/metrics",
              "namespace": "ark",
              "metrics": ["ark_backup_*"],
              "tags": ["dd_monitoring:enabled","dd_ark:enabled","env:prod"]
            }
          ]
```
