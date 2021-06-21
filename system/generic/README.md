# SYSTEM GENERIC DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-system-generic" {
  source      = "claranet/monitors/datadog//system/generic"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message

  memory_message = "${module.datadog-message-alerting-bh-only.alerting-message}"
}

```

## Purpose

Creates DataDog monitors with the following checks:

- CPU load 5 ratio
- CPU usage
- Disk inodes usage
- Disk space usage
- Disk Space usage forecast
- Usable Memory

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                                            | Description                                                                                                                                        | Type           | Default      | Required |
| ----------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------- | -------------- | ------------ | :------: |
| cpu_enabled                                     | Flag to enable CPU high monitor                                                                                                                    | `string`       | `"true"`     |    no    |
| cpu_extra_tags                                  | Extra tags for CPU high monitor                                                                                                                    | `list(string)` | `[]`         |    no    |
| cpu_message                                     | Custom message for CPU high monitor                                                                                                                | `string`       | `""`         |    no    |
| cpu_threshold_critical                          | CPU high critical threshold                                                                                                                        | `number`       | `90`         |    no    |
| cpu_threshold_warning                           | CPU high warning threshold                                                                                                                         | `number`       | `85`         |    no    |
| cpu_time_aggregator                             | Monitor aggregator for CPU high [available values: min, max or avg]                                                                                | `string`       | `"min"`      |    no    |
| cpu_timeframe                                   | Monitor timeframe for CPU high [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]                           | `string`       | `"last_1h"`  |    no    |
| disk_inodes_enabled                             | Flag to enable Free disk inodes monitor                                                                                                            | `string`       | `"true"`     |    no    |
| disk_inodes_extra_tags                          | Extra tags for Free disk inodes monitor                                                                                                            | `list(string)` | `[]`         |    no    |
| disk_inodes_message                             | Custom message for Free disk inodes monitor                                                                                                        | `string`       | `""`         |    no    |
| disk_inodes_threshold_critical                  | Free disk space critical threshold                                                                                                                 | `number`       | `95`         |    no    |
| disk_inodes_threshold_warning                   | Free disk space warning threshold                                                                                                                  | `number`       | `90`         |    no    |
| disk_inodes_time_aggregator                     | Monitor aggregator for Free disk inodes [available values: min, max or avg]                                                                        | `string`       | `"min"`      |    no    |
| disk_inodes_timeframe                           | Monitor timeframe for Free disk inodes [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]                   | `string`       | `"last_5m"`  |    no    |
| disk_space_enabled                              | Flag to enable Free diskspace monitor                                                                                                              | `string`       | `"true"`     |    no    |
| disk_space_extra_tags                           | Extra tags for Free diskspace monitor                                                                                                              | `list(string)` | `[]`         |    no    |
| disk_space_forecast_algorithm                   | Algorithm for the Free diskspace Forecast monitor [available values: `linear` or `seasonal`]                                                       | `string`       | `"linear"`   |    no    |
| disk_space_forecast_deviations                  | Deviations for the Free diskspace Forecast monitor [available values: `1`, `2`, `3`, `4` or `5`]                                                   | `string`       | `1`          |    no    |
| disk_space_forecast_enabled                     | Flag to enable Free diskspace forecast monitor                                                                                                     | `string`       | `"true"`     |    no    |
| disk_space_forecast_extra_tags                  | Extra tags for Free diskspace forecast monitor                                                                                                     | `list(string)` | `[]`         |    no    |
| disk_space_forecast_interval                    | Interval for the Free diskspace Forecast monitor [available values: `30m`, `60m` or `120m`]                                                        | `string`       | `"60m"`      |    no    |
| disk_space_forecast_linear_history              | History for the Free diskspace Forecast monitor [available values: `12h`, `#d` (1, 2, or 3), `#w` (1, or 2) or `#mo` (1, 2 or 3)]                  | `string`       | `"1w"`       |    no    |
| disk_space_forecast_linear_model                | Model for the Free diskspace Forecast monitor [available values: `default`, `simple` or `reactive`]                                                | `string`       | `"default"`  |    no    |
| disk_space_forecast_message                     | Custom message for Free diskspace forecast monitor                                                                                                 | `string`       | `""`         |    no    |
| disk_space_forecast_seasonal_seasonality        | Seasonality for the Free diskspace Forecast monitor                                                                                                | `string`       | `"weekly"`   |    no    |
| disk_space_forecast_threshold_critical          | Free disk space forecast critical threshold                                                                                                        | `number`       | `80`         |    no    |
| disk_space_forecast_threshold_critical_recovery | Free disk space forecast recovery threshold                                                                                                        | `number`       | `72`         |    no    |
| disk_space_forecast_time_aggregator             | Monitor aggregator for Free diskspace forecast [available values: min, max or avg]                                                                 | `string`       | `"max"`      |    no    |
| disk_space_forecast_timeframe                   | Monitor timeframe for Free diskspace forecast [available values: `next_12h`, `next_#d` (1, 2, or 3), `next_#w` (1 or 2) or `next_#mo` (1, 2 or 3)] | `string`       | `"next_1w"`  |    no    |
| disk_space_message                              | Custom message for Free diskspace monitor                                                                                                          | `string`       | `""`         |    no    |
| disk_space_threshold_critical                   | Free disk space critical threshold                                                                                                                 | `number`       | `90`         |    no    |
| disk_space_threshold_warning                    | Free disk space warning threshold                                                                                                                  | `number`       | `80`         |    no    |
| disk_space_time_aggregator                      | Monitor aggregator for Free diskspace [available values: min, max or avg]                                                                          | `string`       | `"max"`      |    no    |
| disk_space_timeframe                            | Monitor timeframe for Free diskspace [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]                     | `string`       | `"last_5m"`  |    no    |
| environment                                     | Architecture Environment                                                                                                                           | `string`       | n/a          |   yes    |
| evaluation_delay                                | Delay in seconds for the metric evaluation                                                                                                         | `number`       | `15`         |    no    |
| filter_tags_custom                              | Tags used for custom filtering when filter_tags_use_defaults is false                                                                              | `string`       | `"*"`        |    no    |
| filter_tags_custom_excluded                     | Tags excluded for custom filtering when filter_tags_use_defaults is false                                                                          | `string`       | `""`         |    no    |
| filter_tags_use_defaults                        | Use default filter tags convention                                                                                                                 | `string`       | `"true"`     |    no    |
| load_enabled                                    | Flag to enable CPU load ratio monitor                                                                                                              | `string`       | `"true"`     |    no    |
| load_extra_tags                                 | Extra tags for CPU load ratio monitor                                                                                                              | `list(string)` | `[]`         |    no    |
| load_message                                    | Custom message for CPU load ratio monitor                                                                                                          | `string`       | `""`         |    no    |
| load_threshold_critical                         | CPU load ratio critical threshold                                                                                                                  | `number`       | `2.5`        |    no    |
| load_threshold_warning                          | CPU load ratio warning threshold                                                                                                                   | `number`       | `2`          |    no    |
| load_time_aggregator                            | Monitor aggregator for CPU load ratio [available values: min, max or avg]                                                                          | `string`       | `"min"`      |    no    |
| load_timeframe                                  | Monitor timeframe for CPU load ratio [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]                     | `string`       | `"last_30m"` |    no    |
| memory_enabled                                  | Flag to enable Free memory monitor                                                                                                                 | `string`       | `"true"`     |    no    |
| memory_extra_tags                               | Extra tags for Free memory monitor                                                                                                                 | `list(string)` | `[]`         |    no    |
| memory_message                                  | Mandatory message for Free memory monitor to avoid NBH alerting by default                                                                         | `string`       | n/a          |   yes    |
| memory_threshold_critical                       | Free disk space critical threshold                                                                                                                 | `number`       | `5`          |    no    |
| memory_threshold_warning                        | Free disk space warning threshold                                                                                                                  | `number`       | `10`         |    no    |
| memory_time_aggregator                          | Monitor aggregator for Free memory [available values: min, max or avg]                                                                             | `string`       | `"max"`      |    no    |
| memory_timeframe                                | Monitor timeframe for Free memory [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]                        | `string`       | `"last_5m"`  |    no    |
| message                                         | Message sent when an alert is triggered                                                                                                            | `any`          | n/a          |   yes    |
| new_host_delay                                  | Delay in seconds before monitor new resource                                                                                                       | `number`       | `300`        |    no    |
| notify_no_data                                  | Will raise no data alert if set to true                                                                                                            | `bool`         | `true`       |    no    |
| prefix_slug                                     | Prefix string to prepend between brackets on every monitors names                                                                                  | `string`       | `""`         |    no    |

## Outputs

| Name                   | Description                        |
| ---------------------- | ---------------------------------- |
| cpu_id                 | id for monitor cpu                 |
| disk_inodes_id         | id for monitor disk_inodes         |
| disk_space_forecast_id | id for monitor disk_space_forecast |
| disk_space_id          | id for monitor disk_space          |
| load_id                | id for monitor load                |
| memory_id              | id for monitor memory              |

## Related documentation

DataDog documentation:
