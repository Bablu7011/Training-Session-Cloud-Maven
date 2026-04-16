Here’s a clean, professional **README.md** you can directly use for your assignment 👇

---

# 🚀 AWS EC2 Hands-on Tasks

This project demonstrates practical implementation of core AWS services using Amazon Web Services, including EC2, S3, IAM roles, User Data automation, and networking concepts.

---

# 📌 Task 1: Simple EC2 Instance

## 🎯 Objective

Create a basic EC2 instance with required configurations.

## ✅ Steps

* Created EC2 instance (Ubuntu) in default VPC
* Enabled Public IP
* Created SSH Key Pair
* Used default Security Group
* Set root volume size to 20GB

## 📷 Screenshots

![create\_instance](./1.1Create_EC2_instance.png)
![create\_key\_pair](./1.2Create_key_pair.png)
![launch\_instance](./1.3Launch_instance.png)
![running\_instance](./1.4Running_instance.png)

---

# 📌 Task 2: EC2, S3 & AWS CLI

## 🎯 Objective

Connect EC2 with S3 and upload files using AWS CLI.

## ✅ Steps

* Created EC2 instance with Public IP
* Connected via SSH using key pair
* Created S3 bucket using GUI
* Installed and configured AWS CLI
* Uploaded files (PDF, Image, TXT) to S3
* Verified uploaded data

## 📷 Screenshots

![create\_instance](./2.1Create_EC2_instance.png)
![launch\_instance](./2.2Launch_instance.png)
![running\_instance](./2.3Running_instance.png)
![ssh\_instance](./2.4SSH_Instance.png)
![create\_s3](./2.5Created_s3_bucket.png)
![upload\_data](./2.6Data_uploaded.png)
![verify\_data](./2.7Verify_Data.png)

---

# 📌 Task 3: EC2 & User Data

---

## 🔹 Task 3A: Nginx using User Data

## 🎯 Objective

Automatically install and run Nginx using EC2 User Data.

## ⚙️ User Data Script

```bash
#!/bin/bash
sudo apt update -y
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
```

## ✅ Output

* Nginx installed automatically
* Accessible via: `http://<EC2-Public-IP>:80`

## 📷 Screenshots

![create\_instance](./A3.1Create_EC2_instance.png)
![create\_key\_pair](./A3.2create_key_pair.png)
![network\_setting](./A3.3Network_setting.png)
![userdata](./A3.4Configure_userdata_and_launch.png)
![instance\_running](./A3.5Instance_running.png)
![port\_open](./A3.6Port_open.png)
![verify\_nginx](./A3.7Verify_Nginx.png)

---

## 🔹 Task 3B: Docker + Apache + Nginx

## 🎯 Objective

Use User Data to install Docker and run two containers.

## ⚙️ User Data Script

```bash
#!/bin/bash

sudo apt update -y
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker

# Run Nginx container
sudo docker run -d -p 80:80 --name nginx nginx

# Run Apache container
sudo docker run -d -p 8080:80 --name apache httpd
```

## ✅ Output

* Nginx → `http://<EC2-IP>:80`
* Apache → `http://<EC2-IP>:8080`

## 📷 Screenshots

![create\_instance](./B3.1Create_EC2_instance.png)
![network\_setting](./B3.2Network_setting.png)
![userdata](./B3.3Configure_userdata_and_launch.png)
![instance\_running](./B3.4Instance_running.png)
![port\_open](./B3.5Port_open.png)
![verify\_nginx](./B3.6verify_nginx.png)
![verify\_apache](./B3.7Verify_apache.png)

---

Got it 👍 — I’ll update **Task 4** section properly with your actual setup (2 VPCs + issue). You can directly replace that part in your README.

---

# 📌 Task 4: Access Private EC2 Instance

## 🎯 Objective

Access an EC2 instance deployed in a **Private Subnet** securely.

---

## 🏗️ Architecture Used

In this task, I used **two different VPCs**:

* **VPC 1**

  * Public Subnet
  * EC2 instance with Public IP

* **VPC 2**

  * Private Subnet
  * EC2 instance (No Public IP)

---

## 🔄 Access Flow Attempted

```text
Local Machine → Public EC2 (VPC 1) → Private EC2 (VPC 2)
```

---

## ⚠️ Issue Faced

While trying to SSH into the private EC2 instance:

* Unable to connect from Public EC2 (Bastion Host)
* SSH request is failing / timing out



---



