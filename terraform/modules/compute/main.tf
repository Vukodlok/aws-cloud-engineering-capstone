# EC2 uses this IAM role to securely obtain temporary AWS credentials
# instead of storing long-lived access keys on the instance, 
# which would create unnecessary security risks. 
resource "aws_iam_role" "ec2_role" {
    name = "${var.environment}-ec2-role"

    assume_role_policy = jsonencode({
        Version = "2012-10-17"

        Statement = [
            {
                Effect = "Allow"

                Principal = {
                    Service = "ec2.amazonaws.com"
                }

                Action = "sts:AssumeRole"
            }
        ]
    })
}

# The instance profile allows the EC2 instance to use the IAM role. 
resource "aws_iam_instance_profile" "ec2_profile" {
    name = "${var.environment}-ec2-instance-profile"
    role = aws_iam_role.ec2_role.name
}

# Attach the AWS-managed Systems Manager policy so the EC2 instance
# can register with Systems Manager and be managed without SSH. 
resource "aws_iam_role_policy_attachment" "ssm_core" {
    role        = aws_iam_role.ec2_role.name
    policy_arn  = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

# Security group protecting the EC2 instance.
# No inbound traffic is allowed because administration is performed 
# through AWS Systems Manager instead of SSH. 
resource "aws_security_group" "ec2" {
    name           = "${var.environment}-ec2-sg"
    description    = "Security group for EC2 instance"
    vpc_id         = var.vpc_id

    egress {
        description = "allow outbound HTTPS for Systems Manager and AWS APIs"

        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name        = "${var.environment}-ec2-sg"
        Environment = var.environment
    }
}

# Retrieve the latest Amazon Linux 2023 AMI from AWS.
# Using a data source avoids hardcoding region-specific AMI IDs.
data "aws_ami" "amazon_linux" {
    most_recent = true

    owners = ["amazon"]

    filter {
        name    = "name"
        values  = ["al2023-ami-*-x86_64"]
    }

    filter {
        name    = "state"
        values  = ["available"]
    }
}

resource "aws_instance" "main" {
    ami             = data.aws_ami.amazon_linux.id
    instance_type   = var.instance_type
    subnet_id       = var.subnet_id

    vpc_security_group_ids = [
        aws_security_group.ec2.id
    ]

    iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

    tags = {
        Name        = "${var.environment}-server"
        Environment = var.environment
    }
}