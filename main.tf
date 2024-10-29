resource "aws_cloudwatch_log_metric_filter" "efs_metric_filter" {
  count          = length(var.efs_file_system_ids)
  log_group_name = var.cw_log_group_name
  name           = "${var.efs_file_system_ids[count.index]}-metric-filter"
  pattern        = "{ ($.eventSource = elasticfilesystem.amazonaws.com) && ($.requestParameters.fileSystemId = \"${var.efs_file_system_ids[count.index]}\") && ($.eventName = \"${join("\" || $.eventName = \"", var.efs_file_system_event_names)}\") }"

  metric_transformation {
    name      = "${var.efs_file_system_ids[count.index]}-metric-filter"
    namespace = var.cw_metric_filter_namespace
    value     = var.cw_metric_filter_value
  }
}

resource "aws_cloudwatch_metric_alarm" "elb_metric_filter_alarm" {
  count               = length(var.efs_file_system_ids)
  alarm_name          = "${var.efs_file_system_ids[count.index]}-metric-filter-alarm"
  comparison_operator = var.cw_metric_filter_alarm_comparison_operator
  evaluation_periods  = var.cw_metric_filter_alarm_evaluation_periods
  metric_name         = "${var.efs_file_system_ids[count.index]}-metric-filter"
  namespace           = var.cw_metric_filter_namespace
  period              = var.cw_metric_filter_alarm_period
  statistic           = var.cw_metric_filter_alarm_statistic
  threshold           = var.cw_metric_filter_alarm_threshold
  alarm_description   = "Alarm when ELB ${var.efs_file_system_ids[count.index]} has >= 1 data points within 5 minutes."
  alarm_actions       = var.cw_metric_filter_alarm_actions
}