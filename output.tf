# ###########################################################################################
# #                                     ESSENTIAL                                           #
# ###########################################################################################
output "LOAD_BALANCER_NAME" {
  description = "Name of the LB. This name must be unique within your AWS account, can have a maximum of 32 characters, must contain only alphanumeric characters or hyphens, and must not begin or end with a hyphen."
  value = var.LOAD_BALANCER_NAME
}

output "LB_SUBNET_IDS" {
  description = "IDs for the load balancer subnets"
  value = var.LB_SUBNET_IDS
}

output "LOAD_BALANCER_TARGET_GROUP_NAME" {
  description = "Name of the target group. This name must be unique per region per account, can have a maximum of 32 characters, must contain only alphanumeric characters or hyphens, and must not begin or end with a hyphen"
  value = var.LOAD_BALANCER_TARGET_GROUP_NAME
}

output "SECURITY_GROUP_NAME" {
  description = "Name of the security group"
  value = var.SECURITY_GROUP_NAME
}

output "SECURITY_GROUP_DESCRIPTION" {
  description = "Security group description. Cannot be ''. NOTE: This field maps to the AWS GroupDescription attribute, for which there is no Update API. If you'd like to classify your security groups in a way that can be updated, use tags"
  value = var.SECURITY_GROUP_DESCRIPTION
}

# ###########################################################################################
# #                                     STRUCTURAL                                          #
# ###########################################################################################
output "INTERNAL" {
  description = "If true, the LB will be internal."
  value     = var.INTERNAL
}

output "LOAD_BALANCER_TYPE" {
  description = "Type of load balancer to create. Possible values are application, gateway, or network"
  value     = var.LOAD_BALANCER_TYPE
}

output "ENABLE_DELETION_PROTECTION" {
  description = "If true, deletion of the load balancer will be disabled via the AWS API. This will prevent Terraform from deleting the load balancer"
  value     = var.ENABLE_DELETION_PROTECTION
}

output "TARGET_GROUP_PORT" {
  description = "Port on which targets receive traffic, unless overridden when registering a specific target. Required when target_type is instance, ip or alb. Does not apply when target_type is lambda"
  value     = var.TARGET_GROUP_PORT
}

output "TARGET_GROUP_PROTOCOL" {
  description = "Protocol to use for routing traffic to the targets. Should be one of GENEVE, HTTP, HTTPS, TCP, TCP_UDP, TLS, or UDP. Required when target_type is instance, ip, or alb. Does not apply when target_type is lambda"
  value     = var.TARGET_GROUP_PROTOCOL
}

output "VPC_ID" {
  description = "Identifier of the VPC in which to create the target group and the load balancer's security group."
  value     = var.VPC_ID
}

output "TARGET_TYPE" {
  description = "Type of target that you must specify when registering targets with this target group. See doc for supported values. The default is instance. Note that you can't specify targets for a target group using both instance IDs and IP addresses. If the target type is ip, specify IP addresses from the subnets of the virtual private cloud (VPC) for the target group, the RFC 1918 range (10.0.0.0/8, 172.16.0.0/12, and 192.168.0.0/16), and the RFC 6598 range (100.64.0.0/10). You can't specify publicly routable IP addresses. Network Load Balancers do not support the lambda target type. Application Load Balancers do not support the alb target type"
  value     = var.TARGET_TYPE
}

output "HEALTH_CHECK_PROTOCOL" {
  description = "Protocol the load balancer uses when performing health checks on targets. Must be one of TCP, HTTP, or HTTPS. The TCP protocol is not supported for health checks if the protocol of the target group is HTTP or HTTPS. Default is HTTP. Cannot be specified when the target_type is lambda"
  value     = var.HEALTH_CHECK_PROTOCOL
}

output "HEALTH_CHECK_PATH" {
  description = "Destination for the health check request. Required for HTTP/HTTPS ALB and HTTP NLB. Only applies to HTTP/HTTPS"
  value     = var.HEALTH_CHECK_PATH
}

output "UNHEALTHY_THRESHOLD" {
  description = "Number of consecutive health check failures required before considering a target unhealthy. The range is 2-10"
  value     = var.UNHEALTHY_THRESHOLD
}

output "LISTENER_PORT" {
  description = "Port on which the load balancer is listening. Not valid for Gateway Load Balancers"
  value     = var.LISTENER_PORT
}

