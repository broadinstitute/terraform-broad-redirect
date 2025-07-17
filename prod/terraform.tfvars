billing_account = "00A539-93294F-AC9B6F"
cost_object     = "1550167"
folder_id       = "109901824533"
project         = "broad-redirect-prod"
project_name    = "Broad Redirects - Production"
region          = "us-east4"

domain_redirects = {
  www_broadinstitute_org = {
    redirect       = "www.broadinstitute.org"
    hostname       = ["www.broadinstitute.mobi", "broadinstitute.mobi"]
    https_redirect = true
  }
}

path_redirects = {
  "proteomics.broadapps.org" = {
    hostnames = ["proteomics.broadapps.org"]
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
}
