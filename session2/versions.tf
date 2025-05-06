terraform {
  required_version = "~> 1.11.0" // Terraform Version
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.96.0"
    }
  }
}

// ~> = Lazy Constraints 

// Sementic Versioning 
// 1.11.4 =
// 1 = magor  (upgrade) = breaking changes 
// 11 = minor (update) = feature gets added 
// 4 = patch (pathc) = fix bugs, vulnerabilities
