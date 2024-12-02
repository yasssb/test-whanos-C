#!/bin/bash

APP_DIR="./whanos-app"
DOCKER_REGISTRY="us-central1-docker.pkg.dev/whanos-443406/whanos"
APP_NAME="whanos-app"


echo "Building Docker image..."
docker build -t "$DOCKER_REGISTRY/$APP_NAME:latest" "$APP_DIR"
if [ $? -ne 0 ]; then
    echo "Error: Docker build failed."
    exit 1
fi

echo "Authenticating with Google Artifact Registry..."
gcloud auth configure-docker
if [ $? -ne 0 ]; then
    echo "Error: Failed to authenticate with Google Artifact Registry."
    exit 1
fi

echo "Pushing Docker image to Artifact Registry..."
docker push "$DOCKER_REGISTRY/$APP_NAME:latest"
if [ $? -ne 0 ]; then
    echo "Error: Failed to push Docker image."
    exit 1
fi

echo "Docker image successfully built and pushed to $DOCKER_REGISTRY/$APP_NAME:latest."
