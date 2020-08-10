# Terraform Module for Azure hdinsight kafka cluster

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cluster\_version | (Required) Specifies the Version of HDInsights which should be used for this Cluster. Changing this forces a new resource to be created. | `string` | n/a | yes |
| component\_version | A component\_version block | `map` | <pre>{<br>  "kafka": "2.1"<br>}</pre> | no |
| gateway | (Required) A gateway block | `map` | <pre>{<br>  "enabled": true,<br>  "password": "TerrAform123!",<br>  "username": "acctestusrgw"<br>}</pre> | no |
| head\_node | (Required) A Head\_node block | `map` | <pre>{<br>  "password": "AccTestvdSC4daf986!",<br>  "username": "acctestusrvm",<br>  "vm_size": "Standard_D3_V2"<br>}</pre> | no |
| location | (Required) Specifies the Azure Region which this HDInsight Kafka Cluster should exist. Changing this forces a new resource to be created. | `string` | n/a | yes |
| metastores | (Optional) A metastores block | `list` | `[]` | no |
| min\_tls\_version | (Optional) The minimal supported TLS version. Possible values are 1.0, 1.1 or 1.2. Changing this forces a new resource to be created. | `string` | `"1.2"` | no |
| monitor | (Optional) A monitor block | `list` | `[]` | no |
| name | (Required) Specifies the name for this HDInsight Kafka Cluster. Changing this forces a new resource to be created. | `string` | `"azure-kafka123"` | no |
| resource\_group\_name | (Required) Specifies the name of the Resource Group in which this HDInsight Kafka Cluster should exist. Changing this forces a new resource to be created. | `string` | n/a | yes |
| tags | (Optional) A map of Tags which should be assigned to this HDInsight Kafka Cluster. | `map` | `{}` | no |
| tier | (Required) Specifies the Tier which should be used for this HDInsight Kafka Cluster. Possible values are Standard or Premium. Changing this forces a new resource to be created | `string` | `"Standard"` | no |
| worker\_node | (Required) A worker\_node block | `map` | <pre>{<br>  "number_of_disks_per_node": 3,<br>  "password": "AccTestvdSC4daf986!",<br>  "target_instance_count": 3,<br>  "username": "acctestusrvm",<br>  "vm_size": "Standard_D3_V2"<br>}</pre> | no |
| zookeeper\_node | (Required) A zookeeper\_node block | `map` | <pre>{<br>  "password": "AccTestvdSC4daf986!",<br>  "username": "acctestusrvm",<br>  "vm_size": "Standard_D3_V2"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| https\_endpoint | The HTTPS Connectivity Endpoint for this HDInsight Kafka Cluster. |
| id | The ID of the HDInsight Kafka Cluster. |
| ssh\_endpoint | The SSH Connectivity Endpoint for this HDInsight Kafka Cluster. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
