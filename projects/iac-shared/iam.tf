
# Read the YAML file
data "local_file" "yaml_file" {
  filename = "${path.module}/iam.yaml"
}

locals {
  # Parse the YAML data
  yaml_data = yamldecode(data.local_file.yaml_file.content)

  # Flatten roles per member into a list of maps
  flattened_roles = flatten([
    for member in local.yaml_data["iam-bindings"] : [
      for role in member.roles : {
        member = member.member
        role   = role
      }
    ]
  ])

  # Convert the flattened roles into a map with unique keys
  test_map = {
    for item in local.flattened_roles :
    "${item.member}-${item.role}" => item
  }
}

# Create IAM bindings dynamically using the refactored structure
resource "google_project_iam_member" "iam_bindings" {
  for_each = local.test_map

  project = module.gcp-project.gcp_project_id
  role    = each.value.role
  member  = each.value.member
}
