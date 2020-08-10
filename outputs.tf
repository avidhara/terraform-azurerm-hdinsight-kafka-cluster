output "id" {
  description = " The ID of the HDInsight Kafka Cluster."
  value       = azurerm_hdinsight_kafka_cluster.this.id
}


output "https_endpoint" {
  description = "The HTTPS Connectivity Endpoint for this HDInsight Kafka Cluster."
  value       = azurerm_hdinsight_kafka_cluster.this.https_endpoint
}


output "ssh_endpoint" {
  description = "The SSH Connectivity Endpoint for this HDInsight Kafka Cluster."
  value       = azurerm_hdinsight_kafka_cluster.this.ssh_endpoint
}
