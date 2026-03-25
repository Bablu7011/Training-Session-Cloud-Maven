
# 🚀 Shared Workflow CI/CD 

This project demonstrates how to:
- Create a shared GitHub Actions workflow
- Call it from another repository
- Build a Docker image
- Push the image to Docker Hub

---

# 📌 Task 1: Create Shared Workflow Repository

### 🔹 Steps:
- Created a repository: `shared-workflows`
- Added reusable workflow using `workflow_call`
- Simple job to print message

### 📂 Workflow File:
`.github/workflows/shared-ci.yml`

### 📷 Output:

![task1 Step 2](task1.2.png)
![task1 Step 1](task1.1.png)  

---

# 📌 Task 2: Use Shared Workflow in Another Repo

### 🔹 Steps:
- Created new repo: `demo-project`
- Called shared workflow using:

```yaml
uses: Bablu7011/shared-workflows/.github/workflows/shared-ci.yml@main
````

* Triggered workflow using `push`

### 📷 Output:

![task2 Step 1](task2.1.png)
![task2 Step 2](task2.2.png)

---

# 📌 Task 3: Update Shared Workflow

### 🔹 Steps:

* Modified shared workflow
* Added new step:

```yaml
- name: New update
  run: echo "Workflow updated!"
```

* Changes reflected automatically in caller repo

### 📷 Output:

![task3 Step 1](task3.1.png)
![task3 Step 2](task3.2.png)
![task3 Step 3](task3.3.png)

---

# 📌 Pracice Task: Docker Build & Push using Shared Workflow

### 🔹 Steps:

* Created new repo: `python-project`
* Added:

  * `app.py` (Flask app)
  * `requirements.txt`
  * `Dockerfile`
* Used shared workflow from:

```yaml
uses: clouddrove/github-shared-workflows/.github/workflows/docker-build-push.yml@master
```

* Passed inputs:

```yaml
provider: DOCKERHUB
images: babludevops701/myapp
IMAGE_TAG: latest
```

* Added GitHub Secrets:

  * `DOCKERHUB_USERNAME`
  * `DOCKERHUB_PASSWORD`

### 📷 Output:

![task4 Step 1](task4.1.png)
![task4 Step 2](task4.2.png)
![task4 Step 3](task4.3.png)
![task4 Step 4](task4.4.png)
![task4 Step 5](task4.5.png)
![task4 Step 6](task4.6.png)

---

# 🐳 Docker Image

Successfully pushed image to Docker Hub:

```
babludevops701/myapp:latest
```


