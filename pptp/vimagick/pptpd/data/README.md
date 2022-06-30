# 配置文件说明

## pptpd.conf
```text
localip 192.168.0.1                             #VPN服务器的虚拟ip
remoteip 192.168.0.200-238,192.168.0.245        #分配给VPN客户端的虚拟ip
```

## pptpd-options
```text
ms-dns 8.8.8.8
ms-dns 8.8.4.4
```

## chap-secrets
```text
client：连接账号
server：服务
secret：密码密码（例：pptpd）
IP addresses：允许连接的IP地址
```
