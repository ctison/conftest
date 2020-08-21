package main

warn_deployment_service_account[msg] {
  deployment = input[_][_]
  deployment.kind == "Deployment"
  pod_spec_service_account[ret] with input as deployment.spec.template.spec
  msg = sprintf("Deployment %q: %s", [deployment.metadata.name, ret])
}