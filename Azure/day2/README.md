# 📘 Azure Networking Hands-On (Step-by-Step Implementation)

This project covers complete Azure networking concepts with hands-on execution:

* VNet Creation & Peering
* VM Connectivity Testing
* NSG (Firewall Rules)
* Hub-Spoke Architecture
* Troubleshooting with Effective Routes
* Private Endpoint (Secure PaaS Access)

---

# 🔹 Step 1: Create Basic VNet Peering

## 🎯 Objective

Create two VNets and connect them so they can communicate privately.

---

## 📌 Step 1.1: Create Dev VNet

* Name: `VNet-Dev`
* Address Space: `10.0.0.0/16`
* Subnet: `10.0.1.0/24`

![1.1Dev-VNet-configured](./1.1Dev-VNet-configured.png)

![1.2Dev-subnet-configured](./1.2Dev-subnet-configured.png)

![1.3Dev-VNet-validation](./1.3Dev-VNet-validation.png)

![1.4Dev-VNet-created](./1.4Dev-VNet-created.png)

---

## 📌 Step 1.2: Create Test VNet

* Name: `VNet-Test`
* Address Space: `10.1.0.0/16`
* Subnet: `10.1.1.0/24`

![1.5Test-subnet-configured](./1.5Test-subnet-configured.png)

![1.6Test-vnet-validated](./1.6Test-vnet-validated.png)

![1.7Test-vnet-created](./1.7Test-vnet-created.png)

---

## 📌 Step 1.3: Create VNet Peering

* Go to **VNet-Dev → Peerings → Add**
* Connect Dev → Test
* Enable reverse peering (auto)
![1.8Vnet-peering_configured](./1.8Vnet-peering_configured.png)

![1.9Vnet-peering_created](./1.9Vnet-peering_created.png)


---

### 🧠 Concept

Peering must be **bidirectional** because communication requires request + response.

---

## ✅ Validation

✔ Peering status = **Connected**
![1.10verify-peering-in-dev](./1.10verify-peering-in-dev.png)

![1.11verify-peering-in-test](./1.11verify-peering-in-test.png)

---

# 🔹 Step 2: Test VM-to-VM Connectivity

## 🎯 Objective

Verify communication using private IPs.

---

## 📌 Step 2.1: Create VM in Dev

* VM Name: `VM-Dev`
* Private IP: `10.0.1.x`

![2.1VM-Dev-configuration](./2.1VM-Dev-configuration.png)

![2.2VM-Dev-network-configuration](./2.2VM-Dev-network-configuration.png)

![2.3VM-Dev-validation](./2.3VM-Dev-validation.png)

---


## 📌 Step 2.2: Create VM in Test

* VM Name: `VM-Test`
* Private IP: `10.1.1.x`
![2.4VM-Test-configuration](./2.4VM-Test-configuration.png)

![2.5VM-Test-network-configuration](./2.5VM-Test-network-configuration.png)


---

## Verify VM Creation
![2.6VM-Dev-created](./2.6VM-Dev-created.png)
![2.7VM-Test-Created](./2.7VM-Test-Created.png)


## 📌 Step 2.3: Test Ping from Dev → Test

```bash
ping 10.1.1.4
```
![2.8Ping-Successfully](./2.8Ping-Successfully.png)

---

## ✅ Result

✔ Ping successful
✔ Traffic flows via Azure internal network

---

### 🧠 Concept

Private IP ensures traffic **never leaves Azure backbone**.

---

# 🔹 Step 3: NSG and Traffic Control

## 🎯 Objective

Control traffic using firewall rules.

---

## 📌 Step 3.2: Associate NSG to Subnet

Attached NSG to Test subnet (`10.1.1.0/24`)

![3.1Created_nsg](./3.1Created_nsg.png)

![3.2Associated_subnet](./3.2Associated_subnet.png)

---

## 📌 Step 3.2: Create Deny Rule (Block ICMP)

