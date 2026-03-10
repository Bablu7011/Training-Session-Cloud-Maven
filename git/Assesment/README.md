stallation, Configuration & First Repository
**Name:** Bablu Kumar

This project demonstrates practical implementation of **Git version control and NGINX web server configuration**, including branching workflows, reverse proxy with Docker, SSL configuration, load balancing, and resolving merge conflicts.

---

# PRACTICAL 01 – Git Installation, Configuration & First Repository

## Step 1 – Install Git

Git was installed on the Ubuntu VM and verified using:

```bash
sudo apt update
sudo apt install git -y
git --version
```

This command installs Git and confirms the installed version.

![Task1 Step1](task1.1.png)

---

## Step 2 – Configure Git Global Identity

Git requires user identity information for commits.

```bash
git config --global user.name "Bablu Kumar"
git config --global user.email "your-email@example.com"
```

This sets the global Git username and email.

![Task1 Step2](task1.2.png)

---

## Step 3 – Initialize Git Repository

A project directory was created and Git was initialized.

```bash
mkdir git-nginx-assessment
cd git-nginx-assessment
git init
```

This creates a new Git repository.

![Task1 Step3](task1.3.png)

---

## Step 4 – Create Project Files

Two files were created:

**README.md**

```markdown
Project Title: Git Installation, Configuration & First Repository
Name: Bablu Kumar
```

**app.py**

```python
print("Hello Git")
```

Files were staged and committed:

```bash
git add README.md app.py
git commit -m "Initial commit: add README and app.py"
```

![Task1 Step4](task1.4.png)

---

## Step 5 – View Commit History

Git history was checked using:

```bash
git log
```

This displays:

* Commit hash
* Author
* Date
* Commit message

![Task1 Step5](task1.4.png)

---

# PRACTICAL 02 – Branching, Committing & Pull Request Workflow

## Step 1 – Create Feature Branch

```bash
git checkout -b feature/add-calculator
```

This creates and switches to a new branch.

![Task2 Step1](task2.1.png)

---

## Step 2 – Add Calculator Module

A new file `calculator.py` was created with Python functions.

```python
def add(a,b):
    return a+b

def subtract(a,b):
    return a-b
```

```bash
git checkout main
git pull origin main
```

![Task2 Step2](task2.2.png)


---

## Step 3 – Commit Calculator Module

```bash
git add calculator.py
git commit -m "feat: add calculator module"
```

![Task2 Step3](task2.3.png)

---

## Step 4 – Update README

README.md was updated to mention the calculator module.

```bash
git add README.md
git commit -m "docs: update README with calculator module"
```

![Task2 Step4](task2.4.png)

---

## Step 5 – Push Branch to GitHub

```bash
git push origin feature/add-calculator
```

![Task2 Step5](task2.5.png)

---

## Step 6 – Create Pull Request

A Pull Request was created on GitHub to merge the feature branch into main.

![Task2 Step6](task2.6.png)

---

## Step 7 – Merge Pull Request

After review, the PR was merged into the main branch.

![Task2 Step7](task2.7.png)

---



![Task2 Step8](task2.8.png)

---

# PRACTICAL 03 – Stash, Undo & History

## Step 1 – Git Stash

Temporary changes were stashed.

```bash
git stash
git stash pop
```

This saves uncommitted changes temporarily.

![Task3 Step1](task3.1.png)

---

## Step 2 – Git Revert

A commit was reverted.

```bash
git revert HEAD
```

This creates a new commit that undoes the previous commit.

![Task3 Step2](task3.2.png)

---

## Step 3 – Amend Commit Message

```bash
git commit --amend -m "fix: hotfix with corrected message"
```

This updates the last commit message.

![Task3 Step3](task3.3.png)

---

## Step 4 – Git Reset

```bash
git reset --soft HEAD~1
```

This removes the last commit but keeps the changes staged.

![Task3 Step4](task3.4.png)

---

# PRACTICAL 04 – NGINX Install, Config & Hosting Multiple Static Sites

## Step 1 – Install NGINX

```bash
sudo apt install nginx -y
systemctl status nginx
```

NGINX was successfully installed and running.

![Task4 Step1](task4.1.png)

---

## Step 2 – Validate Configuration

```bash
sudo nginx -t
```

This verifies the NGINX configuration file syntax.

![Task4 Step2](task4.2.png)

