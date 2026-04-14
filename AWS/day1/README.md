# ☁️ Day 1: Cloud Computing Fundamentals & AWS Overview

This document contains my learning from **Day 1 of my DevOps Journey**, where I explored the basics of **Cloud Computing and AWS**.

---

# 📌 What is Cloud Computing?

Cloud computing means using computing resources like **servers, storage, and applications over the internet** instead of managing physical hardware.

### 🔹 Key Idea:
Instead of buying servers → you **rent them online**.

### 💡 What you can do using cloud:
- Create servers
- Store data
- Run applications
- Build and host websites

### 💰 Benefit:
You **pay only for what you use** (Pay-as-you-go model).

---

# 🔄 Evolution of Cloud Computing

## 🏢 Before Cloud
- Companies maintained their own data centers
- Required:
  - Buying servers
  - Managing hardware
  - Handling power & cooling
- ❌ Expensive and time-consuming

## 💻 Virtualization
- One physical server → multiple virtual machines
- Improved efficiency but still needed hardware

## ☁️ Cloud Era
- Started by AWS (2006)
- Now:
  - Servers created in minutes
  - No hardware management
  - Fully automated infrastructure

---

# ⚖️ Traditional IT vs Cloud

| Traditional IT | Cloud Computing |
|---------------|----------------|
| Buy hardware | Rent resources |
| High upfront cost | Pay-as-you-go |
| Setup takes weeks | Setup in minutes |
| Hard to scale | Easy scaling |
| Manual maintenance | Managed by provider |

👉 Cloud is **faster, scalable, and cost-effective**

---

# 🚀 Business Challenges Solved by Cloud

Cloud helps businesses:
- Reduce infrastructure cost
- Handle traffic spikes
- Expand globally
- Recover from failures
- Launch products faster

### 📌 Example:
During big sales (like Flipkart/Amazon), traffic increases → cloud automatically scales servers.

---

# 🌐 Cloud Deployment Models

## 1. Public Cloud
- Available to everyone
- Example: AWS

## 2. Private Cloud
- Used by a single organization
- More secure but expensive

## 3. Hybrid Cloud
- Combination of public + private cloud
- Sensitive data in private, rest in public

---

# 🧱 Cloud Service Models

## 🟢 IaaS (Infrastructure as a Service)
- Provides:
  - Virtual machines
  - Storage
  - Networking
- You manage OS & applications  
📌 Example: AWS EC2

---

## 🔵 PaaS (Platform as a Service)
- Provides platform to run apps
- No OS management needed  
📌 Example: AWS Elastic Beanstalk

---

## 🟡 SaaS (Software as a Service)
- Ready-to-use applications
- Access via browser  
📌 Examples:
- Gmail
- Google Docs
- Microsoft 365

---

# ⚙️ Core Cloud Concepts

## 1. Elasticity
Automatically increases/decreases resources based on demand.

## 2. Scalability
System can grow when traffic increases.

## 3. High Availability
Application remains available even if one server fails.

## 4. Fault Tolerance
System continues working even if components fail.

---

# 🔐 Shared Responsibility Model

Cloud security is shared between **Cloud Provider** and **Customer**.

## ☁️ Cloud Provider Responsibilities:
- Data centers
- Hardware
- Networking

## 👤 Customer Responsibilities:
- Data
- Applications
- User access & permissions

👉 AWS secures the cloud, you secure what you put in the cloud.

---

# 🏢 Major Cloud Providers

- Amazon Web Services (AWS)
- Microsoft Azure
- Google Cloud Platform (GCP)
- Oracle Cloud

👉 All provide services like:
- Compute (VMs)
- Storage
- Databases
- Networking

---

# ⭐ Why Enterprises Choose AWS

- Global infrastructure
- Wide range of services
- Easy scalability
- Strong ecosystem
- Excellent documentation & community

---

# 🌎 AWS Global Infrastructure

## 🌍 Regions
- Physical locations worldwide (e.g., Mumbai, US, Europe)

## 🏢 Availability Zones (AZ)
- Multiple data centers within a region

### ✅ Benefits:
- High availability
- Disaster recovery
- Better performance

---

## ##############################################################################################



# 🔐 AWS IAM (Identity and Access Management)

IAM is a core AWS service used to **secure and control access** to AWS resources.

👉 It defines:
- **Who** can access AWS (Users/Roles)
- **What** they can do (Policies)
- **Which resources** they can access

---

## 👑 Root User vs IAM User

### 🔴 Root User
- Full access to all AWS services
- Created when AWS account is created
- ⚠️ Should NOT be used for daily work

### 🟢 IAM User
- Created by admin
- Has limited permissions
- Used for daily access

👉 **Best Practice:** Always use IAM users instead of root.

---

## 👤 IAM User

An IAM User represents a person or application that interacts with AWS.

### 🔑 Access Types:
- Console access (username + password)
- Programmatic access (access key + secret key)

---

## 👥 IAM Group

A Group is a collection of IAM users.

### 🎯 Purpose:
- Assign permissions to multiple users at once

### 📌 Example:
- `Developers` group → S3 access
- `Admins` group → Full access

---

## 🧾 IAM Policy

A Policy is a JSON document that defines permissions.

### 📌 Basic Structure:
```json
{
  "Effect": "Allow or Deny",
  "Action": "service:action",
  "Resource": "resource ARN",
  "Condition": "optional"
}
````

### 🔥 Key Points:

* **Allow** → grants permission
* **Deny** → blocks permission (overrides Allow)
* Default = Deny

---

## 🎭 IAM Role

A Role provides **temporary permissions**.

### 🔥 Features:

* No username/password
* Used by AWS services or users
* More secure than access keys

### 📌 Use Cases:

* EC2 accessing S3
* Lambda accessing DynamoDB
* Cross-account access

---

## ⚖️ Permission Evaluation Logic

AWS checks permissions in this order:

1. Default → Deny
2. If Allow → Access granted
3. If Explicit Deny → Access denied (highest priority)

👉 **Deny always wins**

---

## 🔑 Access Keys vs Password

| Type       | Purpose           |
| ---------- | ----------------- |
| Password   | AWS Console login |
| Access Key | CLI / API access  |

⚠️ Never expose access keys in code or GitHub.

---

## 🔐 Multi-Factor Authentication (MFA)

Adds an extra layer of security.

### 📌 Example:

* Password + OTP from mobile

👉 Must enable for:

* Root account
* Admin users

---

## 🌍 IAM Global Service

IAM is a **global service**, not region-specific.

👉 Same users and roles work across all AWS regions.

---

## 🔒 Best Practices

* ✅ Do not use root account daily
* ✅ Follow least privilege principle
* ✅ Use roles instead of access keys
* ✅ Enable MFA
* ✅ Rotate credentials regularly
* ✅ Use groups to manage permissions

---

## ⚠️ Common Mistakes

* ❌ Using root account for daily tasks
* ❌ Giving full access (`*`)
* ❌ Hardcoding credentials in code
* ❌ Not enabling MFA
* ❌ Uploading keys to GitHub

---

## 🎯 Summary

| Concept | Meaning                |
| ------- | ---------------------- |
| IAM     | Security system of AWS |
| User    | Individual identity    |
| Group   | Collection of users    |
| Policy  | Permission rules       |
| Role    | Temporary access       |

👉 IAM ensures **secure and controlled access** to AWS resources.

