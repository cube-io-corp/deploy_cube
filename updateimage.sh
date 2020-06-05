#!/bin/bash

# Usage: ./update_deployment.sh $TAG
# where $TAG is the container image tag to be deployed.
set -ex

NAMESPACE=cube
TAG=$1; shift
echo Updating deployment
kubectl -n $NAMESPACE set image deployment/cubews-mock-v1 cubews=cubeiocorp/cubews:$TAG --record
kubectl -n $NAMESPACE set image deployment/cubews-record-v1 cubews=cubeiocorp/cubews:$TAG --record
kubectl -n $NAMESPACE set image deployment/cubews-replay-v1 cubews=cubeiocorp/cubews:$TAG --record
