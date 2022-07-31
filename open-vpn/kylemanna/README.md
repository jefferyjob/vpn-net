# Docker部署OpenVPN

该 docker-compose 基于 kylemanna/docker-openvpn 编写，由于官方的镜像搭建起来较为繁琐，在docker镜像中，该镜像属于高Star镜像，操作方便，所以推荐使用该方式搭建OpenVPN服务器

## 搭建步骤

### 开放端口

- 1194/udp

### 配置OpenVPN容器
```bash
docker compose run --rm  openvpn ovpn_genconfig -u udp://<ip address>
```
后面的IP地址，请写入你服务器的公网IP地址

### 初始化
```bash
docker compose run --rm openvpn ovpn_initpki
```
初始化过程说明
```text
Enter New CA Key Passphrase(输入私钥密码,输入时是看不见的):
Re-Enter New CA Key Passphrase(再次输入密码):
Common Name (eg: your user, host, or server name) [Easy-RSA CA](输入CA名称，这里我直接回车，采用默认名称):
Enter pass phrase for /etc/openvpn/pki/private/ca.key(输入刚才设置的私钥密码,输入完成后会再让输入一次):
```

### 启动OpenVPN
```bash
docker-compose up -d
```

### 创建用户jack客户端文件
```bash
docker compose run --rm openvpn easyrsa build-client-full jack nopass
```
输入密码过程说明
```text
Enter pass phrase for /etc/openvpn/pki/private/ca.key(输入刚才设置的私钥密码):
```

### 导出.ovpn文件到本地
```bash
docker compose run --rm openvpn ovpn_getclient jack > ./jack.ovpn
```

### 删除用户jack
```bash
docker compose run --rm openvpn easyrsa revoke jack
docker compose run --rm openvpn easyrsa gen-crl update-db
docker compose restart
```

## 参考资料

- https://github.com/kylemanna/docker-openvpn
