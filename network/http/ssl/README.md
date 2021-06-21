# NETWORK HTTP SSL DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-network-http-ssl" {
  source      = "claranet/monitors/datadog//network/http/ssl"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- SSL certificate expiration (disabled by default)
- SSL invalid certificate

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                                           | Description                                                               | Type           | Default     | Required |
| ---------------------------------------------- | ------------------------------------------------------------------------- | -------------- | ----------- | :------: |
| certificate_expiration_date_enabled            | Flag to enable Certificate Expiration Date monitor                        | `string`       | `"false"`   |    no    |
| certificate_expiration_date_extra_tags         | Extra tags for Certificate Expiration Date monitor                        | `list(string)` | `[]`        |    no    |
| certificate_expiration_date_message            | Custom message for the Certificate Expiration Date monitor                | `string`       | `""`        |    no    |
| certificate_expiration_date_threshold_critical | Certificate Expiration Date critical threshold                            | `string`       | `15`        |    no    |
| certificate_expiration_date_threshold_warning  | Certificate Expiration Date warning threshold                             | `string`       | `30`        |    no    |
| certificate_expiration_date_time_aggregator    | Time aggregator for the Certificate Expiration Date monitor               | `string`       | `"max"`     |    no    |
| certificate_expiration_date_timeframe          | Timeframe for the Certificate Expiration Date monitor                     | `string`       | `"last_5m"` |    no    |
| environment                                    | Architecture Environment                                                  | `string`       | n/a         |   yes    |
| evaluation_delay                               | Delay in seconds for the metric evaluation                                | `number`       | `15`        |    no    |
| filter_tags_custom                             | Tags used for custom filtering when filter_tags_use_defaults is false     | `string`       | `"*"`       |    no    |
| filter_tags_custom_excluded                    | Tags excluded for custom filtering when filter_tags_use_defaults is false | `string`       | `""`        |    no    |
| filter_tags_use_defaults                       | Use default filter tags convention                                        | `string`       | `"true"`    |    no    |
| invalid_ssl_certificate_enabled                | Flag to enable SSL invalid certificate monitor                            | `string`       | `"true"`    |    no    |
| invalid_ssl_certificate_extra_tags             | Extra tags for SSL invalid certificate monitor                            | `list(string)` | `[]`        |    no    |
| invalid_ssl_certificate_message                | Custom message for SSL invalid certificate monitor                        | `string`       | `""`        |    no    |
| invalid_ssl_certificate_no_data_timeframe      | SSL invalid certificate monitor no data timeframe                         | `string`       | `10`        |    no    |
| invalid_ssl_certificate_threshold_warning      | SSL invalid certificate monitor (warning threshold)                       | `string`       | `3`         |    no    |
| message                                        | Message sent when an alert is triggered                                   | `any`          | n/a         |   yes    |
| new_host_delay                                 | Delay in seconds before monitor new resource                              | `number`       | `300`       |    no    |
| notify_no_data                                 | Will raise no data alert if set to true                                   | `bool`         | `true`      |    no    |
| prefix_slug                                    | Prefix string to prepend between brackets on every monitors names         | `string`       | `""`        |    no    |

## Outputs

| Name                           | Description                                |
| ------------------------------ | ------------------------------------------ |
| certificate_expiration_date_id | id for monitor certificate_expiration_date |
| invalid_ssl_certificate_id     | id for monitor invalid_ssl_certificate     |

## Related documentation
