📘 Day 3 – Linux Networking & Web Server Lab

This lab covers:

Network Identity

Routing

Internet Connectivity

DNS Analysis

Hosting a Web Server

Firewall Testing

Local Domain Resolution

🧪 Task 1 – Verify Network Identity
🔹 Command Used
ip addr
📖 Explanation

This command shows:

Network interfaces

IP address

Subnet mask

Interface status (UP/DOWN)

It helps us identify:

Our private IP

Network interface name

ip route
📖 Explanation

Shows routing table:

Default gateway

Network routes

Source IP used for outgoing traffic

hostname -I
📖 Explanation

Displays the system IP address in clean format.

ping -c 4 172.31.0.1
📖 Explanation

Tests connectivity to the default gateway.

![Task1](Task1.png)

🌍 Task 2 – Test Internet Connectivity
🔹 Test Internet by IP
ping -c 4 8.8.8.8
📖 Explanation

Tests raw internet connectivity.
If this works → routing & gateway are correct.

🔹 Test Internet by Domain
ping -c 4 google.com
📖 Explanation

Tests:

DNS resolution

Internet connectivity

🔹 Trace Route
traceroute google.com
📖 Explanation

Shows path packets travel from EC2 to Google.

![Task2](Task2.png)

🌐 Task 3 – DNS Analysis
🔹 Check DNS Resolution
dig google.com
📖 Explanation

Displays:

DNS server used

Resolved IP

Query time

TTL

🔹 Check /etc/resolv.conf
cat /etc/resolv.conf
📖 Explanation

Shows which DNS server system is using.
In this case:

nameserver 127.0.0.53

Which means systemd-resolved stub resolver.

🔹 Use nslookup
nslookup google.com
📖 Explanation

Another method to test DNS resolution.

![Task3](Task3.png)

🌐 Task 4 – Install and Configure Nginx
🔹 Install Nginx
sudo apt install nginx -y
📖 Explanation

Installs nginx web server and enables the service.

🔹 Create Simple Web Page
echo "Hello from my server" | sudo tee /var/www/html/index.html
📖 Explanation

Creates/overwrites default nginx page.

🔹 Test Locally
curl http://localhost
📖 Explanation

Tests if nginx is working internally.

🔹 Check Service Status
sudo systemctl status nginx
📖 Explanation

Verifies nginx service is active and running.
![Task4](Task4.1.png)
![Task4](Task4.2.png)

🔌 Task 5 – Check Listening Ports
ss -tuln
📖 Explanation

Shows open ports:

Port 80 → HTTP

Port 443 → HTTPS

Port 53 → DNS

![Task5](Task5.png)

🛑 Task 6 – Stop Nginx and Verify
sudo systemctl stop nginx
📖 Explanation

Stops nginx service.

ss -tuln
📖 Explanation

Verify that port 80 is no longer listening.

![Task6](Task6.png)

🔥 Task 7 – Firewall Configuration (UFW)
🔹 Enable Firewall
sudo ufw enable
📖 Explanation

Activates firewall protection.

🔹 Allow Web Traffic
sudo ufw allow 80
sudo ufw allow 443
📖 Explanation

Allows HTTP & HTTPS traffic.

🔹 Deny SSH
sudo ufw deny 22
📖 Explanation

Blocks SSH access (port 22).
And i have connected(ssh) with port 443 so then i have deny and checked that working or not.
Because my college wifi blocked port 22 to connect so in /etc/ssh/sshd_config

🔹 Check Status
sudo ufw status
📖 Explanation

Displays firewall rules.

![Task7](Task7.1.png)
![Task7](Task7.2.png)



🏷 Task 8 – Local Domain using /etc/hosts
🔹 Edit Hosts File
sudo vim /etc/hosts

Add:

127.0.0.1 mytest.local
📖 Explanation

This overrides DNS and maps domain to localhost.

🔹 Test Custom Domain
curl http://mytest.local
📖 Explanation

Verifies local domain resolution without DNS server.

![Task8](Task8.1.png)

![Task8](Task8.2.png)