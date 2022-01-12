terraform {
  required_providers {
    kind = {
      source  = "kyma-incubator/kind"
      version = "~> 0.0.11"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.7"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.4"
    }

    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.15"
    }
  }
}

provider "kind" {}

provider "docker" {}

provider "kubernetes" {
  host                   = kind_cluster.play.endpoint
  client_certificate     = kind_cluster.play.client_certificate
  client_key             = kind_cluster.play.client_key
  cluster_ca_certificate = kind_cluster.play.cluster_ca_certificate
}

provider "helm" {
  kubernetes {
    host                   = kind_cluster.play.endpoint
    client_certificate     = kind_cluster.play.client_certificate
    client_key             = kind_cluster.play.client_key
    cluster_ca_certificate = kind_cluster.play.cluster_ca_certificate
  }
}
