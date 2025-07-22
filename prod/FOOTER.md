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
