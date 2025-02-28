#!/bin/bash
INGRESS_HOST=$(kubectl get ingress opensearch-ingress -n opensearch -o jsonpath='{.status.loadBalancer.ingress[0].hostname}')

# Ensure JSON output
if [[ -z "$INGRESS_HOST" ]]; then
  echo "{\"output\": \"No Ingress Host Found\"}"
else
  echo "{\"output\": \"$INGRESS_HOST\"}"
fi


