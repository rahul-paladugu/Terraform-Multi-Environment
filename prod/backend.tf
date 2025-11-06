    bucket         = "terraform-tfvars-roboshop-prod"   # Replace with your S3 bucket name
    key            = "demo-remote-state-prod"          # Replace with your desired key/path
    region         = "us-east-1"                  # Replace with your AWS region
    encrypt        = true                         # Optional: Enable server-side encryption
    use_lockfile   = true   