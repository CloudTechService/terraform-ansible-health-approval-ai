# Create a Parameter Group for DocumentDB with family docdb5.0
# resource "aws_docdb_parameter_group" "docdb_parameter_group" {
#   name        = "${var.env}-docdb-parameter-group"
#   family      = "docdb5.0"
#   description = "Parameter group for DocumentDB version 5.0"
# }


module "documentdb_cluster" {
  source = "cloudposse/documentdb-cluster/aws"
  # Cloud Posse recommends pinning every module to a specific version
  # version = "x.x.x"
  namespace               = var.env
  stage                   = "health"
  name                    = "${var.env}-docdb"
  engine      = "docdb"
  cluster_family = "docdb5.0"
  cluster_size            = 1
  master_username         = "admin1"
  master_password         = "W4T*4m_Q4n2-"
  instance_class          = "db.r5.large"
  engine_version          = "5.0.0"
  # auto_major_version_upgrade = true
  auto_minor_version_upgrade  = true
  vpc_id                  = module.vpc_health_ai.vpc_id
  subnet_ids              = [module.vpc_health_ai.public_subnets[0], module.vpc_health_ai.public_subnets[1]]
  allowed_security_groups = [module.web_server_sg.security_group_id]
  skip_final_snapshot     = true
}