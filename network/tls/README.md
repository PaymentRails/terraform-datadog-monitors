# NETWORK TLS DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-network-tls" {
  source      = "claranet/monitors/datadog//network/tls"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- TLS cannot connect
- TLS certificate expiration (disabled by default)
- TLS certificate expiring
- TLS invalid certificate

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                                           | Description                                                               | Type           | Default     | Required |
| ---------------------------------------------- | ------------------------------------------------------------------------- | -------------- | ----------- | :------: |
| cannot_connect_enabled                         | Flag to enable TLS cannot connect monitor                                 | `string`       | `"true"`    |    no    |
| cannot_connect_extra_tags                      | Extra tags for TLS cannot connect monitor                                 | `list(string)` | `[]`        |    no    |
| cannot_connect_message                         | Custom message for TLS cannot connect monitor                             | `string`       | `""`        |    no    |
| cannot_connect_no_data_timeframe               | TLS cannot connect monitor no data timeframe                              | `string`       | `10`        |    no    |
| cannot_connect_threshold_warning               | TLS cannot connect monitor (warning threshold)                            | `string`       | `3`         |    no    |
| certificate_expiration_date_enabled            | Flag to enable Certificate Expiration Date monitor                        | `string`       | `"false"`   |    no    |
| certificate_expiration_date_extra_tags         | Extra tags for Certificate Expiration Date monitor                        | `list(string)` | `[]`        |    no    |
| certificate_expiration_date_message            | Custom message for the Certificate Expiration Date monitor                | `string`       | `""`        |    no    |
| certificate_expiration_date_threshold_critical | Container Memory Usage critical threshold                                 | `string`       | `15`        |    no    |
| certificate_expiration_date_threshold_warning  | Container Memory Usage warning threshold                                  | `string`       | `30`        |    no    |
| certificate_expiration_date_time_aggregator    | Time aggregator for the Certificate Expiration Date monitor               | `string`       | `"max"`     |    no    |
| certificate_expiration_date_timeframe          | Timeframe for the Certificate Expiration Date monitor                     | `string`       | `"last_5m"` |    no    |
| environment                                    | Architecture Environment                                                  | `string`       | n/a         |   yes    |
| evaluation_delay                               | Delay in seconds for the metric evaluation                                | `number`       | `15`        |    no    |
| filter_tags_custom                             | Tags used for custom filtering when filter_tags_use_defaults is false     | `string`       | `"*"`       |    no    |
| filter_tags_custom_excluded                    | Tags excluded for custom filtering when filter_tags_use_defaults is false | `string`       | `""`        |    no    |
| filter_tags_use_defaults                       | Use default filter tags convention                                        | `string`       | `"true"`    |    no    |
| invalid_tls_certificate_enabled                | Flag to enable TLS certificate expiration monitor                         | `string`       | `"true"`    |    no    |
| invalid_tls_certificate_extra_tags             | Extra tags for TLS certificate expiration monitor                         | `list(string)` | `[]`        |    no    |
| invalid_tls_certificate_message                | Custom message for TLS certificate expiration monitor                     | `string`       | `""`        |    no    |
| invalid_tls_certificate_threshold_warning      | TLS certificate expiration monitor (warning threshold)                    | `string`       | `3`         |    no    |
| message                                        | Message sent when an alert is triggered                                   | `any`          | n/a         |   yes    |
| new_host_delay                                 | Delay in seconds before monitor new resource                              | `number`       | `300`       |    no    |
| notify_no_data                                 | Will raise no data alert if set to true                                   | `bool`         | `true`      |    no    |
| prefix_slug                                    | Prefix string to prepend between brackets on every monitors names         | `string`       | `""`        |    no    |
| tls_certificate_expiration_enabled             | Flag to enable TLS certificate expiration monitor                         | `string`       | `"true"`    |    no    |
| tls_certificate_expiration_extra_tags          | Extra tags for TLS certificate expiration monitor                         | `list(string)` | `[]`        |    no    |
| tls_certificate_expiration_message             | Custom message for TLS certificate expiration monitor                     | `string`       | `""`        |    no    |
| tls_certificate_expiration_threshold_warning   | TLS certificate expiration monitor (warning threshold)                    | `string`       | `5`         |    no    |

## Outputs

| Name                           | Description                                |
| ------------------------------ | ------------------------------------------ |
| cannot_connect_id              | id for monitor cannot_connect              |
| certificate_expiration_date_id | id for monitor certificate_expiration_date |
| invalid_tls_certificate_id     | id for monitor invalid_tls_certificate     |
| tls_certificate_expiration_id  | id for monitor tls_certificate_expiration  |

## Related documentation

- [Datadog TLS integration](https://docs.datadoghq.com/integrations/tls/)
