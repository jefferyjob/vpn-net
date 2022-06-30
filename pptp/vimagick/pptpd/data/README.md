# 配置文件说明

## pptpd.conf
```text
localip  服务器内网IP（例：192.168.9.1）
remoteip VPN分配的网段（例：192.168.9.100-150）
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
