# terraform-broad-redirect

This is the base [Terraform][1] configuration to be used for the
**broad-redirect-\*** projects. If you need to run [Terraform][1] for an
environment locally, you first need to deal with [Terraform][1] state, which
will be stored in a Google bucket (GCS).

## How to Use

This terraform config is designed to be run in a Atlantis CI/CD pipeline.
Atlantis is a tool that runs Terraform in response to GitHub pull requests.
Atlantis is configured to run this terraform config in the `atlantis.yaml` file.

## Changes

You will need to create a feature branch and open a pull request. Atlantis will
run the terraform plan and apply operations in response to the pull request.
Once the changes are approved, you can leave a comment of `atlantis apply`, and
Atlantis will apply the changes to the `prod` environment, and merge the branch
into `main`.

The process for making changes to this terraform config:

1. Create a feature branch off this repo for your changes
1. Make your changes to the terraform config
1. Create a PR into the `main` branch with your changes
1. Verify your changes look correct in the Terraform plans shown in the PR
1. Wait for approval from one of the [CODEOWNERS](.github/CODEOWNERS)
1. Once approved, run `atlantis apply` to apply the changes to the `prod`
   environment
1. Verify that the changes are working as expected in the `prod` environment
1. Verify that Atlantis merged the PR into the `main` branch
1. Delete your feature branch

## Dealing with Common Tasks

### Adding Certificates

When adding a certificate to an existing `http_redirects` section, or creating a
new section under `http_redirects` editing the file is relatively simple. The
key to each map is what the name of the certificate will be. The value of each
is a list of strings that represent the hostnames that will be created inside
that certificate. What happens behind the scenes is that each hostname gets a
DNS authorization created (if `use_dns_authorizations` is `true` for that
section).

If you need the certificate to be set up and working before you change DNS, you
will need to do some targetted [Terraform][1] applies before doing the main
apply. To do this you would run the following:

```Shell
terraform plan -out=planfile -target google_certificate_manager_dns_authorization.domains
```

This will create a plan that just create the DNS authorization resources in the
project. You can apply this as you normally would to create the resources.

```Shell
terraform apply planfile
```

You can then retrieve the authorization information you need using the following
`gcloud` command:

```Shell
gcloud certificate-manager --project broad-redirect-prod dns-authorizations list --format json
```

You then need to add CNAME records to your DNS system to match the hostnames you
just added to the certificate(s). This will provide the DNS authorization needed
when you apply the rest of the change so that the certificates all get created,
moved to `active` state, and linked to your redirect correctly so they can be
tested before you change any DNS records to have the hostnames point at the
redirect system.

### Adding, Removing or Changing a Hostname in a Certificate

If you add, remove, or change a hostname in an existing certificate, the plan
will succeed, but the apply will fail with an error from Google similar to:

```Text
Error: Error when reading or editing Certificate: googleapi: Error 400: can't delete certificate that is referenced by a CertificateMapEntry or other resources
```

This happens because if you change one or more hostnames in a certificate,
Google must destroy the first certificate and recreate it. Because that
certificate is attached to a map entry, you have a conflict.

To fix this, the easiest thing to do is taint the map entry for all entries in
[Terraform][1] that your certificate is attached to. That means tainting all map
entries for all hostnames except for the ones you are adding, removing, or
updating. If you do this, the next plan will remove the map entry first, then
remove the certificate, then it will create the new certificate and finally
recreate the map entry.

