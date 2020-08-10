
variable "resource_group_name" {
  type        = string
  description = "(Required) Specifies the name of the Resource Group in which this HDInsight Kafka Cluster should exist. Changing this forces a new resource to be created."
}

variable "name" {
  type        = string
  description = "(Required) Specifies the name for this HDInsight Kafka Cluster. Changing this forces a new resource to be created."
  default     = "azure-kafka123"
}

variable "location" {
  type        = string
  description = " (Required) Specifies the Azure Region which this HDInsight Kafka Cluster should exist. Changing this forces a new resource to be created."
}

variable "cluster_version" {
  type        = string
  description = "(Required) Specifies the Version of HDInsights which should be used for this Cluster. Changing this forces a new resource to be created."
}
variable "component_version" {
  type        = map
  description = "A component_version block"
  default = {
    kafka = "2.1"
  }
}

variable "gateway" {
  type        = map
  description = "(Required) A gateway block"
  default = {
    enabled  = true
    username = "acctestusrgw"
    password = "TerrAform123!"
  }
}
variable "head_node" {
  type        = map
  description = "(Required) A Head_node block"
  default = {
    vm_size  = "Standard_D3_V2"
    username = "acctestusrvm"
    password = "AccTestvdSC4daf986!"
  }
}

variable "worker_node" {
  type        = map
  description = "(Required) A worker_node block"
  default = {
    vm_size                  = "Standard_D3_V2"
    username                 = "acctestusrvm"
    password                 = "AccTestvdSC4daf986!"
    number_of_disks_per_node = 3
    target_instance_count    = 3
  }
}

variable "zookeeper_node" {
  type        = map
  description = "(Required) A zookeeper_node block"
  default = {
    vm_size  = "Standard_D3_V2"
    username = "acctestusrvm"
    password = "AccTestvdSC4daf986!"
  }
}

variable "tier" {
  type        = string
  description = "(Required) Specifies the Tier which should be used for this HDInsight Kafka Cluster. Possible values are Standard or Premium. Changing this forces a new resource to be created"
  default     = "Standard"
}
variable "min_tls_version" {
  type        = string
  description = "(Optional) The minimal supported TLS version. Possible values are 1.0, 1.1 or 1.2. Changing this forces a new resource to be created."
  default     = "1.2"
}

variable "tags" {
  type        = map
  description = "(Optional) A map of Tags which should be assigned to this HDInsight Kafka Cluster."
  default = {

  }
}

variable "metastores" {
  type        = list
  description = "(Optional) A metastores block"
  default = [

  ]
}



variable "monitor" {
  type        = list
  description = " (Optional) A monitor block"
  default = [

  ]
}
