resource "kind_cluster" "play" {
  name            = "play"
  kubeconfig_path = "${path.module}/.kubeconfig"
  wait_for_ready  = true
}
