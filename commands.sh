# GOALS :
# (1) Create and manage infra deployment ( resources and dependencies ) to AWS
# (2) Verify deployment of infra repeatable



# Start the trigger of our SAM : local, onPremises development
# Create S3 bucket
aws s3 mb s3://hari-kagoshima-code-sam --region us-east-1

# Package local paths referenced by template to S3 bucket.
# Source code, artifacts, resources
aws cloudformation package --s3-bucket hari-kagoshima-code-sam --template-file template.yaml --output-template-file gen/template-generated.yaml

# Deploy infrastructure
# Gaaah @ need for IAM capabilities to create a changeset and then create/update CFT stacks.
# Latest code lang runtime to create or update lambda functions too.
aws cloudformation deploy --template-file gen/template-generated.yaml --stack-name hello-world-sam --capabilities CAPABILITY_IAM





