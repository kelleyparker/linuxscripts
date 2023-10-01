#!/bin/bash

# A script I used to upload csr/jks files to AWS.  Be sure to check the variables:
# - zip_file
# - s3_bucket
# And check the /bin/aws cli command options

# Prompt for the suffix
read -p "Enter the suffix for the zip file name: " suffix

# Create a temporary directory
temp_dir=$(mktemp -d)

# Copy .jks and IssuedCert*.txt files to the temporary directory
cp *.jks "$temp_dir"
cp *.txt "$temp_dir"

# Create the zip file
zip_file="FOR_TRANSFER-$type.zip"
zip -r "$zip_file" "$temp_dir"

# Clean up temporary directory
rm -r "$temp_dir"

# Upload the zip file to S3
s3_bucket="s3://[]"
/bin/aws s3 --region [] cp "$zip_file" "$s3_bucket/$zip_file"

echo "File uploaded to $s3_bucket/$zip_file"
