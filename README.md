# Project41225.Infrastructure

This repository contains Bicep templates for deploying Azure infrastructure.

## Environments

- **dev**: Deploys `rg-use-project41225-dev` resource group at the subscription level.

## Structure

- `main.bicep`: Entry point for deploying a resource group.
- `environments/`: Parameter files per environment.

## Deployment

```powershell
./deploy.ps1 -Environment dev
```
