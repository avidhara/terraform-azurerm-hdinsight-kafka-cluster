resource "azurerm_storage_account" "this" {
  name                     = format("%s-hdinsightstor", var.name)
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "this" {
  name                  = "hdinsight"
  storage_account_name  = azurerm_storage_account.this.name
  container_access_type = "private"
}


resource "azurerm_hdinsight_kafka_cluster" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  cluster_version     = var.cluster_version
  tier                = var.tier

  min_tls_version = var.min_tls_version

  dynamic "component_version" {
    for_each = var.component_version
    content {
      kafka = lookup(component_version.value, "kafka")
    }
  }
  dynamic "gateway" {
    for_each = var.gateway
    content {
      enabled  = lookup(gateway.value, "enabled")
      username = lookup(gateway.value, "username")
      password = lookup(gateway.value, "password")
    }
  }
  storage_account {
    storage_container_id = azurerm_storage_container.this.id
    storage_account_key  = azurerm_storage_account.this.primary_access_key
    is_default           = true
  }
  # dynamic "storage_account" {
  #   for_each = var.storage_account
  #   content {
  #     storage_container_id = lookup(storage_account.value, "storage_container_id")
  #     storage_account_key = lookup(storage_account.value, "storage_account_key")
  #     is_default = lookup(storage_account.value, "is_default")
  #   }
  # }

  # dynamic "storage_account_gen2" {
  #   for_each = var.storage_account_gen2
  #   content {
  #     storage_resource_id  = lookup(storage_account_gen2.value, "storage_resource_id")
  #     filesystem_id  = lookup(storage_account_gen2.value, "filesystem_id ")
  #     managed_identity_resource_id  = lookup(storage_account_gen2.value, "managed_identity_resource_id ")
  #     is_default = lookup(storage_account_gen2.value, "is_default")
  #   }
  # }


  roles {
    head_node {
      vm_size            = var.head_node["vm_size"]
      username           = var.head_node["username"]
      password           = lookup(var.head_node, "password", null)
      ssh_keys           = lookup(var.head_node, "ssh_keys", null)
      subnet_id          = lookup(var.head_node, "subnet_id", null)
      virtual_network_id = lookup(var.head_node, "virtual_network_id", null)
    }
    worker_node {
      vm_size                  = var.worker_node["vm_size"]
      username                 = var.worker_node["username"]
      password                 = var.worker_node["password"]
      number_of_disks_per_node = var.worker_node["number_of_disks_per_node"]
      target_instance_count    = var.worker_node["target_instance_count"]
      ssh_keys                 = var.zookeeper_node["ssh_keys"]
      subnet_id                = var.zookeeper_node["subnet_id"]
      virtual_network_id       = var.zookeeper_node["virtual_network_id"]
    }

    zookeeper_node {
      vm_size            = var.zookeeper_node["vm_size"]
      username           = var.zookeeper_node["username"]
      password           = lookup(var.zookeeper_node, "password", null)
      sh_keys            = var.zookeeper_node["ssh_keys"]
      subnet_id          = var.zookeeper_node["subnet_id"]
      virtual_network_id = var.zookeeper_node["virtual_network_id"]
    }
  }

  dynamic "metastores" {
    for_each = length(keys(var.metastores)) == 0 ? [] : var.metastores
    content {

      dynamic "hive" {
        for_each = length(keys(lookup(metastores.value, "hive", {}))) == 0 ? [] : [lookup(metastores.value, "hive", {})]

        content {
          server        = lookup(hive.value, "server")
          database_name = lookup(hive.value, "database_name")
          username      = lookup(hive.value, "username")
          password      = lookup(hive.value, "password")
        }

      }


      dynamic "ambari" {
        for_each = length(keys(lookup(metastores.value, "ambari", {}))) == 0 ? [] : [lookup(metastores.value, "ambari", {})]

        content {
          server        = lookup(ambari.value, "server")
          database_name = lookup(ambari.value, "database_name")
          username      = lookup(ambari.value, "username")
          password      = lookup(ambari.value, "password")
        }

      }


      dynamic "oozie" {
        for_each = length(keys(lookup(metastores.value, "oozie", {}))) == 0 ? [] : [lookup(metastores.value, "oozie", {})]

        content {
          server        = lookup(oozie.value, "server")
          database_name = lookup(oozie.value, "database_name")
          username      = lookup(oozie.value, "username")
          password      = lookup(oozie.value, "password")
        }

      }
    }
  }

  dynamic "monitor" {
    for_each = length(keys(var.monitor)) == 0 ? [] : var.monitor
    content {
      log_analytics_workspace_id = lookup(monitor.value, "log_analytics_workspace_id")
      primary_key                = lookup(monitor.value, "primary_key")
    }
  }

  tags = var.tags
}