* Protocol: ICMP
* Action: Deny

![3.2deny-rule](./3.2deny-rule.png)

---

## 📌 Step 3.3: Ping Test (Failed ❌)

Ping from Dev → Test fails

![3.3Not-able-to-ping](./3.3Not-able-to-ping.png)

---

## 📌 Step 3.4: Create Allow Rule (Higher Priority)

* Priority: 100
* Action: Allow ICMP

![3.4Created\_allow\_rule](./3.4Created_allow_rule.png)

---

## 📌 Step 3.5: Ping Test (Success ✅)

![3.5Able-to-ping](./3.5Able-to-ping.png)

---

### 🧠 Concept

NSG Rules priority:

* Lower number = higher priority
* Allow overrides Deny

---

# 🔹 Step 4: Hub-and-Spoke Architecture

## 🎯 Objective

Create scalable network design.

---

## 📌 Step 4.1: Create Hub VNet

![4.1HubVnet](./4.1HubVnet.png)

---

## 📌 Step 4.2: Create Spoke Dev

![4.2Spoke-dev-vnet](./4.2Spoke-dev-vnet.png)

---

## 📌 Step 4.3: Create Spoke Test

![4.3Spoke-test-vnet](./4.3Spoke-test-vnet.png)

---

## 📌 Step 4.4: Verify VNets

![4.4verify-vnets-creation](./4.4verify-vnets-creation.png)

---

## 📌 Step 4.5: Create Peering (Hub ↔ Spokes)

![4.5done-peering](./4.5done-peering.png)

---

## 📌 Step 4.5: Launch VMs for Testing

![4.5Launch-vm-for-ping](./4.5Launch-vm-for-ping.png)

---

### 🧠 Concept

Hub acts as **central router**
Spokes connect through hub instead of directly.


---

### ⚠️ Note (Work in Progress)

* Currently, **router/firewall configuration is not completed**
* Still learning how to configure:

  * Azure Firewall
  * Route tables (UDR)
  * Forwarded traffic through Hub
* Final validation (Spoke ↔ Spoke via Hub) is **in progress**


---

# 🔹 Step 5: Troubleshooting VNet Peering

## 🎯 Objective

Understand routing issues.

---

## 📌 Step 5.1: Delete Peering

![5.1deleted-peering](./5.1deleted-peering.png)

---

## 📌 Step 5.2: Ping Fails ❌

![5.2ping-failed](./5.2ping-failed.png)

---

## 📌 Step 5.3: Check Effective Routes

![5.3VM-internal-routing-table](./5.3VM-internal-routing-table.png)

---

### 🧠 Observation

Route to `10.1.0.0/16` missing → no connectivity

---

## 📌 Step 5.4: Recreate Peering

![5.4After-peering-added](./5.4After-peering-added.png)

---

## ✅ Result

✔ Route restored
✔ Connectivity works again

---

# 🔹 Step 6: Private Endpoint (Secure Storage)

## 🎯 Objective

Access storage securely without public internet.

---

## 📌 Step 6.1: Create Storage Account

![6.1Created\_storage-account](./6.1Created_storage-account.png)

---

## 📌 Step 6.2: Create VNet

![6.2CreateVnet](./6.2CreateVnet.png)

---

## 📌 Step 6.3: Create Private Endpoint

![6.3Created-private-endpoints](./6.3Created-private-endpoints.png)

---

## 📌 Step 6.4: Deployment Completed

![6.4deploy-private-endpointss](./6.4deploy-private-endpointss.png)

---

## 📌 Step 6.5: Launch VM

![6.5launch-vm](./6.5launch-vm.png)

---

## 📌 Step 6.6: Test DNS Resolution

```bash
nslookup <your-storage>.blob.core.windows.net

```
![6.6ssh-vm-and-run-command.png](./6.6ssh-vm-and-run-command.png)
---

## ✅ Result

✔ Resolves to Private IP (`10.x.x.x`)
✔ No public access

---



