global_settings = {
  default_region = "region1"
  regions = {
    region1 = "southeastasia"
  }
}

resource_groups = {
  kv_region1 = {
    name = "example-rg1"
  }
}

keyvaults = {
  cert_secrets = {
    name                = "certsecrets"
    resource_group_key  = "kv_region1"
    sku_name            = "standard"
    soft_delete_enabled = true
        
  }
}

keyvault_certificate_issuers = {
  kv_cert_issuer = {
    issuer_name = "DummyIssuer"
    provider_name = "DigiCert"
    organization_id = "ExampleOrg"
    account_id = "0000"
    resource_group_key = "kv_region1"
    keyvault_key       = "cert_secrets"

    admin_settings = {
      admin1 = {
        first_name              = "cert-admin1"
        last_name               = "cert-admin1-last-name"
        email_address           = "email1@domain"
        phone_number            = "00000000"
      } #remove the following block if additional adminss aren't needed.
      admin2 = {
        first_name              = "cert-admin2"
        last_name               = "cert-admin2-last-name"
        email_address           = "email2@domain"
        phone_number            = "00000001"
      }
    } #add more admins by repeating the block.
  
  }
}

keyvault_access_policies = {
  # A maximum of 16 access policies per keyvault
  cert_secrets = {
    logged_in_user = {
      certificate_permissions = ["Get", "List", "Update", "Create", "Import", "Delete", "Purge", "Recover", "getissuers", "setissuers", "listissuers", "deleteissuers", "manageissuers", "Restore", "Managecontacts"]
    }
  }
}
