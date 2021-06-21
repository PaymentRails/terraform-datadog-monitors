# CLOUD AWS ELASTICSEARCH DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-aws-elasticsearch" {
  source      = "claranet/monitors/datadog//cloud/aws/elasticsearch"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message

  es_cluster_volume_size = 42
}

```

## Purpose

Creates DataDog monitors with the following checks:

- ElasticSearch cluster CPU high
- ElasticSearch cluster free storage space
- ElasticSearch cluster status is not green

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                                | Description                                                                                                                          | Type           | Default      | Required |
| ----------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------ | -------------- | ------------ | :------: |
| cpu_enabled                         | Flag to enable ES cluster cpu monitor                                                                                                | `string`       | `"true"`     |    no    |
| cpu_extra_tags                      | Extra tags for ES cluster cpu monitor                                                                                                | `list(string)` | `[]`         |    no    |
| cpu_message                         | Custom message for ES cluster cpu monitor                                                                                            | `string`       | `""`         |    no    |
| cpu_threshold_critical              | CPU usage in percent (critical threshold)                                                                                            | `string`       | `"90"`       |    no    |
| cpu_threshold_warning               | CPU usage in percent (warning threshold)                                                                                             | `string`       | `"80"`       |    no    |
| cpu_time_aggregator                 | Monitor aggregator for ES cluster cpu [available values: min, max or avg]                                                            | `string`       | `"min"`      |    no    |
| cpu_timeframe                       | Monitor timeframe for ES cluster cpu [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]       | `string`       | `"last_15m"` |    no    |
| diskspace_enabled                   | Flag to enable ES cluster diskspace monitor                                                                                          | `string`       | `"true"`     |    no    |
| diskspace_extra_tags                | Extra tags for ES cluster diskspace monitor                                                                                          | `list(string)` | `[]`         |    no    |
| diskspace_message                   | Custom message for ES cluster diskspace monitor                                                                                      | `string`       | `""`         |    no    |
| diskspace_threshold_critical        | Disk free space in percent (critical threshold)                                                                                      | `string`       | `"10"`       |    no    |
| diskspace_threshold_warning         | Disk free space in percent (warning threshold)                                                                                       | `string`       | `"20"`       |    no    |
| diskspace_time_aggregator           | Monitor aggregator for ES cluster diskspace [available values: min, max or avg]                                                      | `string`       | `"max"`      |    no    |
| diskspace_timeframe                 | Monitor timeframe for ES cluster diskspace [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string`       | `"last_15m"` |    no    |
| environment                         | Architecture Environment                                                                                                             | `string`       | n/a          |   yes    |
| es_cluster_status_enabled           | Flag to enable ES cluster status monitor                                                                                             | `string`       | `"true"`     |    no    |
| es_cluster_status_extra_tags        | Extra tags for ES cluster status monitor                                                                                             | `list(string)` | `[]`         |    no    |
| es_cluster_status_message           | Custom message for ES cluster status monitor                                                                                         | `string`       | `""`         |    no    |
| es_cluster_status_no_data_timeframe | Number of minutes before reporting no data                                                                                           | `string`       | `60`         |    no    |
| es_cluster_status_timeframe         | Monitor timeframe for ES cluster status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]    | `string`       | `"last_30m"` |    no    |
| es_cluster_volume_size              | ElasticSearch Domain volume size (in GB)                                                                                             | `any`          | n/a          |   yes    |
| evaluation_delay                    | Delay in seconds for the metric evaluation                                                                                           | `number`       | `900`        |    no    |
| filter_tags_custom                  | Tags used for custom filtering when filter_tags_use_defaults is false                                                                | `string`       | `"*"`        |    no    |
| filter_tags_custom_excluded         | Tags excluded for custom filtering when filter_tags_use_defaults is false                                                            | `string`       | `""`         |    no    |
| filter_tags_use_defaults            | Use default filter tags convention                                                                                                   | `string`       | `"true"`     |    no    |
| message                             | Message sent when an alert is triggered                                                                                              | `any`          | n/a          |   yes    |
| new_host_delay                      | Delay in seconds before monitor new resource                                                                                         | `number`       | `300`        |    no    |
| notify_no_data                      | Will raise no data alert if set to true                                                                                              | `bool`         | `true`       |    no    |
| prefix_slug                         | Prefix string to prepend between brackets on every monitors names                                                                    | `string`       | `""`         |    no    |

## Outputs

| Name                 | Description                      |
| -------------------- | -------------------------------- |
| es_cluster_status_id | id for monitor es_cluster_status |
| es_cpu_90_15min_id   | id for monitor es_cpu_90_15min   |
| es_free_space_low_id | id for monitor es_free_space_low |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/amazon_es/](https://docs.datadoghq.com/integrations/amazon_es/)

AWS ElasticSearch Service Instance metrics documentation: [https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/es-metricscollected.html](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/es-metricscollected.html)
