#!/bin/bash

THRESHOLD=75

GCP_PROJECT=“<GCP_PROJECT>“
GCP_ZONE=“us-central2“
GCP_INSTANCE_NAME=“auto-scaled-vm-$(date +%s)“
GCP_MACHINE_TYPE="e2-medium"
GCP_IMAGE_FAMILY="debian-12"
GCP_IMAGE_PROJECT="debian-cloud"

CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')

echo "Current CPU Usage: $CPU_USAGE%"

if (( $(echo "$CPU_USAGE > $THRESHOLD" | bc -l) )); then
    echo "CPU usage exceeds threshold. Creating GCP VM..."

    gcloud auth activate-service-account —key-file=Downloads/sample_json.json
    gcloud compute instances create $GCP_INSTANCE_NAME \
        --project=$GCP_PROJECT \
        --zone=$GCP_ZONE \
        --machine-type=$GCP_MACHINE_TYPE \
        --image-family=$GCP_IMAGE_FAMILY \
        --image-project=$GCP_IMAGE_PROJECT \
        --boot-disk-size=10GB

    echo "GCP VM created: $GCP_INSTANCE_NAME"
else
    echo "CPU usage is within limits."
fi
