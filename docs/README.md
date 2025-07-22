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

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.12 |
| <a name="requirement_google"></a> [google](#requirement\_google) | 6.44.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 6.44.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_domain_redirects"></a> [domain\_redirects](#module\_domain\_redirects) | github.com/broadinstitute/terraform-google-domain-redirect | multihost |
| <a name="module_path_redirects"></a> [path\_redirects](#module\_path\_redirects) | ../modules/terraform-google-url-redirects | n/a |

## Resources

| Name | Type |
|------|------|
| [google_project.redirects](https://registry.terraform.io/providers/hashicorp/google/6.44.0/docs/resources/project) | resource |
| [google_project_iam_policy.broad_redirect](https://registry.terraform.io/providers/hashicorp/google/6.44.0/docs/resources/project_iam_policy) | resource |
| [google_project_service.api_services](https://registry.terraform.io/providers/hashicorp/google/6.44.0/docs/resources/project_service) | resource |
| [google_resource_manager_lien.redirects](https://registry.terraform.io/providers/hashicorp/google/6.44.0/docs/resources/resource_manager_lien) | resource |
| [google_iam_policy.admin](https://registry.terraform.io/providers/hashicorp/google/6.44.0/docs/data-sources/iam_policy) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | The billing account used by the project | `string` | n/a | yes |
| <a name="input_cost_object"></a> [cost\_object](#input\_cost\_object) | The cost object that pays for the project | `string` | n/a | yes |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | The ID for the folder in which the project should reside | `string` | n/a | yes |
| <a name="input_path_redirects"></a> [path\_redirects](#input\_path\_redirects) | The map of redirects to apply to the path under the hostname. | <pre>map(object({<br/>    default_destination_host = optional(string, "www.broadinstitute.org")<br/>    default_destination_path = optional(string, "/")<br/>    hostnames                = list(string)<br/>    redirects = list(object({<br/>      destination_host       = string<br/>      destination_path       = string<br/>      redirect_response_code = optional(string, "MOVED_PERMANENTLY_DEFAULT")<br/>      source_paths           = list(string)<br/>    }))<br/>  }))</pre> | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | The project ID used for this project | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The descriptive name for the project | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The deployment region | `string` | n/a | yes |
| <a name="input_api_services"></a> [api\_services](#input\_api\_services) | The billing account used by the project | `list(any)` | <pre>[<br/>  "compute.googleapis.com"<br/>]</pre> | no |
| <a name="input_domain_redirects"></a> [domain\_redirects](#input\_domain\_redirects) | The data used to create all the domain-level redirects | <pre>map(object({<br/>    redirect       = string<br/>    hostname       = list(string)<br/>    https_redirect = bool<br/>  }))</pre> | `{}` | no |

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
