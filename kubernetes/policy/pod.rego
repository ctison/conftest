package main

pod_spec_service_account[msg] {
  input.serviceAccount
  msg = "serviceAccount is deprecated, use serviceAccountName instead."
}

warn_pod_service_account[msg] {
  pod = input[_][_]
  pod.kind == "Pod"
  pod_spec_service_account[ret] with input as pod.spec
  msg = sprintf("Pod %q: %s", [pod.metadata.name, ret])
}