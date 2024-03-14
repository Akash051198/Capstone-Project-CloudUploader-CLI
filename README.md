# Capstone-Project-CloudUploader-CLI
Capstone Project: CloudUploader CLI

########################################################
[5:53 PM] Prakash, Akash
Creating a CloudUploader CLI using AWS involves several steps, including setting up an AWS S3 bucket, configuring AWS CLI, writing a bash script for uploading files to S3, and creating a CLI interface for interacting with the script. Below are the full steps to accomplish this:

1. **Set up an AWS S3 Bucket:**

   - Log in to the AWS Management Console.

   - Navigate to the S3 service.

   - Create a new bucket, choosing a unique name and selecting the appropriate region.

   - Note down the bucket name as you'll need it for the script.

2. **Install and Configure AWS CLI:**

   - Install AWS CLI by following the instructions in the official documentation: [AWS CLI Installation](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html).

   - After installation, configure AWS CLI with your AWS credentials using `aws configure`.

   - Enter your Access Key ID, Secret Access Key, default region, and output format when prompted.

3. **Write Bash Script for Uploading Files:**

   - Create a new bash script file, let's say `upload_to_s3.sh`.

   - Open the file in a text editor and write the script. Below is an example script:

```bash

#!/bin/bash

# Define AWS S3 Bucket Name

bucket_name="your-bucket-name"

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

```

4. **Make the Script Executable:**

   - Make the script executable by running `chmod +x upload_to_s3.sh`.

5. **Testing the Script:**

   - Test the script by running it with a file path as an argument, for example: `./upload_to_s3.sh /path/to/your/file`.

6. **Create a CLI Interface:**

   - To make the CloudUploader CLI more user-friendly, you can create a simple CLI interface using `getopts` or other methods.

   - Below is a basic example of how you can modify the script to accept command-line options:

```bash

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

```

With this modification, users can now run the script like so: `./upload_to_s3.sh -f /path/to/your/file`.

That's it! You now have a CloudUploader CLI using AWS S3 and a bash script. You can extend this further by adding error handling, additional functionalities, or integrating it with other AWS services as per your requirements
Install or update to the latest version of the AWS CLI - AWS Command Line Interface
Instructions to install or update the AWS CLI on your system.
