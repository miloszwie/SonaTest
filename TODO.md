
## Terraform ECS + Basic RDS

This Terraform setup provisions:
- A VPC with two public subnets
- A PostgreSQL RDS instance (not publicly accessible)
- ECS Fargate service with HTTPS load balancer
- Security group restricted to allow access from 75.2.60.0/24 only

### Access

The deployed app is exposed on port 8080 over HTTPS/ALB. 
Only clients from IP range `75.2.60.0/24` can access it.

---

## Improvement list

- [ ] **Move DB credentials to Secrets Manager** instead of hardcoding.
- [ ] **Use private subnets** for ECS tasks and RDS (with NAT GW).
- [ ] **Add auto-scaling policy** for ECS service.
- [ ] **Use ALB access logs** and CloudWatch logging.
- [ ] **Configure Route53 + domain name** for easier access.
- [ ] **Add HTTPS redirect for HTTP** if supporting both ports.
- [ ] **Enable health alarm + monitoring** with CloudWatch alarms.
- [ ] **Add lifecycle policies / retention** to log groups.
- [ ] **Use Terraform workspaces** or remote backends for stage separation (dev/stage/prod).