**Note: Removing the map entries will make all the hostnames in that certificate
stop responding until the entries are recreated, so note that this means
downtime for those hostnames. Use the instructions in
[Adding Certificates](#adding-certificates) to pre-create the resources.**

As an example, suppose you had a redirect entry as follows:

```HCL
"broadinstitute-test" = {
  certificates = {
    "example.org"      = ["example.org", "www.example.org"],
  }
  redirects              = []
}
```

Now, we want to add a new hostname `test.example.org` to this list:

```HCL
"broadinstitute-test" = {
  certificates = {
    "example.org"      = ["example.org", "test.example.org", "www.example.org"],
  }
  redirects              = []
}
```

This would cause the apply error.

**Note: Make sure all DNS authorizations are done prior to performing the next
steps so that the DNS entries are already in place for any new hostnames so that
the certificates get created as quickly as possible.**

To fix this, you can taing the two pre-existing map entries:

```Shell
terraform taint module.http_redirects["broadinstitute-test"].module.certificates.google_certificate_manager_certificate_map_entry.certificates["example.org"]
terraform taint module.http_redirects["broadinstitute-test"].module.certificates.google_certificate_manager_certificate_map_entry.certificates["www.example.org"]
```

Now, when you run another plan and apply, you should see that the map entries
will be removed, then recreated along with the new entry you just added.

<!-- BEGIN_TF_DOCS -->

## Requirements

| Name                                                                     | Version |
| ------------------------------------------------------------------------ | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.12 |
| <a name="requirement_google"></a> [google](#requirement_google)          | 6.44.0  |

## Providers

| Name                                                      | Version |
| --------------------------------------------------------- | ------- |
| <a name="provider_google"></a> [google](#provider_google) | 6.44.0  |

## Modules

| Name                                                                                | Source                                                     | Version   |
| ----------------------------------------------------------------------------------- | ---------------------------------------------------------- | --------- |
| <a name="module_domain_redirects"></a> [domain_redirects](#module_domain_redirects) | github.com/broadinstitute/terraform-google-domain-redirect | multihost |
| <a name="module_path_redirects"></a> [path_redirects](#module_path_redirects)       | ../modules/terraform-google-url-redirects                  | n/a       |

## Resources

| Name                                                                                                                                           | Type        |
| ---------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [google_project.redirects](https://registry.terraform.io/providers/hashicorp/google/6.44.0/docs/resources/project)                             | resource    |
| [google_project_iam_policy.broad_redirect](https://registry.terraform.io/providers/hashicorp/google/6.44.0/docs/resources/project_iam_policy)  | resource    |
| [google_project_service.api_services](https://registry.terraform.io/providers/hashicorp/google/6.44.0/docs/resources/project_service)          | resource    |
| [google_resource_manager_lien.redirects](https://registry.terraform.io/providers/hashicorp/google/6.44.0/docs/resources/resource_manager_lien) | resource    |
| [google_iam_policy.admin](https://registry.terraform.io/providers/hashicorp/google/6.44.0/docs/data-sources/iam_policy)                        | data source |

## Inputs

| Name                                                                              | Description                                                   | Type                                                                                                                                                                                                                                                                                                                                                                                                               | Default                                          | Required |
| --------------------------------------------------------------------------------- | ------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------ | :------: |
| <a name="input_billing_account"></a> [billing_account](#input_billing_account)    | The billing account used by the project                       | `string`                                                                                                                                                                                                                                                                                                                                                                                                           | n/a                                              |   yes    |
| <a name="input_cost_object"></a> [cost_object](#input_cost_object)                | The cost object that pays for the project                     | `string`                                                                                                                                                                                                                                                                                                                                                                                                           | n/a                                              |   yes    |
| <a name="input_folder_id"></a> [folder_id](#input_folder_id)                      | The ID for the folder in which the project should reside      | `string`                                                                                                                                                                                                                                                                                                                                                                                                           | n/a                                              |   yes    |
| <a name="input_path_redirects"></a> [path_redirects](#input_path_redirects)       | The map of redirects to apply to the path under the hostname. | <pre>map(object({<br/> default_destination_host = optional(string, "www.broadinstitute.org")<br/> default_destination_path = optional(string, "/")<br/> hostnames = list(string)<br/> redirects = list(object({<br/> destination_host = string<br/> destination_path = string<br/> redirect_response_code = optional(string, "MOVED_PERMANENTLY_DEFAULT")<br/> source_paths = list(string)<br/> }))<br/> }))</pre> | n/a                                              |   yes    |
| <a name="input_project"></a> [project](#input_project)                            | The project ID used for this project                          | `string`                                                                                                                                                                                                                                                                                                                                                                                                           | n/a                                              |   yes    |
| <a name="input_project_name"></a> [project_name](#input_project_name)             | The descriptive name for the project                          | `string`                                                                                                                                                                                                                                                                                                                                                                                                           | n/a                                              |   yes    |
| <a name="input_region"></a> [region](#input_region)                               | The deployment region                                         | `string`                                                                                                                                                                                                                                                                                                                                                                                                           | n/a                                              |   yes    |
| <a name="input_api_services"></a> [api_services](#input_api_services)             | The billing account used by the project                       | `list(any)`                                                                                                                                                                                                                                                                                                                                                                                                        | <pre>[<br/> "compute.googleapis.com"<br/>]</pre> |    no    |
| <a name="input_domain_redirects"></a> [domain_redirects](#input_domain_redirects) | The data used to create all the domain-level redirects        | <pre>map(object({<br/> redirect = string<br/> hostname = list(string)<br/> https_redirect = bool<br/> }))</pre>                                                                                                                                                                                                                                                                                                    | `{}`                                             |    no    |

## Outputs

No outputs.

## Terraform docs

[Terraform Docs](https://terraform-docs.io/) created by running:

```Shell
podman run --rm -u $(id -u) \
    --volume "$(pwd):/terraform-docs" \
    -w /terraform-docs \
    quay.io/terraform-docs/terraform-docs:latest \
    --output-file ../docs/README.md \
    --output-mode inject /terraform-docs/prod
```

Remember update the dependency lock file for different architectures:

```Shell
terraform providers lock \
    -platform=linux_amd64 \
    -platform=linux_arm64 \
    -platform=darwin_amd64 \
    -platform=darwin_arm64 \
    -platform=windows_amd64
```

[1]: https://terraform.io/ "Terraform"
[2]: https://www.docker.com/ "Docker"
[3]: https://terragrunt.gruntwork.io/ "Terragrunt"

<!-- END_TF_DOCS -->
