
# 📘 Azure IAM + Data Layer (Hands-on)

## 🔐 Task 1: IAM – Identity, Access & Governance

### 🎯 Objective

* Create users & groups
* Assign RBAC roles
* Apply Azure Policy
* Verify access control

---

## 👤 Step 1: Create User

👉 Created a new user in Microsoft Entra ID

![Created User](./H1.1_Created_user.png)

📌 What happens:

* A new identity is created
* This user can now log in to Azure

---

## 👥 Step 2: Create Group & Add User

👉 Created a group and added user

![Add Member](./H1.2_Configure_group_and_assigned_user.png)
![Group Created](./H1.3_created_group.png)

📌 What happens:

* Group helps manage permissions easily
* Instead of assigning role to user → assign to group

---

## 📦 Step 3: Create Resource Group

👉 Created resource group `bablu-rg`

![Resource Group](./H1.4_Created_Resource_group.png)

📌 What happens:

* Acts like a folder for resources
* All resources will be managed inside this

---

## 🔐 Step 4: Assign RBAC Role

👉 Assigned **Contributor role** to group

![Assign Role](./H1.5_Assign_role_to_rg.png)
![Assign Member](./H1.6_Assign_member_to_rg.png)
![Review](./H1.7_Review_assign.png)

📌 What happens:

* Group can create & manage resources
* But cannot assign roles

---

## ✅ Step 5: Verify Role Assignment

![Verify Role](./H1.8_verify_role_assignment.png)

📌 What happens:

* Confirms RBAC is working
* Group now has access to resource group

---

## 📏 Step 6: Apply Azure Policy

👉 Applied policy: **Allowed region = Central India**

![Policy Assigned](./H1.9_Assign_policy.png)

📌 What happens:

* Restricts resource creation only in Central India
* Enforces governance

---

## ❌ Step 7: Try Creating Resource in Different Region

![Try Different Region](./H1.10_Tried_Create_resource_in_diffrent_region.png)
![Failed](./H1.11_Failed_to_Create_resources_in_otherRegion.png)

📌 Result:

* ❌ Creation failed
* Reason: Azure Policy blocked it

---

## ✅ Step 8: Create Resource in Allowed Region

![Success](./H1.12_Able_to_create_in_central_india.png)

📌 Result:

* ✔️ Resource created successfully
* Policy allows Central India

---

## 🧠 Key Learning (IAM)

* Entra ID = Identity management
* Group = easy permission handling
* RBAC = who can do what
* Policy = what is allowed

👉 **Policy overrides RBAC**

---

# 🗄️ Task 2: DB – Data Layer (Private Database Architecture)

---

## 🎯 Objective

* Create private database
* Restrict public access
* Allow access only via VM

---

## 🌐 Step 1: Create Virtual Network

![VNet](./H2.1_VNet_created.png)

📌 What happens:

* Created private network
* Two subnets:

  * VM subnet
  * DB subnet

---

## 🛢 Step 2: Create Private Database

![Private DB](./H2.2_Private_Database_Created.png)

📌 What happens:

* PostgreSQL deployed
* Public access disabled
* Only accessible inside VNet

---

## 💻 Step 3: Create Virtual Machine

![VM](./H2.3_VM_lauched.png)

📌 What happens:

* VM acts as **jump server**
* Used to access database

---

## ❌ Step 4: Try Access from Local System

![Failed Connection](./H2.4_Test_failed_connect_database.png)

📌 Result:

* ❌ Connection failed
* Reason:

  * DB is private
  * Not accessible from internet

---

## ✅ Step 5: Access DB from VM

![Success DB](./H2.5_Connect_database_privately.png)

📌 Result:

* ✔️ Connected successfully
* Because VM is inside same network

---

