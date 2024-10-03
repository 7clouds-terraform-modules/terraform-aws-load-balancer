resource "aws_lb" "lb" {
  name               = var.LOAD_BALANCER_NAME
  internal           = var.INTERNAL
  load_balancer_type = var.LOAD_BALANCER_TYPE
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = var.LB_SUBNET_IDS
  enable_deletion_protection = var.ENABLE_DELETION_PROTECTION
  tags   = var.TAGS != null ? "${merge(var.TAGS, { Name = "${var.LOAD_BALANCER_NAME}" })}" : { Name = "${var.LOAD_BALANCER_NAME}" }
}

resource "aws_security_group" "lb_sg" {
  name        = var.SECURITY_GROUP_NAME
  description = var.SECURITY_GROUP_DESCRIPTION
  vpc_id      = var.VPC_ID

  dynamic "ingress" {
    for_each = var.SECURITY_GROUP_INGRESS_BLOCK
    content {
      protocol    = ingress.value["SECURITY_GROUP_INGRESS_RULES_PROTOCOL"]
      from_port   = ingress.value["SECURITY_GROUP_INGRESS_FROM_PORT"]
      to_port     = ingress.value["SECURITY_GROUP_INGRESS_TO_PORT"]
      cidr_blocks = ingress.value["SECURITY_GROUP_INGRESS_CIDR_BLOCK"]
    }
  }

  dynamic "egress" {
    for_each = var.SECURITY_GROUP_EGRESS_BLOCK
    content {
      protocol    = egress.value["SECURITY_GROUP_EGRESS_RULES_PROTOCOL"]
      from_port   = egress.value["SECURITY_GROUP_EGRESS_FROM_PORT"]
      to_port     = egress.value["SECURITY_GROUP_EGRESS_TO_PORT"]
      cidr_blocks = egress.value["SECURITY_GROUP_EGRESS_CIDR_BLOCK"]
    }
  }
}

resource "aws_lb_target_group" "lb_tg" {
  depends_on  = [
    aws_lb.lb
  ]
  name        = var.LOAD_BALANCER_TARGET_GROUP_NAME
  port        = var.TARGET_GROUP_PORT
  protocol    = var.TARGET_GROUP_PROTOCOL
  vpc_id      = var.VPC_ID
  target_type = var.TARGET_TYPE
  health_check {
      healthy_threshold   = var.HEALTHY_THRESHOLD
      interval            = var.HEALTH_CHECK_INTERVAL
      protocol            = var.HEALTH_CHECK_PROTOCOL
      port                = var.HEALTH_CHECK_PORT
      matcher             = var.HEALTH_CHECK_MATCHER
      timeout             = var.HEALTH_CHECK_TIMEOUT
      path                = var.HEALTH_CHECK_PATH
      unhealthy_threshold = var.UNHEALTHY_THRESHOLD
  }
}

resource "aws_lb_listener" "lb_listener" {
  load_balancer_arn = aws_lb.lb.id
  port              = var.LISTENER_PORT
  protocol          = var.LISTENER_PROTOCOL
  certificate_arn   = var.CERTIFICATE_ARN
  ssl_policy        = var.SSL_POLICY
  default_action {
    target_group_arn = aws_lb_target_group.lb_tg.id
    type             = var.LISTENER_DEFAULT_ACTION_TYPE
  }
}

resource "aws_lb_listener_rule" "lb_custom_domain_listener_rule" {
  count         = var.CREATE_LB_CUSTOM_DOMAIN_LISTENER_RULE == true ? 1 : 0
  listener_arn = aws_lb_listener.lb_listener.arn
  priority     = var.LB_CUSTOM_DOMAIN_PRIORITY

  action {
    type             = var.LB_CUSTOM_DOMAIN_ACTION
    target_group_arn = aws_lb_target_group.lb_tg.arn
  }

  condition {
    host_header {
      values = var.LB_CUSTOM_DOMAIN_NAME
    }
  }

  condition {
    path_pattern {
      values = var.LB_CUSTOM_DOMAIN_PATH_PATTERN
    }
  }
}