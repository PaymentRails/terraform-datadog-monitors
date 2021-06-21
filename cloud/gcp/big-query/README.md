# CLOUD GCP BIG-QUERY DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-gcp-big-query" {
  source      = "claranet/monitors/datadog//cloud/gcp/big-query"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- GCP Big Query Available Slots
- GCP Big Query Concurrent Queries
- GCP Big Query Execution Time
- GCP Big Query Scanned Bytes
- GCP Big Query Scanned Bytes Billed
- GCP Big Query Stored Bytes
- GCP Big Query Table Count
- GCP Big Query Uploaded Bytes
- GCP Big Query Uploaded Bytes Billed

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                                     | Description                                                       | Type           | Default     | Required |
| ---------------------------------------- | ----------------------------------------------------------------- | -------------- | ----------- | :------: |
| available_slots_enabled                  | Flag to enable GCP Big Query Available Slots monitor              | `string`       | `"true"`    |    no    |
| available_slots_extra_tags               | Extra tags for GCP Big Query Available Slots monitor              | `list(string)` | `[]`        |    no    |
| available_slots_message                  | Custom message for the Available Slots monitor                    | `string`       | `""`        |    no    |
| available_slots_threshold_critical       | Available Slots (critical threshold)                              | `string`       | `200`       |    no    |
| available_slots_threshold_warning        | Available Slots (warning threshold)                               | `string`       | `300`       |    no    |
| available_slots_timeframe                | Timeframe for the Available Slots monitor                         | `string`       | `"last_5m"` |    no    |
| concurrent_queries_enabled               | Flag to enable GCP Big Query Concurrent Queries monitor           | `string`       | `"true"`    |    no    |
| concurrent_queries_extra_tags            | Extra tags for GCP Big Query Concurrent Queries monitor           | `list(string)` | `[]`        |    no    |
| concurrent_queries_message               | Custom message for the Concurrent Queries monitor                 | `string`       | `""`        |    no    |
| concurrent_queries_threshold_critical    | Concurrent Queries (critical threshold) (hard limit 50)           | `string`       | `45`        |    no    |
| concurrent_queries_threshold_warning     | Concurrent Queries (warning threshold) (hard limit 50)            | `string`       | `40`        |    no    |
| concurrent_queries_timeframe             | Timeframe for the Concurrent Queries monitor                      | `string`       | `"last_5m"` |    no    |
| environment                              | Architecture environment                                          | `string`       | n/a         |   yes    |
| evaluation_delay                         | Delay in seconds for the metric evaluation                        | `number`       | `900`       |    no    |
| execution_time_enabled                   | Flag to enable GCP Big Query Execution Time monitor               | `string`       | `"true"`    |    no    |
| execution_time_extra_tags                | Extra tags for GCP Big Query Execution Time monitor               | `list(string)` | `[]`        |    no    |
| execution_time_message                   | Custom message for the Execution Time monitor                     | `string`       | `""`        |    no    |
| execution_time_threshold_critical        | Average Execution Time in seconds (critical threshold)            | `string`       | `150`       |    no    |
| execution_time_threshold_warning         | Average Execution Time in seconds (warning threshold)             | `string`       | `100`       |    no    |
| execution_time_timeframe                 | Timeframe for the Execution Time monitor                          | `string`       | `"last_5m"` |    no    |
| filter_tags                              | Tags used for filtering                                           | `string`       | `"*"`       |    no    |
| message                                  | Message sent when a monitor is triggered                          | `any`          | n/a         |   yes    |
| new_host_delay                           | Delay in seconds for the new host evaluation                      | `number`       | `300`       |    no    |
| notify_no_data                           | Will raise no data alert if set to true                           | `bool`         | `true`      |    no    |
| prefix_slug                              | Prefix string to prepend between brackets on every monitors names | `string`       | `""`        |    no    |
| scanned_bytes_billed_enabled             | Flag to enable GCP Big Query Scanned Bytes Billed monitor         | `string`       | `"true"`    |    no    |
| scanned_bytes_billed_extra_tags          | Extra tags for GCP Big Query Scanned Bytes Billed monitor         | `list(string)` | `[]`        |    no    |
| scanned_bytes_billed_message             | Custom message for the Scanned Bytes Billed monitor               | `string`       | `""`        |    no    |
| scanned_bytes_billed_threshold_critical  | Scanned Bytes Billed (critical threshold)                         | `string`       | `1`         |    no    |
| scanned_bytes_billed_threshold_warning   | Scanned Bytes Billed (warning threshold)                          | `string`       | `0`         |    no    |
| scanned_bytes_billed_timeframe           | Timeframe for the Scanned Bytes Billed monitor                    | `string`       | `"last_4h"` |    no    |
| scanned_bytes_enabled                    | Flag to enable GCP Big Query Scanned Bytes monitor                | `string`       | `"true"`    |    no    |
| scanned_bytes_extra_tags                 | Extra tags for GCP Big Query Scanned Bytes monitor                | `list(string)` | `[]`        |    no    |
| scanned_bytes_message                    | Custom message for the Scanned Bytes monitor                      | `string`       | `""`        |    no    |
| scanned_bytes_threshold_critical         | Scanned Bytes (critical threshold)                                | `string`       | `1`         |    no    |
| scanned_bytes_threshold_warning          | Scanned Bytes (warning threshold)                                 | `string`       | `0`         |    no    |
| scanned_bytes_timeframe                  | Timeframe for the Scanned Bytes monitor                           | `string`       | `"last_4h"` |    no    |
| stored_bytes_enabled                     | Flag to enable GCP Big Query Stored Bytes monitor                 | `string`       | `"true"`    |    no    |
| stored_bytes_extra_tags                  | Extra tags for GCP Big Query Stored Bytes monitor                 | `list(string)` | `[]`        |    no    |
| stored_bytes_message                     | Custom message for the Stored Bytes monitor                       | `string`       | `""`        |    no    |
| stored_bytes_threshold_critical          | Stored Bytes in fraction (critical threshold)                     | `string`       | `1`         |    no    |
| stored_bytes_threshold_warning           | Stored Bytes in fraction (warning threshold)                      | `string`       | `0`         |    no    |
| stored_bytes_timeframe                   | Timeframe for the Stored Bytes monitor                            | `string`       | `"last_5m"` |    no    |
| table_count_enabled                      | Flag to enable GCP Big Query Table Count monitor                  | `string`       | `"true"`    |    no    |
| table_count_extra_tags                   | Extra tags for GCP Big Query Table Count monitor                  | `list(string)` | `[]`        |    no    |
| table_count_message                      | Custom message for the Table Count monitor                        | `string`       | `""`        |    no    |
| table_count_threshold_critical           | Table Count (critical threshold)                                  | `string`       | `1`         |    no    |
| table_count_threshold_warning            | Table Count (warning threshold)                                   | `string`       | `0`         |    no    |
| table_count_timeframe                    | Timeframe for the Table Count monitor                             | `string`       | `"last_4h"` |    no    |
| uploaded_bytes_billed_enabled            | Flag to enable GCP Big Query Uploaded Bytes Billed monitor        | `string`       | `"true"`    |    no    |
| uploaded_bytes_billed_extra_tags         | Extra tags for GCP Big Query Scanned Bytes monitor                | `list(string)` | `[]`        |    no    |
| uploaded_bytes_billed_message            | Custom message for the Uploaded Bytes Billed monitor              | `string`       | `""`        |    no    |
| uploaded_bytes_billed_threshold_critical | Uploaded Bytes Billed (critical threshold)                        | `string`       | `1`         |    no    |
| uploaded_bytes_billed_threshold_warning  | Uploaded Bytes Billed (warning threshold)                         | `string`       | `0`         |    no    |
| uploaded_bytes_billed_timeframe          | Timeframe for the Uploaded Bytes Billed monitor                   | `string`       | `"last_4h"` |    no    |
| uploaded_bytes_enabled                   | Flag to enable GCP Big Query Uploaded Bytes monitor               | `string`       | `"true"`    |    no    |
| uploaded_bytes_extra_tags                | Extra tags for GCP Big Query Uploaded Bytes monitor               | `list(string)` | `[]`        |    no    |
| uploaded_bytes_message                   | Custom message for the Uploaded Bytes monitor                     | `string`       | `""`        |    no    |
| uploaded_bytes_threshold_critical        | Uploaded Bytes (critical threshold)                               | `string`       | `1`         |    no    |
| uploaded_bytes_threshold_warning         | Uploaded Bytes (warning threshold)                                | `string`       | `0`         |    no    |
| uploaded_bytes_timeframe                 | Timeframe for the Uploaded Bytes monitor                          | `string`       | `"last_4h"` |    no    |

## Outputs

| Name                     | Description                          |
| ------------------------ | ------------------------------------ |
| available_slots_id       | id for monitor available_slots       |
| concurrent_queries_id    | id for monitor concurrent_queries    |
| execution_time_id        | id for monitor execution_time        |
| scanned_bytes_billed_id  | id for monitor scanned_bytes_billed  |
| scanned_bytes_id         | id for monitor scanned_bytes         |
| stored_bytes_id          | id for monitor stored_bytes          |
| table_count_id           | id for monitor table_count           |
| uploaded_bytes_billed_id | id for monitor uploaded_bytes_billed |
| uploaded_bytes_id        | id for monitor uploaded_bytes        |

## Related documentation

- [GCP Big Query monitoring](https://cloud.google.com/bigquery/docs/monitoring)
- [Datadog Integration for GCP Big Query](https://docs.datadoghq.com/integrations/google_cloud_big_query/)
- [GCP Big Query Quotas and Limits](https://cloud.google.com/bigquery/quotas)
