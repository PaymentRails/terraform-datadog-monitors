# CAAS KUBERNETES CLUSTER DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-caas-kubernetes-cluster" {
  source      = "claranet/monitors/datadog//caas/kubernetes/cluster"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Kubernetes API server does not respond

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |

## Inputs

| Name                        | Description                                                               | Type           | Default  | Required |
| --------------------------- | ------------------------------------------------------------------------- | -------------- | -------- | :------: |
| apiserver_enabled           | Flag to enable API server monitor                                         | `string`       | `"true"` |    no    |
| apiserver_extra_tags        | Extra tags for API server monitor                                         | `list(string)` | `[]`     |    no    |
| apiserver_message           | Custom message for API server monitor                                     | `string`       | `""`     |    no    |
| apiserver_no_data_timeframe | Number of minutes before reporting no data                                | `string`       | `10`     |    no    |
| apiserver_threshold_warning | API server monitor (warning threshold)                                    | `string`       | `3`      |    no    |
| environment                 | Architecture environment                                                  | `any`          | n/a      |   yes    |
| evaluation_delay            | Delay in seconds for the metric evaluation                                | `number`       | `15`     |    no    |
| filter_tags_custom          | Tags used for custom filtering when filter_tags_use_defaults is false     | `string`       | `"*"`    |    no    |
| filter_tags_custom_excluded | Tags excluded for custom filtering when filter_tags_use_defaults is false | `string`       | `""`     |    no    |
| filter_tags_use_defaults    | Use default filter tags convention                                        | `string`       | `"true"` |    no    |
| message                     | Message sent when a monitor is triggered                                  | `any`          | n/a      |   yes    |
| new_host_delay              | Delay in seconds before monitor new resource                              | `number`       | `300`    |    no    |
| notify_no_data              | Will raise no data alert if set to true                                   | `bool`         | `true`   |    no    |
| prefix_slug                 | Prefix string to prepend between brackets on every monitors names         | `string`       | `""`     |    no    |

## Outputs

| Name         | Description              |
| ------------ | ------------------------ |
| apiserver_id | id for monitor apiserver |

## Related documentation

- [Datadog metrics](https://docs.datadoghq.com/agent/kubernetes/metrics/)
- [Datadog documentation](https://docs.datadoghq.com/integrations/kubernetes/)
- [Datadog Blog](https://www.datadoghq.com/blog/monitor-kubernetes-docker/)

## Requirements

- Datadog Agent > v6.6