output "LISTENER_PROTOCOL" {
  description = "Protocol for connections from clients to the load balancer. For Application Load Balancers, valid values are HTTP and HTTPS. For Network Load Balancers, valid values are TCP, TLS, UDP, and TCP_UDP. Not valid to use UDP or TCP_UDP if dual-stack mode is enabled. Not valid for Gateway Load Balancers"
  value     = var.LISTENER_PROTOCOL
}

output "LISTENER_DEFAULT_ACTION_TYPE" {
  description = "Type of routing action. Valid values are forward, redirect, fixed-response, authenticate-cognito and authenticate-oidc"
  value       = var.LISTENER_DEFAULT_ACTION_TYPE
}

output "SECURITY_GROUP_INGRESS_BLOCK" {
  description = "One or more ingress blocks for the security group (multiples allowed)"
  value     = var.SECURITY_GROUP_INGRESS_BLOCK
}

output "SECURITY_GROUP_EGRESS_BLOCK" {
  description = "One or more egress blocks for the security group (multiples allowed)"
  value     = var.SECURITY_GROUP_EGRESS_BLOCK
}


# ###########################################################################################
# #                                      OPTIONAL                                           #
# ###########################################################################################

output "HEALTHY_THRESHOLD" {
  description = "Number of consecutive health check successes required before considering a target healthy. The range is 2-10. Defaults to 3"
  value     = var.HEALTHY_THRESHOLD
}

output "HEALTH_CHECK_INTERVAL" {
  description = "Approximate amount of time, in seconds, between health checks of an individual target. The range is 5-300. For lambda target groups, it needs to be greater than the timeout of the underlying lambda. Defaults to 30"
  value     = var.HEALTH_CHECK_INTERVAL
}

output "HEALTH_CHECK_MATCHER" {
  description = "The HTTP or gRPC codes to use when checking for a successful response from a target. The health_check.protocol must be one of HTTP or HTTPS or the target_type must be lambda. Values can be comma-separated individual values (e.g., '200,202') or a range of values (e.g., '200-299')"
  value     = var.HEALTH_CHECK_MATCHER
}

output "HEALTH_CHECK_PORT" {
  description = "The port the load balancer uses when performing health checks on targets. Valid values are either traffic-port, to use the same port as the target group, or a valid port number between 1 and 65536. Default is traffic-port"
  value     = var.HEALTH_CHECK_PORT
}

output "HEALTH_CHECK_TIMEOUT" {
  description = "Amount of time, in seconds, during which no response from a target means a failed health check. The range is 2–120 seconds. For target groups with a protocol of HTTP, the default is 6 seconds. For target groups with a protocol of TCP, TLS or HTTPS, the default is 10 seconds. For target groups with a protocol of GENEVE, the default is 5 seconds. If the target type is lambda, the default is 30 seconds"
  value     = var.HEALTH_CHECK_TIMEOUT
}

output "CERTIFICATE_ARN" {
  description = "ARN of the default SSL server certificate. Exactly one certificate is required if the protocol is HTTPS"
  value     = var.CERTIFICATE_ARN
}

output "SSL_POLICY" {
  description = "Name of the SSL Policy for the listener. Required if protocol is HTTPS or TLS"
  value     = var.SSL_POLICY
}

output "CREATE_LB_CUSTOM_DOMAIN_LISTENER_RULE" {
  description = "To define if a listener rule which requires a custom domain as host header will be created"
  value     = var.CREATE_LB_CUSTOM_DOMAIN_LISTENER_RULE
}

output "LB_CUSTOM_DOMAIN_NAME" {
  description = "Domain name for the host header condition"
  value     = var.LB_CUSTOM_DOMAIN_NAME
}

output "LB_CUSTOM_DOMAIN_ACTION" {
  description = "The type of routing action. Valid values are forward, redirect, fixed-response, authenticate-cognito and authenticate-oidc"
  value     = var.LB_CUSTOM_DOMAIN_ACTION
}

output "LB_CUSTOM_DOMAIN_PRIORITY" {
  description = "The priority for the rule between 1 and 50000"
  value     = var.LB_CUSTOM_DOMAIN_PRIORITY
}

output "LB_CUSTOM_DOMAIN_PATH_PATTERN" {
  description = "The absolute path, starting with the leading '/'"
  value     = var.LB_CUSTOM_DOMAIN_PATH_PATTERN
}

# ###########################################################################################
# #                                      RESOURCE                                           #
# ###########################################################################################
output "LOAD_BALANCER_ARN" {
  value       = aws_lb.lb.arn
  description = "ARN for the Load Balancer"
}

output "LOAD_BALANCER_DNS_NAME" {
  value       = aws_lb.lb.dns_name
  description = "DNS name for the Load Balancer"
}