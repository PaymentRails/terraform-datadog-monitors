# CAAS KUBERNETES VELERO DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-caas-kubernetes-velero" {
  source      = "claranet/monitors/datadog//caas/kubernetes/velero"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Velero backup deletion failure
- Velero backup failure
- Velero backup partial failure
- Velero scheduled backup missing
- Velero volume snapshot failure

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                                                      | Description                                                                                                                                             | Type           | Default     | Required |
| --------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------- | ----------- | :------: |
| environment                                               | Architecture environment                                                                                                                                | `any`          | n/a         |   yes    |
| evaluation_delay                                          | Delay in seconds for the metric evaluation                                                                                                              | `number`       | `15`        |    no    |
| filter_tags_custom                                        | Tags used for custom filtering when filter_tags_use_defaults is false                                                                                   | `string`       | `"*"`       |    no    |
| filter_tags_custom_excluded                               | Tags excluded for custom filtering when filter_tags_use_defaults is false                                                                               | `string`       | `""`        |    no    |
| filter_tags_use_defaults                                  | Use default filter tags convention                                                                                                                      | `string`       | `"true"`    |    no    |
| message                                                   | Message sent when a monitor is triggered                                                                                                                | `any`          | n/a         |   yes    |
| new_host_delay                                            | Delay in seconds before monitor new resource                                                                                                            | `number`       | `300`       |    no    |
| notify_no_data                                            | Will raise no data alert if set to true                                                                                                                 | `bool`         | `true`      |    no    |
| prefix_slug                                               | Prefix string to prepend between brackets on every monitors names                                                                                       | `string`       | `""`        |    no    |
| velero_backup_deletion_failure_enabled                    | Flag to enable Velero backup deletion failure monitor                                                                                                   | `string`       | `"true"`    |    no    |
| velero_backup_deletion_failure_extra_tags                 | Extra tags for Velero backup deletion failure monitor                                                                                                   | `list(string)` | `[]`        |    no    |
| velero_backup_deletion_failure_monitor_message            | Custom message for Velero backup deletion failure monitor                                                                                               | `string`       | `""`        |    no    |
| velero_backup_deletion_failure_monitor_timeframe          | Monitor timeframe for Velero backup deletion failure monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]  | `string`       | `"last_1d"` |    no    |
| velero_backup_failure_enabled                             | Flag to enable Velero backup failure monitor                                                                                                            | `string`       | `"true"`    |    no    |
| velero_backup_failure_extra_tags                          | Extra tags for Velero backup failure monitor                                                                                                            | `list(string)` | `[]`        |    no    |
| velero_backup_failure_monitor_message                     | Custom message for Velero backup failure monitor                                                                                                        | `string`       | `""`        |    no    |
| velero_backup_failure_monitor_timeframe                   | Monitor timeframe for Velero backup failure monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]           | `string`       | `"last_1d"` |    no    |
| velero_backup_partial_failure_enabled                     | Flag to enable Velero backup partial failure monitor                                                                                                    | `string`       | `"true"`    |    no    |
| velero_backup_partial_failure_extra_tags                  | Extra tags for Velero backup partial failure monitor                                                                                                    | `list(string)` | `[]`        |    no    |
| velero_backup_partial_failure_monitor_message             | Custom message for Velero backup partial failure monitor                                                                                                | `string`       | `""`        |    no    |
| velero_backup_partial_failure_monitor_timeframe           | Monitor timeframe for Velero backup partial failure monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]   | `string`       | `"last_1d"` |    no    |
| velero_scheduled_backup_missing_enabled                   | Flag to enable Velero scheduled backup missing monitor                                                                                                  | `string`       | `"true"`    |    no    |
| velero_scheduled_backup_missing_extra_tags                | Extra tags for Velero scheduled backup missing monitor                                                                                                  | `list(string)` | `[]`        |    no    |
| velero_scheduled_backup_missing_monitor_message           | Custom message for Velero scheduled backup missing monitor                                                                                              | `string`       | `""`        |    no    |
| velero_scheduled_backup_missing_monitor_no_data_timeframe | No data timeframe in minutes                                                                                                                            | `number`       | `2880`      |    no    |
| velero_scheduled_backup_missing_monitor_timeframe         | Monitor timeframe for Velero scheduled backup missing monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string`       | `"last_1d"` |    no    |
| velero_volume_snapshot_failure_enabled                    | Flag to enable Velero volume snapshot failure monitor                                                                                                   | `string`       | `"true"`    |    no    |
| velero_volume_snapshot_failure_extra_tags                 | Extra tags for Velero volume snapshot failure monitor                                                                                                   | `list(string)` | `[]`        |    no    |
| velero_volume_snapshot_failure_monitor_message            | Custom message for Velero volume snapshot failure monitor                                                                                               | `string`       | `""`        |    no    |
| velero_volume_snapshot_failure_monitor_timeframe          | Monitor timeframe for Velero volume snapshot failure monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]  | `string`       | `"last_1d"` |    no    |

## Outputs

| Name                               | Description                                    |
| ---------------------------------- | ---------------------------------------------- |
| velero_backup_deletion_failure_id  | id for monitor velero_backup_deletion_failure  |
| velero_backup_failure_id           | id for monitor velero_backup_failure           |
| velero_backup_partial_failure_id   | id for monitor velero_backup_partial_failure   |
| velero_scheduled_backup_missing_id | id for monitor velero_scheduled_backup_missing |
| velero_volume_snapshot_failure_id  | id for monitor velero_volume_snapshot_failure  |

## Related documentation

Documentation for Datadog prometheus intergration: https://docs.datadoghq.com/integrations/prometheus/
Documentation for Datadog OpenMetrics integration: https://docs.datadoghq.com/integrations/openmetrics/
Documentation for Datadog autodiscovery: https://docs.datadoghq.com/agent/autodiscovery/clusterchecks/

### How to configure Datadog agent for these monitors ?

You can configure Datadog agent by autodiscovery pod annotations or by configuration file.

#### Configuration by autodiscovery pod annotations

Add these annotations to Velero pods:

```
podAnnotations: {
  "ad.datadoghq.com/velero.check_names": '["openmetrics"]',
  "ad.datadoghq.com/velero.init_configs": '[{}]',
  "ad.datadoghq.com/velero.instances": '[{"prometheus_url": "http://%%host%%:8085/metrics", "namespace": "velero", "metrics": ["velero*"]}]'
}
```

#### Configuration by configuration file

Example of `openmetrics.d/conf.yaml`:

```
init_config:

