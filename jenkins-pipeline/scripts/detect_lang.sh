#!/bin/bash

APP_DIR="./whanos-app"

echo "Detect App Language"


if [ -f "$APP_DIR/Makefile" ]; then
    echo "c"
elif [ -f "$APP_DIR/pom.xml" ]; then
    echo "java"
elif [ -f "$APP_DIR/package.json" ]; then
    echo "javascript"
elif [ -f "$APP_DIR/requirements.txt" ]; then
    echo "python"
elif [ -f "$APP_DIR/app/main.bf" ] && [ $(find "$app_dir/app/" -name "*.bf" | wc -l) -eq 1 ]; then
    echo "befunge"
else
    echo "unknown"
fi