---

## Step 3 – Create Website Directories

```bash
sudo mkdir -p /var/www/app1.local/html
sudo mkdir -p /var/www/app2.local/html
```

Each directory contains its own `index.html`.

![Task4 Step3](task4.4.png)

---

## Step 4 – Create Server Blocks

Example configuration:

```nginx
server {
listen 80;
server_name app1.local;
root /var/www/app1.local/html;
index index.html;

location / {
try_files $uri $uri/ =404;
}
}
```

![Task4 Step4](task4.4.png)

---

## Step 5 – Enable Sites

```bash
sudo ln -s /etc/nginx/sites-available/app1.local /etc/nginx/sites-enabled/
sudo ln -s /etc/nginx/sites-available/app2.local /etc/nginx/sites-enabled/
```

NGINX configuration was reloaded.

---

## Step 6 – Test Sites

Hosts file updated:

```
127.0.0.1 app1.local
127.0.0.1 app2.local
```

Testing:

```bash
curl http://app1.local
curl http://app2.local
```

![Task4 Step6](task4.4.png)

---

# PRACTICAL 05 – Reverse Proxy with Docker Backend

## Step 1 – Run Backend Docker Container

```bash
docker run -d -p 8080:80 --name backend-app nginx:alpine
```

Testing backend:

```bash
curl http://localhost:8080
```

![Task5 Step1](task5.1.png)

---

## Step 2 – Configure Reverse Proxy

NGINX configuration:

```nginx
server {
listen 80;
server_name myapp.local;

location / {
proxy_pass http://127.0.0.1:8080;

proxy_set_header Host $host;
proxy_set_header X-Real-IP $remote_addr;
proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
proxy_set_header X-Forwarded-Proto $scheme;
}
}
```

![Task5 Step2](task5.2.png)

---

## Step 3 – Enable Site and Reload NGINX

```bash
sudo nginx -t
sudo systemctl reload nginx
```

![Task5 Step3](task5.3.png)
![Task5 Step4](task5.4.png)
![Task5 Step5](task5.5.png)
---

## Step 4 – Update Hosts File

```
127.0.0.1 myapp.local
```



---

## Step 5 – Test Reverse Proxy

```bash
curl http://myapp.local
```

NGINX successfully proxies requests to the Docker backend.



---

## Proxy Header Explanation

| Header            | Purpose                                       |
| ----------------- | --------------------------------------------- |
| Host              | Passes original host requested by client      |
| X-Real-IP         | Sends the client IP to backend server         |
| X-Forwarded-For   | Maintains chain of client IPs through proxies |
| X-Forwarded-Proto | Indicates original protocol (HTTP/HTTPS)      |

These headers allow backend applications to identify the **real client and protocol**.

---

# PRACTICAL 06 – SSL, Load Balancing & Merge Conflict

---

# 6a – SSL Configuration

Generate self-signed certificate:

```bash
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout /etc/ssl/private/myapp.key \
-out /etc/ssl/certs/myapp.crt
```

NGINX SSL configuration:

```nginx
server {
listen 443 ssl;
server_name myapp.local;

ssl_certificate /etc/ssl/certs/myapp.crt;
ssl_certificate_key /etc/ssl/private/myapp.key;

location / {
root /var/www/myapp.local/html;
index index.html;
}
}
```

Testing:

```bash
curl -k https://myapp.local
```

![Task6a Step1](task6a.1.png)

![Task6a Step2](task6a.6.png)

---

# 6b – Load Balancer Configuration

NGINX upstream configuration:

```nginx
upstream backend_servers {
server 127.0.0.1:8080;
server 127.0.0.1:8080;
}

server {
listen 80;
server_name myapp.local;

location / {
proxy_pass http://backend_servers;
}
}
```

This distributes traffic across backend servers.

![Task6b Step1](task6b.1.png)

![Task6b Step2](task6b.2.png)

---

# 6c – Merge Conflict Resolution

Conflict was created by editing the same line in two branches.

Git shows markers like:

```


After resolving manually:

```bash
git add README.md
git commit
```

Git history:

```bash
git log --oneline
```

![Task6c Step1](task6c.1.png)

![Task6c Step2](task6c.2.png)
![Task6c Step2](task6c.3.png)
![Task6c Step2](task6c.4.png)
![Task6c Step2](task6c.5.png)


---

