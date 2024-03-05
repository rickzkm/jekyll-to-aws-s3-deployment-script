# My Jekyll Website AWS S3 Deployment Script

This repository contains a deployment script for the My Jekyll Website, simplifying the process of updating dependencies, building the website and deploying it onto AWS S3. The script automates the deployment workflow, including dependency updates and CloudFront cache invalidation, ensuring users receive the latest version of the website after deployment.

## Usage

1. Clone the repository:

    ```bash
    git clone https://github.com/empireelements/jekyllwebsite-deployment-script.git
    ```

2. Navigate to the repository directory:

    ```bash
    cd jekyllwebsite-deployment-script
    ```

3. Make sure you have the necessary prerequisites installed:

   - Git
   - Ruby
   - Bundler
   - Jekyll
   - AWS CLI

4. Modify the configuration variables in the script according to your environment:

    ```bash
    REPO_URL="https://github.com/myrepository/jekyllwebsite"
    BRANCH="main"
    S3_BUCKET="s3://jekyllwebsite.app"
    CF_DIST_ID="E63CYFDQYJCNF"
    WEBSITE_DIR="/path/to/jekyllwebsite/website"
    ```

5. Set the AWS access key ID and secret access key as environment variables:

    ```bash
    export AWS_ACCESS_KEY_ID="YOUR_AWS_ACCESS_KEY_ID"
    export AWS_SECRET_ACCESS_KEY="YOUR_AWS_SECRET_ACCESS_KEY"
    ```

6. Run the deployment script:

    ```bash
    ./deploy.sh
    ```

## Configuration

- `REPO_URL`: The URL of your Jekyll Website repository.
- `BRANCH`: The branch from which to fetch updates. For me it's the Main branch.
- `S3_BUCKET`: The S3 bucket where the website will be deployed.
- `CF_DIST_ID`: The CloudFront distribution ID for invalidation.
- `WEBSITE_DIR`: The directory where your Jekyll website is located.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
