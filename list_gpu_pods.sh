oc get pods --all-namespaces -o json | jq -r '.items[] | select(.spec.containers[]?.resources.requests? | has("nvidia.com/gpu")) | [.metadata.namespace, .metadata.name] | @tsv'
