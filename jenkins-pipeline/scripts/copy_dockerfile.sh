#!/bin/bash

APP_DIR="./whanos-app"
DOCKER_DIR="./images"

LANGUAGE=$(./detect_lang.sh)

echo "Detected language: $LANGUAGE"

if [ "$LANGUAGE" == "c" ]; then
    cp "$DOCKER_DIR/c/Dockerfile.standalone" "$APP_DIR/Dockerfile"
    echo "Copied Dockerfile for C."
elif [ "$LANGUAGE" == "java" ]; then
    cp "$DOCKER_DIR/java/Dockerfile.standalone" "$APP_DIR/Dockerfile"
    echo "Copied Dockerfile for Java."
elif [ "$LANGUAGE" == "javascript" ]; then
    cp "$DOCKER_DIR/javascript/Dockerfile.standalone" "$APP_DIR/Dockerfile"
    echo "Copied Dockerfile for JavaScript."
elif [ "$LANGUAGE" == "python" ]; then
    cp "$DOCKER_DIR/python/Dockerfile.standalone" "$APP_DIR/Dockerfile"
    echo "Copied Dockerfile for Python."
elif [ "$LANGUAGE" == "befunge" ]; then
    cp "$DOCKER_DIR/befunge/Dockerfile.standalone" "$APP_DIR/Dockerfile"
    echo "Copied Dockerfile for Befunge."
else
    echo "Unknown language. No Dockerfile copied."
fi