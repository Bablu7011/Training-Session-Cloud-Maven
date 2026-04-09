
# 🚀 ELK Stack Setup (Docker Compose)

This guide explains how to run the **ELK Stack (Elasticsearch, Logstash, Kibana)** using Docker and view logs in Kibana.

---

## 📌 Prerequisites

* Docker Desktop installed and running
* Git installed
* Basic knowledge of terminal

---

## ⚙️ Setup Steps

### 1️⃣ Start Docker

Make sure **Docker Desktop** is running.

---

### 2️⃣ Clone the Repository

```bash
git clone https://github.com/Einsteinish/Einsteinish-ELK-Stack-with-docker-compose.git
cd Einsteinish-ELK-Stack-with-docker-compose
```

---

### 3️⃣ Configure Username & Password

In this project, Elasticsearch security is enabled.

Default credentials used:

```
Username: elastic
Password: changeme
```

(we can modify this in configuration files if needed)

---

### 4️⃣ Start ELK Stack

```bash
docker compose up --build -d
```

---

### 5️⃣ Verify Containers

```bash
docker ps
```

You should see:

* elasticsearch container
* logstash container
* kibana container

---

### 6️⃣ Wait for Kibana Setup

⏳ Wait for **2–3 minutes** for all services to start properly.

---

## 🌐 Access Services

| Service       | URL                                            |
| ------------- | ---------------------------------------------- |
| Elasticsearch | [http://localhost:9200](http://localhost:9200) |
| Kibana        | [http://localhost:5601](http://localhost:5601) |
| Logstash      | Port 5000 (TCP input, not UI)                  |

---

## 🔐 Login to Kibana

* Open: [http://localhost:5601](http://localhost:5601)
* Username: `elastic`
* Password: `changeme`

---

## 📊 Create Index Pattern

1. Go to **Stack Management**
2. Click **Index Patterns**
3. Create new pattern:

   ```
   log*
   ```
4. Select `@timestamp` as time field

---

## 🔍 View Logs in Kibana

1. Go to **Discover**
2. Select your index pattern (`log*`)
3. You will see logs stored in Elasticsearch

---

## 📥 Send Logs to Logstash

Logstash listens on **port 5000** (TCP).

### Example (PowerShell - Windows):

```powershell
$tcp = New-Object System.Net.Sockets.TcpClient("localhost",5000)
$stream = $tcp.GetStream()
$writer = New-Object System.IO.StreamWriter($stream)
$writer.WriteLine('{"message":"Hello ELK"}')
$writer.Flush()
$writer.Close()
$tcp.Close()
```

---

## 🔎 View Logs Directly in Elasticsearch

You can also view stored logs directly using Elasticsearch API:

👉 Open in browser:

```
http://elastic:changeme@localhost:9200/logstash-*/_search?pretty
```

👉 Or using curl:

```bash
curl -u elastic:changeme http://localhost:9200/logstash-*/_search?pretty
```

---


## 🔄 Log Flow (How It Works)

```
Client/App → Logstash (port 5000)
           → Elasticsearch (store logs)
           → Kibana (visualize logs)
```

---

## 🧠 Observations

* Port **5000** is used for sending logs (not a UI)
* Logs sent to Logstash are processed and stored in Elasticsearch
* Kibana is used to visualize and analyze logs
* If logs are not in JSON format, you may see `_jsonparsefailure`

---

## ⚠️ Common Issues

* Kibana not loading → wait 2–3 minutes
* Port 5000 not opening in browser → expected behavior
* No logs in Kibana → check Logstash pipeline and index pattern

---

## 🎯 Conclusion

This setup provides a **basic centralized logging system** using ELK stack where:

* Logs are collected → processed → stored → visualized

