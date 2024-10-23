module "documentdb_cluster" {
  source = "cloudposse/documentdb-cluster/aws"
  # Cloud Posse recommends pinning every module to a specific version
  # version = "x.x.x"
  namespace               = var.env
  stage                   = "health"
  name                    = "${var.env}-docdb"
  cluster_size            = 3
  master_username         = "admin1"
  master_password         = "Test123456789"
  instance_class          = "db.r4.large"
  vpc_id                  = module.vpc_health_ai.vpc_id
  subnet_ids              = [module.vpc_health_ai.public_subnets[0], module.vpc_health_ai.public_subnets[1]]
  allowed_security_groups = [module.web_server_sg.security_group_id]
  skip_final_snapshot     = true
}