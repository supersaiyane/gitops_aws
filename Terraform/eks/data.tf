# Get AWS Account ID
data "aws_caller_identity" "current" {}
output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

data "aws_iam_policy_document" "pfv3stage-PolicyELBPermissions"{
  
  statement {
      sid = "1"

      actions = [
          "elasticloadbalancing:Describe*",
      ]

      resources = [
        "*"
      ]
    }
  
  
  statement {
    sid = "2"

    actions = [
        "ec2:DescribeAccountAttributes",
        "ec2:DescribeAddresses",
        "ec2:DescribeInternetGateways"
    ]

    resources = [
      "*"
    ]
  }
}

data "aws_iam_policy_document" "pfv3stage-PolicyCloudWatchMetrics"{
  statement {
    sid = "1"

    actions = [
      "cloudwatch:PutMetricData",
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents",
        "logs:DescribeLogStreams"
    ]

    resources = [
      "*"
    ]
  }
}

data "aws_eks_cluster_auth" "cluster" {
  name = aws_eks_cluster.eks_cluster.id
}

# Datasource: AWS Partition
# Use this data source to lookup information about the current AWS partition in which Terraform is working
data "aws_partition" "current" {}
