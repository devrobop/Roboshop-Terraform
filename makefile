dev-apply:
    rm -rf .terraform
    terraform init -backend-config=env.dev/state.tfvars
    terraform apply -vars-file=env-dev/main.tfvars

dev-destroy:
    rm -rf .terraform
    terraform init -backend-config=env.dev/state.tfvars
    terraform apply -vars-file=env-dev/main.tfvars

prod-apply:
    rm -rf .terraform
    terraform init -backend-config=env.prod/state.tfvars
    terraform apply -vars-file=env-prod/main.tfvars

prod-destroy:
    rm -rf .terraform
    terraform init -backend-config=env.prod/state.tfvars
    terraform apply -vars-file=env-prod/main.tfvars