## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_dbtcloud"></a> [dbtcloud](#requirement\_dbtcloud) | ~> 0.3 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 4.0 |
| <a name="requirement_local"></a> [local](#requirement\_local) | >= 1.4.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 6.14.1 |
| <a name="provider_local"></a> [local](#provider\_local) | 2.5.2 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.6.3 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_bigquery-dataset"></a> [bigquery-dataset](#module\_bigquery-dataset) | ../../modules/bigquery | n/a |
| <a name="module_gcp-project"></a> [gcp-project](#module\_gcp-project) | ../../modules/gcp-project | n/a |

## Resources

| Name | Type |
|------|------|
| [google_project_iam_member.iam_bindings](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_service_account.dbt_service_account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_storage_bucket.terraform_state](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |
| [random_string.random](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [local_file.yaml_file](https://registry.terraform.io/providers/hashicorp/local/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gcp_billing_account_id"></a> [gcp\_billing\_account\_id](#input\_gcp\_billing\_account\_id) | The billing account ID | `string` | n/a | yes |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | The region to deploy resources | `string` | `"europe-west1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_project-id"></a> [project-id](#output\_project-id) | n/a |
| <a name="output_tf-state-bucket-name"></a> [tf-state-bucket-name](#output\_tf-state-bucket-name) | n/a |
