# CLOUD AZURE IOTHUBS DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-azure-iothubs" {
  source      = "claranet/monitors/datadog//cloud/azure/iothubs"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- IOT Hub is down
- IOT Hub Too many c2d methods failure
- IOT Hub Too many c2d twin read failure
- IOT Hub Too many c2d twin update failure
- IOT Hub Too many d2c telemetry egress dropped
- IOT Hub Too many d2c telemetry egress invalid
- IOT Hub Too many d2c telemetry egress orphaned
- IOT Hub Too many d2c telemetry ingress not sent
- IOT Hub Too many d2c twin read failure
- IOT Hub Too many d2c twin update failure
- IOT Hub Too many jobs failed
- IOT Hub Too many list_jobs failure
- IOT Hub Too many query_jobs failed
- IOT Hub Total devices is wrong

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                                                          | Description                                                                                                                                    | Type           | Default     | Required |
| ------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- | -------------- | ----------- | :------: |
| dropped_d2c_telemetry_egress_enabled                          | Flag to enable IoT Hub dropped d2c telemetry monitor                                                                                           | `string`       | `"true"`    |    no    |
| dropped_d2c_telemetry_egress_extra_tags                       | Extra tags for IoT Hub dropped d2c telemetry monitor                                                                                           | `list(string)` | `[]`        |    no    |
| dropped_d2c_telemetry_egress_message                          | Custom message for IoT Hub dropped d2c telemetry monitor                                                                                       | `string`       | `""`        |    no    |
| dropped_d2c_telemetry_egress_rate_threshold_critical          | D2C Telemetry Dropped limit (critical threshold)                                                                                               | `number`       | `90`        |    no    |
| dropped_d2c_telemetry_egress_rate_threshold_warning           | D2C Telemetry Dropped limit (warning threshold)                                                                                                | `number`       | `50`        |    no    |
| dropped_d2c_telemetry_egress_time_aggregator                  | Monitor aggregator for IoT Hub dropped d2c telemetry [available values: min, max, sum or avg]                                                  | `string`       | `"min"`     |    no    |
| dropped_d2c_telemetry_egress_timeframe                        | Monitor timeframe for IoT Hub dropped d2c telemetry [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]  | `string`       | `"last_5m"` |    no    |
| environment                                                   | Architecture Environment                                                                                                                       | `string`       | n/a         |   yes    |
| evaluation_delay                                              | Delay in seconds for the metric evaluation                                                                                                     | `number`       | `900`       |    no    |
| failed_c2d_methods_rate_enabled                               | Flag to enable IoT Hub failed c2d methods monitor                                                                                              | `string`       | `"true"`    |    no    |
| failed_c2d_methods_rate_extra_tags                            | Extra tags for IoT Hub failed c2d methods monitor                                                                                              | `list(string)` | `[]`        |    no    |
| failed_c2d_methods_rate_message                               | Custom message for IoT Hub failed c2d method monitor                                                                                           | `string`       | `""`        |    no    |
| failed_c2d_methods_rate_threshold_critical                    | C2D Methods Failed rate limit (critical threshold)                                                                                             | `number`       | `90`        |    no    |
| failed_c2d_methods_rate_threshold_warning                     | C2D Methods Failed rate limit (warning threshold)                                                                                              | `number`       | `50`        |    no    |
| failed_c2d_methods_rate_time_aggregator                       | Monitor aggregator for IoT Hub failed c2d method [available values: min, max, sum or avg]                                                      | `string`       | `"min"`     |    no    |
| failed_c2d_methods_rate_timeframe                             | Monitor timeframe for IoT Hub failed c2d method [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]      | `string`       | `"last_5m"` |    no    |
| failed_c2d_twin_read_rate_enabled                             | Flag to enable IoT Hub failed c2d twin read monitor                                                                                            | `string`       | `"true"`    |    no    |
| failed_c2d_twin_read_rate_extra_tags                          | Extra tags for IoT Hub failed c2d twin read monitor                                                                                            | `list(string)` | `[]`        |    no    |
| failed_c2d_twin_read_rate_message                             | Custom message for IoT Hub failed c2d twin read monitor                                                                                        | `string`       | `""`        |    no    |
| failed_c2d_twin_read_rate_threshold_critical                  | C2D Twin Read Failed rate limit (critical threshold)                                                                                           | `number`       | `90`        |    no    |
| failed_c2d_twin_read_rate_threshold_warning                   | C2D Twin Read Failed rate limit (warning threshold)                                                                                            | `number`       | `50`        |    no    |
| failed_c2d_twin_read_rate_time_aggregator                     | Monitor aggregator for IoT Hub failed c2d twin read [available values: min, max, sum or avg]                                                   | `string`       | `"min"`     |    no    |
| failed_c2d_twin_read_rate_timeframe                           | Monitor timeframe for IoT Hub failed c2d twin read [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]   | `string`       | `"last_5m"` |    no    |
| failed_c2d_twin_update_rate_enabled                           | Flag to enable IoT Hub failed c2d twin update monitor                                                                                          | `string`       | `"true"`    |    no    |
| failed_c2d_twin_update_rate_extra_tags                        | Extra tags for IoT Hub failed c2d twin update monitor                                                                                          | `list(string)` | `[]`        |    no    |
| failed_c2d_twin_update_rate_message                           | Custom message for IoT Hub failed c2d twin update monitor                                                                                      | `string`       | `""`        |    no    |
| failed_c2d_twin_update_rate_threshold_critical                | C2D Twin Update Failed rate limit (critical threshold)                                                                                         | `number`       | `90`        |    no    |
| failed_c2d_twin_update_rate_threshold_warning                 | C2D Twin Update Failed rate limit (warning threshold)                                                                                          | `number`       | `50`        |    no    |
| failed_c2d_twin_update_rate_time_aggregator                   | Monitor aggregator for IoT Hub failed c2d twin update [available values: min, max, sum or avg]                                                 | `string`       | `"min"`     |    no    |
| failed_c2d_twin_update_rate_timeframe                         | Monitor timeframe for IoT Hub failed c2d twin update [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string`       | `"last_5m"` |    no    |
| failed_d2c_twin_read_rate_enabled                             | Flag to enable IoT Hub failed d2c twin read monitor                                                                                            | `string`       | `"true"`    |    no    |
| failed_d2c_twin_read_rate_extra_tags                          | Extra tags for IoT Hub failed d2c twin read monitor                                                                                            | `list(string)` | `[]`        |    no    |
| failed_d2c_twin_read_rate_message                             | Custom message for IoT Hub failed d2c twin read monitor                                                                                        | `string`       | `""`        |    no    |
| failed_d2c_twin_read_rate_threshold_critical                  | D2C Twin Read Failed rate limit (critical threshold)                                                                                           | `number`       | `90`        |    no    |
| failed_d2c_twin_read_rate_threshold_warning                   | D2C Twin Read Failed rate limit (warning threshold)                                                                                            | `number`       | `50`        |    no    |
| failed_d2c_twin_read_rate_time_aggregator                     | Monitor aggregator for IoT Hub failed d2c twin read [available values: min, max, sum or avg]                                                   | `string`       | `"min"`     |    no    |
| failed_d2c_twin_read_rate_timeframe                           | Monitor timeframe for IoT Hub failed d2c twin read [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]   | `string`       | `"last_5m"` |    no    |
| failed_d2c_twin_update_rate_enabled                           | Flag to enable IoT Hub failed d2c twin update monitor                                                                                          | `string`       | `"true"`    |    no    |
| failed_d2c_twin_update_rate_extra_tags                        | Extra tags for IoT Hub failed d2c twin update monitor                                                                                          | `list(string)` | `[]`        |    no    |
| failed_d2c_twin_update_rate_message                           | Custom message for IoT Hub failed d2c twin update monitor                                                                                      | `string`       | `""`        |    no    |
| failed_d2c_twin_update_rate_threshold_critical                | D2C Twin Update Failed rate limit (critical threshold)                                                                                         | `number`       | `90`        |    no    |
| failed_d2c_twin_update_rate_threshold_warning                 | D2C Twin Update Failed rate limit (warning threshold)                                                                                          | `number`       | `50`        |    no    |
| failed_d2c_twin_update_rate_time_aggregator                   | Monitor aggregator for IoT Hub failed d2c twin update [available values: min, max, sum or avg]                                                 | `string`       | `"min"`     |    no    |
| failed_d2c_twin_update_rate_timeframe                         | Monitor timeframe for IoT Hub failed d2c twin update [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string`       | `"last_5m"` |    no    |
| failed_jobs_rate_enabled                                      | Flag to enable IoT Hub failed jobs monitor                                                                                                     | `string`       | `"true"`    |    no    |
| failed_jobs_rate_extra_tags                                   | Extra tags for IoT Hub failed jobs monitor                                                                                                     | `list(string)` | `[]`        |    no    |
| failed_jobs_rate_message                                      | Custom message for IoT Hub failed jobs monitor                                                                                                 | `string`       | `""`        |    no    |
| failed_jobs_rate_threshold_critical                           | Jobs Failed rate limit (critical threshold)                                                                                                    | `number`       | `90`        |    no    |
| failed_jobs_rate_threshold_warning                            | Jobs Failed rate limit (warning threshold)                                                                                                     | `number`       | `50`        |    no    |
| failed_jobs_rate_time_aggregator                              | Monitor aggregator for IoT Hub failed jobs [available values: min, max, sum or avg]                                                            | `string`       | `"min"`     |    no    |
| failed_jobs_rate_timeframe                                    | Monitor timeframe for IoT Hub failed jobs [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]            | `string`       | `"last_5m"` |    no    |
| failed_listjobs_rate_enabled                                  | Flag to enable IoT Hub failed list jobs monitor                                                                                                | `string`       | `"true"`    |    no    |
| failed_listjobs_rate_extra_tags                               | Extra tags for IoT Hub failed list jobs monitor                                                                                                | `list(string)` | `[]`        |    no    |
| failed_listjobs_rate_message                                  | Custom message for IoT Hub failed list jobs monitor                                                                                            | `string`       | `""`        |    no    |
| failed_listjobs_rate_threshold_critical                       | ListJobs Failed rate limit (critical threshold)                                                                                                | `number`       | `90`        |    no    |
| failed_listjobs_rate_threshold_warning                        | ListJobs Failed rate limit (warning threshold)                                                                                                 | `number`       | `50`        |    no    |
| failed_listjobs_rate_time_aggregator                          | Monitor aggregator for IoT Hub failed list jobs [available values: min, max, sum or avg]                                                       | `string`       | `"min"`     |    no    |
| failed_listjobs_rate_timeframe                                | Monitor timeframe for IoT Hub failed list jobs [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]       | `string`       | `"last_5m"` |    no    |
| failed_queryjobs_rate_enabled                                 | Flag to enable IoT Hub failed query jobs monitor                                                                                               | `string`       | `"true"`    |    no    |
| failed_queryjobs_rate_extra_tags                              | Extra tags for IoT Hub failed query jobs monitor                                                                                               | `list(string)` | `[]`        |    no    |
| failed_queryjobs_rate_message                                 | Custom message for IoT Hub failed query jobs monitor                                                                                           | `string`       | `""`        |    no    |
| failed_queryjobs_rate_threshold_critical                      | QueryJobs Failed rate limit (critical threshold)                                                                                               | `number`       | `90`        |    no    |
| failed_queryjobs_rate_threshold_warning                       | QueryJobs Failed rate limit (warning threshold)                                                                                                | `number`       | `50`        |    no    |
| failed_queryjobs_rate_time_aggregator                         | Monitor aggregator for IoT Hub failed query jobs [available values: min, max, sum or avg]                                                      | `string`       | `"min"`     |    no    |
| failed_queryjobs_rate_timeframe                               | Monitor timeframe for IoT Hub failed query jobs [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]      | `string`       | `"last_5m"` |    no    |
| filter_tags_custom                                            | Tags used for custom filtering when filter_tags_use_defaults is false                                                                          | `string`       | `"*"`       |    no    |
| filter_tags_custom_excluded                                   | Tags excluded for custom filtering when filter_tags_use_defaults is false                                                                      | `string`       | `""`        |    no    |
| filter_tags_use_defaults                                      | Use default filter tags convention                                                                                                             | `string`       | `"true"`    |    no    |
| invalid_d2c_telemetry_egress_enabled                          | Flag to enable IoT Hub invalid d2c telemetry monitor                                                                                           | `string`       | `"true"`    |    no    |
| invalid_d2c_telemetry_egress_extra_tags                       | Extra tags for IoT Hub invalid d2c telemetry monitor                                                                                           | `list(string)` | `[]`        |    no    |
| invalid_d2c_telemetry_egress_message                          | Custom message for IoT Hub invalid d2c telemetry monitor                                                                                       | `string`       | `""`        |    no    |
| invalid_d2c_telemetry_egress_rate_threshold_critical          | D2C Telemetry Invalid limit (critical threshold)                                                                                               | `number`       | `90`        |    no    |
| invalid_d2c_telemetry_egress_rate_threshold_warning           | D2C Telemetry Invalid limit (warning threshold)                                                                                                | `number`       | `50`        |    no    |
| invalid_d2c_telemetry_egress_time_aggregator                  | Monitor aggregator for IoT Hub invalid d2c telemetry [available values: min, max, sum or avg]                                                  | `string`       | `"min"`     |    no    |
| invalid_d2c_telemetry_egress_timeframe                        | Monitor timeframe for IoT Hub invalid d2c telemetry [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]  | `string`       | `"last_5m"` |    no    |
| message                                                       | Message sent when an alert is triggered                                                                                                        | `any`          | n/a         |   yes    |
| new_host_delay                                                | Delay in seconds before monitor new resource                                                                                                   | `number`       | `300`       |    no    |
| notify_no_data                                                | Will raise no data alert if set to true                                                                                                        | `bool`         | `true`      |    no    |
| orphaned_d2c_telemetry_egress_enabled                         | Flag to enable IoT Hub orphaned d2c telemetry monitor                                                                                          | `string`       | `"true"`    |    no    |
| orphaned_d2c_telemetry_egress_extra_tags                      | Extra tags for IoT Hub orphaned d2c telemetry monitor                                                                                          | `list(string)` | `[]`        |    no    |
| orphaned_d2c_telemetry_egress_message                         | Custom message for IoT Hub orphaned d2c telemetry monitor                                                                                      | `string`       | `""`        |    no    |
| orphaned_d2c_telemetry_egress_rate_threshold_critical         | D2C Telemetry Orphaned limit (critical threshold)                                                                                              | `number`       | `90`        |    no    |
| orphaned_d2c_telemetry_egress_rate_threshold_warning          | D2C Telemetry Orphaned limit (warning threshold)                                                                                               | `number`       | `50`        |    no    |
| orphaned_d2c_telemetry_egress_time_aggregator                 | Monitor aggregator for IoT Hub orphaned d2c telemetry [available values: min, max, sum or avg]                                                 | `string`       | `"min"`     |    no    |
| orphaned_d2c_telemetry_egress_timeframe                       | Monitor timeframe for IoT Hub orphaned d2c telemetry [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string`       | `"last_5m"` |    no    |
| prefix_slug                                                   | Prefix string to prepend between brackets on every monitors names                                                                              | `string`       | `""`        |    no    |
| status_enabled                                                | Flag to enable IoT Hub status monitor                                                                                                          | `string`       | `"true"`    |    no    |
| status_extra_tags                                             | Extra tags for IoT Hub status monitor                                                                                                          | `list(string)` | `[]`        |    no    |
| status_message                                                | Custom message for IoT Hub status monitor                                                                                                      | `string`       | `""`        |    no    |
| status_no_data_timeframe                                      | Number of minutes before reporting no data                                                                                                     | `string`       | `10`        |    no    |
| status_time_aggregator                                        | Monitor aggregator for IoT Hub status [available values: min, max, sum or avg]                                                                 | `string`       | `"max"`     |    no    |
| status_timeframe                                              | Monitor timeframe for IoT Hub status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]                 | `string`       | `"last_5m"` |    no    |
| too_many_d2c_telemetry_ingress_nosent_enabled                 | Flag to enable IoT Hub unsent d2c telemetry monitor                                                                                            | `string`       | `"true"`    |    no    |
| too_many_d2c_telemetry_ingress_nosent_extra_tags              | Extra tags for IoT Hub unsent d2c telemetry monitor                                                                                            | `list(string)` | `[]`        |    no    |
| too_many_d2c_telemetry_ingress_nosent_message                 | Custom message for IoT Hub unsent d2c telemetry monitor                                                                                        | `string`       | `""`        |    no    |
| too_many_d2c_telemetry_ingress_nosent_rate_threshold_critical | D2C Telemetry ingress not sent limit (critical threshold)                                                                                      | `number`       | `20`        |    no    |
| too_many_d2c_telemetry_ingress_nosent_rate_threshold_warning  | D2C Telemetry ingress not sent limit (warning threshold)                                                                                       | `number`       | `10`        |    no    |
| too_many_d2c_telemetry_ingress_nosent_timeframe               | Monitor timeframe for IoT Hub unsent d2c telemetry [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]   | `string`       | `"last_5m"` |    no    |
| total_devices_enabled                                         | Flag to enable IoT Hub total devices monitor                                                                                                   | `string`       | `"true"`    |    no    |
| total_devices_extra_tags                                      | Extra tags for IoT Hub total devices monitor                                                                                                   | `list(string)` | `[]`        |    no    |
| total_devices_message                                         | Custom message for IoT Hub total devices monitor                                                                                               | `string`       | `""`        |    no    |
| total_devices_time_aggregator                                 | Monitor aggregator for IoT Hub total devices [available values: min, max, sum or avg]                                                          | `string`       | `"min"`     |    no    |
| total_devices_timeframe                                       | Monitor timeframe for IoT Hub total devices [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]          | `string`       | `"last_5m"` |    no    |

## Outputs

| Name                                      | Description                                           |
| ----------------------------------------- | ----------------------------------------------------- |
| status_id                                 | id for monitor status                                 |
| too_many_c2d_methods_failed_id            | id for monitor too_many_c2d_methods_failed            |
| too_many_c2d_twin_read_failed_id          | id for monitor too_many_c2d_twin_read_failed          |
| too_many_c2d_twin_update_failed_id        | id for monitor too_many_c2d_twin_update_failed        |
| too_many_d2c_telemetry_egress_dropped_id  | id for monitor too_many_d2c_telemetry_egress_dropped  |
| too_many_d2c_telemetry_egress_invalid_id  | id for monitor too_many_d2c_telemetry_egress_invalid  |
| too_many_d2c_telemetry_egress_orphaned_id | id for monitor too_many_d2c_telemetry_egress_orphaned |
| too_many_d2c_telemetry_ingress_nosent_id  | id for monitor too_many_d2c_telemetry_ingress_nosent  |
| too_many_d2c_twin_read_failed_id          | id for monitor too_many_d2c_twin_read_failed          |
| too_many_d2c_twin_update_failed_id        | id for monitor too_many_d2c_twin_update_failed        |
| too_many_jobs_failed_id                   | id for monitor too_many_jobs_failed                   |
| too_many_list_jobs_failed_id              | id for monitor too_many_list_jobs_failed              |
| too_many_query_jobs_failed_id             | id for monitor too_many_query_jobs_failed             |
| total_devices_id                          | id for monitor total_devices                          |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/azure_iot_hub](https://docs.datadoghq.com/integrations/azure_iot_hub)

Azure IOT Hubs metrics documentation: [https://docs.microsoft.com/en-us/azure/iot-hub/iot-hub-monitor-resource-health](https://docs.microsoft.com/en-us/azure/iot-hub/iot-hub-monitor-resource-health)
