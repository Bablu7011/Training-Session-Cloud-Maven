
---

# Linux Practical Tasks

---

## 1. Permissions & umask (Practical)

**a.** Create a file named `test.txt` with default permissions.
**b.** Show the output of `umask` and explain how umask affected the permission of that file.

Default `umask` was `0022`, so new file permission became `644` (666 - 022 = 644).
Changing `umask` to `0666` resulted in file permission `000`, proving umask removes permission bits from default base value.

Reference: test1 image

---

## 2. Users (Practical)

**a.** Create a user named `intern1` with `/bin/bash` as the default shell and set account expiry in 7 days.

Command used:

```
sudo useradd -m -s /bin/bash intern1
sudo chage -E $(date -d "+7 days" +"%Y-%m-%d") intern1
```

Verified using:

```
sudo chage -l intern1
```

Reference: test2 image

---

## 3. SSH (Practical)

**a.** Generate SSH keypair and configure passwordless login.

Steps:

* Generated key using `ssh-keygen`
* Copied public key to `~/.ssh/authorized_keys`
* Logged in using `ssh -i` into localhost

Successful login confirmed key-based authentication working.

Reference: test3.1 to test3.4 images

---

## 4. Package Management (Practical)

**a.** Install `htop` using apt.

```
sudo apt install htop
```

**b.** Find which package provides `/bin/bash`.

```
dpkg -S /bin/bash
```

Output shows `/bin/bash` is provided by `bash` package.

Reference: test4.1 and test4.2 images

---

## 5. Cron (Practical)

**a.** Create cron job to run `/usr/bin/date` every minute and append output to `/tmp/cron_test.log`.

Crontab entry:

```
* * * * * /usr/bin/date >> /tmp/cron_test.log
```

Verified using:

```
crontab -l
cat /tmp/cron_test.log
```

Reference: test5 image

---

## 6. Systemd Timer (Practical)

**a.** Create service that writes "Hello from systemd" into `/tmp/hello.txt`.

Service file: `systemd_test.service`
Timer file: `systemd_test.timer`

Timer configured with:

```
OnCalendar=*:0/2
```

Enabled using:

```
sudo systemctl enable systemd_test.timer
sudo systemctl start systemd_test.timer
```

Verified using:

```
systemctl list-timers
cat /tmp/hello.txt
```

Reference: test6.1 to test6.4 images

---

## 7. Network (Practical)

### a. Ping and Traceroute

```
ping -c 1 8.8.8.8
traceroute example.com
```

Verified connectivity and route path.

### b. Listening Ports

```
ss -tuln
ss -tuln | grep 80
```

Confirmed open TCP ports and checked if port 80 is listening.

### c. Packet Capture and Firewall Rule

Captured HTTP traffic:

```
sudo tcpdump -i any port 80 -c 5 -w /tmp/http.pcap
```

Blocked source IP:

```
sudo ufw deny from 10.0.2.55 to any port 80
sudo ufw status
```

### d. HTTP Headers and DNS

```
curl -I http://example.com
dig +short example.com
```

Verified response headers and A records.

Reference: test7a to test7d images

---

## 8. Monitoring (Practical)

### a. Disk Usage

```
df -h
du -sh /var/log
```

Checked filesystem usage and log directory size.

### b. Top 3 Memory Processes

```
ps aux --sort=-%mem | head -4
```

Sorted processes by memory usage and displayed top 3.

### c. System Logs

```
journalctl -n 20
sudo tail -n 20 /var/log/syslog
```

Displayed recent system and syslog entries.

Reference: test8a to test8c images

---

## 9. Logs (Practical)

### a. Last 20 Journal Logs

```
journalctl -n 20
```

### b. Web Server Logs Location

Nginx logs:

```
/var/log/nginx/access.log
/var/log/nginx/error.log
```

Apache logs (if installed):

```
/var/log/apache2/access.log
/var/log/apache2/error.log
```

Reference: test9a to test9b images

---

## 10. Network Troubleshooting (Practical)

Capture only HTTP traffic:

```
sudo tcpdump -i any port 80 -w http.pcap
```

Verified file creation:

```
ls -lh http.pcap
```

Reference: test10a.1 and test10a.2 images

---

## 11. Small Script (Practical)

Created `/tmp/check_disk.sh`:

Logic:

* Check `/` usage using `df`
* If usage > 80%, print "Disk almost full" to stderr and exit 1
* Otherwise print "Disk OK" to stdout and exit 0

Executed script:

```
./check_disk.sh
```

Output confirmed expected behavior.

Reference: test11 image

---

