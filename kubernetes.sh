# function that waits for specific pod in the namespace to start
# arg1 - namespace
# arg2 - label of the pod we're waiting to be started
# an example:
# wait_pods cert-manager cert-manager
wait_pods () {
    while [ "$(kubectl -n $1 get pods -l=app=$2 -o jsonpath='{.items[*].status.containerStatuses[0].ready}')" != "true" ]; do
        sleep 5
        echo "Waiting for $1/$2 to be ready."
    done
}
