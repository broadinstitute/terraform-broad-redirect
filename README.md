# terraform-broad-redirect

This is the base [Terraform][1] configuration to be used for the **broad-redirect-\*** projects.  This project also uses [Terragrunt][3] to make this configuration work for multiple projects that have the same configurations.

If you need to run [Terraform][1] for an environment locally, you first need to deal with [Terraform][1] state, which will be stored in a Google bucket (GCS).

Included in this repository is the `run.sh` script.  This script can be used to run the [alpine/terragrunt](https://hub.docker.com/r/alpine/terragrunt) [Docker][2] container with all the correct parameters to run [Terraform][1] or [Terragrunt][3] correctly.

## GCP setup

To run terraform, you will be running it as yourself in GCP.  To accomplish this, you will need to activate Application Default Credentials on your local `gcloud` installation.  More information can be found at [https://cloud.google.com/sdk/gcloud/reference/auth/application-default/login](https://cloud.google.com/sdk/gcloud/reference/auth/application-default/login)

## Running terragrunt

To run [Terragrunt][3], you should be in the [Terragrunt][3] container started using the `run.sh` script:

```sh
./run.sh bash
```

From there, you should change to the directory of the environment you want to [Terraform][1].  For example, to push out changes to the `dev` environment:

```sh
cd dev
terragrunt plan --out=planfile
terragrunt apply planfile
```

[1]: https://terraform.io/ "Terraform"
[2]: https://www.docker.com/ "Docker"
[3]: https://terragrunt.gruntwork.io/ "Terragrunt"
