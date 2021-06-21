# CAAS DOCKER DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-caas-docker" {
  source      = "claranet/monitors/datadog//caas/docker"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Docker Container Memory Used (disabled by default)
- Docker does not respond

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                             | Description                                                               | Type           | Default     | Required |
| -------------------------------- | ------------------------------------------------------------------------- | -------------- | ----------- | :------: |
| environment                      | Architecture Environment                                                  | `string`       | n/a         |   yes    |
| evaluation_delay                 | Delay in seconds for the metric evaluation                                | `number`       | `15`        |    no    |
| filter_tags_custom               | Tags used for custom filtering when filter_tags_use_defaults is false     | `string`       | `"*"`       |    no    |
| filter_tags_custom_excluded      | Tags excluded for custom filtering when filter_tags_use_defaults is false | `string`       | `""`        |    no    |
| filter_tags_use_defaults         | Use default filter tags convention                                        | `string`       | `"true"`    |    no    |
| memory_used_enabled              | Flag to enable Container Memory Usage monitor                             | `string`       | `"false"`   |    no    |
| memory_used_extra_tags           | Extra tags for Container Memory Usage monitor                             | `list(string)` | `[]`        |    no    |
| memory_used_message              | Custom message for the Container Memory Usage monitor                     | `string`       | `""`        |    no    |
| memory_used_threshold_critical   | Container Memory Usage critical threshold                                 | `string`       | `90`        |    no    |
| memory_used_threshold_warning    | Container Memory Usage warning threshold                                  | `string`       | `85`        |    no    |
| memory_used_time_aggregator      | Time aggregator for the Container Memory Usage monitor                    | `string`       | `"min"`     |    no    |
| memory_used_timeframe            | Timeframe for the Container Memory Usage monitor                          | `string`       | `"last_5m"` |    no    |
| message                          | Message sent when an alert is triggered                                   | `any`          | n/a         |   yes    |
| new_host_delay                   | Delay in seconds before monitor new resource                              | `number`       | `300`       |    no    |
| not_responding_enabled           | Flag to enable Docker does not respond monitor                            | `string`       | `"true"`    |    no    |
| not_responding_extra_tags        | Extra tags for Docker does not respond monitor                            | `list(string)` | `[]`        |    no    |
| not_responding_message           | Custom message for Docker does not respond monitor                        | `string`       | `""`        |    no    |
| not_responding_no_data_timeframe | Docker does not respond monitor no data timeframe                         | `string`       | `10`        |    no    |
| not_responding_threshold_warning | Docker does not respond monitor (warning threshold)                       | `string`       | `3`         |    no    |
| notify_no_data                   | Will raise no data alert if set to true                                   | `bool`         | `true`      |    no    |
| prefix_slug                      | Prefix string to prepend between brackets on every monitors names         | `string`       | `""`        |    no    |

## Outputs

| Name              | Description                   |
| ----------------- | ----------------------------- |
| memory_used_id    | id for monitor memory_used    |
| not_responding_id | id for monitor not_responding |

## Related documentation

- [Datadog Docker integration](https://docs.datadoghq.com/integrations/docker_daemon/)
