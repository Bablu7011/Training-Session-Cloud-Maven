
---

# Linux Practical Tasks

---

## 1. Permissions & umask (Practical)

Default `umask` was `0022`, so new file permission became `644` (666 - 022 = 644).
Changing `umask` to `0666` resulted in file permission `000`, showing how umask removes permission bits from default value.

![test1 Step 1](test1.png)

---

## 2. Users (Practical)


```bash
sudo useradd -m -s /bin/bash intern1
sudo chage -E $(date -d "+7 days" +"%Y-%m-%d") intern1
sudo chage -l intern1
```

Verified account expiry using `chage -l`.

![test2 Step 1](test2.png)

---

## 3. SSH (Practical)


* Generated key using `ssh-keygen`
* Added public key to `~/.ssh/authorized_keys`
* Logged in using `ssh -i` into localhost

Successful login confirmed key-based authentication.

![test3 Step 1](test3.1.png)
![test3 Step 2](test3.2.png)
![test3 Step 3](test3.3.png)
![test3 Step 4](test3.4.png)

---

## 4. Package Management (Practical)

**a.** Install `htop` using apt.

```bash
sudo apt install htop
```

**b.** Find which package provides `/bin/bash`.

```bash
dpkg -S /bin/bash
```

Output shows `/bin/bash` is provided by `bash` package.

![test4 Step 1](test4.1.png)
![test4 Step 2](test4.2.png)

---

## 5. Cron (Practical)


Crontab entry:

```bash
* * * * * /usr/bin/date >> /tmp/cron_test.log
```

Verified using `crontab -l` and checked log output.

![test5 Step 1](test5.png)

---

## 6. Systemd Timer (Practical)

Timer configuration:

```bash
OnCalendar=*:0/2
```

Enabled and verified using `systemctl list-timers`.

![test6 Step 1](test6.1.png)
![test6 Step 2](test6.2.png)
![test6 Step 3](test6.3.png)
![test6 Step 4](test6.4.png)

---

## 7. Network (Practical)

### a. Ping and Traceroute

```bash
ping -c 1 8.8.8.8
traceroute example.com
```

### b. Listening Ports

```bash
ss -tuln
ss -tuln | grep 80
```

### c. Packet Capture and Firewall Rule

```bash
sudo tcpdump -i any port 80 -c 5 -w /tmp/http.pcap
sudo ufw deny from 10.0.2.55 to any port 80
sudo ufw status
```

### d. HTTP Headers and DNS

```bash
curl -I http://example.com
dig +short example.com
```

![test7a](test7a.png)
![test7b](test7b.png)
![test7c Step 1](test7c.1.png)
![test7c Step 2](test7c.2.png)
![test7d](test7d.png)

---

## 8. Monitoring (Practical)

### a. Disk Usage

```bash
df -h
du -sh /var/log
```

### b. Top 3 Processes by Memory

```bash
ps aux --sort=-%mem | head -4
```

### c. System Logs

```bash
journalctl -n 20
sudo tail -n 20 /var/log/syslog
```

![test8a](test8a.png)
![test8b](test8b.png)
![test8c](test8c.png)

---

## 9. Logs (Practical)

### a. Last 20 Journal Logs

```bash
journalctl -n 20
```

### b. Web Server Logs Location

Nginx logs:

```
/var/log/nginx/access.log
/var/log/nginx/error.log
```

for the apache i have not installed but apche logs also going to store in /var/log directory
Apache logs:

```
/var/log/apache2/access.log
/var/log/apache2/error.log
```

![test9a](test9a.png)
![test9b](test9b.png)

---

## 10. Network Troubleshooting (Practical)

Capture HTTP traffic on port 80:

```bash
sudo tcpdump -i any port 80 -w http.pcap
ls -lh http.pcap
```

![test10a Step 1](test10a.1.png)
![test10a Step 2](test10a.2.png)

---

## 11. Small Script (Practical)

Created `/tmp/check_disk.sh` to check root disk usage.

Logic:

* If `/` usage > 80%, print "Disk almost full" to stderr and exit 1
* Otherwise print "Disk OK" to stdout and exit 0

Executed script and verified output.

![test11](test11.png)

---


Bonus: 
---
--> stdout is used for standard output.
--> stderr is used for error messages.

Example:
echo "Hello" > output.txt
echo "Error" > error.txt

-->Cron and systemd timers are used to schedule tasks.
In cron, a single crontab line schedules a command.
In systemd timer, we create two files: a .service file and a .timer file.

---
