# module "alb" {
#   source             = "terraform-aws-modules/alb/aws"
#   version            = "6.3.0"
#   name               = "${local.name}-alb"
#   load_balancer_type = "application"
#   vpc_id             = module.vpc.vpc_id
#   subnets            = module.vpc.public_subnets
#   security_groups    = [module.public-sg.security_group_id]

#   # Listerners
#   http_tcp_listeners = [
#     {
#       port               = 80
#       protocol           = "HTTP"
#       target_group_index = 0
#     },
#     {
#       port        = 81
#       protocol    = "HTTP"
#       action_type = "fixed-response"
#       fixed_response = {
#         content_type = "text/plain"
#         message_body = "Fixed response for port 81"
#         status_code  = "200"
#       }
#     }

#   ]

#   # Target Groups
#   target_groups = [
#     {
#       name_prefix          = "app1-"
#       backend_protocol     = "HTTP"
#       backend_port         = 80
#       target_type          = "instance"
#       deregistration_delay = 10
#       health_check = {
#         enable              = true
#         interval            = 30
#         path                = "/app1/index.html"
#         port                = "traffic-port"
#         healthy_threshold   = 3
#         unhealthy_threshold = 3
#         timeout             = 6
#         protocol            = "HTTP"
#         matcher             = "200-399"
#       }
#       protocol_version = "HTTP1"
#       targets = {
#         my_app1_instance1 = {
#           target_id = module.ec2_private[0].id
#           port      = 80
#         }
#       }
#       tags = local.common_tags
#     }
#   ]
#   tags = local.common_tags
# }