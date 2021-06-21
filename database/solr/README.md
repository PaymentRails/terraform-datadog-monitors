# DATABASE SOLR DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-database-solr" {
  source      = "claranet/monitors/datadog//database/solr"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Solr does not respond
- Solr searcher warmup time too high
- Too many errors on Solr search handler

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                                          | Description                                                               | Type           | Default                          | Required |
| --------------------------------------------- | ------------------------------------------------------------------------- | -------------- | -------------------------------- | :------: |
| environment                                   | Architecture environment                                                  | `string`       | n/a                              |   yes    |
| evaluation_delay                              | Delay in seconds for the metric evaluation                                | `number`       | `15`                             |    no    |
| filter_tags_custom                            | Tags used for custom filtering when filter_tags_use_defaults is false     | `string`       | `"*"`                            |    no    |
| filter_tags_custom_excluded                   | Tags excluded for custom filtering when filter_tags_use_defaults is false | `string`       | `""`                             |    no    |
| filter_tags_use_defaults                      | Use default filter tags convention                                        | `string`       | `"true"`                         |    no    |
| message                                       | Message sent when a monitor is triggered                                  | `any`          | n/a                              |   yes    |
| new_host_delay                                | Delay in seconds before begin to monitor new host                         | `number`       | `300`                            |    no    |
| not_responding_enabled                        | Flag to enable Solr does not repsond monitor                              | `bool`         | `true`                           |    no    |
| not_responding_extra_tags                     | Extra tags for solr does not respond monitor                              | `list(string)` | `[]`                             |    no    |
| not_responding_group_by                       | Not responding tags to group data                                         | `list(string)` | <pre>[<br> "instance"<br>]</pre> |    no    |
| not_responding_message                        | Custom message for Solr does not respond monitor                          | `string`       | `""`                             |    no    |
| not_responding_no_data_timeframe              | Solr not responding monitor no data timeframe                             | `number`       | `10`                             |    no    |
| not_responding_threshold_warning              | Solr not responding limit (warning threshold)                             | `number`       | `3`                              |    no    |
| notify_no_data                                | Will raise no data alert if set to true                                   | `bool`         | `true`                           |    no    |
| prefix_slug                                   | Prefix string to prepend between brackets on every monitors names         | `string`       | `""`                             |    no    |
| search_handler_errors_enabled                 | Flag to enable Solr search handler errors monitor                         | `bool`         | `true`                           |    no    |
| search_handler_errors_extra_tags              | Extra tags for Search handler errors monitor                              | `list(string)` | `[]`                             |    no    |
| search_handler_errors_group_by                | Search handler errors tags to group datas                                 | `list(string)` | <pre>[<br> "instance"<br>]</pre> |    no    |
| search_handler_errors_message                 | Custom message for Solr search handler errors monitor                     | `string`       | `""`                             |    no    |
| search_handler_errors_rate_threshold_critical | Handler errors rate critical threshold                                    | `number`       | `50`                             |    no    |
| search_handler_errors_rate_threshold_warning  | Handler errors rate warning threshold                                     | `number`       | `10`                             |    no    |
| search_handler_errors_time_aggregator         | Time aggregator for the Handler errors monitor                            | `string`       | `"min"`                          |    no    |
| search_handler_errors_timeframe               | Timeframe for the search handler errors monitor                           | `string`       | `"last_5m"`                      |    no    |
| searcher_warmup_time_aggregator               | Time aggregator for the searcher warmup time monitor                      | `string`       | `"max"`                          |    no    |
| searcher_warmup_time_enabled                  | Flag to enable Solr searcher warmup time monitor                          | `bool`         | `true`                           |    no    |
| searcher_warmup_time_extra_tags               | Extra tags for searcher warmum time monitor                               | `list(string)` | `[]`                             |    no    |
| searcher_warmup_time_group_by                 | Search warmup time tags to group datas                                    | `list(string)` | <pre>[<br> "instance"<br>]</pre> |    no    |
| searcher_warmup_time_message                  | Custom message for Solr searcher warmup time monitor                      | `string`       | `""`                             |    no    |
| searcher_warmup_time_threshold_critical       | Searcher warmup time critical threshold in ms                             | `number`       | `5000`                           |    no    |
| searcher_warmup_time_threshold_warning        | Searcher warmup time warning threshold in ms                              | `number`       | `2000`                           |    no    |
| searcher_warmup_time_timeframe                | Timeframe for the searcher warmup time monitor                            | `string`       | `"last_5m"`                      |    no    |

## Outputs

| Name                     | Description                          |
| ------------------------ | ------------------------------------ |
| not_responding_id        | id for monitor not_responding        |
| search_handler_errors_id | id for monitor search_handler_errors |
| searcher_warmup_time_id  | id for monitor searcher_warmup_time  |

## Related documentation

- [Integration Datadog & Solr](https://docs.datadoghq.com/integrations/solr/)
