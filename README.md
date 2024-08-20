# dbt-google-cloud-platform
Terraform resources to set up DBT on GCP

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 5.42.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_bigquery-dataset"></a> [bigquery-dataset](#module\_bigquery-dataset) | ./bigquery | n/a |
| <a name="module_gcp-project"></a> [gcp-project](#module\_gcp-project) | ./gcp-project | n/a |

## Resources

| Name | Type |
|------|------|
| [google_project_iam_member.dbt_service_account_role](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_service_account.dbt_service_account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_service_account_key.dbt_sa_key](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gcp_billing_account_id"></a> [gcp\_billing\_account\_id](#input\_gcp\_billing\_account\_id) | The billing account ID | `string` | n/a | yes |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | The region to deploy resources | `string` | `"europe-west1"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->