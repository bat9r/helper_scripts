#!/usr/bin/env bash

for i in {1..120}:
do
    sleep 1
    status=$(kubectl get pod --namespace qa \
        | grep -o "jessica-integration-tests[A-Za-z0-9-]*[ ]*[0-9/]*[ ]*[A-Za-z]*" \
        | grep -o "[A-Za-z]*$")
    echo "$status"
    if [[ "$status" = "Running" ]]; then
        echo "run"
        exit 0
    else
        echo "waiting"
    fi
done
