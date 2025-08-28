# 🏗️ Fabrikam Modular Homes - Business AI Demonstration Platform

> **🤖 GITHUB COPILOT: CRITICA### **FabrikamMcp** - AI Integration Server

- **Natural Language Interface**: Query business data conversationally
- **10 Consolidated Tools**: Optimized for Copilot Studio's 15-tool limit
- **Intelligent Defaults**: Works without parameters for robust AI interactions
- **Real-time Data**: Connects to live API for current business information

## 🔌 **Understanding MCP (Model Context Protocol)**

**What is MCP?** Think of MCP like a **USB-C port for AI applications**. Just as USB-C provides a standardized way to connect your devices to various peripherals and accessories, **MCP provides a standardized way to connect AI models to different data sources and tools**.

### **🎯 Why MCP Matters for Business**

**The Problem**: Traditional AI integrations require:
- Custom development for each AI platform
- Proprietary APIs that lock you into specific vendors
- Complex integration layers that are expensive to maintain
- Starting over when switching AI applications

**The MCP Solution**: A universal standard that enables:
- ✅ **Build once, use everywhere**: Your integrations work across different AI platforms
- ✅ **Own your context**: Switch between AI applications while keeping your business logic
- ✅ **Standardized development**: Use proven patterns instead of reinventing integration layers
- ✅ **Future-proof investments**: Open protocol that evolves with the AI ecosystem

### **🛠️ Core MCP Capabilities**

MCP servers provide three main types of functionality:

#### **1. 📄 Resources**: File-like data that can be read by AI clients
- *Examples*: API responses, file contents, database queries, document repositories
- *In Fabrikam*: Customer profiles, order summaries, product catalogs, support ticket details

#### **2. 🔧 Tools**: Functions that can be called by the LLM (with user approval)
- *Examples*: Execute business actions, perform calculations, trigger workflows, update systems
- *In Fabrikam*: "Get sales analytics", "Check inventory levels", "Find customer orders", "Create support tickets"

#### **3. 💬 Prompts**: Pre-written templates that help users accomplish specific tasks
- *Examples*: Business intelligence queries, report generation, customer service scripts
- *In Fabrikam*: "Analyze quarterly sales performance", "Generate customer summary report", "Draft customer service response"

### **🏗️ How Fabrikam Demonstrates MCP Value**

Our FabrikamMcp service showcases **Tools** - the most powerful MCP capability for business scenarios:

```
🔄 Real Business Flow Example:
Executive: "What were our sales last month by region?"
↓
Copilot Studio → MCP Protocol → FabrikamMcp → FabrikamApi → Business Database
↓
Real business data flows back through standardized protocol
↓
AI formats intelligent response: "Last month you generated $67,340 in revenue: 
North Region: $34,200 (51%), South Region: $33,140 (49%). 
This represents 12% growth vs. previous month..."
```

**Key Business Benefits You'll Experience:**
- 🚀 **Zero custom integration code** - MCP handles all the AI connectivity complexity
- 🔄 **Always current data** - Real-time connections to your live business systems
- 🎯 **Business-focused tools** - Operations teams can query data using natural language
- 📈 **Scalable architecture** - Add new business capabilities without changing AI configuration
- 🔄 **Platform flexibility** - Same tools work with Copilot Studio, ChatGPT, Claude, and future AI platforms

### **🎪 What You'll See in Action**

During demonstrations, you'll experience MCP's business value:

1. **Ask natural business questions**: "Which customer has spent the most?" or "What products are low in stock?"
2. **Get real-time answers**: Data comes directly from your live business systems
3. **See the AI reasoning**: Watch how the AI chooses the right tools and formats business-friendly responses
4. **Experience the flexibility**: Same questions work whether you're using Copilot Studio, web chat, or mobile apps

**The Magic**: You maintain one MCP integration, but it works across all AI platforms. As new AI technologies emerge, your business logic travels with you.

## 🔐 Authentication System RULES** ⚠️  
> **ALWAYS use VS Code tasks for servers**: `run_task(id: "🌐 Start Both Servers")`  
> **NEVER use run_in_terminal for servers**: `dotnet run` commands break server management  
> **Use separate terminals for commands**: `run_in_terminal(command: "curl...", isBackground: false)`  
> **📖 Full Rules**: `COPILOT-SERVER-RULES.md` and `.copilot/instructions.md`

> **🚨 MONOREPO STRUCTURE**: This is a multi-project .NET solution. See `.github/MONOREPO-GUIDE.md` for complete development guidance.

> **🤖 GitHub Copilot Notice**: This project uses **automated CI/CD** with GitHub Actions. Every code change triggers testing and deployment. See `.github/copilot-cicd-context.md` for full pipeline details.

A comprehensive .NET-based business simulation platform designed for **Microsoft Copilot demonstrations**, **partner training**, and **AI business value showcases**. This project simulates Fabrikam, a fictional modular home builder, with realistic business operations and AI-powered tools.

## 🎯 Purpose

