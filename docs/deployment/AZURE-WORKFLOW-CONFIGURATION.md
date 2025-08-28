# 🔧 Azure Workflow Configuration Guide

## 🎯 Problem: Azure Portal Auto-Generated Workflows Need Monorepo Fix

When you set up CI/CD via **Azure Portal > Deployment Center**, Azure generates workflows that assume a single-project repository. Since Fabrikam is a **monorepo** with multiple projects, these workflows need minor adjustments.

**✅ Key Benefit**: Azure automatically configures all secrets, service principals, and authentication for you - this is valuable and should be preserved!

## 🚀 **Recommended Workshop Approach**

### **Step 1: Let Azure Create Workflows (Keep the Secrets!)**

In Azure Portal > Deployment Center:
- ✅ **Choose "GitHub Actions"** as deployment method
- ✅ **Let Azure generate workflows** (don't use existing ones)
- ✅ **Azure automatically sets up**: Service principals, secrets, authentication

**Why this matters**: Azure handles all the complex authentication setup that would otherwise require manual GitHub secrets configuration.

### **Step 2: Fix the Monorepo Structure**

After Azure creates the workflows, run our automated fix:

```powershell
# After Azure generates workflows, fix them for monorepo
.\scripts\Fix-AzureWorkflows.ps1
```

This keeps all Azure's authentication benefits while fixing the project paths.

## ⚡ **Quick Fix Options**

### **Option 1: Automated Script (Recommended for Workshops)**

**Best for workshops**: Let Azure generate workflows first, then fix them automatically.

```powershell
# After Azure Portal creates workflows, run:
.\scripts\Fix-AzureWorkflows.ps1

# Or preview changes first:
.\scripts\Fix-AzureWorkflows.ps1 -WhatIf
```

**What it does:**
- ✅ Preserves all Azure-configured secrets and authentication
- ✅ Fixes `dotnet publish` commands to specify correct project paths
- ✅ Updates `dotnet build` to use the solution file
- ✅ Creates backups before making changes
- ✅ Works for both API and MCP services

### **Option 2: Use Pre-Built Templates (Advanced Users)**

**Only for advanced scenarios**: Requires manual secret configuration.

```powershell
# Copy API deployment template
cp .github/workflow-templates/fabrikam-api-deployment.yml .github/workflows/

# Copy MCP deployment template  
cp .github/workflow-templates/fabrikam-mcp-deployment.yml .github/workflows/
```

⚠️ **Manual setup required**: You'll need to configure GitHub secrets manually:
- `AZUREAPPSERVICE_CLIENTID_*`
- `AZUREAPPSERVICE_TENANTID_*` 
- `AZUREAPPSERVICE_SUBSCRIPTIONID_*`

### **Option 3: Manual Fix**

If you prefer manual editing, make these specific changes:

#### **For API Workflow** (`main_fabrikam-api-development-*.yml`):
```diff
- run: dotnet publish -c Release -o ${{env.DOTNET_ROOT}}/myapp
+ run: dotnet publish FabrikamApi/src/FabrikamApi.csproj -c Release -o ${{env.DOTNET_ROOT}}/myapp
```

#### **For MCP Workflow** (`main_fabrikam-mcp-development-*.yml`):
```diff
- run: dotnet publish -c Release -o ${{env.DOTNET_ROOT}}/myapp
+ run: dotnet publish FabrikamMcp/src/FabrikamMcp.csproj -c Release -o ${{env.DOTNET_ROOT}}/myapp
```

## 🎪 **Workshop Recommendation**

**For workshops and demos, always use Option 1 (Let Azure Generate + Auto Fix)** because:

### ✅ **Azure Benefits You Keep:**
- **Automatic secrets**: Service principal credentials configured automatically
- **GitHub integration**: Azure has permission to create secrets in your repository
- **Authentication setup**: Complex OIDC/service principal setup handled for you
- **Environment-specific**: Unique credentials for each deployment

### ✅ **Script Benefits You Get:**
- **Monorepo compatibility**: Projects build and deploy correctly
- **One command**: `.\scripts\Fix-AzureWorkflows.ps1` fixes everything
- **Safe changes**: Backups created automatically
- **Educational**: Shows automation best practices

### ❌ **Why Not Pre-Built Templates for Workshops:**
- **Manual secrets setup**: Participants would need to configure GitHub secrets manually
- **Service principal creation**: Complex Azure AD app registration required
- **Authentication complexity**: Time-consuming setup that reduces workshop focus
- **Error-prone**: Higher chance of configuration mistakes

## 🔄 **Complete Workshop Process**

**Recommended sequence for workshop participants:**

1. **Fork the repository** to your GitHub account
2. **Create Azure resources** (App Services for API and MCP)
3. **Set up CI/CD** via Azure Portal > Deployment Center
   - Choose "GitHub Actions" 
   - **Let Azure generate new workflows** (don't use existing)
   - Azure automatically configures all secrets and authentication
4. **Wait for workflows** to appear in `.github/workflows/`
5. **Run the fix script**: `.\scripts\Fix-AzureWorkflows.ps1`
6. **Test deployment** by pushing a change to main branch

**Result**: Participants get fully working CI/CD with minimal manual configuration!

## ⚠️ **Common Issues & Solutions**

### **Issue**: Script reports "No workflow files found"
**Solution**: Make sure you've completed Azure Portal setup and workflows exist in `.github/workflows/`

### **Issue**: Build fails with "project not found"
**Solution**: Verify the script ran successfully and check the `dotnet publish` line includes the full project path

### **Issue**: Deployment succeeds but app doesn't work
**Solution**: Check that both API and MCP services are deployed and configured correctly

## 🎯 **Future Enhancement Ideas**

If we want to eliminate this step entirely in future versions:

1. **Custom Azure Resource Manager template** that creates workflows with correct paths
2. **GitHub Action for repository setup** that users can run once
3. **Integration with Azure DevOps** instead of GitHub Actions
4. **Custom deployment center experience** through Azure CLI

For now, the automated script provides the best balance of simplicity and reliability for workshop scenarios.
