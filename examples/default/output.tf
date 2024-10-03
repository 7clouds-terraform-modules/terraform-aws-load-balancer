
output "LOAD_BALANCER_ARN" {
  value       = module.load_balancer.LOAD_BALANCER_ARN
  description = "ARN for the Load Balancer"
}

output "LOAD_BALANCER_DNS_NAME" {
  value       = module.load_balancer.LOAD_BALANCER_DNS_NAME
  description = "DNS name for the Load Balancer"
}