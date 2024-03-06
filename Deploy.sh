#!/bin/bash

# Configuration
REPO_URL="https://github.com/myrepository/jekyllwebsite"
BRANCH="main"
S3_BUCKET="s3://jekyllwebsite.app"
CF_DIST_ID="YOUR_CLOUDFRONT_ID"
WEBSITE_DIR="/Users/yourlocalname/Documents/GitHub/jekyllwebsiteapp/website"

# Set AWS access key ID and secret access key as environment variables
export AWS_ACCESS_KEY_ID="YOUR_AWS_ACCESS_KEY_ID"
export AWS_SECRET_ACCESS_KEY="YOUR_AWS_SECRET_ACCESS_KEY"

echo "Updating repository from $REPO_URL..."
cd ~/Documents/GitHub/jekyllwebsite/ || exit
git fetch && git reset --hard "origin/$BRANCH" || exit
# or maybe just "git fetch || exit" if you prefer
echo "Repository updated."

echo "Updating dependencies..."
cd "$WEBSITE_DIR" || exit
bundle update || exit
echo "Dependencies updated."

echo "Building website..."
JEKYLL_ENV=production bundle exec jekyll build || exit
echo "Website build complete."

echo "Deploying to S3 bucket $S3_BUCKET..."
aws s3 cp _site "$S3_BUCKET" --recursive --cache-control max-age=31536000 || exit
echo "Deployment to S3 complete."

echo "Invalidating CloudFront distribution $CF_DIST_ID..."
aws cloudfront create-invalidation --distribution-id "$CF_DIST_ID" --paths "/*" || exit
echo "CloudFront invalidation complete."

echo "Deployment successful!"
