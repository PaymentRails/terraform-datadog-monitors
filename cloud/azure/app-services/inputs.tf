variable "environment" {
  description = "Architecture environment"
  type        = "string"
}

variable "filter_tags_use_defaults" {
  description = "Use default filter tags convention"
  default     = "true"
}

variable "filter_tags_custom" {
  description = "Tags used for custom filtering when filter_tags_use_defaults is false"
  default     = "*"
}

variable "message" {
  description = "Message sent when a monitor is triggered"
}

variable "delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 600
}

###################################
###   RESPONSE TIME VARIABLES   ###
###################################

variable "response_time_threshold_critical" {
  default     = 10
  description = "Alerting threshold in seconds"
}

variable "response_time_threshold_warning" {
  default     = 5
  description = "Warning threshold in seconds"
}

###################################
###   MEMORY USAGE VARIABLES   ###
###################################

variable "memory_usage_threshold_critical" {
  default     = 1073741824                  # 1Gb
  description = "Alerting threshold in Mib"
}

variable "memory_usage_threshold_warning" {
  default     = 536870912                  # 512Mb
  description = "Warning threshold in MiB"
}

#################################
###   HTTP 5xx status pages   ###
#################################

variable "http_5xx_requests_threshold_critical" {
  default     = 90
  description = "Maximum critical acceptable percent of 5xx errors"
}

variable "http_5xx_requests_threshold_warning" {
  default     = 50
  description = "Warning regarding acceptable percent of 5xx errors"
}

#################################
###   HTTP 4xx status pages   ###
#################################

variable "http_4xx_requests_threshold_critical" {
  default     = 90
  description = "Maximum critical acceptable percent of 4xx errors"
}

variable "http_4xx_requests_threshold_warning" {
  default     = 50
  description = "Warning regarding acceptable percent of 4xx errors"
}

#################################
###   HTTP 2xx status pages   ###
#################################

variable "http_successful_requests_threshold_critical" {
  default     = 10
  description = "Minimum critical acceptable percent of 2xx & 3xx requests"
}

variable "http_successful_requests_threshold_warning" {
  default     = 30
  description = "Warning regarding acceptable percent of 2xx & 3xx requests"
}
