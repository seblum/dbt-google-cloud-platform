# dbt-google-cloud-platform
Terraform resources to set up DBT on GCP

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_dbtcloud"></a> [dbtcloud](#requirement\_dbtcloud) | ~> 0.3 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 4.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_bigquery-dataset"></a> [bigquery-dataset](#module\_bigquery-dataset) | ./bigquery | n/a |
| <a name="module_gcp-project"></a> [gcp-project](#module\_gcp-project) | ./gcp-project | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dbtcloud_account_id"></a> [dbtcloud\_account\_id](#input\_dbtcloud\_account\_id) | Account ID for dbt Cloud | `string` | n/a | yes |
| <a name="input_dbtcloud_token"></a> [dbtcloud\_token](#input\_dbtcloud\_token) | API token for dbt Cloud | `string` | n/a | yes |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | The region to deploy resources | `string` | `"europe-west1"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->