- **Accelerate Copilot adoption** with realistic SME&C business scenarios
- **Enable hands-on AI labs** demonstrating tangible business value
- **Support partner training** with ready-to-deploy environments
- **Showcase Model Context Protocol (MCP)** integration patterns

## 🚀 **Status: Production Ready!**

**✅ Live Deployment**: https://fabrikam-api-dev-y32g.azurewebsites.net  
**✅ Authentication Complete**: 100% success rate with Azure Key Vault RBAC  
**✅ Demo Ready**: 7 working demo users across all roles  
**✅ Fully Tested**: Automated testing with CI/CD integration

## 📚 **Quick Navigation**

| Resource | Purpose | Status |
|----------|---------|--------|
| **[🚀 Deploy to Azure](docs/deployment/DEPLOY-TO-AZURE.md)** | One-click Azure deployment | ✅ Production Ready |
| **[📚 Documentation Index](docs/DOCUMENTATION-INDEX.md)** | Complete documentation guide | ✅ Organized |
| **[🎉 Authentication Complete](docs/development/AUTHENTICATION-IMPLEMENTATION-COMPLETE.md)** | Implementation results | ✅ 100% Success |
| **[🧪 Testing Guide](test.ps1)** | Automated testing | ✅ Local + Production |

## 🎬 Demo Video

Watch the complete Fabrikam Project demonstration showcasing:

- Customer management and business analytics
- Product catalog and inventory tracking
- Order processing and timeline management
- MCP tool integration with AI assistants
- Real-time business dashboard functionality

**📹 [View Demo Video](docs/assets/fabrikamprojectdemo1.mp4)** _(11 minutes - comprehensive walkthrough)_

## ⚡ Quick Start

### **Local Development** (Monorepo Structure)

```powershell
# 🚀 Start both servers from workspace root
.\test.ps1 start

# 🧪 Test everything (convenient shortcuts available!)
.\test.ps1 -Quick               # Root shortcut

# 📊 Check status
.\test.ps1 status
```

**Testing Shortcuts**: For convenience, you can use the root-level shortcuts:
- `.\test.ps1` - PowerShell wrapper for the main testing script (**Recommended**)
- `.\test.bat` - Batch file wrapper for command prompt users

### **Option 1: Use Deployed Services** (Recommended)

- **API**: https://fabrikam-api-dev-y32g.azurewebsites.net
- **MCP**: wss://fabrikam-mcp-dev-y32g.azurewebsites.net  
- **Copilot Studio**: See [Setup Guide](docs/demos/Copilot-Studio-Agent-Setup-Guide.md)

### **Option 2: Local Development**

```powershell
# Run API locally
cd FabrikamApi/src
dotnet run

# Run MCP server locally
cd FabrikamMcp/src
dotnet run
```

## 🏗️ Architecture

![Fabrikam Architecture](docs/assets/FabrikamArchitecture.png)

Two integrated services providing complete business functionality:

### **FabrikamApi** - Business Operations API

- **Sales Analytics**: Order management and revenue tracking ($829K+ in sample data)
- **Product Catalog**: Modular homes with specifications and inventory tracking
- **Customer Management**: CRM with order history and support integration
- **Asset Management**: Images, blueprints, and marketing materials

### **FabrikamMcp** - AI Integration Server

- **Natural Language Interface**: Query business data conversationally
- **10 Consolidated Tools**: Optimized for Copilot Studio's 15-tool limit
- **Intelligent Defaults**: Works without parameters for robust AI interactions
- **Real-time Data**: Connects to live API for current business information

## � Authentication System

**Complete ASP.NET Core Identity implementation with Azure integration:**

- **JWT Token Management**: Secure authentication with access/refresh token lifecycle
- **Role-Based Access Control**: Admin, Sales, Customer service roles with appropriate permissions  
- **Azure Key Vault Integration**: RBAC-based secrets management with managed identity
- **Demo User System**: 7 pre-configured users for immediate testing and demonstrations
- **Production Deployment**: Fully tested in Azure App Service with 100% authentication success rate

**🔗 [View Authentication Details](AUTHENTICATION-IMPLEMENTATION-COMPLETE.md)**

## �📊 Business Data

Comprehensive sample data for realistic demonstrations:

- **8 Customers**: Business and individual buyers across regions
- **45 Products**: Modular homes, ADUs, materials with specifications
- **15 Orders**: $829,482.50 in sample revenue with regional breakdowns
- **20 Support Tickets**: Customer service cases with realistic workflows
- **Asset Library**: House images, blueprints, and marketing materials

## 🧪 Testing Your Setup

### **API Endpoints**

```powershell
# Health check
curl https://fabrikam-api-dev-y32g.azurewebsites.net/health

# Sales analytics
curl https://fabrikam-api-dev-y32g.azurewebsites.net/api/orders/analytics

# Product inventory
curl https://fabrikam-api-dev-y32g.azurewebsites.net/api/products/inventory
```

### **MCP Integration**

```powershell
# Server status
curl https://fabrikam-mcp-dev-y32g.azurewebsites.net/status

# List available tools
curl https://fabrikam-mcp-dev-y32g.azurewebsites.net/mcp
```

