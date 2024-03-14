#!/bin/bash
# Define AWS S3 Bucket Name
bucket_name="your-bucket-name"
while getopts ":f:" opt; do
   case ${opt} in
       f )
           file_path=$OPTARG
           ;;
       \? )
           echo "Usage: $0 -f <file_path>"
           exit 1
           ;;
       : )
           echo "Invalid option: $OPTARG requires an argument"
           exit 1
           ;;
   esac
done
shift $((OPTIND -1))
# Check if file path is provided
if [ -z "$file_path" ]; then
   echo "Usage: $0 -f <file_path>"
   exit 1
fi
# Check if file exists
if [ ! -f "$file_path" ]; then
   echo "File not found: $file_path"
   exit 1
fi
# Upload file to S3
aws s3 cp "$file_path" "s3://$bucket_name/$(basename "$file_path")"
echo "File uploaded successfully to S3: s3://$bucket_name/$(basename "$file_path")"
