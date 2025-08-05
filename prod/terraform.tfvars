billing_account = "00A539-93294F-AC9B6F"
cost_object     = "1550167"
folder_id       = "109901824533"
project         = "broad-redirect-prod"
project_name    = "Broad Redirects - Production"
region          = "us-east4"

http_redirects = {
  # The following domains are misspellings of broadinstitute.org
  "broadinstitute-misspell" = {
    certificates = {
      "broadinsitute.org"      = ["broadinsitute.org", "www.broadinsitute.org"],
      "broadinstittute.org"    = ["broadinstittute.org", "www.broadinstittute.org"],
      "broadinstitute-mit.org" = ["broadinstitute-mit.org", "www.broadinstitute-mit.org"],
      "broadintitute.com"      = ["broadintitute.com", "www.broadintitute.com"],
      "broadintitute.org"      = ["broadintitute.org", "www.broadintitute.org"],
      "broadlinstitute.com"    = ["broadlinstitute.com", "www.broadlinstitute.com"],
      "broadlinstitute.net"    = ["broadlinstitute.net", "www.broadlinstitute.net"],
      "broadlinstitute.org"    = ["broadlinstitute.org", "www.broadlinstitute.org"],
      "broadlnstitute.com"     = ["broadlnstitute.com", "www.broadlnstitute.com"],
      "broadlnstitute.net"     = ["broadlnstitute.net", "www.broadlnstitute.net"],
      "broadlnstitute.org"     = ["broadlnstitute.org", "www.broadlnstitute.org"],
      "broadlntitute.com"      = ["broadlntitute.com", "www.broadlntitute.com"],
      "broadlntitute.org"      = ["broadlntitute.org", "www.broadlntitute.org"],
      "broadnstitute.org"      = ["broadnstitute.org", "www.broadnstitute.org"],
    }
    redirects              = []
    use_dns_authorizations = false
  }
  "broadinstitute-org" = {
    certificates = {
      "broadinstitute.mobi" = ["broadinstitute.mobi", "www.broadinstitute.mobi"]
      "broadinstitute.org"  = ["broadinstitute.org"]
      # The following domains are Broad domains that should redirect to www.broadinstitute.org
      # "broad.dev",
      # "broad.im",
      # "broad.institute",
      # "broad.us",
      # "broadapis.org",
      # "broadapps.com",
      # "broadapps.net",
      # "broadapps.org",
      # "broadinstitute.com",
      # "broadinstitute.info",
      # "broadinstitute.net",
      # "broadinstitute.tv",
      # "broadinstitute.us",
      # "redirect.broadinstitute.org",
      # "test.broadinstitute.com",
      # "test.broadinstitute.net",
      # "test.broadinstitute.org",
      # "thebroadinstitute.com",
      # "thebroadinstitute.info",
      # "thebroadinstitute.net",
      # "thebroadinstitute.org",
      # "thebroadinstitute.us",
    }
    default_redirect_response_code = "TEMPORARY_REDIRECT"
    redirects                      = []
  },
  "proteomics-broadapps-org" = {
    certificates = {
      "proteomics.broadapps.org" = ["proteomics.broadapps.org"]
    }
    redirects = [
      {
        destination_host = "proteogenomics.shinyapps.io"
        destination_path = "/cptac-LSCC2021-viewer/"
        source_paths     = ["/CPTAC-LSCC2021", "/CPTAC-LSCC2021/"]
      },
      {
        destination_host = "proteogenomics.shinyapps.io"
        destination_path = "/cptac-MONTE2022-viewer/"
        source_paths     = ["/CPTAC-MONTE2022", "/CPTAC-MONTE2022/"]
      },
      {
        destination_host = "proteogenomics.shinyapps.io"
        destination_path = "/ptmsigdb/"
        source_paths     = ["/ptmsigdb", "/ptmsigdb/"]
      }
    ]
  },
  # INC0330028
  "prot-shiny-vm-broadinstitute-org" = {
    certificates = {
      "prot-shiny-vm.broadinstitute.org" = ["prot-shiny-vm.broadinstitute.org"]
    }
    http_port_range = "3838"
    redirects = [
      {
        destination_host = "proteogenomics.shinyapps.io"
        destination_path = "/cptac-BRCA2016-viewer/"
        source_paths     = ["/BC2016", "/BC2016/"]
      },
      {
        destination_host = "proteogenomics.shinyapps.io"
        destination_path = "/cptac-BKM120-viewer/"
        source_paths     = ["/BKM120", "/BKM120/"]
      },
      {
        destination_host = "proteogenomics.shinyapps.io"
        destination_path = "/cptac-BRCA2020-viewer/"
        source_paths     = ["/CPTAC-BRCA2020", "/CPTAC-BRCA2020/"]
      },
      {
        destination_host = "proteogenomics.shinyapps.io"
        destination_path = "cptac-LUAD2020-viewer/"
        source_paths     = ["/CPTAC-LUAD2020", "/CPTAC-LUAD2020/"]
      },
    ]
  },
}
