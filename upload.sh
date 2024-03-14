# Define AWS S3 Bucket Name
bucket_name="cliuploaderbash"

# Check if file path is provided
if [ $# -eq 0 ]; then
   echo "Usage: $0 <file_path>"
   exit 1
fi
file_path=$1


# Check if file exists
if [ ! -f "$file_path" ]; then
   echo "File not found: $file_path"
   exit 1
fi


# Upload file to S3
aws s3 cp "$file_path" "s3://$bucket_name/$(basename "$file_path")"
echo "File uploaded successfully to S3: s3://$bucket_name/$(basename "$file_path")"
