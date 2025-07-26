plugin "aws" {
  enabled = true
  version = "0.29.0" # Optional: pin the version
  source  = "github.com/terraform-linters/tflint-ruleset-aws"
}

plugin "terraform" {
  enabled = true
}
