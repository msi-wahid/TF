# ------------------------------
# PROVIDER
# ------------------------------
provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}

provider "aws" {
  alias  = "ap_southeast_3"
  region = "ap-southeast-3"
}


# RESOURCE: Resource Link Database (Glue)
resource "aws_glue_catalog_database" "resource_link" {
  provider = aws.us_east_1
  name     = var.resource_link_name

  target_database {
    catalog_id    = var.target_database_catalog_id
    database_name = var.target_database_name
  }
}


#Grant Lake Formation Permissions
resource "aws_lakeformation_permissions" "grant_describe" {
  provider = aws.us_east_1
  permissions = ["DESCRIBE"]
  principal = var.saml_principal 
    
  database {
    name = aws_glue_catalog_database.resource_link.name
    }
}
