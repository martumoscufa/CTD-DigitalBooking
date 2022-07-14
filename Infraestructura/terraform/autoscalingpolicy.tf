
#APP
# scale up alarm
resource "aws_autoscaling_policy" "app_cpu_policy" {
name = "${var.environment}-app-cpu-policy"
autoscaling_group_name = "${aws_autoscaling_group.autoscaling_group.name}"
adjustment_type = "ChangeInCapacity"
scaling_adjustment = "1"
cooldown = "300"
policy_type = "SimpleScaling"
}
resource "aws_cloudwatch_metric_alarm" "app_cpu_alarm" {
alarm_name = "${var.environment}-app-cpu-alarm"
alarm_description = "${var.environment}-app-cpu-alarm"
comparison_operator = "GreaterThanOrEqualToThreshold"
evaluation_periods = "2"
metric_name = "CPUUtilization"
namespace = "AWS/EC2"
period = "120"
statistic = "Average"
threshold = "30"
dimensions = {
"AutoScalingGroupName" = "${aws_autoscaling_group.autoscaling_group.name}"
}
actions_enabled = true
alarm_actions = ["${aws_autoscaling_policy.app_cpu_policy.arn}"]
}
# scale down alarm
resource "aws_autoscaling_policy" "app_cpu_policy_scaledown" {
name = "${var.environment}-app-cpu-policy-scaledown"
autoscaling_group_name = "${aws_autoscaling_group.autoscaling_group.name}"
adjustment_type = "ChangeInCapacity"
scaling_adjustment = "-1"
cooldown = "300"
policy_type = "SimpleScaling"
}
resource "aws_cloudwatch_metric_alarm" "app_cpu_alarm_scaledown" {
alarm_name = "${var.environment}-app-cpu-alarm-scaledown"
alarm_description = "${var.environment}-app-cpu-alarm-scaledown"
comparison_operator = "LessThanOrEqualToThreshold"
evaluation_periods = "2"
metric_name = "CPUUtilization"
namespace = "AWS/EC2"
period = "120"
statistic = "Average"
threshold = "5"
dimensions = {
"AutoScalingGroupName" = "${aws_autoscaling_group.autoscaling_group.name}"
}
actions_enabled = true
alarm_actions = ["${aws_autoscaling_policy.app_cpu_policy_scaledown.arn}"]
}



#API
# scale up alarm
resource "aws_autoscaling_policy" "api_cpu_policy" {
name = "${var.environment}-api-cpu-policy"
autoscaling_group_name = "${aws_autoscaling_group.autoscaling_group_api.name}"
adjustment_type = "ChangeInCapacity"
scaling_adjustment = "1"
cooldown = "300"
policy_type = "SimpleScaling"
}
resource "aws_cloudwatch_metric_alarm" "api_cpu_alarm" {
alarm_name = "${var.environment}-api-cpu-alarm"
alarm_description = "${var.environment}-api-cpu-alarm"
comparison_operator = "GreaterThanOrEqualToThreshold"
evaluation_periods = "2"
metric_name = "CPUUtilization"
namespace = "AWS/EC2"
period = "120"
statistic = "Average"
threshold = "30"
dimensions = {
"AutoScalingGroupName" = "${aws_autoscaling_group.autoscaling_group_api.name}"
}
actions_enabled = true
alarm_actions = ["${aws_autoscaling_policy.api_cpu_policy.arn}"]
}
# scale down alarm
resource "aws_autoscaling_policy" "api_cpu_policy_scaledown" {
name = "${var.environment}-api-cpu-policy-scaledown"
autoscaling_group_name = "${aws_autoscaling_group.autoscaling_group_api.name}"
adjustment_type = "ChangeInCapacity"
scaling_adjustment = "-1"
cooldown = "300"
policy_type = "SimpleScaling"
}
resource "aws_cloudwatch_metric_alarm" "api_cpu_alarm_scaledown" {
alarm_name = "${var.environment}-api-cpu-alarm-scaledown"
alarm_description = "${var.environment}-api-cpu-alarm-scaledown"
comparison_operator = "LessThanOrEqualToThreshold"
evaluation_periods = "2"
metric_name = "CPUUtilization"
namespace = "AWS/EC2"
period = "120"
statistic = "Average"
threshold = "5"
dimensions = {
"AutoScalingGroupName" = "${aws_autoscaling_group.autoscaling_group_api.name}"
}
actions_enabled = true
alarm_actions = ["${aws_autoscaling_policy.api_cpu_policy_scaledown.arn}"]
}