## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 4.0 |
| <a name="requirement_local"></a> [local](#requirement\_local) | >= 1.4.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 4.0 |
| <a name="provider_local"></a> [local](#provider\_local) | >= 1.4.0 |
| <a name="provider_random"></a> [random](#provider\_random) | >= 3.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gcp-project"></a> [gcp-project](#module\_gcp-project) | ../../modules/gcp-project | n/a |

## Resources

| Name | Type |
|------|------|
| [google_iam_workload_identity_pool.oidc_wi_pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_workload_identity_pool) | resource |
| [google_iam_workload_identity_pool_provider.github_actions_oidc_provider](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_workload_identity_pool_provider) | resource |
| [google_project_iam_member.iam_bindings](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_service_account.port_service_account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_service_account_iam_binding.oidc-sa-token-role](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account_iam_binding) | resource |
| [google_service_account_iam_binding.oidc-wi-user-role](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account_iam_binding) | resource |
| [google_storage_bucket.terraform_state](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |
| [random_string.random](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [local_file.yaml_file](https://registry.terraform.io/providers/hashicorp/local/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gcp_billing_account_id"></a> [gcp\_billing\_account\_id](#input\_gcp\_billing\_account\_id) | The billing account ID | `string` | n/a | yes |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | The region to deploy resources | `string` | `"europe-west1"` | no |
| <a name="input_oidc_provider_principalSet"></a> [oidc\_provider\_principalSet](#input\_oidc\_provider\_principalSet) | The OIDC provider principalSet | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_project-id"></a> [project-id](#output\_project-id) | n/a |
| <a name="output_tf-state-bucket-name"></a> [tf-state-bucket-name](#output\_tf-state-bucket-name) | n/a |
