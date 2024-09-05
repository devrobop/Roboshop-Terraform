##  IAM for EKS


#  assume_role_policy = data.aws_iam_policy_document.assume_role.json
# rather than data policy we had taken different approach in line no 9

resource "aws_iam_role" "eks-cluster-role" {
  name               = "${var.env}-eks-cluster-role"
  assume_role_policy = jsonencode({
    version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "eks.amazonaws.com"  
        }
      }  
    ]
  })
}

resource "aws_iam_role_policy_attachment" "eks-cluster-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks-cluster.name
}

resource "aws_iam_role_policy_attachment" "eks-cluster-AmazonEKSVPCResourceController" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = aws_iam_role.eks-cluster.name
}