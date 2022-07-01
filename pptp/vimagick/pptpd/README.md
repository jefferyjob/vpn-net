# Docker搭建pptpd服务器

## 搭建步骤

### 开放端口
- 1723/tcp

### 启动pptpd
```bash
docker-compose up -d
```

### 配置网络转发

#### 设置ipv4转发
还要让系统允许 IP forward, 编辑 /etc/sysctl.conf 这个文件, 确保有这一行:
```bash
net.ipv4.ip_forward = 1
```
然后, 运行 `sysctl -p`

#### 设置iptables NAT转发
```bash
#注意这里eth0代表你的外网网卡，请用ifconfig查看或者咨询网络管理员
#如果不懂网卡知识，建议去了解一下，又不难
sudo iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -o eth0 -j MASQUERADE
#如果上面的命令报错,可以尝试以下的命令，其中xxx.xxx.xxx.xxx代表你的VPS外网(公网)ip地址
#如果你是用虚拟机的话这里的xxx.xxx.xxx.xxx代表你用宿主机能ping通的虚拟机ip
sudo iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -o eth0 -j SNAT --to-source xxx.xxx.xxx.xxx
```

设置MTU来确保过大的包不会被丢弃（这个可以不做，看字面意思就懂）

```bash
sudo iptables -I FORWARD -s 192.168.0.0/24 -p tcp --syn -i ppp+ -j TCPMSS --set-mss 1300
```

#### 检查VPN服务器的连接情况
```bash
ps -aux | grep pptpd
 
 #检查结果
root      2711  0.0  0.0  10680   752 ?        Ss   07:50   0:00 /usr/sbin/pptpd
ubuntu    2882  0.0  0.0  10460   936 pts/0    S+   08:20   0:00 grep --color=auto pptpd
ubuntu@ip-172-31-26-143:~$ ps -aux | grep pptpd
root      2711  0.0  0.0  10680   756 ?        Ss   07:50   0:00 /usr/sbin/pptpd
root      2883  0.0  0.0  14884   892 ?        S    08:21   0:00 pptpd [221.194.176.15:12E3 - 0100]                                                                    
root      2884  0.0  0.2  34840  2240 pts/4    Ss+  08:21   0:00 /usr/sbin/pppd local file /etc/ppp/pptpd-options 115200 172.31.26.143:172.31.26.100 ipparam 221.194.176.15 plugin /usr/lib/pptpd/pptpd-logwtmp.so pptpd-original-ip 221.194.176.15 remotenumber 221.194.176.15
ubuntu    2895  0.0  0.0  10464   932 pts/0    S+   08:21   0:00 grep --color=auto pptpd
```