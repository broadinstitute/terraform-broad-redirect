billing_account = "00A539-93294F-AC9B6F"
cost_object     = "1550167"
folder_id       = "109901824533"
project         = "broad-redirect-prod"
project_name    = "Broad Redirects - Production"
region          = "us-east4"

http_redirects = {
  "broadinstitute-org" = {
    sites = {
      "amsn-broadinstitute-org" = {
        certificates = {
          "amsn.broadinstitute.org" = ["amsn.broadinstitute.org"]
        }
        default_destination_host = "docs.google.com"
        default_destination_path = "/forms/d/e/1FAIpQLSfe4gFX88fWZvM6CrdRonVdiVn7ZTq1YqhoLei1__vYunZUmg/viewform"
      },
      "artifactory-broadinstitute-org" = {
        certificates = {
          "artifactory.broadinstitute.org" = ["artifactory.broadinstitute.org"]
        }
        default_destination_host = "broadinstitute.jfrog.io"
        default_destination_path = "/"
      },
      "b2b-broadinstitute-org" = {
        certificates = {
          "b2b.broadinstitute.org" = ["b2b.broadinstitute.org", "epernicus.broadinstitute.org"]
        }
        default_destination_host = "intranet.broadinstitute.org"
        default_destination_path = "/work/whom-do-i-ask"
      },
      "bacteroidescyc-broadinstitute-org" = {
        certificates = {
          "bacteroidescyc.broadinstitute.org" = [
            "bacteroidescyc.broadinstitute.org",
            "enterocyc.broadinstitute.org",
            "fusocyc.broadinstitute.org",
            "rhodocyc.broadinstitute.org",
            "strepcyc.broadinstitute.org",
          ]
        }
        default_destination_host = "www.broadinstitute.org"
        default_destination_path = "/node/7965"
      },
      "cancergenome-broadinstitute-org" = {
        certificates = {
          "cancergenome.broadinstitute.org" = ["cancergenome.broadinstitute.org", "tumorportal.broadinstitute.org"]
        }
        default_destination_host = "www.tumorportal.org"
        default_destination_path = "/"
      },
      "cga-broadinstitute-org" = {
        certificates = {
          "cga.broadinstitute.org" = ["cga.broadinstitute.org"]
        }
        default_destination_host = "broadinstitute.atlassian.net"
        default_destination_path = "/wiki/spaces/CGATools/overview"
      },
      "chembank-broadinstitute-org" = {
        certificates = {
          "chembank.broadinstitute.org" = ["chembank.broadinstitute.org"]
        }
        default_destination_host = "data.broadinstitute.org"
        default_destination_path = "/chembank/"
      },
      "clue-broadinstitute-org" = {
        certificates = {
          "clue.broadinstitute.org" = ["clue.broadinstitute.org"]
        }
        default_destination_host = "clue.io"
        default_destination_path = "/"
      },
      "intmail-broadinstitute-org" = {
        certificates = {
          "intmail.broadinstitute.org" = [
            "www.intmail.broadinstitute.org",
          ],
        }
      },
      "localmail-broadinstitute-org" = {
        certificates = {
          "localmail.broadinstitute.org" = [
            "www.localmail.broadinstitute.org",
          ],
        }
      },
      # INC0334193
      "people-broadinstitute-org" = {
        certificates = {
          "people.broadinstitute.org" = ["people.broadinstitute.org", "people-cloud.broadinstitute.org"],
        }
        default_destination_host = "www.myworkday.com"
        default_destination_path = "/broadinstitute/d/task/1422$2788.htmld"
      },
      # INC0330028
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
      "visitors-broadinstitute-org" = {
        certificates = {
          "visitors.broadinstitute.org" = ["visitors.broadinstitute.org", "www.visitors.broadinstitute.org"],
        }
      },
      "web-broadinstitute-org" = {
        certificates = {
          "web.broadinstitute.org" = ["web.broadinstitute.org", "www.web.broadinstitute.org"],
        }
      },
    },
  },
  "no-dns-auth" = {
    sites = {
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
      }
    },
    use_dns_authorizations = false
  },
  "other-domains" = {
    sites = {
      "apex-redirects" = {
        certificates = {
          "broad.dev"               = ["broad.dev", "www.broad.dev"],
          "broad.harvard.edu"       = ["broad.harvard.edu", "www.broad.harvard.edu"],
          "broad.im"                = ["broad.im", "www.broad.im"],
          "broad.institute"         = ["broad.institute", "www.broad.institute"],
          "broad.us"                = ["broad.us", "www.broad.us"],
          "broadapis.org"           = ["broadapis.org", "www.broadapis.org"],
          "broadapps.com"           = ["broadapps.com", "www.broadapps.com"],
          "broadapps.net"           = ["broadapps.net", "www.broadapps.net"],
          "broadapps.org"           = ["broadapps.org", "www.broadapps.org"],
          "broadinstitute.com"      = ["broadinstitute.com", "www.broadinstitute.com"],
          "broadinstitute.info"     = ["broadinstitute.info", "www.broadinstitute.info"],
          "broadinstitute.mobi"     = ["broadinstitute.mobi", "www.broadinstitute.mobi"]
          "broadinstitute.net"      = ["broadinstitute.net", "www.broadinstitute.net"],
          "broadinstitute.org"      = ["broadinstitute.org"]
          "broadinstitute.tv"       = ["broadinstitute.tv", "www.broadinstitute.tv"],
          "broadinstitute.us"       = ["broadinstitute.us", "www.broadinstitute.us"],
          "test.broadinstitute.com" = ["test.broadinstitute.com", "www.test.broadinstitute.com"],
          "test.broadinstitute.net" = ["test.broadinstitute.net", "www.test.broadinstitute.net"],
          "test.broadinstitute.org" = ["test.broadinstitute.org", "www.test.broadinstitute.org"],
          "test.broadinstitute.us"  = ["test.broadinstitute.us", "www.test.broadinstitute.us"],
          "thebroadinstitute.com"   = ["thebroadinstitute.com", "www.thebroadinstitute.com"],
          "thebroadinstitute.info"  = ["thebroadinstitute.info", "www.thebroadinstitute.info"],
          "thebroadinstitute.net"   = ["thebroadinstitute.net", "www.thebroadinstitute.net"],
          "thebroadinstitute.org"   = ["thebroadinstitute.org", "www.thebroadinstitute.org"],
          "thebroadinstitute.us"    = ["thebroadinstitute.us", "www.thebroadinstitute.us"],
        }
        default_redirect_response_code = "TEMPORARY_REDIRECT"
        redirects = [
          {
            destination_host = "www.broadinstitute.org"
            source_paths     = ["/*"]
          },
        ]
      },
      "blog-cellprofiler-org" = {
        certificates = {
          "blog.cellprofiler.org" = ["blog.cellprofiler.org"],
        }
        default_destination_host = "carpenter-singh-lab.broadinstitute.org"
        default_destination_path = "/blog/"
      },
    },
  },
  "port-3838" = {
    http_port_range = "3838"
    sites = {
      # INC0330028
      "prot-shiny-vm-broadinstitute-org" = {
        certificates = {
          "prot-shiny-vm.broadinstitute.org" = ["prot-shiny-vm.broadinstitute.org"]
        }
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
    },
  },
}
