# 🚀 Day 2 - GitHub Actions Workflow (Simple Learning)

In this day, I learned how GitHub Actions works step by step.  
I created workflows and tested them using different tasks.

---

# ✅ Task 1: Trigger Workflow (PR + Manual)

### 🧠 What I learned:
- Workflow can run when Pull Request is created
- Workflow can also run manually using button

### 📌 What I did:
- Created a workflow file
- Added `pull_request` and `workflow_dispatch`

### 🖼️ Output:

![task1 Step 1](task1.1.png)  
![task1 Step 2](task1.2.png)  
![task1 Step 3](task1.3.png)  
![task1 Step 4](task1.4.png)  

---

# ✅ Task 2: Job Dependency (Build → Test)

### 🧠 What I learned:
- Jobs run parallel by default  
- Using `needs` we can run jobs in order  

### 📌 What I did:
- Created 2 jobs → build and test  
- Made test depend on build  

### 🖼️ Output:

![task2 Step 1](task2.1.png)  
![task2 Step 2](task2.2.png)  

---

# ✅ Task 3: GitHub Context Variables

### 🧠 What I learned:
- GitHub gives automatic variables  
- Example: branch name, commit id  

### 📌 What I did:
- Printed branch name using `${{ github.ref }}`
- Printed commit id using `${{ github.sha }}`  

### 🖼️ Output:

![task3 Step 1](task3.1.png)  
![task3 Step 2](task3.2.png)  

---

# ✅ Task 4: Pull Request Workflow

### 🧠 What I learned:
- Workflow runs automatically on PR  
- Can use build and test together  

### 📌 What I did:
- Created PR workflow  
- Added build and test jobs  
- Used `needs` for dependency  

### 🖼️ Output:

![task4 Step 1](task4.1.png)  
![task4 Step 2](task4.2.png)  
![task4 Step 3](task4.3.png)  

---

# ✅ Task 5: Docker Build & Push

### 🧠 What I learned:
- How to build Docker image in GitHub Actions  
- How to push image to DockerHub  
- How to use secrets securely  

### 📌 What I did:
- Logged in using DockerHub secrets  
- Built Docker image  
- Tagged image with username  
- Pushed image  
- Removed local image  

### 🖼️ Output:

![task5 Step 1](task5.1.png)  
![task5 Step 2](task5.2.png)  
![task5 Step 3](task5.3.png)  

---

