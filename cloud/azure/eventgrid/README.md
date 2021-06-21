# CLOUD AZURE EVENTGRID DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-azure-eventgrid" {
  source      = "claranet/monitors/datadog//cloud/azure/eventgrid"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Event Grid no successful message
- Event Grid too many failed messages
- Event Grid too many unmatched events

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                                              | Description                                                                                                                                      | Type           | Default     | Required |
| ------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------ | -------------- | ----------- | :------: |
| environment                                       | Architecture environment                                                                                                                         | `string`       | n/a         |   yes    |
| evaluation_delay                                  | Delay in seconds for the metric evaluation                                                                                                       | `number`       | `900`       |    no    |
| eventgrid_no_successful_message_no_data_timeframe | Number of minutes before reporting no data                                                                                                       | `string`       | `10`        |    no    |
| failed_messages_rate_enabled                      | Flag to enable Event Grid failed messages monitor                                                                                                | `string`       | `"true"`    |    no    |
| failed_messages_rate_extra_tags                   | Extra tags for Event Grid failed messages monitor                                                                                                | `list(string)` | `[]`        |    no    |
| failed_messages_rate_message                      | Custom message for Event Grid failed messages monitor                                                                                            | `string`       | `""`        |    no    |
| failed_messages_rate_thresold_critical            | Failed messages ratio (percentage) to trigger the critical alert                                                                                 | `number`       | `90`        |    no    |
| failed_messages_rate_thresold_warning             | Failed messages ratio (percentage) to trigger a warning alert                                                                                    | `number`       | `50`        |    no    |
| failed_messages_rate_time_aggregator              | Monitor aggregator for Event Grid failed messages [available values: min, max or avg]                                                            | `string`       | `"min"`     |    no    |
| failed_messages_rate_timeframe                    | Monitor timeframe for Event Grid failed messages [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]       | `string`       | `"last_5m"` |    no    |
| filter_tags_custom                                | Tags used for custom filtering when filter_tags_use_defaults is false                                                                            | `string`       | `"*"`       |    no    |
| filter_tags_custom_excluded                       | Tags excluded for custom filtering when filter_tags_use_defaults is false                                                                        | `string`       | `""`        |    no    |
| filter_tags_use_defaults                          | Use default filter tags convention                                                                                                               | `string`       | `"true"`    |    no    |
| message                                           | Message sent when an alert is triggered                                                                                                          | `any`          | n/a         |   yes    |
| new_host_delay                                    | Delay in seconds before monitor new resource                                                                                                     | `number`       | `300`       |    no    |
| no_successful_message_rate_enabled                | Flag to enable Event Grid no successful message monitor                                                                                          | `string`       | `"true"`    |    no    |
| no_successful_message_rate_extra_tags             | Extra tags for Event Grid no successful message monitor                                                                                          | `list(string)` | `[]`        |    no    |
| no_successful_message_rate_message                | Custom message for Event Grid no successful message monitor                                                                                      | `string`       | `""`        |    no    |
| no_successful_message_rate_time_aggregator        | Monitor aggregator for Event Grid no successful message [available values: min, max or avg]                                                      | `string`       | `"min"`     |    no    |
| no_successful_message_rate_timeframe              | Monitor timeframe for Event Grid no successful message [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string`       | `"last_5m"` |    no    |
| notify_no_data                                    | Will raise no data alert if set to true                                                                                                          | `bool`         | `true`      |    no    |
| prefix_slug                                       | Prefix string to prepend between brackets on every monitors names                                                                                | `string`       | `""`        |    no    |
| unmatched_events_rate_enabled                     | Flag to enable Event Grid unmatched events monitor                                                                                               | `string`       | `"true"`    |    no    |
| unmatched_events_rate_extra_tags                  | Extra tags for Event Grid unmatched events monitor                                                                                               | `list(string)` | `[]`        |    no    |
| unmatched_events_rate_message                     | Custom message for Event Grid unmatched events monitor                                                                                           | `string`       | `""`        |    no    |
| unmatched_events_rate_thresold_critical           | Unmatched events ratio (percentage) to trigger the critical alert                                                                                | `number`       | `90`        |    no    |
| unmatched_events_rate_thresold_warning            | Unmatched events ratio (percentage) to trigger a warning alert                                                                                   | `number`       | `50`        |    no    |
| unmatched_events_rate_time_aggregator             | Monitor aggregator for Event Grid unmatched events [available values: min, max or avg]                                                           | `string`       | `"min"`     |    no    |
| unmatched_events_rate_timeframe                   | Monitor timeframe for Event Grid unmatched events [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]      | `string`       | `"last_5m"` |    no    |

## Outputs

| Name                               | Description                                    |
| ---------------------------------- | ---------------------------------------------- |
| eventgrid_failed_messages_id       | id for monitor eventgrid_failed_messages       |
| eventgrid_no_successful_message_id | id for monitor eventgrid_no_successful_message |
| eventgrid_unmatched_events_id      | id for monitor eventgrid_unmatched_events      |

## Related documentation

Datadog Azure documentation: [https://docs.datadoghq.com/integrations/azure/](https://docs.datadoghq.com/integrations/azure/)

Azure "Monitor event delivery" documentation: [https://docs.microsoft.com/en-us/azure/event-grid/monitor-event-delivery](https://docs.microsoft.com/en-us/azure/event-grid/monitor-event-delivery)

Azure Monitor metrics: [https://docs.microsoft.com/en-us/azure/azure-monitor/platform/metrics-supported#microsofteventgridtopics](https://docs.microsoft.com/en-us/azure/azure-monitor/platform/metrics-supported#microsofteventgridtopics)
