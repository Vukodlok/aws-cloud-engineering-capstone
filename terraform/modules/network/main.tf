# A single VPC is used as the network boundary for this project.
# Subnet separation provides security segmentation without introducing
# unnecessary network complexity across multiple VPCs.
resource "aws_vpc" "main" {
    cidr_block              = var.vpc_cidr
    enable_dns_support      = true
    enable_dns_hostnames    = true

    tags = {
        Name        = "${var.environment}-vpc"
        Environment = var.environment
    }
}

resource "aws_subnet" "public" {
    vpc_id                  = aws_vpc.main.id
    cidr_block              = var.public_subnet_cidr
    availability_zone       = var.public_availability_zone
    map_public_ip_on_launch = true

    tags = {
        Name        = "${var.environment}-public-subnet"
        Environment = var.environment
    }
}

# Private resources are isloated from direct internet access.
# Access will be provided through AWS managed services such as
# Systems Manager rather than exposing ports.
  
resource "aws_subnet" "private" {
    vpc_id                  = aws_vpc.main.id
    cidr_block              = var.private_subnet_cidr
    availability_zone       = var.private_availability_zone

    tags = {
        Name        = "${var.environment}-private-subnet"
        Environment = var.environment
    }
}

resource "aws_internet_gateway" "main" {
    vpc_id = aws_vpc.main.id

    tags = {
        Name        = "${var.environment}-igw"
        Environment = var.environment
    }
}

resource "aws_route_table" "public" {
    vpc_id = aws_vpc.main.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.main.id
    }

    tags = {
        Name        = "${var.environment}-public-route-table"
        Environment = var.environment
    }
}

resource "aws_route_table_association" "public" {
    subnet_id       = aws_subnet.public.id
    route_table_id  = aws_route_table.public.id
}

# The private route table intentionally does not include an internet route.
# This reduces exposure and follows least privilege by only allowing
# internal VPC communication unless additional connectivity is required.
resource "aws_route_table" "private" {
    vpc_id = aws_vpc.main.id

    tags = {
        Name        = "${var.environment}-private-route-table"
        Environment = var.environment
    }
}

resource "aws_route_table_association" "private" {
    subnet_id       = aws_subnet.private.id
    route_table_id  = aws_route_table.private.id
}