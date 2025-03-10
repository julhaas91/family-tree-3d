#!/bin/bash
set -e

create() {
  BUCKET_NAME=$1
  if [ -z "$BUCKET_NAME" ]; then
    echo "Please provide a bucket name"
    exit 1
  fi

  echo "Creating the bucket..."
  gsutil mb gs://${BUCKET_NAME}

  echo "Making bucket publicly readable..."
  gsutil iam ch allUsers:objectViewer gs://${BUCKET_NAME}
  
  echo "Setting the bucket to host a static website..."
  gsutil web set -m index.html -e 404.html gs://${BUCKET_NAME}
  
  echo "Building the application..."
  gsutil -m cp -r ./dist/* gs://${BUCKET_NAME}/
  
  echo "Successfully created the cloud storage bucket and set it to host a static website!"
  echo "The website is available at: https://storage.googleapis.com/${BUCKET_NAME}/index.html"
}

update() {
  BUCKET_NAME=$1
  if [ -z "$BUCKET_NAME" ]; then
    echo "Please provide a bucket name"
    exit 1
  fi


  echo "Deleting all files from the bucket: ${BUCKET_NAME}..."
  gsutil -m rm -r gs://${BUCKET_NAME}/*

  echo "Building the application..."
  npm run build

  echo "Deploying the application to Google Cloud Storage..."
  gsutil -m cp -r ./dist/* gs://${BUCKET_NAME}/

  echo "Successfully built and deployed the application to Google Cloud Storage"
  echo "The website is available at: https://storage.googleapis.com/${BUCKET_NAME}/index.html"
}

show_url() {
  BUCKET_NAME=$1
  if [ -z "$BUCKET_NAME" ]; then
    echo "Please provide a bucket name"
    exit 1
  fi
  echo "The website is available at: https://storage.googleapis.com/${BUCKET_NAME}/index.html"
}

clean() {
  BUCKET_NAME=$1
  if [ -z "$BUCKET_NAME" ]; then
    echo "Please provide a bucket name"
    exit 1
  fi

  echo "Removing all files from the bucket..."
  gsutil -m rm -r gs://${BUCKET_NAME}/*
  echo "Successfully removed all files from the bucket"
}

help() {
  echo "Usage: ./taskfile.sh <bucket-name> [command]"
  echo "Commands:"
  echo "  create: Create the cloud storage bucket and set it to host a static website"
  echo "  update: Build and deploy the app to Google Cloud Storage"
  echo "  show_url: Show the URL of the hosted website"
  echo "  clean: Remove all files from the cloud storage bucket"
  echo "  help: Show this help message"
}

"${@:-help}"