#!/usr/bin/env python3
"""Parse the JSON output from the gcloud command to retrieve DNS
authorizations from a project to create Terraform resources for use in the
broad-dns project.
"""

import argparse
from collections import defaultdict
import json
from string import Template
import sys


TEMPLATE = Template("""# DNS Auth for broad-redirect-prod
resource "google_dns_record_set" "acme_challenge_$resource_add$domain_name" {
  managed_zone = google_dns_managed_zone.$domain_name.name
  name         = "$record$${google_dns_managed_zone.$domain_name.dns_name}"
  rrdatas      = ["$rrdata"]
  ttl          = 300
  type         = "CNAME"
}
""")

def parse_arguments():
    """Parse command-line arguments using argparse"""
    docs = f"{__doc__}\n\ngcloud certificate-manager --project broad-redirect-prod dns-authorizations list --format json > filename.json"
    parser = argparse.ArgumentParser(description=docs, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument(
        "-f",
        "--filepath",
        help="The path to the JSON file to parse",
        required=True,
    )

    return parser.parse_args()


def main():
    args = parse_arguments()

    with open(args.filepath) as filep:
        auth = json.load(filep)

    domains = defaultdict(list)
    for domain in auth:
        tmp = domain["domain"].split(".")
        tld = f"{tmp[-2]}.{tmp[-1]}"
        domain_name = f"{tmp[-2]}_{tmp[-1]}"
        resource_add = "_".join(tmp[:-2])
        record = domain["dnsResourceRecord"]["name"].replace(f"{tld}.", "")
        if resource_add:
            resource_add += "_"
            resource_add = resource_add.replace("-", "_")
        rrdata = domain["dnsResourceRecord"]["data"]
        resource = TEMPLATE.substitute(
            domain_name=domain_name, tld=tld, record=record, resource_add=resource_add, rrdata=rrdata
        )
        filename = f"zone_{domain_name}.tf"
        domains[filename].append(resource)

    for filename, resources in domains.items():
        print(f"## {filename}")
        for resource in resources:
            print(resource)


if __name__ == "__main__":
    RET = main()
    sys.exit(RET)
