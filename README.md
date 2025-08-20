# Azure Resource Group Terraform Project

This Terraform project demonstrates how to deploy Azure Resource Groups using a modular approach. The project follows Terraform best practices and is structured for simplicity and maintainability.

## 📁 Project Structure

```
├── main.tf                    # Main Terraform configuration
├── variables.tf               # Variable definitions
├── terraform.tfvars.example   # Example variable values
├── deploy.sh                  # Deployment automation script
├── modules/                   # Terraform modules
│   └── resource-group/        # Resource Group module
│       ├── main.tf           # Module main configuration
│       ├── variables.tf      # Module variables
│       └── outputs.tf        # Module outputs
└── README.md                 # This file
```

## 🚀 Features

- **Modular Design**: Resource Group deployment using a reusable module
- **Simple and Clean**: Focused on just creating resource groups
- **Comprehensive Outputs**: Useful output values for integration with other tools
- **Automated Deployment**: Shell script for easy deployment

## 📋 Prerequisites

1. **Azure CLI** installed and authenticated
2. **Terraform** (version >= 1.0)
3. **Azure Subscription** with appropriate permissions

## 🔧 Setup Instructions

### 1. Clone and Navigate

```bash
git clone <repository-url>
cd terraform
```

### 2. Azure Authentication

```bash
# Login to Azure
az login

# Set your subscription (if you have multiple)
az account set --subscription "your-subscription-id"
```

### 3. Configure Variables

```bash
# Copy the example file
cp terraform.tfvars.example terraform.tfvars

# Edit the file with your values
nano terraform.tfvars
```

### 4. Initialize Terraform

```bash
terraform init
```

### 5. Plan and Deploy

```bash
# Plan the deployment
terraform plan

# Apply the configuration
terraform apply
```

## 🚀 Automated Deployment

Use the provided deployment script for easier management:

```bash
# Make the script executable
chmod +x deploy.sh

# Deploy with default terraform.tfvars
./deploy.sh

# Plan only
./deploy.sh -p

# Deploy with custom var file
./deploy.sh -f custom.tfvars

# Destroy resources
./deploy.sh -d
```

## 📝 Configuration Examples

### Basic Resource Group

```hcl
# In terraform.tfvars
resource_group_name = "rg-myproject"
location = "East US"

## 📊 Outputs

After successful deployment, Terraform will output:

- `resource_group_name`: Name of the deployed resource group
- `resource_group_id`: Resource ID of the resource group
- `resource_group_location`: Location of the resource group

## 🗂️ State Management

The project uses local state by default. For production, consider using remote state:

```hcl
# Add to main.tf
terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-state-rg"
    storage_account_name = "tfstate12345"
    container_name       = "tfstate"
    key                  = "resourcegroup.terraform.tfstate"
  }
}
```

### Azure Storage Backend Setup

```bash
# Create storage account for Terraform state
az group create --name terraform-state-rg --location eastus
az storage account create --name tfstate12345 --resource-group terraform-state-rg --sku Standard_LRS
az storage container create --name tfstate --account-name tfstate12345
```

## 🧹 Cleanup

To destroy all resources:

```bash
terraform destroy
```

Or use the deployment script:

```bash
./deploy.sh -d
```

## 🔄 Module Usage

The Resource Group module can be used independently:

```hcl
module "resource_group" {
  source = "./modules/resource-group"
  
  resource_group_name = "my-rg"
  location            = "East US" 
}
```

## 📋 Variable Reference

### Required Variables

- `resource_group_name`: Name of the resource group
- `location`: Azure region

### Optional Variables

## 🚨 Important Notes

1. **Resource Group Names**: Must be unique within your subscription
2. **Location**: Choose a region close to your users for better performance3. 
3. **State Management**: Use remote state for team collaboration

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test with `terraform plan`
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License.

## 🆘 Troubleshooting

### Common Issues

1. **Authentication Error**: Run `az login` and verify subscription
2. **Name Conflicts**: Ensure resource group name is unique within subscription
3. **Permission Errors**: Verify Azure role assignments
4. **Module Not Found**: Run `terraform init` to download modules

### Getting Help

- Check Azure documentation for Resource Groups
- Review Terraform Azure provider documentation
- Open an issue in the repository

---

**Happy Deploying!** 🚀
