plugin "aws" {
  enabled = true
  version = "0.29.0" # Optional: lock to a version
  source  = "github.com/terraform-linters/tflint-ruleset-aws"
}

plugin "terraform" {
  enabled = true
}

config {
  deep_check = true
}
