variable "bigquery_configs" {
  description = "Configuration for BigQuery datasets and tables"
  type = map(object({
    dataset = object({
      dataset_id = string
      location   = string
    })
    tables = map(object({
      table_id = string
      schema   = list(object({
        name = string
        type = string
        mode = string
      }))
    }))
  }))
  default = {
    example_dataset = {
      dataset = {
        dataset_id = "example_dataset"
        location   = "US"
      }
      tables = {
        example_table = {
          table_id = "example_table"
          schema = [
            {
              name = "id"
              type = "STRING"
              mode = "REQUIRED"
            },
            {
              name = "value"
              type = "FLOAT"
              mode = "NULLABLE"
            }
          ]
        }
      }
    }
  }
}

variable "project_id" {
    description = "The GCP project ID"
    type        = string
}