instances:

    ## @param prometheus_url - string - required
    ## The URL where your application metrics are exposed by Prometheus.
    #
  - prometheus_url: http://velero.velero.svc.cluster.local:8085/metrics

    ## @param namespace - string - required
    ## The namespace to be prepended to all metrics.
    #
    namespace: "velero"

    ## @param metrics - list of strings - required
    ## List of metrics to be fetched from the prometheus endpoint, if there's a
    ## value it'll be renamed. This list should contain at least one metric
    #
    metrics:
      - velero*
```

### How to monitor multiple schedule witch have different frequencies ?

If you have multiple Velero schedules with different frequencies, you must duplicate the default example module declaration specifying right timeframes and disabling others common monitors.

For instance, for an hourly schedule you can uncomment this block:

```
#module "datadog-monitors-caas-kubernetes-velero" {
#  source                                                    = "claranet/monitors/datadog//caas/kubernetes/velero"
#  version                                                   = "{revision}"
#
#  environment                                               = var.environment
#  message                                                   = module.datadog-message-alerting.alerting-message
#}

#module "datadog-monitors-caas-kubernetes-velero-hourly" {
#  source                                                    = "claranet/monitors/datadog//caas/kubernetes/velero"
#  version                                                   = "{revision}"
#
#  environment                                               = var.environment
#  message                                                   = module.datadog-message-alerting.alerting-message
#
#  velero_scheduled_backup_missing_monitor_timeframe         = "last_1h"
#  velero_scheduled_backup_missing_monitor_no_data_timeframe = 120
#  velero_backup_failure_enabled                             = false
#  velero_backup_partial_failure_enabled                     = false
#  velero_backup_deletion_failure_enabled                    = false
#  velero_volume_snapshot_failure_enabled                    = false
#}
```
