# Load Balancer Module by Seven Technologies

Thank you for riding with us! Feel free to download or reference this respository in your terraform projects and studies

This module is a part of our product SCA — An automated API and Serverless Infrastructure generator that can reduce your API development time by 40-60% and automate your deployments up to 90%!

Get in touch via admin@seventechnologies.cloud if you have any doubts or suggestions and check out our website for other solutions: https://seventechnologies.cloud/

Don't forget to star rate our repo if you like our job!

## Usage

Our Load Balancer Module encompasses settings for load balancer, target group, security group, listener and its rule. Each resource/data has conditions applied on their count arguments, in a way that setting/overriding the variables is enough to serve your needs

```hcl
module "load_balancer" {
  source       = "../.."
  LOAD_BALANCER_NAME = "lb-test"
  SECURITY_GROUP_NAME = "gp-lb-test"
  SECURITY_GROUP_DESCRIPTION = "Description for example"
  SECURITY_GROUP_INGRESS_BLOCK = [{SECURITY_GROUP_INGRESS_FROM_PORT = 80, SECURITY_GROUP_INGRESS_TO_PORT = 80, SECURITY_GROUP_INGRESS_RULES_PROTOCOL = "tcp", SECURITY_GROUP_INGRESS_CIDR_BLOCK = ["0.0.0.0/0"]}]
  SECURITY_GROUP_EGRESS_BLOCK = [{SECURITY_GROUP_EGRESS_FROM_PORT = 0, SECURITY_GROUP_EGRESS_TO_PORT = 0, SECURITY_GROUP_EGRESS_RULES_PROTOCOL = "-1", SECURITY_GROUP_EGRESS_CIDR_BLOCK = ["0.0.0.0/0"]}]
  LB_SUBNET_IDS = ["subnet-1-id", "subnet-2-id"]
  LOAD_BALANCER_TARGET_GROUP_NAME = "tg-gp-test"
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.68.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.68.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="terraform-aws-load-balancer"></a> [terraform-aws-load-balancer](#module\_terraform-aws-load-balancer) | ../.. | v0.1.0 |

## Resources

| Name | Type |
|------|------|
| [aws_lb.lb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.lb_listener](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener_rule.lb_custom_domain_listener_rule](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener_rule) | resource |
| [aws_lb_target_group.lb_tg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_security_group.lb_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_CERTIFICATE_ARN"></a> [CERTIFICATE\_ARN](#input\_CERTIFICATE\_ARN) | ARN of the default SSL server certificate. Exactly one certificate is required if the protocol is HTTPS | `string` | `null` | no |
| <a name="input_CREATE_LB_CUSTOM_DOMAIN_LISTENER_RULE"></a> [CREATE\_LB\_CUSTOM\_DOMAIN\_LISTENER\_RULE](#input\_CREATE\_LB\_CUSTOM\_DOMAIN\_LISTENER\_RULE) | To define if a listener rule which requires a custom domain as host header will be created | `bool` | `false` | no |
| <a name="input_ENABLE_DELETION_PROTECTION"></a> [ENABLE\_DELETION\_PROTECTION](#input\_ENABLE\_DELETION\_PROTECTION) | If true, deletion of the load balancer will be disabled via the AWS API. This will prevent Terraform from deleting the load balancer | `bool` | `true` | no |
| <a name="input_HEALTHY_THRESHOLD"></a> [HEALTHY\_THRESHOLD](#input\_HEALTHY\_THRESHOLD) | Number of consecutive health check successes required before considering a target healthy. The range is 2-10. Defaults to 3 | `string` | `"3"` | no |
| <a name="input_HEALTH_CHECK_INTERVAL"></a> [HEALTH\_CHECK\_INTERVAL](#input\_HEALTH\_CHECK\_INTERVAL) | Approximate amount of time, in seconds, between health checks of an individual target. The range is 5-300. For lambda target groups, it needs to be greater than the timeout of the underlying lambda. Defaults to 30 | `string` | `"30"` | no |
| <a name="input_HEALTH_CHECK_MATCHER"></a> [HEALTH\_CHECK\_MATCHER](#input\_HEALTH\_CHECK\_MATCHER) | The HTTP or gRPC codes to use when checking for a successful response from a target. The health\_check.protocol must be one of HTTP or HTTPS or the target\_type must be lambda. Values can be comma-separated individual values (e.g., '200,202') or a range of values (e.g., '200-299') | `string` | `"200"` | no |
| <a name="input_HEALTH_CHECK_PATH"></a> [HEALTH\_CHECK\_PATH](#input\_HEALTH\_CHECK\_PATH) | Destination for the health check request. Required for HTTP/HTTPS ALB and HTTP NLB. Only applies to HTTP/HTTPS | `string` | `"/"` | no |
| <a name="input_HEALTH_CHECK_PORT"></a> [HEALTH\_CHECK\_PORT](#input\_HEALTH\_CHECK\_PORT) | The port the load balancer uses when performing health checks on targets. Valid values are either traffic-port, to use the same port as the target group, or a valid port number between 1 and 65536. Default is traffic-port | `string` | `"traffic-port"` | no |
| <a name="input_HEALTH_CHECK_PROTOCOL"></a> [HEALTH\_CHECK\_PROTOCOL](#input\_HEALTH\_CHECK\_PROTOCOL) | Protocol the load balancer uses when performing health checks on targets. Must be one of TCP, HTTP, or HTTPS. The TCP protocol is not supported for health checks if the protocol of the target group is HTTP or HTTPS. Default is HTTP. Cannot be specified when the target\_type is lambda | `string` | `"HTTP"` | no |
| <a name="input_HEALTH_CHECK_TIMEOUT"></a> [HEALTH\_CHECK\_TIMEOUT](#input\_HEALTH\_CHECK\_TIMEOUT) | Amount of time, in seconds, during which no response from a target means a failed health check. The range is 2–120 seconds. For target groups with a protocol of HTTP, the default is 6 seconds. For target groups with a protocol of TCP, TLS or HTTPS, the default is 10 seconds. For target groups with a protocol of GENEVE, the default is 5 seconds. If the target type is lambda, the default is 30 seconds | `string` | `"30"` | no |
| <a name="input_INTERNAL"></a> [INTERNAL](#input\_INTERNAL) | If true, the LB will be internal. | `bool` | `true` | no |
| <a name="input_LB_CUSTOM_DOMAIN_ACTION"></a> [LB\_CUSTOM\_DOMAIN\_ACTION](#input\_LB\_CUSTOM\_DOMAIN\_ACTION) | The type of routing action. Valid values are forward, redirect, fixed-response, authenticate-cognito and authenticate-oidc | `string` | `"forward"` | no |
| <a name="input_LB_CUSTOM_DOMAIN_NAME"></a> [LB\_CUSTOM\_DOMAIN\_NAME](#input\_LB\_CUSTOM\_DOMAIN\_NAME) | Domain name for the host header condition | `list(string)` | `null` | no |
| <a name="input_LB_CUSTOM_DOMAIN_PATH_PATTERN"></a> [LB\_CUSTOM\_DOMAIN\_PATH\_PATTERN](#input\_LB\_CUSTOM\_DOMAIN\_PATH\_PATTERN) | The absolute path, starting with the leading '/' | `list(string)` | <pre>[<br/>  "/"<br/>]</pre> | no |
| <a name="input_LB_CUSTOM_DOMAIN_PRIORITY"></a> [LB\_CUSTOM\_DOMAIN\_PRIORITY](#input\_LB\_CUSTOM\_DOMAIN\_PRIORITY) | The priority for the rule between 1 and 50000 | `number` | `1` | no |
| <a name="input_LB_SUBNET_IDS"></a> [LB\_SUBNET\_IDS](#input\_LB\_SUBNET\_IDS) | IDs for the load balancer subnets | `list(string)` | n/a | yes |
| <a name="input_LISTENER_DEFAULT_ACTION_TYPE"></a> [LISTENER\_DEFAULT\_ACTION\_TYPE](#input\_LISTENER\_DEFAULT\_ACTION\_TYPE) | Type of routing action. Valid values are forward, redirect, fixed-response, authenticate-cognito and authenticate-oidc | `string` | `"forward"` | no |
| <a name="input_LISTENER_PORT"></a> [LISTENER\_PORT](#input\_LISTENER\_PORT) | Port on which the load balancer is listening. Not valid for Gateway Load Balancers | `number` | `null` | no |
| <a name="input_LISTENER_PROTOCOL"></a> [LISTENER\_PROTOCOL](#input\_LISTENER\_PROTOCOL) | Protocol for connections from clients to the load balancer. For Application Load Balancers, valid values are HTTP and HTTPS. For Network Load Balancers, valid values are TCP, TLS, UDP, and TCP\_UDP. Not valid to use UDP or TCP\_UDP if dual-stack mode is enabled. Not valid for Gateway Load Balancers | `string` | `null` | no |
| <a name="input_LOAD_BALANCER_NAME"></a> [LOAD\_BALANCER\_NAME](#input\_LOAD\_BALANCER\_NAME) | Name of the LB. This name must be unique within your AWS account, can have a maximum of 32 characters, must contain only alphanumeric characters or hyphens, and must not begin or end with a hyphen. | `string` | n/a | yes |
| <a name="input_LOAD_BALANCER_TARGET_GROUP_NAME"></a> [LOAD\_BALANCER\_TARGET\_GROUP\_NAME](#input\_LOAD\_BALANCER\_TARGET\_GROUP\_NAME) | Name of the target group. This name must be unique per region per account, can have a maximum of 32 characters, must contain only alphanumeric characters or hyphens, and must not begin or end with a hyphen | `string` | n/a | yes |
| <a name="input_LOAD_BALANCER_TYPE"></a> [LOAD\_BALANCER\_TYPE](#input\_LOAD\_BALANCER\_TYPE) | Type of load balancer to create. Possible values are application, gateway, or network | `string` | `"application"` | no |
| <a name="input_SECURITY_GROUP_DESCRIPTION"></a> [SECURITY\_GROUP\_DESCRIPTION](#input\_SECURITY\_GROUP\_DESCRIPTION) | Security group description. Cannot be ''. NOTE: This field maps to the AWS GroupDescription attribute, for which there is no Update API. If you'd like to classify your security groups in a way that can be updated, use tags | `string` | n/a | yes |
| <a name="input_SECURITY_GROUP_EGRESS_BLOCK"></a> [SECURITY\_GROUP\_EGRESS\_BLOCK](#input\_SECURITY\_GROUP\_EGRESS\_BLOCK) | One or more egress blocks for the security group (multiples allowed) | <pre>list(object({ <br/>      egress = list(object({<br/>                        SECURITY_GROUP_EGRESS_FROM_PORT  = string,<br/>                        SECURITY_GROUP_EGRESS_TO_PORT = string,<br/>                        SECURITY_GROUP_EGRESS_RULES_PROTOCOL = string,<br/>                        SECURITY_GROUP_EGRESS_CIDR_BLOCK = list(string)<br/>                  }))<br/>  }))</pre> | n/a | yes |
| <a name="input_SECURITY_GROUP_INGRESS_BLOCK"></a> [SECURITY\_GROUP\_INGRESS\_BLOCK](#input\_SECURITY\_GROUP\_INGRESS\_BLOCK) | One or more ingress blocks for the security group (multiples allowed) | <pre>list(object({ <br/>      ingress = list(object({<br/>                        SECURITY_GROUP_INGRESS_FROM_PORT  = string,<br/>                        SECURITY_GROUP_INGRESS_TO_PORT = string,<br/>                        SECURITY_GROUP_INGRESS_RULES_PROTOCOL = string,<br/>                        SECURITY_GROUP_INGRESS_CIDR_BLOCK = list(string)<br/>                  }))<br/>  }))</pre> | n/a | yes |
| <a name="input_SECURITY_GROUP_NAME"></a> [SECURITY\_GROUP\_NAME](#input\_SECURITY\_GROUP\_NAME) | Name of the security group | `string` | n/a | yes |
| <a name="input_SSL_POLICY"></a> [SSL\_POLICY](#input\_SSL\_POLICY) | Name of the SSL Policy for the listener. Required if protocol is HTTPS or TLS | `string` | `null` | no |
| <a name="input_TAGS"></a> [TAGS](#input\_TAGS) | Tag List | `map(string)` | `null` | no |
| <a name="input_TARGET_GROUP_PORT"></a> [TARGET\_GROUP\_PORT](#input\_TARGET\_GROUP\_PORT) | Port on which targets receive traffic, unless overridden when registering a specific target. Required when target\_type is instance, ip or alb. Does not apply when target\_type is lambda | `number` | `null` | no |
| <a name="input_TARGET_GROUP_PROTOCOL"></a> [TARGET\_GROUP\_PROTOCOL](#input\_TARGET\_GROUP\_PROTOCOL) | Protocol to use for routing traffic to the targets. Should be one of GENEVE, HTTP, HTTPS, TCP, TCP\_UDP, TLS, or UDP. Required when target\_type is instance, ip, or alb. Does not apply when target\_type is lambda | `string` | `null` | no |
| <a name="input_TARGET_TYPE"></a> [TARGET\_TYPE](#input\_TARGET\_TYPE) | Type of target that you must specify when registering targets with this target group. See doc for supported values. The default is instance. Note that you can't specify targets for a target group using both instance IDs and IP addresses. If the target type is ip, specify IP addresses from the subnets of the virtual private cloud (VPC) for the target group, the RFC 1918 range (10.0.0.0/8, 172.16.0.0/12, and 192.168.0.0/16), and the RFC 6598 range (100.64.0.0/10). You can't specify publicly routable IP addresses. Network Load Balancers do not support the lambda target type. Application Load Balancers do not support the alb target type | `string` | `"instance"` | no |
| <a name="input_UNHEALTHY_THRESHOLD"></a> [UNHEALTHY\_THRESHOLD](#input\_UNHEALTHY\_THRESHOLD) | Number of consecutive health check failures required before considering a target unhealthy. The range is 2-10 | `string` | `"2"` | no |
| <a name="input_VPC_ID"></a> [VPC\_ID](#input\_VPC\_ID) | Identifier of the VPC in which to create the target group and the load balancer's security group. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_CERTIFICATE_ARN"></a> [CERTIFICATE\_ARN](#output\_CERTIFICATE\_ARN) | ARN of the default SSL server certificate. Exactly one certificate is required if the protocol is HTTPS |
| <a name="output_CREATE_LB_CUSTOM_DOMAIN_LISTENER_RULE"></a> [CREATE\_LB\_CUSTOM\_DOMAIN\_LISTENER\_RULE](#output\_CREATE\_LB\_CUSTOM\_DOMAIN\_LISTENER\_RULE) | To define if a listener rule which requires a custom domain as host header will be created |
| <a name="output_ENABLE_DELETION_PROTECTION"></a> [ENABLE\_DELETION\_PROTECTION](#output\_ENABLE\_DELETION\_PROTECTION) | If true, deletion of the load balancer will be disabled via the AWS API. This will prevent Terraform from deleting the load balancer |
| <a name="output_HEALTHY_THRESHOLD"></a> [HEALTHY\_THRESHOLD](#output\_HEALTHY\_THRESHOLD) | Number of consecutive health check successes required before considering a target healthy. The range is 2-10. Defaults to 3 |
| <a name="output_HEALTH_CHECK_INTERVAL"></a> [HEALTH\_CHECK\_INTERVAL](#output\_HEALTH\_CHECK\_INTERVAL) | Approximate amount of time, in seconds, between health checks of an individual target. The range is 5-300. For lambda target groups, it needs to be greater than the timeout of the underlying lambda. Defaults to 30 |
| <a name="output_HEALTH_CHECK_MATCHER"></a> [HEALTH\_CHECK\_MATCHER](#output\_HEALTH\_CHECK\_MATCHER) | The HTTP or gRPC codes to use when checking for a successful response from a target. The health\_check.protocol must be one of HTTP or HTTPS or the target\_type must be lambda. Values can be comma-separated individual values (e.g., '200,202') or a range of values (e.g., '200-299') |
| <a name="output_HEALTH_CHECK_PATH"></a> [HEALTH\_CHECK\_PATH](#output\_HEALTH\_CHECK\_PATH) | Destination for the health check request. Required for HTTP/HTTPS ALB and HTTP NLB. Only applies to HTTP/HTTPS |
| <a name="output_HEALTH_CHECK_PORT"></a> [HEALTH\_CHECK\_PORT](#output\_HEALTH\_CHECK\_PORT) | The port the load balancer uses when performing health checks on targets. Valid values are either traffic-port, to use the same port as the target group, or a valid port number between 1 and 65536. Default is traffic-port |
| <a name="output_HEALTH_CHECK_PROTOCOL"></a> [HEALTH\_CHECK\_PROTOCOL](#output\_HEALTH\_CHECK\_PROTOCOL) | Protocol the load balancer uses when performing health checks on targets. Must be one of TCP, HTTP, or HTTPS. The TCP protocol is not supported for health checks if the protocol of the target group is HTTP or HTTPS. Default is HTTP. Cannot be specified when the target\_type is lambda |
| <a name="output_HEALTH_CHECK_TIMEOUT"></a> [HEALTH\_CHECK\_TIMEOUT](#output\_HEALTH\_CHECK\_TIMEOUT) | Amount of time, in seconds, during which no response from a target means a failed health check. The range is 2–120 seconds. For target groups with a protocol of HTTP, the default is 6 seconds. For target groups with a protocol of TCP, TLS or HTTPS, the default is 10 seconds. For target groups with a protocol of GENEVE, the default is 5 seconds. If the target type is lambda, the default is 30 seconds |
| <a name="output_INTERNAL"></a> [INTERNAL](#output\_INTERNAL) | If true, the LB will be internal. |
| <a name="output_LB_CUSTOM_DOMAIN_ACTION"></a> [LB\_CUSTOM\_DOMAIN\_ACTION](#output\_LB\_CUSTOM\_DOMAIN\_ACTION) | The type of routing action. Valid values are forward, redirect, fixed-response, authenticate-cognito and authenticate-oidc |
| <a name="output_LB_CUSTOM_DOMAIN_NAME"></a> [LB\_CUSTOM\_DOMAIN\_NAME](#output\_LB\_CUSTOM\_DOMAIN\_NAME) | Domain name for the host header condition |
| <a name="output_LB_CUSTOM_DOMAIN_PATH_PATTERN"></a> [LB\_CUSTOM\_DOMAIN\_PATH\_PATTERN](#output\_LB\_CUSTOM\_DOMAIN\_PATH\_PATTERN) | The absolute path, starting with the leading '/' |
| <a name="output_LB_CUSTOM_DOMAIN_PRIORITY"></a> [LB\_CUSTOM\_DOMAIN\_PRIORITY](#output\_LB\_CUSTOM\_DOMAIN\_PRIORITY) | The priority for the rule between 1 and 50000 |
| <a name="output_LB_SUBNET_IDS"></a> [LB\_SUBNET\_IDS](#output\_LB\_SUBNET\_IDS) | IDs for the load balancer subnets |
| <a name="output_LISTENER_DEFAULT_ACTION_TYPE"></a> [LISTENER\_DEFAULT\_ACTION\_TYPE](#output\_LISTENER\_DEFAULT\_ACTION\_TYPE) | Type of routing action. Valid values are forward, redirect, fixed-response, authenticate-cognito and authenticate-oidc |
| <a name="output_LISTENER_PORT"></a> [LISTENER\_PORT](#output\_LISTENER\_PORT) | Port on which the load balancer is listening. Not valid for Gateway Load Balancers |
| <a name="output_LISTENER_PROTOCOL"></a> [LISTENER\_PROTOCOL](#output\_LISTENER\_PROTOCOL) | Protocol for connections from clients to the load balancer. For Application Load Balancers, valid values are HTTP and HTTPS. For Network Load Balancers, valid values are TCP, TLS, UDP, and TCP\_UDP. Not valid to use UDP or TCP\_UDP if dual-stack mode is enabled. Not valid for Gateway Load Balancers |
| <a name="output_LOAD_BALANCER_ARN"></a> [LOAD\_BALANCER\_ARN](#output\_LOAD\_BALANCER\_ARN) | ARN for the Load Balancer |
| <a name="output_LOAD_BALANCER_DNS_NAME"></a> [LOAD\_BALANCER\_DNS\_NAME](#output\_LOAD\_BALANCER\_DNS\_NAME) | DNS name for the Load Balancer |
| <a name="output_LOAD_BALANCER_NAME"></a> [LOAD\_BALANCER\_NAME](#output\_LOAD\_BALANCER\_NAME) | Name of the LB. This name must be unique within your AWS account, can have a maximum of 32 characters, must contain only alphanumeric characters or hyphens, and must not begin or end with a hyphen. |
| <a name="output_LOAD_BALANCER_TARGET_GROUP_NAME"></a> [LOAD\_BALANCER\_TARGET\_GROUP\_NAME](#output\_LOAD\_BALANCER\_TARGET\_GROUP\_NAME) | Name of the target group. This name must be unique per region per account, can have a maximum of 32 characters, must contain only alphanumeric characters or hyphens, and must not begin or end with a hyphen |
| <a name="output_LOAD_BALANCER_TYPE"></a> [LOAD\_BALANCER\_TYPE](#output\_LOAD\_BALANCER\_TYPE) | Type of load balancer to create. Possible values are application, gateway, or network |
| <a name="output_SECURITY_GROUP_DESCRIPTION"></a> [SECURITY\_GROUP\_DESCRIPTION](#output\_SECURITY\_GROUP\_DESCRIPTION) | Security group description. Cannot be ''. NOTE: This field maps to the AWS GroupDescription attribute, for which there is no Update API. If you'd like to classify your security groups in a way that can be updated, use tags |
| <a name="output_SECURITY_GROUP_EGRESS_BLOCK"></a> [SECURITY\_GROUP\_EGRESS\_BLOCK](#output\_SECURITY\_GROUP\_EGRESS\_BLOCK) | One or more egress blocks for the security group (multiples allowed) |
| <a name="output_SECURITY_GROUP_INGRESS_BLOCK"></a> [SECURITY\_GROUP\_INGRESS\_BLOCK](#output\_SECURITY\_GROUP\_INGRESS\_BLOCK) | One or more ingress blocks for the security group (multiples allowed) |
| <a name="output_SECURITY_GROUP_NAME"></a> [SECURITY\_GROUP\_NAME](#output\_SECURITY\_GROUP\_NAME) | Name of the security group |
| <a name="output_SSL_POLICY"></a> [SSL\_POLICY](#output\_SSL\_POLICY) | Name of the SSL Policy for the listener. Required if protocol is HTTPS or TLS |
| <a name="output_TARGET_GROUP_PORT"></a> [TARGET\_GROUP\_PORT](#output\_TARGET\_GROUP\_PORT) | Port on which targets receive traffic, unless overridden when registering a specific target. Required when target\_type is instance, ip or alb. Does not apply when target\_type is lambda |
| <a name="output_TARGET_GROUP_PROTOCOL"></a> [TARGET\_GROUP\_PROTOCOL](#output\_TARGET\_GROUP\_PROTOCOL) | Protocol to use for routing traffic to the targets. Should be one of GENEVE, HTTP, HTTPS, TCP, TCP\_UDP, TLS, or UDP. Required when target\_type is instance, ip, or alb. Does not apply when target\_type is lambda |
| <a name="output_TARGET_TYPE"></a> [TARGET\_TYPE](#output\_TARGET\_TYPE) | Type of target that you must specify when registering targets with this target group. See doc for supported values. The default is instance. Note that you can't specify targets for a target group using both instance IDs and IP addresses. If the target type is ip, specify IP addresses from the subnets of the virtual private cloud (VPC) for the target group, the RFC 1918 range (10.0.0.0/8, 172.16.0.0/12, and 192.168.0.0/16), and the RFC 6598 range (100.64.0.0/10). You can't specify publicly routable IP addresses. Network Load Balancers do not support the lambda target type. Application Load Balancers do not support the alb target type |
| <a name="output_UNHEALTHY_THRESHOLD"></a> [UNHEALTHY\_THRESHOLD](#output\_UNHEALTHY\_THRESHOLD) | Number of consecutive health check failures required before considering a target unhealthy. The range is 2-10 |
| <a name="output_VPC_ID"></a> [VPC\_ID](#output\_VPC\_ID) | Identifier of the VPC in which to create the target group and the load balancer's security group. |
<!-- END_TF_DOCS -->