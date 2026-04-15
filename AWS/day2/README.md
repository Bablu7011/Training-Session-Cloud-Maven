# 🚀 AWS IAM Role Chaining & S3 Access Control

This project demonstrates how to securely manage access to AWS S3 using:
- IAM Users
- IAM Roles
- Role Chaining (User → Role1 → Role2)
- AWS CLI (STS AssumeRole)

---

# 📌 Objective

- Create an IAM user with limited permissions
- Allow access to S3 using roles instead of direct permissions
- Implement **Role Chaining**
- Perform S3 operations using temporary credentials

---

---

# 🔹 Task 1: Create IAM User & S3 Access Policy

## Step 1: Create IAM User

- Created a user: `cloudmaven-user`


![user_creation](./1.1new_user_name.png)


---

## Step 2: Create S3 Policy

* Allowed permission:

  * `s3:CreateBucket`


![policy_creation](./1.2Add_policy.png)


---

## Step 3: Name the Policy


![policy_name](./1.3Policy_name.png)


---

## Step 4: Attach Policy to User


![attach_policy](./1.4Attach_policy.png)


---

## Step 5: Create User

![create_user](./1.5Create_user.png)


---

## Step 6: Generate Access Key (for CLI)


![access_key](./1.6Create_Acces_key_for_cli.png)


---

## Step 7: Create S3 Bucket via CLI


aws s3 mb s3://cloud-maven7011 --region ap-south-1



![bucket_created](./1.7Created_s3_bucket.png)


---

## Step 8: Verify Bucket

```bash
aws s3 ls
```

![bucket_verify](./1.8Confirm_s3_bucket_created.png)


---

# 🔹 Task 2: Create Role for Bucket Deletion

## Step 1: Create IAM Role

* Trusted entity: AWS Account


![trusted_entity](./2.1Choose_trust_entity.png)


---

## Step 2: Add Trust Policy (User → Role)

![trust_policy](./2.2Add_Trusted_entities.png)


---

## Step 3: Add S3 Delete Policy

Permissions:

* `s3:DeleteBucket`
* `s3:ListBucket`


![bucket_policy](./2.3Add_bucket_policy.png)


---

## Step 4: Name Policy

![policy_name](./2.4Policy_name.png)


---

## Step 5: Attach Policy to Role


![role_policy](./2.4Role_with_policy_for_del_bucket.png)


---

## Step 6: Assume Role & Delete Bucket

```bash
aws sts assume-role \
--role-arn arn:aws:iam::<ACCOUNT_ID>:role/s3-bucket-delete-role \
--role-session-name test-session
```


![login_role](./2.5Login_As_role.png)

---

## Step 7: Delete Bucket


aws s3 rb s3://cloud-maven7011


![bucket_deleted](./2.6Bucket_Deleted.png)

---

# 🔹 Task 3: IAM Role Chaining (Advanced)

## 🎯 Goal

Instead of giving direct access:

* IAM User → Role 1 → Role 2 → S3

---

## Step 1: Create IAM Role 1

* Trusted entity: IAM User


![role1](./3.1iam-role-1_created.png)


---

## Step 2: Create IAM Role 2

* Trusted entity: Role 1


![role2](./3.2iam-role-2_created.png)


---

## Step 3: Attach Role1 to User


![user_role1](./3.3iam_user_attach_role1.png)


---

## Step 4: Allow Role1 → Assume Role2


![role1_policy](./3.4Attach_Policy_to_Role1.png)


---

## Step 5: Attach S3 Policy to Role2

Permissions:

* `s3:CreateBucket`
* `s3:ListBucket`
* `s3:ListAllMyBuckets`


![role2_policy](./3.5Attach_Policy_to_Role2.png)


---

## Step 6: Assume Role 1

```bash
aws sts assume-role \
--role-arn arn:aws:iam::<ACCOUNT_ID>:role/iam-role-1 \
--role-session-name role1-session
```


![role1_login](./3.6role1_login.png)


---

## Step 7: Assume Role 2 (Role Chaining)

```bash
aws sts assume-role \
--role-arn arn:aws:iam::<ACCOUNT_ID>:role/iam-role-2 \
--role-session-name role2-session
```





---

## Step 8: Create Bucket Using Role2

```bash
aws s3 mb s3://cloud-maven7011
aws s3 ls
```
![role2_login](./3.7role2_login_create_bucket.png)

## Bucker Verification
![bucket_verify](./3.8bucket_verification.png)


---

# 🔐 Key Concepts Learned

### ✅ IAM User vs Role

* User = Permanent identity
* Role = Temporary access

---

### ✅ Assume Role (STS)

* Provides temporary credentials
* More secure than static keys

---

### ✅ Role Chaining

* One role assumes another role
* Helps implement **least privilege**

---

### ✅ Why Not Direct Permissions?

* Improves security
* Better control
* Temporary access only

---

# ⚠️ Common Errors Faced

### ❌ AccessDenied (AssumeRole)

* Missing trust relationship
* Wrong principal

---

### ❌ Cannot delete bucket

* Bucket not empty
* Missing `s3:DeleteBucket`

---

### ❌ `aws s3 ls` not working

* Missing `s3:ListAllMyBuckets`

---

# 🏁 Conclusion

This project demonstrates:

* Secure AWS access using IAM roles
* Role chaining implementation
* Real-world DevOps security practices

---

