# CLOUD AZURE STORAGE DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-azure-storage" {
  source      = "claranet/monitors/datadog//cloud/azure/storage"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Azure Blob Storage too many authorization errors
- Azure Blob Storage too many client_other errors
- Azure Blob Storage too many network errors
- Azure Blob Storage too many server_other errors
- Azure Blob Storage too many throttling errors
- Azure Blob Storage too many timeout errors
- Azure File Storage too many authorization errors
- Azure File Storage too many client_other errors
- Azure File Storage too many network errors
- Azure File Storage too many server_other errors
- Azure File Storage too many throttling errors
- Azure File Storage too many timeout errors
- Azure Queue Storage too many authorization errors
- Azure Queue Storage too many client_other errors
- Azure Queue Storage too many network errors
- Azure Queue Storage too many server_other errors
- Azure Queue Storage too many throttling errors
- Azure Queue Storage too many timeout errors
- Azure Storage Blob service too few successful requests
- Azure Storage Blob service too high end to end latency
- Azure Storage File service too few successful requests
- Azure Storage File service too high end to end latency
- Azure Storage is down
- Azure Storage Queue service too few successful requests
- Azure Storage Queue service too high end to end latency
- Azure Storage Table service too few successful requests
- Azure Storage Table service too high end to end latency
- Azure Table Storage too many authorization errors
- Azure Table Storage too many client_other errors
- Azure Table Storage too many network errors
- Azure Table Storage too many server_other errors
- Azure Table Storage too many throttling errors
- Azure Table Storage too many timeout errors

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                                            | Description                                                                                                                                  | Type           | Default     | Required |
| ----------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------- | -------------- | ----------- | :------: |
| authorization_error_requests_enabled            | Flag to enable Storage authorization errors monitor                                                                                          | `string`       | `"true"`    |    no    |
| authorization_error_requests_extra_tags         | Extra tags for Storage authorization errors monitor                                                                                          | `list(string)` | `[]`        |    no    |
| authorization_error_requests_message            | Custom message for Storage authorization errors monitor                                                                                      | `string`       | `""`        |    no    |
| authorization_error_requests_silenced           | Groups to mute for Storage authorization errors monitor                                                                                      | `map(string)`  | `{}`        |    no    |
| authorization_error_requests_threshold_critical | Maximum acceptable percent of authorization error requests for a storage                                                                     | `number`       | `90`        |    no    |
| authorization_error_requests_threshold_warning  | Warning regarding acceptable percent of authorization error requests for a storage                                                           | `number`       | `50`        |    no    |
| authorization_error_requests_time_aggregator    | Monitor aggregator for Storage authorization errors [available values: min, max or avg]                                                      | `string`       | `"min"`     |    no    |
| authorization_error_requests_timeframe          | Monitor timeframe for Storage authorization errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string`       | `"last_5m"` |    no    |
| availability_enabled                            | Flag to enable Storage availability monitor                                                                                                  | `string`       | `"true"`    |    no    |
| availability_extra_tags                         | Extra tags for Storage availability monitor                                                                                                  | `list(string)` | `[]`        |    no    |
| availability_message                            | Custom message for Storage availability monitor                                                                                              | `string`       | `""`        |    no    |
| availability_silenced                           | Groups to mute for Storage availability monitor                                                                                              | `map(string)`  | `{}`        |    no    |
| availability_threshold_critical                 | Minimum acceptable percent of availability for a storage                                                                                     | `number`       | `50`        |    no    |
| availability_threshold_warning                  | Warning regarding acceptable percent of availability for a storage                                                                           | `number`       | `90`        |    no    |
| availability_time_aggregator                    | Monitor aggregator for Storage availability [available values: min, max or avg]                                                              | `string`       | `"max"`     |    no    |
| availability_timeframe                          | Monitor timeframe for Storage availability [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]         | `string`       | `"last_5m"` |    no    |
| client_other_error_requests_enabled             | Flag to enable Storage other errors monitor                                                                                                  | `string`       | `"true"`    |    no    |
| client_other_error_requests_extra_tags          | Extra tags for Storage other errors monitor                                                                                                  | `list(string)` | `[]`        |    no    |
| client_other_error_requests_message             | Custom message for Storage other errors monitor                                                                                              | `string`       | `""`        |    no    |
| client_other_error_requests_silenced            | Groups to mute for Storage other errors monitor                                                                                              | `map(string)`  | `{}`        |    no    |
| client_other_error_requests_threshold_critical  | Maximum acceptable percent of client other error requests for a storage                                                                      | `number`       | `90`        |    no    |
| client_other_error_requests_threshold_warning   | Warning regarding acceptable percent of client other error requests for a storage                                                            | `number`       | `50`        |    no    |
| client_other_error_requests_time_aggregator     | Monitor aggregator for Storage other errors [available values: min, max or avg]                                                              | `string`       | `"min"`     |    no    |
| client_other_error_requests_timeframe           | Monitor timeframe for Storage other errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]         | `string`       | `"last_5m"` |    no    |
| environment                                     | Architecture environment                                                                                                                     | `string`       | n/a         |   yes    |
| evaluation_delay                                | Delay in seconds for the metric evaluation                                                                                                   | `number`       | `900`       |    no    |
| filter_tags_custom                              | Tags used for custom filtering when filter_tags_use_defaults is false                                                                        | `string`       | `"*"`       |    no    |
| filter_tags_custom_excluded                     | Tags excluded for custom filtering when filter_tags_use_defaults is false                                                                    | `string`       | `""`        |    no    |
| filter_tags_use_defaults                        | Use default filter tags convention                                                                                                           | `string`       | `"true"`    |    no    |
| latency_enabled                                 | Flag to enable Storage latency monitor                                                                                                       | `string`       | `"true"`    |    no    |
| latency_extra_tags                              | Extra tags for Storage latency monitor                                                                                                       | `list(string)` | `[]`        |    no    |
| latency_message                                 | Custom message for Storage latency monitor                                                                                                   | `string`       | `""`        |    no    |
| latency_silenced                                | Groups to mute for Storage latency monitor                                                                                                   | `map(string)`  | `{}`        |    no    |
| latency_threshold_critical                      | Maximum acceptable end to end latency (ms) for a storage                                                                                     | `number`       | `2000`      |    no    |
| latency_threshold_warning                       | Warning regarding acceptable end to end latency (ms) for a storage                                                                           | `number`       | `1000`      |    no    |
| latency_time_aggregator                         | Monitor aggregator for Storage latency [available values: min, max or avg]                                                                   | `string`       | `"min"`     |    no    |
| latency_timeframe                               | Monitor timeframe for Storage latency [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]              | `string`       | `"last_5m"` |    no    |
| message                                         | Message sent when a Redis monitor is triggered                                                                                               | `any`          | n/a         |   yes    |
| network_error_requests_enabled                  | Flag to enable Storage network errors monitor                                                                                                | `string`       | `"true"`    |    no    |
| network_error_requests_extra_tags               | Extra tags for Storage network errors monitor                                                                                                | `list(string)` | `[]`        |    no    |
| network_error_requests_message                  | Custom message for Storage network errors monitor                                                                                            | `string`       | `""`        |    no    |
| network_error_requests_silenced                 | Groups to mute for Storage network errors monitor                                                                                            | `map(string)`  | `{}`        |    no    |
| network_error_requests_threshold_critical       | Maximum acceptable percent of network error requests for a storage                                                                           | `number`       | `90`        |    no    |
| network_error_requests_threshold_warning        | Warning regarding acceptable percent of network error requests for a storage                                                                 | `number`       | `50`        |    no    |
| network_error_requests_time_aggregator          | Monitor aggregator for Storage network errors [available values: min, max or avg]                                                            | `string`       | `"min"`     |    no    |
| network_error_requests_timeframe                | Monitor timeframe for Storage network errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]       | `string`       | `"last_5m"` |    no    |
| new_host_delay                                  | Delay in seconds before monitor new resource                                                                                                 | `number`       | `300`       |    no    |
| notify_no_data                                  | Will raise no data alert if set to true                                                                                                      | `bool`         | `true`      |    no    |
| prefix_slug                                     | Prefix string to prepend between brackets on every monitors names                                                                            | `string`       | `""`        |    no    |
| server_other_error_requests_enabled             | Flag to enable Storage server other errors monitor                                                                                           | `string`       | `"true"`    |    no    |
| server_other_error_requests_extra_tags          | Extra tags for Storage server other errors monitor                                                                                           | `list(string)` | `[]`        |    no    |
| server_other_error_requests_message             | Custom message for Storage server other errors monitor                                                                                       | `string`       | `""`        |    no    |
| server_other_error_requests_silenced            | Groups to mute for Storage server other errors monitor                                                                                       | `map(string)`  | `{}`        |    no    |
| server_other_error_requests_threshold_critical  | Maximum acceptable percent of server other error requests for a storage                                                                      | `number`       | `90`        |    no    |
| server_other_error_requests_threshold_warning   | Warning regarding acceptable percent of server other error requests for a storage                                                            | `number`       | `50`        |    no    |
| server_other_error_requests_time_aggregator     | Monitor aggregator for Storage other errors [available values: min, max or avg]                                                              | `string`       | `"min"`     |    no    |
| server_other_error_requests_timeframe           | Monitor timeframe for Storage server other errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]  | `string`       | `"last_5m"` |    no    |
| status_enabled                                  | Flag to enable App Services status monitor                                                                                                   | `string`       | `"true"`    |    no    |
| status_extra_tags                               | Extra tags for App Services status monitor                                                                                                   | `list(string)` | `[]`        |    no    |
| status_message                                  | Custom message for storage Services status monitor                                                                                           | `string`       | `""`        |    no    |
| status_silenced                                 | Groups to mute for App Services status monitor                                                                                               | `map(string)`  | `{}`        |    no    |
| status_time_aggregator                          | Monitor aggregator for Storage Services status [available values: min, max or avg]                                                           | `string`       | `"max"`     |    no    |
| status_timeframe                                | Monitor timeframe for Storage Services status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]      | `string`       | `"last_5m"` |    no    |
| storage_status_no_data_timeframe                | Number of minutes before reporting no data                                                                                                   | `string`       | `10`        |    no    |
| successful_requests_enabled                     | Flag to enable Storage sucessful requests monitor                                                                                            | `string`       | `"true"`    |    no    |
| successful_requests_extra_tags                  | Extra tags for Storage sucessful requests monitor                                                                                            | `list(string)` | `[]`        |    no    |
| successful_requests_message                     | Custom message for Storage sucessful requests monitor                                                                                        | `string`       | `""`        |    no    |
| successful_requests_silenced                    | Groups to mute for Storage sucessful requests monitor                                                                                        | `map(string)`  | `{}`        |    no    |
| successful_requests_time_aggregator             | Monitor aggregator for Storage sucessful requests [available values: min, max or avg]                                                        | `string`       | `"max"`     |    no    |
| successful_requests_timeframe                   | Monitor timeframe for Storage sucessful requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]   | `string`       | `"last_5m"` |    no    |
| successful_storage_requests_threshold_critical  | Minimum acceptable percent of successful requests for a storage                                                                              | `number`       | `90`        |    no    |
| successful_storage_requests_threshold_warning   | Warning regarding acceptable percent of successful requests for a storage                                                                    | `number`       | `70`        |    no    |
| throttling_error_requests_enabled               | Flag to enable Storage throttling error monitor                                                                                              | `string`       | `"true"`    |    no    |
| throttling_error_requests_extra_tags            | Extra tags for Storage throttling error monitor                                                                                              | `list(string)` | `[]`        |    no    |
| throttling_error_requests_message               | Custom message for Storage throttling error monitor                                                                                          | `string`       | `""`        |    no    |
| throttling_error_requests_silenced              | Groups to mute for Storage throttling error monitor                                                                                          | `map(string)`  | `{}`        |    no    |
| throttling_error_requests_threshold_critical    | Maximum acceptable percent of throttling error requests for a storage                                                                        | `number`       | `90`        |    no    |
| throttling_error_requests_threshold_warning     | Warning regarding acceptable percent of throttling error requests for a storage                                                              | `number`       | `50`        |    no    |
| throttling_error_requests_time_aggregator       | Monitor aggregator for Storage throttling errors [available values: min, max or avg]                                                         | `string`       | `"min"`     |    no    |
| throttling_error_requests_timeframe             | Monitor timeframe for Storage throttling errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]    | `string`       | `"last_5m"` |    no    |
| timeout_error_requests_enabled                  | Flag to enable Storage timeout monitor                                                                                                       | `string`       | `"true"`    |    no    |
| timeout_error_requests_extra_tags               | Extra tags for Storage timeout monitor                                                                                                       | `list(string)` | `[]`        |    no    |
| timeout_error_requests_message                  | Custom message for Storage timeout monitor                                                                                                   | `string`       | `""`        |    no    |
| timeout_error_requests_silenced                 | Groups to mute for Storage timeout monitor                                                                                                   | `map(string)`  | `{}`        |    no    |
| timeout_error_requests_threshold_critical       | Maximum acceptable percent of timeout error requests for a storage                                                                           | `number`       | `90`        |    no    |
| timeout_error_requests_threshold_warning        | Warning regarding acceptable percent of timeout error requests for a storage                                                                 | `number`       | `50`        |    no    |
| timeout_error_requests_time_aggregator          | Monitor aggregator for Storage timeout [available values: min, max or avg]                                                                   | `string`       | `"min"`     |    no    |
| timeout_error_requests_timeframe                | Monitor timeframe for Storage timeout [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]              | `string`       | `"last_5m"` |    no    |

## Outputs

| Name                                  | Description                                       |
| ------------------------------------- | ------------------------------------------------- |
| blob_authorization_error_requests_id  | id for monitor blob_authorization_error_requests  |
| blob_client_other_error_requests_id   | id for monitor blob_client_other_error_requests   |
| blob_network_error_requests_id        | id for monitor blob_network_error_requests        |
| blob_server_other_error_requests_id   | id for monitor blob_server_other_error_requests   |
| blob_throttling_error_requests_id     | id for monitor blob_throttling_error_requests     |
| blob_timeout_error_requests_id        | id for monitor blob_timeout_error_requests        |
| blobservices_latency_id               | id for monitor blobservices_latency               |
| blobservices_requests_error_id        | id for monitor blobservices_requests_error        |
| file_authorization_error_requests_id  | id for monitor file_authorization_error_requests  |
| file_client_other_error_requests_id   | id for monitor file_client_other_error_requests   |
| file_network_error_requests_id        | id for monitor file_network_error_requests        |
| file_server_other_error_requests_id   | id for monitor file_server_other_error_requests   |
| file_throttling_error_requests_id     | id for monitor file_throttling_error_requests     |
| file_timeout_error_requests_id        | id for monitor file_timeout_error_requests        |
| fileservices_latency_id               | id for monitor fileservices_latency               |
| fileservices_requests_error_id        | id for monitor fileservices_requests_error        |
| queue_authorization_error_requests_id | id for monitor queue_authorization_error_requests |
| queue_client_other_error_requests_id  | id for monitor queue_client_other_error_requests  |
| queue_network_error_requests_id       | id for monitor queue_network_error_requests       |
| queue_server_other_error_requests_id  | id for monitor queue_server_other_error_requests  |
| queue_throttling_error_requests_id    | id for monitor queue_throttling_error_requests    |
| queue_timeout_error_requests_id       | id for monitor queue_timeout_error_requests       |
| queueservices_latency_id              | id for monitor queueservices_latency              |
| queueservices_requests_error_id       | id for monitor queueservices_requests_error       |
| storage_status_id                     | id for monitor storage_status                     |
| table_authorization_error_requests_id | id for monitor table_authorization_error_requests |
| table_client_other_error_requests_id  | id for monitor table_client_other_error_requests  |
| table_network_error_requests_id       | id for monitor table_network_error_requests       |
| table_server_other_error_requests_id  | id for monitor table_server_other_error_requests  |
| table_throttling_error_requests_id    | id for monitor table_throttling_error_requests    |
| table_timeout_error_requests_id       | id for monitor table_timeout_error_requests       |
| tableservices_latency_id              | id for monitor tableservices_latency              |
| tableservices_requests_error_id       | id for monitor tableservices_requests_error       |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/azure_storage/](https://docs.datadoghq.com/integrations/azure_storage/)

DataDog blog: [https://www.datadoghq.com/blog/monitor-azure-storage-datadog/](https://www.datadoghq.com/blog/monitor-azure-storage-datadog/)

Azure Storage metrics documentation: [https://docs.microsoft.com/en-us/azure/storage/common/storage-monitor-storage-account](https://docs.microsoft.com/en-us/azure/storage/common/storage-monitor-storage-account)

Azure Storage metrics detailed documentation [https://docs.microsoft.com/en-us/rest/api/storageservices/storage-analytics-metrics-table-schema](https://docs.microsoft.com/en-us/rest/api/storageservices/storage-analytics-metrics-table-schema)
