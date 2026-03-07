
---

````markdown
 Git Training – Scenario Based Practice

This repository demonstrates practical Git scenarios that developers commonly face while working in a team environment.  
Each scenario shows the problem, the solution, and the commands used to fix it.

---

# Scenario 1 – Wrong Branch Commit


## Solution
We move the commit to the correct branch and clean the main branch.

---

### Step 1 – Create a file and commit in main (mistakenly)

A file `hello.py` was created and committed, but it should have been committed in the feature branch.

![scenerio1 Step 1](scenerio1.1.png)

---

### Step 2 – Verify commit history

The commit history shows that the new commit exists on the `main` branch.

![scenerio1 Step 2](scenerio1.2.png)

---

### Step 3 – Create feature branch

We create the branch `feature/login` from the current commit.

```bash
git checkout -b feature/login
````

![scenerio1 Step 3](scenerio1.3.png)

---

### Step 4 – Reset main branch

Now we go back to the main branch and remove the last commit using soft reset.

```bash
git checkout main
git reset --soft HEAD~1
```

![scenerio1 Step 4](scenerio1.4.png)

---

### Step 5 – Push feature branch to GitHub

Finally, push the correct branch to the remote repository.

```bash
git push origin feature/login
```

![scenerio1 Step 5](scenerio1.5.png)

---

# Scenario 2 –  Bad Commit Already Pushed

keys**.

Example:

```
database_password=12345bablu
```

This should never be committed to the repository.

---

## Solution

Since the commit was already pushed to GitHub, we cannot use `git reset`.
Instead, we use **git revert**, which safely undoes the change without rewriting history.

---

### Step 1 – Create sensitive file

A file `database.txt` was created containing a password.

![scenerio2 Step 1](scenerio2.1.png)

---

### Step 2 – Commit the sensitive file

The file was committed accidentally.

![scenerio2 Step 2](scenerio2.2.png)

---

### Step 3 – Push to GitHub

The commit was pushed to GitHub.

![scenerio2 Step 3](scenerio2.3.png)

---

### Step 4 – Check commit history

We identify the commit that contains the mistake.

![scenerio2 Step 4](scenerio2.4.png)

---

### Step 5 – Revert the commit

We revert the commit safely using:

```bash
git revert <commit-id>
git push origin main
```

This creates a new commit that removes the sensitive file.

![scenerio2 Step 5](scenerio2.5.png)

---

# Scenario 3 –  Merge Conflict in Team Environmen

In this scenario:

* `main` branch modified `hello.txt`
* `feature/payment` branch also modified `hello.txt`

When trying to merge, Git cannot automatically decide which change to keep.

---

### Step 1 – Create feature branch

We create a new branch `feature/payment`.

![scenerio3 Step 1](scenerio3.1.png)

---

### Step 2 – Modify file in main branch

Changes were made in the `main` branch.

![scenerio3 Step 2](scenerio3.2.png)

---

### Step 3 – Modify file in feature branch

The same file was edited in the feature branch.

![scenerio3 Step 3](scenerio3.3.png)

---

### Step 4 – Push feature branch

Push the feature branch to GitHub.

![scenerio3 Step 4](scenerio3.4.png)

---

### Step 5 – Create Pull Request

Open a pull request to merge the feature branch into main.

![scenerio3 Step 5](scenerio3.5.png)

---

### Step 6 – Conflict detected

GitHub detects a conflict because both branches modified the same file.

![scenerio3 Step 6](scenerio3.6.png)

---

### Step 7 – Resolve conflict

Edit the file and choose the correct content.

![scenerio3 Step 7](scenerio3.7.png)

---

### Step 8 – Mark conflict resolved

After fixing the conflict, mark it as resolved.

![scenerio3 Step 8](scenerio3.8.png)

---

### Step 9 – Merge the Pull Request

Once conflicts are resolved, merge the pull request.

![scenerio3 Step 9](scenerio3.9.png)

---

### Step 10 – Final merged result

The changes are now successfully merged into the main branch.

![scenerio3 Step 10](scenerio3.10.png)

---

