
# 🐳 Docker Practice Manual (Volumes & Networking)

This is my Docker practice.  
I learned how data is saved and how containers talk to each other.

---

# 🧪 Practice 1: Volume (Data Save)

## Step 1: Create Volume
![practice1 Step 1](practice1.png)

👉 I created a volume named `app_storage`

## Step 2: Use Volume in Container
👉 I ran ubuntu container and attached volume

## Step 3: Add Data
👉 I created a file `notes.txt`

## Step 4: Check Data Again
👉 After deleting container, data was still there ✅

### 🧠 Understanding (Simple)
Container is temporary ❌  
Volume is permanent ✅  
So data is safe in volume

---

# 🧪 Practice 2: Bind Mount (Live Sync)

## Step 1: Create HTML File
![practice2 Step 1](practice2.1.png)

👉 I created `index.html`

## Step 2: Run Nginx with Bind Mount
![practice2 Step 2](practice2.2.png)

👉 Connected my folder with container

## Step 3: Open in Browser
![practice2 Step 3](practice2.3.png)

👉 Website is running on port 9090

## Step 4: Update File
👉 When I changed HTML → website updated instantly ✅

### 🧠 Understanding
Host folder ↔ Container folder  
Both are connected like mirror 🪞

---

# 🧪 Practice 3: MySQL + Volume (Database Save)

## Step 1: Run MySQL Container
![practice3 Step 1](practice3.1.png)

👉 Used volume `db_storage`

## Step 2: Add Data in MySQL
![practice3 Step 2](practice3.2.png)

👉 Created database, table, and inserted data

## Step 3: Delete & Run Again
👉 Container removed and started again

## Step 4: Check Data
👉 Data still exists ✅

### 🧠 Understanding
Database data stored in volume  
So container delete ≠ data delete

---

# 🧪 Practice 4: Docker Networking

## Step 1: Create Network
![practice4 Step 1](practice4.1.png)

👉 Created `app_network`

## Step 2: Run Containers in Same Network
![practice4 Step 2](practice4.2.png)

👉 MySQL + Nginx running

## Step 3: Test Connection
👉 Ping worked between containers ✅

### 🧠 Understanding
Containers talk using names  
No need of IP address

