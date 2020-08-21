package main

test_warn_pod_service_account {
  warn_pod_service_account[msg] with input as {"-": [{
    "kind": "Pod",
    "metadata": {
      "name": "test"
    },
    "spec": {
      "serviceAccount": "default"
    }
  }]}
  is_string(msg)
}