
# 🚀 AWS Auto Scaling Group (ASG) with Launch Template

This project demonstrates how to use **AWS Launch Templates and Auto Scaling Groups (ASG)** to automatically manage EC2 instances and deploy web servers (Apache & Nginx).

---

# 📌 Project Objective

* Create a **Launch Template**
* Deploy multiple EC2 instances using **Auto Scaling Group**
* Install **Apache Web Server**
* Update configuration to **Nginx**
* Handle issue where changes are not reflected using **Instance Refresh**

---

# 🧱 Architecture Overview

```
Launch Template → Auto Scaling Group → EC2 Instances → Web Server
```

---

# 🛠️ Step 1: Create Launch Template

### 🔹 Configuration

* AMI: Ubuntu
* Instance Type: t2.micro
* Key Pair: Created
* Security Group:

  * Allow SSH (22)
  * Allow HTTP (80)

📷 Image:
![Template\_configuration](./1.1_Template_configuration.png)

---

### 🔹 Instance & Key Configuration

📷 Image:
![Template\_configuration](./1.2_Template_configuration.png)

---

### 🔹 Security Group (Ports)

📷 Image:
![Template\_configuration](./1.3_port_configuration.png)

---

### 🔹 User Data Script (Apache Setup)

```bash
#!/bin/bash
apt update -y
apt install apache2 -y
systemctl start apache2
systemctl enable apache2

echo "<html>
<head><title>Apache Test</title></head>
<body>
<h1>Apache - Hello from Your Bablu!</h1>
</body>
</html>" > /var/www/html/index.html
```

📷 Image:
![Template\_configuration](./1.4_user_Data_configuration.png)

---

### ✅ Launch Template Created

📷 Image:
![Template\_configuration](./1.5_template_created.png)

---

# ⚙️ Step 2: Create Auto Scaling Group (ASG)

### 🔹 Select Launch Template

📷 Image:
![Template\_configuration](./2.1_Autoscaling_configuration.png)

---

### 🔹 Configure Network (Multi-AZ)

📷 Image:
![Template\_configuration](./2.2_Autoscaling_configuration.png)

---

### 🔹 Attach Load Balancer

📷 Image:
![Template\_configuration](./2.3_Autoscaling_configuration.png)

---

### 🔹 Configure Scaling

* Desired Capacity: 2
* Min: 1
* Max: 3

📷 Image:
![Template\_configuration](./2.4_Autoscaling_configuration.png)

---

### ✅ ASG Created

📷 Image:
![Template\_configuration](./2.5_Created_Autoscaling.png)

---

# 🌐 Step 3: Verify Apache Web Server

### 🔹 Instances Running

📷 Image:
![Template\_configuration](./2.6_Instance_running.png)

---

### 🔹 Access Web Page

👉 Open in browser:

```
http://<Public-IP>
```

📷 Output:
![Template\_configuration](./2.7_Apache_Access.png)

---

# 🔄 Step 4: Scale Instances

### 🔹 Increase Instance Count

📷 Image:
![Template\_configuration](./3.1_Instance_count_updated.png)

---

### 🔹 New Instances Running

📷 Image:
![Template\_configuration](./3.2_Instance_updated.png)

---

# 🔁 Step 5: Update Launch Template (Apache → Nginx)

### 🔹 Updated User Data Script

```bash
#!/bin/bash
apt update -y
apt install -y nginx
systemctl start nginx
systemctl enable nginx

cat <<EOF > /var/www/html/index.html
<html>
<head>
<title>Nginx Test</title>
</head>
<body>
<h1>Nginx - Hello from Bablu!</h1>
</body>
</html>
EOF
```

📷 Image:
![Template\_configuration](./4.1_updated_user_Data.png)

---

### 🔹 New Launch Template Version Created

📷 Image:
![Template\_configuration](./4.2_launch_template.png)




---

# ⚠️ Important Issue Faced

👉 After updating Launch Template & ASG
**Webpage was still showing Apache instead of Nginx**

### ❓ Why this happens?

* ASG **does NOT update existing instances automatically**
* Only **new instances** use updated template

---

# ✅ Solution: Instance Refresh (Very Important)

👉 To apply new configuration:

* Go to ASG
* Update Launch Template version
![Template\_configuration](./4.2_Update_ASG_WITH_new_version.png)
* Perform **Instance Refresh**




---

### 🔹 Perform Instance Refresh

📷 Image:
![Template\_configuration](./4.3_done_instant_refresh.png)

---

# 🌐 Final Output (Nginx)

After refresh, all instances recreated with new config

📷 Output:
![Template\_configuration](./4.4_update_webpage_nginx.png)

---

# 🎯 Key Learnings

* Launch Template = Configuration Blueprint
* ASG = Automation & Scaling
* Scaling helps handle traffic dynamically
* **Instance Refresh is required to apply updates**

---

