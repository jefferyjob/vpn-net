# 文件下载器

由于VPN服务器搭建完成后，下载密钥文件比较麻烦。所以该Docker容器基于nginx，提供快捷的下载服务。

## 搭建步骤

### 开放端口

- 80/http

### 启动nginx

```bash
docker-compose up -d
```

### 授权
请授予777的权限，否则没有文件下载权限
```bash
chmod -R 777 ../*
```

### 访问
server ip 是你服务器的公网IP
```text
http://<server ip>:80
```
你可以通过此网址下载所需要的文件