## 📖 Documentation

### **Essential Guides**

- [**Copilot Studio Setup**](docs/demos/Copilot-Studio-Agent-Setup-Guide.md) - Create your business AI assistant
- [**Asset Management**](docs/development/ASSET-MANAGEMENT-GUIDE.md) - Add images, blueprints, and files
- [**Authentication Implementation**](docs/development/AUTHENTICATION-IMPLEMENTATION-GUIDE.md) - Development workflow and methodology
- [**Deployment Guide**](docs/deployment/DEPLOYMENT-GUIDE.md) - Azure deployment instructions

## 📚 Documentation

Comprehensive documentation is organized in the [`docs/`](docs/) directory:

### 🎬 **Demos & Showcases**

- [**Demo Ready Summary**](docs/demos/DEMO-READY-SUMMARY.md) - Complete 3-minute demo guide
- [**Copilot Demo Prompts**](docs/demos/COPILOT-DEMO-PROMPTS.md) - Business intelligence scenarios
- [**Quick Demo Prompts**](docs/demos/QUICK-DEMO-PROMPTS.md) - Copy-paste ready prompts

### 🚀 **Deployment & Production**

- [**Deployment Guide**](docs/deployment/DEPLOYMENT-GUIDE.md) - Azure deployment instructions
- [**Release Guide**](docs/deployment/RELEASE-GUIDE.md) - Release process and versioning
- [**Production Testing**](docs/deployment/PRODUCTION-TESTING-GUIDE.md) - Production validation

### 🛠️ **Development**

- [**Development Workflow**](docs/development/DEVELOPMENT-WORKFLOW.md) - Daily development process
- [**Testing Strategy**](docs/development/TESTING-STRATEGY.md) - Comprehensive testing approach
- [**Commit Checklist**](docs/development/COMMIT-CHECKLIST.md) - Pre-commit validation
- [**Utility Scripts**](scripts/README.md) - Development and testing utilities

### 🏗️ **Architecture & Planning**

- [**Future Enhancements**](docs/architecture/TODO-FUTURE-ENHANCEMENTS.md) - Planned features and roadmap
- [**Visual Assets**](docs/assets/README.md) - Branding and Copilot Studio assets

> **📖 Full Navigation**: See [`docs/README.md`](docs/README.md) for complete documentation index

### **Implementation Status**

- ✅ **API Controllers**: All business endpoints implemented and tested
- ✅ **MCP Tools**: 10 consolidated tools optimized for Copilot Studio
- ✅ **Azure Deployment**: Both services deployed and accessible
- ✅ **Asset Structure**: Directory structure ready for house designs and blueprints
- 🔄 **Content Expansion**: Adding product images and architectural drawings

## 🎯 Business Scenarios

Perfect for demonstrating AI value through **natural language business intelligence**:

### **📊 Executive Dashboard Conversations**
- **Sales Performance**: "What are our sales numbers this quarter?" → Real revenue data with regional breakdowns and trend analysis
- **Business Growth**: "Which customers are driving the most revenue?" → Customer ranking with order history and value analysis
- **Market Analysis**: "How are our different product lines performing?" → Product category revenue and inventory insights

### **⚡ Operational Intelligence**
- **Inventory Management**: "What products need restocking?" → Live stock levels with automated reorder recommendations
- **Order Fulfillment**: "Show me all pending orders" → Order pipeline with delivery timelines and priority sorting
- **Customer Service**: "Any urgent support tickets today?" → Priority ticket management with customer context

### **🎯 Product & Customer Insights**
- **Product Information**: "Show me our ADU options with specifications" → Complete product catalogs with pricing and availability
- **Customer Profiles**: "Tell me about our top customers" → Customer analysis with order history and preferences
- **Regional Performance**: "How are sales performing by region?" → Geographic analysis with market penetration data

### **🔄 MCP-Powered Natural Language**

**The key difference**: Instead of learning complex dashboards or SQL queries, users ask **business questions in plain English** and get **real-time answers from live data**:

```
Traditional Approach:
Login → Navigate to Reports → Select Parameters → Run Query → Interpret Results

MCP + AI Approach:
"What were our best-selling products last month?" → Instant intelligent answer
```

**Business Value**: Operations teams, executives, and customer service can access business intelligence through conversation, dramatically reducing training time and increasing data accessibility.

## 🤝 Contributing

This project is designed for demonstrations and training. To extend functionality:

1. **Fork the repository** for your own customizations
2. **Follow our [Development Workflow](docs/development/DEVELOPMENT-WORKFLOW.md)** for daily development
3. **Add your business scenarios** by extending the sample data
4. **Test with our comprehensive tools** - see [Testing Strategy](docs/development/TESTING-STRATEGY.md)
5. **Follow deployment best practices** - see [Deployment Guide](docs/deployment/DEPLOYMENT-GUIDE.md)

For detailed contributing guidelines, see [CONTRIBUTING.md](CONTRIBUTING.md).

---

_Fabrikam Modular Homes - Showcasing AI-powered business operations_
