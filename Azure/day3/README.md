# 📘 Azure Networking Day-3 (NSG, VM, Routing Lab)

---

## 🔹 Step 1: Create Virtual Network with Subnets

### 🎯 Objective

Create a Virtual Network and divide it into multiple subnets for better security and structure.

---

## 📌 Step 1.1: Configure VNet and Subnets

![1_Dev-VNet-configured](./1_Configure_VNet_subnets.png)

### 🧠 Explanation

* Created **Bablu-VNet** with address space `10.0.0.0/16`
* Created 3 subnets:

  * **web-subnet** → `10.0.1.0/24`
  * **app-subnet** → `10.0.2.0/24`
  * **db-subnet** → `10.0.3.0/24`

👉 This follows **3-tier architecture**:

* Web → Public layer
* App → Backend layer
* DB → Secure layer

---

## 🔹 Step 2: Create Network Security Groups (NSG)

### 🎯 Objective

Control traffic using firewall rules.

---

## 📌 Step 2.1: Create NSG for Web

![2.1\_Create\_web\_nsg](./2.1_Create_web_nsg.png)

### 🧠 Explanation

* Created **NSG-Web**
* This will control traffic for Web subnet

---

## 📌 Step 2.2: Create NSG for App

![2.2\_Created\_app\_nsg](./2.2_Created_app_nsg.png)

### 🧠 Explanation

* Created **NSG-App**
* This will secure backend application layer

---

## 🔹 Step 3: Configure NSG Rules & Attach to Subnet

### 🎯 Objective

Allow only required traffic.

---

## 📌 Step 3.1: Add Rule in NSG-Web

![3.1\_Inbound\_nsg\_web](./3.1_Inbound_nsg_web.png)

### 🧠 Explanation

* Allowed **SSH (port 22)** from anywhere
  * 👉 So we can login into Web VM

---

## 📌 Step 3.2: Attach NSG-Web to Web Subnet

![3.2\_Associate\_subnet\_nsg\_web](./3.2_Associate_subnet_nsg_web.png)

### 🧠 Explanation

* Linked NSG-Web with **web-subnet**
  * 👉 All VMs in this subnet will follow these rules

---

## 📌 Step 3.3: Add Rule in NSG-App

![3.3\_Inbound\_nsg\_app](./3.3_Inbound_nsg_app.png)

### 🧠 Explanation

* Allowed traffic **only from web-subnet (10.0.1.0/24)**
* 👉 This means:
  * Web → App ✔️
  * Internet → App ❌

---

## 📌 Step 3.4: Attach NSG-App to App Subnet

![3.4\_Associate\_subnet\_nsg\_app](./3.4_Associate_subnet_nsg_app.png)

### 🧠 Explanation

* Linked NSG-App with **app-subnet**
  * 👉 Backend is now protected

---

## 🔹 Step 4: Create Virtual Machines

### 🎯 Objective

Deploy VMs inside subnets to test connectivity.

---

## 📌 Step 4.1: Create Web VM

![4.1VM-Web](./4.1VM-Web.png)

### 🧠 Explanation

* Created **Bablu-VM-Web**
* Placed inside **web-subnet**

---

## 📌 Step 4.2: Create App VM

![4.2VM-App](./4.2VM-App.png)

### 🧠 Explanation

* Created **Bablu-VM-App**
* Placed inside **app-subnet**

---

## 📌 Step 4.3: Verify Both VMs

![4.3Verify\_Both-VM](./4.3Verify_Both-VM.png)

### 🧠 Explanation

* Both VMs are running successfully

---

## 🔹 Step 5: Test Connectivity (Security Check)

### 🎯 Objective

Verify NSG behavior.

---

## 📌 Step 5.1: Try Direct Access to App VM

![5.1Try\_ping](./5.1Try_ping.png)

### 🧠 Explanation

* Tried SSH directly to App VM
* ❌ Connection failed

* 👉 Because NSG-App blocks internet access

---

## 📌 Step 5.2: Connect to Web VM

![5.2Connect\_web-app](./5.2Connect_web-app.png)

### 🧠 Explanation

* Successfully logged into Web VM
  * 👉 Allowed because NSG-Web allows SSH

---

## 📌 Step 5.3: Connect App VM via Web VM

![5.3Connect-app-vm-by-web-vm](./5.3Connect-app-vm-by-web-vm.png)

### 🧠 Explanation

* From Web VM → connected to App VM
* ✔️ Success

* 👉 This is called **Jumpbox concept**

---

## 🔹 Step 6: Create Route Table (Block Internet)

### 🎯 Objective

Prevent backend VM from accessing internet.

---

## 📌 Step 6.1: Create Route Table

![6.1Create\_Route\_table](./6.1Create_Route_table.png)

### 🧠 Explanation

* Created **RT-AppSubnet**

---

## 📌 Step 6.2: Add Route (Block Internet)

![6.2\_configure\_route](./6.2_configure_route.png)

### 🧠 Explanation

* Destination: `0.0.0.0/0`
* Next hop: **None**

👉 Meaning:

* Block all internet traffic

---

## 📌 Step 6.3: Associate Route Table

![6.3\_Associate\_Subnet](./6.3_Associate_Subnet.png)

### 🧠 Explanation

* Attached route table to **app-subnet**

---

## 📌 Step 6.4: Verify Internet Block

![6.4\_Verify\_vm\_app\_ping](./6.4_Verify_vm_app_ping.png)

### 🧠 Explanation

* Tried `ping google.com` from App VM
* ❌ Failed

👉 Internet successfully blocked

---

