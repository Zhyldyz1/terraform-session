terraform {
  required_version = "~> 1.11.0" 
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.96.0"
    }
  }
}

# ~>= Lazy Constraints
// Semantic versioning
// 1.11.4
// 1- major (upgrade)- Breaking changes
// 11- minor (update)- Feauture gets added
// 4- patch (patching)- Fix bugs, vulnerabilities

# 1. Terrfarom version
# 2. Provider version
