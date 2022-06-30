# Docker 部署 OpenVPN



## 搭建步骤

**配置OpenVPN容器**
```bash
docker-compose run --rm  openvpn ovpn_genconfig -u udp://<ip address>
# 后面的IP地址，请写入你服务器的公网IP地址
```

**初始化**
```bash
docker-compose run --rm openvpn ovpn_initpki
```
初始化过程说明
```text
# 输入私钥密码（输入时是看不见的
Enter PEM pass phrase:123456
# 再输入一遍
Verifying - Enter PEM pass phrase:123456
# 输入一个CA名称（我这里直接回车）
Common Name (eg: your user, host, or server name) [Easy-RSA CA]:
# 输入刚才设置的私钥密码（输入完成后会再让输入一次）
Enter pass phrase for /etc/openvpn/pki/private/ca.key:123456
```

**启动OpenVPN**
```bash
docker-compose up -d
```

**创建用户jack客户端文件**
```bash
docker-compose run --rm openvpn easyrsa build-client-full jack nopass
```
输入密码过程说明
```text
输入刚才设置的密码
Enter pass phrase for /etc/openvpn/pki/private/ca.key:12345678
```

**导出.ovpn文件到本地**
```bash
docker-compose run --rm openvpn ovpn_getclient jack > ./jack.ovpn
```

**删除用户jack**
```bash
docker-compose run --rm openvpn easyrsa revoke jack
docker-compose run --rm openvpn easyrsa gen-crl update-db
docker-compose restart
```

