data "aws_iam_policy_document" "github_actions_trust" {
  statement {
    effect = "Allow"
    principals {
      type        = "Federated"
      identifiers = [aws_iam_openid_connect_provider.github.arn]
    }
    actions = ["sts:AssumeRoleWithWebIdentity"]
    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:sub"
      values   = [
        "repo:${var.github_org}/${var.github_repo}:ref:refs/heads/main"
      ]
    }
  }
}

data "aws_caller_identity" "current" {}

resource "aws_iam_role" "github_actions" {
  name               = "GithubActionsRole"
  assume_role_policy = data.aws_iam_policy_document.github_actions_trust.json
}

resource "aws_iam_role_policy_attachment" "github_actions_attach" {
  for_each = toset([
    "AmazonEC2FullAccess",
    "AmazonRoute53FullAccess",
    "AmazonS3FullAccess",
    "IAMFullAccess",
    "AmazonVPCFullAccess",
    "AmazonSQSFullAccess",
    "AmazonEventBridgeFullAccess"
  ])
  role       = aws_iam_role.github_actions.name
  policy_arn = "arn:aws:iam::aws:policy/${each.value}"
}