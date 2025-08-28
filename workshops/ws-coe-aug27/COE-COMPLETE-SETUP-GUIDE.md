# 🚀 COE Complete Setup Guide - From GitHub Account to Production Deployment

**Welcome to the COE Team! This guide will take you from zero to a fully deployed Fabrikam project with CI/CD in your own Azure environment.**

## 📋 Overview

This guide covers:
- ✅ Setting up a dedicated browser profile for clean authentication
- ✅ Initial Azure/Microsoft 365 login and MFA setup
- ✅ Creating a GitHub account (if needed)
- ✅ Forking the Fabrikam project
- ✅ Cloning your fork for local development (optional)
- ✅ Deploying to your Azure subscription
- ✅ Setting up automated CI/CD pipelines with automated workflow fixing
- ✅ Configuring authentication and testing

**⏱️ Estimated time: 25-35 minutes** *(Reduced due to automated workflow fixing)*

---

## 🔧 Prerequisites

Before starting, ensure you have:
- [ ] Your COE username (e.g., `imatest`, `chridep`, etc.)
- [ ] Access to the COE tenant: `fabrikam.cspsecurityaccelerate.com`
- [ ] Default password: `TempPassword123!` (you'll change this during setup)
- [ ] Web browser (Chrome, Edge, or Firefox recommended)

---

## 🌐 Step 1: Create Dedicated Browser Profile

**🎯 Goal**: Set up a clean browser environment to avoid authentication conflicts with your personal/work accounts.

### 1.1 Create New Browser Profile

**For Chrome:**
1. **Open Chrome** and click your profile icon (top-right)
2. **Click "Add"** → **"Add"** again
3. **Name**: Use your COE username (e.g., `imatest`, `chridep`)
4. **Choose an avatar** and click "Done"
5. **Chrome will open a new window** with your dedicated profile

**For Edge:**
1. **Open Edge** and click your profile icon (top-right)
2. **Click "Add profile"**
3. **Select "Add"** → **"Add without data"**
4. **Name**: Use your COE username (e.g., `imatest`, `chridep`)
5. **Choose a theme/avatar** and click "Confirm"
6. **Edge will open a new window** with your dedicated profile

**For Firefox:**
1. **Type in address bar**: `about:profiles`
2. **Click "Create a New Profile"**
3. **Click "Next"** → **Enter your COE username** → **"Finish"**
4. **Click "Launch profile in new browser"**

### 1.2 Initial Microsoft 365 / Azure Login

**🔑 This step establishes your identity in the COE tenant and sets up MFA**

1. **In your new browser profile**, go to: [portal.azure.com](https://portal.azure.com)

2. **Sign in with your COE credentials**:
   ```
   Email: [your-username]@fabrikam.cspsecurityaccelerate.com
   Password: TempPassword123!
   ```
   *(Replace `[your-username]` with your actual username like `imatest`)*

3. **Change your password** when prompted:
   - Choose a strong, unique password
   - **Write it down** - you'll need it for other tools

4. **Set up Multi-Factor Authentication (MFA)**:
   - Follow the prompts to set up MFA (phone app recommended)
   - Complete the verification process

5. **Accept any terms and conditions** that appear

6. **Verify access**: You should see the Azure Portal dashboard

### 1.3 Test Additional Services

**Test Copilot Studio access:**
1. **Open new tab**: [copilotstudio.microsoft.com](https://copilotstudio.microsoft.com)
2. **Verify** you can access without additional login prompts

**Test Microsoft 365 access:**
1. **Open new tab**: [portal.office.com](https://portal.office.com)
2. **Verify** you can access the M365 portal

### 1.4 Bookmark Key URLs

**Add these bookmarks** to your COE browser profile:
- Azure Portal: `https://portal.azure.com`
- Copilot Studio: `https://copilotstudio.microsoft.com`
- Microsoft 365: `https://portal.office.com`
- GitHub: `https://github.com`

**✅ Success Criteria**: You can access Azure, Copilot Studio, and M365 without authentication prompts between them.

---

## 📝 Step 2: Create GitHub Account (Skip if you already have one)

**🎯 Goal**: Set up a GitHub account for code collaboration and CI/CD.

### 2.1 Sign Up for GitHub

1. **In your COE browser profile**, navigate to [github.com](https://github.com)

2. **Click "Sign up"** in the top-right corner

3. **Enter your details**:
   ```
   Email: [use your work email or personal email]
   Password: [create a strong password - can be different from COE password]
   Username: [choose a unique username - consider using your name/initials]
   ```

4. **Verify your email**: GitHub will send a verification email - click the link to confirm

5. **Choose your plan**: Select "Free" (sufficient for this project)

### 2.2 Configure Your Profile

1. **Upload a profile photo** (optional but recommended)
2. **Add your name** in the profile settings
3. **Consider enabling two-factor authentication** for security

---

## 🍴 Step 3: Fork the Fabrikam Project

**🎯 Goal**: Create your own copy of the Fabrikam project for development and deployment.

### 3.1 Navigate to the Source Repository

1. **Go to**: [https://github.com/davebirr/Fabrikam-Project](https://github.com/davebirr/Fabrikam-Project)

2. **Click the "Fork" button** in the top-right corner

3. **Configure your fork**:
   - Owner: [Your GitHub username]
   - Repository name: `Fabrikam-Project` (keep default)
   - Description: Keep the original description
   - ✅ Copy the main branch only

4. **Click "Create fork"**

### 3.2 Your Fork is Ready!

You now have your own copy at: `https://github.com/[your-username]/Fabrikam-Project`

### 3.3 🔄 Important: Fork Management & Updates

**Understanding Forks:**
- Your fork is a **complete copy** of the original repository
- You can make changes, deploy, and customize without affecting the original
- **This same process** can be used to update your fork when new features are added to the original

**📋 Future Updates Process:**
1. Visit your fork on GitHub
2. Click **"Sync fork"** button (appears when updates are available)
3. Choose **"Update branch"** to pull latest changes

**⚠️ CRITICAL WARNING - Never Discard Commits:**

> **🚨 NEVER click "Discard commits" when syncing your fork!**
> 
> **Why?** When you deploy to Azure, the system creates custom workflow files (`.github/workflows/`) specific to your deployment. Discarding commits will **delete these files** and break your CI/CD pipeline.
> 
> **Always choose "Update branch"** instead, which safely merges new changes while preserving your custom workflows.

**✅ Safe Update Process:**
- ✅ Click "Sync fork" → "Update branch" (preserves your workflow files)
- ❌ Never click "Discard commits" (deletes your deployment configuration)

---

## 💻 Step 3.5: Clone Your Fork (Optional - For Local Development)

**🎯 Goal**: Get a local copy of your forked repository on your computer to run scripts and work with the code locally.

> **💡 When do you need this?** You'll need to clone your repository if you want to:
> - Run the automated workflow fixing script (`.\scripts\Fix-AzureWorkflows.ps1`)
> - Make code changes locally using VS Code or other editors
> - Test the application on your local machine
> - Use PowerShell scripts for testing and validation

### 3.5.1 Understanding Git Repositories

**💡 What's a repository?** A Git repository is a special `.git/` folder that tracks all changes made to files in a project. Think of it as a complete history of your project that you can sync between GitHub (online) and your computer (local).

### 3.5.2 Prerequisites for Cloning

**Before cloning, ensure you have:**
- [ ] Git installed on your computer ([Download Git](https://git-scm.com/downloads))
- [ ] PowerShell or Command Prompt access
- [ ] Your fork URL ready (something like: `https://github.com/yourusername/Fabrikam-Project`)

### 3.5.3 Cloning Your Fork

**Recommended folder structure:**
```
Development/
└── Fabrikam-Project/    ← Your cloned repository will be here
```

**Step-by-step cloning process:**

1. **Choose your development location** (e.g., `C:\Development` or `C:\Users\[YourName]\Documents\`)

   > **💡 Pro Tip - Avoid Network Locations:** Synced folder locations, such as OneDrive, are viewed as network locations. For local development we recommend using a local, non-network folder because network locations can sometimes cause issues during builds. The nature of source control such as GitHub provides similar sync and backup benefits that you would get from OneDrive.

2. **Open PowerShell** and navigate to your chosen location:
   ```powershell
   # Example: Navigate to your Documents folder
   cd "C:\Users\$env:USERNAME\Documents"
   
   # Or navigate to a Development folder
   cd "C:\Development"
   ```

3. **Clone your forked repository**:
   ```powershell
   # Replace 'yourusername' with your actual GitHub username
   git clone https://github.com/yourusername/Fabrikam-Project --origin yourusername
   ```

4. **Navigate into the cloned repository**:
   ```powershell
   cd Fabrikam-Project
   ```

5. **Verify the clone was successful**:
   ```powershell
   # List the contents - you should see all the project files
   dir
   
   # Check your git remotes
   git remote -v
   ```

### 3.5.4 Understanding Git Remotes

**📝 Info**: When you clone a git repository, you automatically get a "remote" - this is a pointer (URL) to the online copy of your repository. 

- **Default behavior**: Git would normally call this remote `origin`
- **Our approach**: We use `--origin yourusername` to make it clearer which fork you're working with
- **Why this helps**: If you later add the original repository as another remote, you'll easily distinguish between your fork and the original

**Example of what you'll see:**
```
yourusername    https://github.com/yourusername/Fabrikam-Project (fetch)
yourusername    https://github.com/yourusername/Fabrikam-Project (push)
```

### 3.5.5 Next Steps After Cloning

**Now you can:**
- ✅ Run the automated workflow script: `.\scripts\Fix-AzureWorkflows.ps1`
- ✅ Open the project in VS Code: `code .`
- ✅ Run local testing scripts: `.\test.ps1 -Quick`
- ✅ Make code changes and commit them back to your fork

> **💡 Tip**: Keep PowerShell open in your project directory - you'll use it for running scripts during the workshop!

---

## ☁️ Step 4: Deploy to Azure

**🎯 Goal**: Deploy the Fabrikam application to your Azure subscription with proper resource naming.

### 4.1 Verify Your Pre-Created Resources

**✅ Good news!** Your Azure resources have already been created during the COE provisioning process.

1. **Open Azure Portal**: Go to [portal.azure.com](https://portal.azure.com)

2. **Verify your resource group exists**: 
   - Search for `rg-fabrikam-coe-[your-username]`
   - For example: `rg-fabrikam-coe-imatest`
   - You should see it in your resource groups list

3. **Get your User Object ID** (needed to grant you Key Vault access):
   - **Why we need this**: The deployment creates an Azure Key Vault to securely store application secrets. Your User Object ID allows Azure to grant you permission to manage these secrets.
   - Open **Cloud Shell**: Click the terminal icon (`>_`) in the top toolbar
   - Choose **PowerShell** when prompted (recommended for consistency, if you want Bash it's fine)
   - Choose **No storage account required** (You can create one if you want, this is faster)
   - Select **FabrikamAI Subscription** and press **Apply** 
   - **Run this command** once the shell starts:
     ```powershell
     az ad signed-in-user show --query id -o tsv
     ```
   - **Copy the result** - this is your User Object ID that you'll enter in the ARM template deployment form

### 4.2 Deploy Using ARM Template

**🎯 Goal**: Deploy the Fabrikam application with one click.

**Click the button below to deploy directly from the main repository:**

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fdavebirr%2FFabrikam-Project%2Fmain%2Fdeployment%2FAzureDeploymentTemplate.modular.json)

**Fill in the deployment form**:
- **Subscription**: Your Azure subscription (should be pre-selected)
- **Resource Group**: `rg-fabrikam-coe-[your-username]` (your existing resource group)
- **Resource Prefix**: Leave default `fabrikam` (optional - only affects storage/key vault names)
- **User Object ID**: The value from Step 4.1
- **Authentication Mode**: Choose `Disabled` (recommended for COE workshops)

**💡 Note**: App Services will be named `fabrikam-api-development-[suffix]` and `fabrikam-mcp-development-[suffix]` regardless of the Resource Prefix setting.

**Click "Review + Create"** then **"Create"**

**Wait for deployment** (typically 10-15 minutes)

**✅ Azure permissions for successful deployment:**
- 📖 **Reader** - Subscription level (can see all resources)
- 🔐 **Contributor** - Resource Group level (can create/modify resources)
- 🔑 **User Access Administrator** - Resource Group level (can assign roles to Key Vault)

**💡 Pro Tip**: Bookmark your deployment URL for future use!

---

## 🔄 Step 5: Set Up CI/CD Pipeline

### 📚 Understanding CI/CD Pipelines

**What is CI/CD?**
- **CI (Continuous Integration)**: Automatically builds and tests your code whenever changes are pushed to GitHub
- **CD (Continuous Deployment)**: Automatically deploys your tested code to Azure when builds pass

**Why use CI/CD?**
- 🔍 **Quality Assurance**: Catch bugs before they reach production
- 🚀 **Faster Deployments**: No manual deployment steps
- 📈 **Reliability**: Consistent, repeatable deployment process
- 👥 **Team Collaboration**: Everyone's changes are automatically tested and deployed

### 🗂️ GitHub Workflow Files in Your Repository

Your Fabrikam project will have **4 GitHub workflow files** in `.github/workflows/`:

| Workflow File | Purpose | When It Runs |
|---------------|---------|--------------|
| **`testing.yml`** | 🧪 **Quality Gate** - Runs unit tests and validates code quality | Every push and pull request |
| **`authentication-validation.yml`** | 🔐 **Security Check** - Validates authentication configurations | Pull requests only (or manual trigger) |
| **`main_fabrikam-api-development-[suffix].yml`** | 🌐 **API Deployment** - Deploys API to Azure App Service | When code changes and tests pass |
| **`main_fabrikam-mcp-development-[suffix].yml`** | 🤖 **MCP Deployment** - Deploys MCP server to Azure App Service | When code changes and tests pass |

**How they work together:**
1. 📤 You push code to GitHub
2. 🧪 Testing workflow runs first (quality gate)
3. 🔐 Authentication validation ensures security (runs on pull requests to validate code before merging)
4. ✅ If tests pass, deployment workflows run automatically
5. 🚀 Your apps are updated in Azure

**💡 Note**: Since COE workshops typically use direct pushes to main (not pull requests), you may not see the authentication-validation workflow run automatically. This is by design - it's meant to validate security before code reaches production. You can trigger it manually from the GitHub Actions tab if needed.

---

**🎯 Goal**: Configure automatic deployment from your GitHub repository to Azure App Services using Azure Portal's Deployment Center, then fix the generated workflows for monorepo compatibility using our automated script.

> **💡 Simplified Process**: We've automated the workflow fixing process! You'll use a single PowerShell command instead of manual YAML editing, making this much faster and more reliable for workshop environments.

### 5.1 Configure API App Service Deployment

1. **In Azure Portal**, navigate to your resource group: `rg-fabrikam-coe-[your-username]`

2. **Click on your API App Service**: Look for the app service with "api" in the name (e.g., `fabrikam-api-development-bb7fsc`)

3. **Open Deployment Center**:
   - In the left navigation, click **Deployment** > **Deployment Center**

4. **Configure GitHub Integration**:
   - **Source**: Select **GitHub**
   - **Authorize**: Click **Authorize** and sign in to **AzureAppService** when prompted
   - **Organization**: Select your GitHub username
   - **Repository**: Select your fork of **Fabrikam-Project**
   - **Branch**: Select **main**

5. **Workflow Configuration**:
   - **Workflow option**: Leave default **"Add a workflow"** selected ✅
   - **Authentication type**: Leave default
   - **Runtime stack**: Leave default (.NET)
   - **Version**: Leave default

   > **💡 Why "Add a workflow"?** This lets Azure configure all the authentication secrets automatically. We'll fix the monorepo structure afterward with our automated script - much simpler than manual configuration!

6. **Save**: Click **Save** at the top of the Settings pane

7. **Wait for initial deployment**: This will automatically trigger a deployment from your main branch

### 5.2 Configure MCP App Service Deployment

**Repeat the same process for the MCP App Service:**

1. **Go back to your resource group**: `rg-fabrikam-coe-[your-username]`

2. **Click on your MCP App Service**: Look for the app service with "mcp" in the name (e.g., `fabrikam-mcp-development-bb7fsc`)

3. **Repeat steps 3-7** from the API configuration above:
   - **Source**: GitHub
   - **Authorize**: AzureAppService (if not already authorized)
   - **Organization**: Your GitHub username
   - **Repository**: Your Fabrikam-Project fork
   - **Branch**: main
   - **Save** the configuration

### 5.3 Fix Generated Workflows for Monorepo Compatibility

**✅ AUTOMATED SOLUTION**: Azure Portal generates workflows with automatic authentication, but they need adjustment for our monorepo structure. We've created an automated script to fix this!

#### **Quick Fix with Automated Script:**

1. **Wait for Azure to create workflows** (they may fail initially - this is expected)

2. **Ensure you have a local copy of your repository**:
   - If you haven't cloned your fork yet, see [Step 3.5: Clone Your Fork](#-step-35-clone-your-fork-optional---for-local-development)
   - Open PowerShell/Terminal in your cloned repository folder

3. **Run the automated fix script**:
   ```powershell
   .\scripts\Fix-AzureWorkflows.ps1
   ```

   > **💡 Alternative**: If you prefer not to clone locally, you can still do this manually through GitHub's web interface, but the script is much faster and more reliable.

4. **Review the script output** - it will show you exactly what was fixed:
   ```
   🔍 Scanning for Azure-generated workflow files...
   💡 This preserves Azure's automatic authentication while fixing monorepo issues.
   ✅ Found 2 workflow file(s) to fix:
     - main_fabrikam-api-development-[suffix].yml
     - main_fabrikam-mcp-development-[suffix].yml
   
   🔧 Processing: main_fabrikam-api-development-[suffix].yml
   💾 Created backup: main_fabrikam-api-development-[suffix].yml.backup
   ✅ Applied changes:
     - Fixed dotnet publish command for API service
     - Fixed dotnet build command to use solution file
   
   🔧 Processing: main_fabrikam-mcp-development-[suffix].yml
   💾 Created backup: main_fabrikam-mcp-development-[suffix].yml.backup
   ✅ Applied changes:
     - Fixed dotnet publish command for MCP service
     - Fixed dotnet build command to use solution file
   
   🎉 Workflow fix completed!
   ✅ Azure's automatic authentication is preserved.
   ✅ Monorepo project paths are now correctly configured.
   ```

5. **Commit the fixed workflows**:
   ```powershell
   git add .github/workflows/
   git commit -m "Fix Azure workflows for monorepo structure"
   git push origin main
   ```

#### **What the Script Does:**
- ✅ **Preserves Azure's automatic authentication** (service principals, secrets, GitHub integration)
- ✅ **Fixes monorepo project paths** for both API and MCP services
- ✅ **Creates automatic backups** before making changes
- ✅ **Works for both services** - detects API vs MCP workflows automatically
- ✅ **Safe and reliable** - thoroughly tested for workshop environments

#### **Why This Approach Works Best:**
- 🚀 **Fast**: One command vs manual editing of multiple files
- 🔒 **Secure**: Keeps all Azure-generated authentication setup intact
- 🛡️ **Safe**: Automatic backups in case you need to revert
- 🎯 **Workshop-friendly**: No complex YAML editing required
- ✅ **Educational**: Shows automation best practices

> **� Technical Details**: See [Azure Workflow Configuration Guide](../../docs/deployment/AZURE-WORKFLOW-CONFIGURATION.md) for complete documentation on this approach.

### 5.4 Verify CI/CD Pipeline Setup

1. **Check GitHub Actions**:
   - Go to your forked repository on GitHub
   - Click the **Actions** tab
   - You should see workflow runs for both API and MCP deployments
   - **Note**: Your fork starts with 2 core workflows (testing + security), and Azure Portal adds 2 deployment workflows

2. **Test Automatic Deployment (Optional)**:
   - After fixing the workflows, make a small change to trigger the pipeline:
     - Edit `README.md` in your repository
     - Add a line: `<!-- Updated by [Your Name] for COE demo -->`
     - Commit and push the change
   - Watch the Actions tab for new workflow runs

3. **Monitor Deployment Progress**:
   - In Azure Portal, go to each App Service
   - Check **Deployment** > **Deployment Center** 
   - You should see deployment status and history

**✅ Success Criteria**: 
- Both App Services show "Success" in Deployment Center
- GitHub Actions show 4 workflows total (2 core + 2 deployment)
- All workflow runs show green checkmarks
- Making code changes triggers automatic deployments
- All workflow runs show green checkmarks
- Making code changes triggers automatic deployments

---

## 🧪 Step 6: Test Your Deployment

### 5.1 Verify Azure Resources

1. **In Azure Portal**, navigate to your resource group
2. **Confirm these resources exist**:
   - App Service (API)
   - Container App (MCP Server)
   - Key Vault
   - Application Insights
   - Container Registry

### 5.2 Test the API ✅

1. **Find your API URL**:
   - Go to your App Service in Azure Portal
   - Copy the "Default domain" URL
   - It should look like: `https://fabrikam-api-development-[suffix].azurewebsites.net`

2. **Test the API endpoints**:
   - **Swagger UI** (✅ Works): Open `https://[your-api-url]/swagger`
   - **API Info endpoint** (✅ Works): `https://[your-api-url]/api/info`
     - Should return JSON with application information
     - Example: `{"applicationName":"Fabrikam Modular Homes API","version":"1.1.0"...}`

> **💡 Note**: If browser testing fails, try using a different browser profile or incognito/private mode. The endpoints work correctly when tested with tools like curl or Postman.

### 5.3 Test Authentication (Optional - BearerToken mode only)

> **⚠️ Note**: Authentication testing may not work reliably in all browsers due to CORS and cookie policies. This is expected for workshop/demo environments.

If your deployment uses BearerToken authentication mode:

1. **Get demo credentials**:
   - Use the `/api/auth/demo-credentials` endpoint in Swagger
   - Copy the provided test credentials

2. **Login and test** (Optional):
   - Use `/api/auth/login` endpoint with demo credentials
   - Copy the JWT token from the response
   - Use "Authorize" button in Swagger to set Bearer token
   - Try authenticated endpoints like `/api/customers`

**Expected Results:**
- ✅ Swagger UI loads and displays endpoints
- ✅ `/api/info` returns application data
- ⚠️ Authentication may fail in browser (expected for workshop setup)

---

## 🤖 Step 7: Set Up Copilot Studio Integration

If you want to test the AI capabilities:

1. **Follow the Copilot Studio guide**: [Copilot-Studio-Disabled-Setup-Guide.md](./Copilot-Studio-Disabled-Setup-Guide.md)

2. **Use your deployed MCP endpoint**:
   - Find your Container App URL in Azure Portal
   - Use it in the Copilot Studio configuration

---

## ✅ Step 8: Verification Checklist

Confirm everything is working:

- [ ] ✅ GitHub account created and configured
- [ ] ✅ Fabrikam project forked successfully
- [ ] ✅ Azure resources deployed without errors
- [ ] ✅ CI/CD pipeline configured and working
- [ ] ✅ API accessible via Swagger interface
- [ ] ✅ `/api/info` endpoint returns application data
- [ ] ⚠️ Authentication working (optional - may fail in browser)
- [ ] ✅ MCP server accessible (if testing Copilot Studio)

**🎉 Success Criteria**: Swagger UI loads and `/api/info` returns valid JSON data. Authentication issues are expected in workshop environments and don't prevent success.

---

## 🆘 Troubleshooting

### Common Issues and Solutions

**GitHub Fork Issues:**
- **Problem**: Can't fork the repository
- **Solution**: Ensure you're logged into GitHub and have verified your email

**Azure Deployment Fails:**
- **Problem**: ARM template deployment errors
- **Solution**: Check that you have Contributor permissions and the resource group exists

**CI/CD Pipeline Fails:**
- **Problem**: GitHub Actions workflow errors
- **Solution**: 
  1. First, run the automated fix script: `.\scripts\Fix-AzureWorkflows.ps1`
  2. If still failing, verify Azure credentials are correctly configured in GitHub secrets
  3. Check that workflow files exist in `.github/workflows/` directory

**Workflow Fix Script Issues:**
- **Problem**: Script reports "No workflow files found"
- **Solution**: 
  1. Ensure Azure Portal has created deployment workflows (check `.github/workflows/` folder on GitHub)
  2. Make sure you have cloned your fork locally (see Step 3.5 if needed)
  3. Verify you're running the script from the repository root directory
  4. Confirm you completed the Azure Deployment Center setup first

- **Problem**: "Can't find the script file"
- **Solution**:
  1. Ensure you cloned your fork to your local machine (Step 3.5)
  2. Navigate to the correct directory: `cd Fabrikam-Project`
  3. Verify the script exists: `dir scripts\Fix-AzureWorkflows.ps1`

- **Problem**: Script runs but deployments still fail  
- **Solution**:
  1. Check the script output - it creates backups you can review
  2. Manually verify the `dotnet publish` lines include project paths
  3. Try running the script again with `-WhatIf` to preview changes

**API Not Accessible:**
- **Problem**: Can't reach the Swagger interface
- **Solution**: Wait 5-10 minutes after deployment for services to fully start

**Authentication Issues:**
- **Problem**: JWT tokens not working
- **Solution**: Ensure you selected "BearerToken" mode during deployment

### Getting Help

**During the COE Session:**
- Ask Dave Birr for assistance
- Use the chat for questions
- Reference this guide for step-by-step instructions

**After the Session:**
- Check the [GitHub Issues](https://github.com/davebirr/Fabrikam-Project/issues) for known problems
- Review the [documentation index](../DOCUMENTATION-INDEX.md) for additional guides

---

## 🎯 Next Steps After Setup

Once your environment is ready:

1. **Explore the API**: Test different endpoints and authentication modes
2. **Customize the project**: Modify code and see CI/CD deploy changes
3. **Try Copilot Studio**: Set up AI integration with your deployed services
4. **Scale and optimize**: Experiment with Azure scaling and monitoring features

---

## 📚 Additional Resources

- **Project Documentation**: [Full documentation index](../DOCUMENTATION-INDEX.md)
- **Azure Architecture**: [Architecture guides](../architecture/)
- **Authentication Deep Dive**: [Authentication implementation guide](../development/AUTHENTICATION-LESSONS-LEARNED.md)
- **Deployment Options**: [Deployment documentation](../deployment/)

---

**🎉 Congratulations! You now have a complete Fabrikam deployment with automated CI/CD in your own Azure environment.**

*This project demonstrates modern .NET development, Azure deployment, authentication patterns, and AI integration - perfect for learning and experimentation in your COE environment.*
