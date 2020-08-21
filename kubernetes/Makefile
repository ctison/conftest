.PHONY: test example bundle clean re
SHELL := bash -euo pipefail -O nullglob

test:
	conftest verify

example:
	kubectl kustomize example/ | conftest test --combine -

kubernetes.tar.gz: policy/*.rego
	cd policy && opa build --ignore '*_test.rego' -o ../$@ .

bundle: kubernetes.tar.gz

clean:
	rm kubernetes.tar.gz

re: clean bundle