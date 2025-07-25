billing_account = "00A539-93294F-AC9B6F"
cost_object     = "1550167"
folder_id       = "109901824533"
project         = "broad-redirect-prod"
project_name    = "Broad Redirects - Production"
region          = "us-east4"

http_redirects = {
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
  "broadinstitute-org" = {
    certificates                   = {
      "broadinstitute.mobi" = ["broadinstitute.mobi", "www.broadinstitute.mobi"]
      "broadinstitute.org"  = ["broadinstitute.org"]
    }
    default_redirect_response_code = "TEMPORARY_REDIRECT"
  #     # The following domains are misspellings of broadinstitute.org
  #     # "broadinsitute.org",
  #     # "broadinstittute.org",
  #     # "broadinstitute-mit.org",
  #     # "broadintitute.com",
  #     # "broadintitute.org",
  #     # "broadlinstitute.com",
  #     # "broadlinstitute.net",
  #     # "broadlinstitute.org",
  #     # "broadlnstitute.com",
  #     # "broadlnstitute.net",
  #     # "broadlnstitute.org",
  #     # "broadlntitute.org",
  #     # "broadnstitute.org",
  #     # The following domains are Broad domains that should redirect to www.broadinstitute.org
  #     # "broad.dev",
  #     # "broad.im",
  #     # "broad.institute",
  #     # "broad.us",
  #     # "broadapis.org",
  #     # "broadapps.com",
  #     # "broadapps.net",
  #     # "broadapps.org",
  #     # "broadinstitute.com",
  #     # "broadinstitute.info",
  #     # "broadinstitute.net",
  #     # "broadinstitute.tv",
  #     # "broadinstitute.us",
  #     # "redirect.broadinstitute.org",
  #     # "test.broadinstitute.com",
  #     # "test.broadinstitute.net",
  #     # "test.broadinstitute.org",
  #     # "thebroadinstitute.com",
  #     # "thebroadinstitute.info",
  #     # "thebroadinstitute.net",
  #     # "thebroadinstitute.org",
  #     # "thebroadinstitute.us",
    redirects      = []
  }
}
