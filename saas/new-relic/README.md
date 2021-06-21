# SAAS NEW-RELIC DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-saas-new-relic" {
  source      = "claranet/monitors/datadog//saas/new-relic"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- New Relic Apdex score ratio
- New Relic Error rate

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                               | Description                                                               | Type           | Default      | Required |
| ---------------------------------- | ------------------------------------------------------------------------- | -------------- | ------------ | :------: |
| app_apdex_score_enabled            | Flag to enable APP Apdex Score monitor                                    | `string`       | `"true"`     |    no    |
| app_apdex_score_extra_tags         | Extra tags for New Relic APP Apdex Score monitor                          | `list(string)` | `[]`         |    no    |
| app_apdex_score_message            | Custom message for the APP Apdex Score monitor                            | `string`       | `""`         |    no    |
| app_apdex_score_threshold_critical | APP Apdex Score critical threshold                                        | `string`       | `0.25`       |    no    |
| app_apdex_score_threshold_warning  | APP Apdex Score warning threshold                                         | `string`       | `0.5`        |    no    |
| app_apdex_score_time_aggregator    | Time aggregator for the APP Apdex Score monitor                           | `string`       | `"avg"`      |    no    |
| app_apdex_score_timeframe          | Timeframe for the APP Apdex Score monitor                                 | `string`       | `"last_15m"` |    no    |
| app_error_rate_enabled             | Flag to enable APP Error Rate monitor                                     | `string`       | `"true"`     |    no    |
| app_error_rate_extra_tags          | Extra tags for New Relic APP Error Rate monitor                           | `list(string)` | `[]`         |    no    |
| app_error_rate_message             | Custom message for the APP Error Rate monitor                             | `string`       | `""`         |    no    |
| app_error_rate_threshold_critical  | APP Error Rate critical threshold                                         | `string`       | `5`          |    no    |
| app_error_rate_threshold_warning   | APP Error Rate warning threshold                                          | `string`       | `1`          |    no    |
| app_error_rate_time_aggregator     | Time aggregator for the APP Error Rate monitor                            | `string`       | `"min"`      |    no    |
| app_error_rate_timeframe           | Timeframe for the APP Error Rate monitor                                  | `string`       | `"last_5m"`  |    no    |
| environment                        | Architecture Environment                                                  | `string`       | n/a          |   yes    |
| evaluation_delay                   | Delay in seconds for the metric evaluation                                | `number`       | `900`        |    no    |
| filter_tags_custom                 | Tags used for custom filtering when filter_tags_use_defaults is false     | `string`       | `"*"`        |    no    |
| filter_tags_custom_excluded        | Tags excluded for custom filtering when filter_tags_use_defaults is false | `string`       | `""`         |    no    |
| filter_tags_use_defaults           | Use default filter tags convention                                        | `string`       | `"true"`     |    no    |
| message                            | Message sent when an alert is triggered                                   | `any`          | n/a          |   yes    |
| new_host_delay                     | Delay in seconds before monitor new resource                              | `number`       | `300`        |    no    |
| notify_no_data                     | Will raise no data alert if set to true                                   | `bool`         | `true`       |    no    |
| prefix_slug                        | Prefix string to prepend between brackets on every monitors names         | `string`       | `""`         |    no    |

## Outputs

| Name               | Description                    |
| ------------------ | ------------------------------ |
| app_apdex_score_id | id for monitor app_apdex_score |
| app_error_rate_id  | id for monitor app_error_rate  |

## Related documentation

- [Datadog New Relic integration](https://docs.datadoghq.com/integrations/new_relic/)
