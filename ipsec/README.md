# IPsec VPN

## 搭建步骤
### 开放端口

- 4500/udp
- 500/udp

### 开始搭建

```bash
docker compose up -d
```

```bash
docker logs ipsec-vpn-server
```

```text
Trying to auto discover IP of this server...

Starting IPsec service...

================================================

IPsec VPN server is now ready for use!

Connect to your new VPN with these details:

Server IP: 54.92.87.72
IPsec PSK: vpn_user_psk
Username: vpn_user
Password: vpn_user_pwd

Write these down. You'll need them to connect!

VPN client setup: https://vpnsetup.net/clients2

================================================

Setting up IKEv2. This may take a few moments...

================================================

IKEv2 setup successful. Details for IKEv2 mode:

VPN server address: 54.92.87.72
VPN client name: vpnclient

Client configuration is available inside the
Docker container at:
/etc/ipsec.d/vpnclient.p12 (for Windows & Linux)
/etc/ipsec.d/vpnclient.sswan (for Android)
/etc/ipsec.d/vpnclient.mobileconfig (for iOS & macOS)

Next steps: Configure IKEv2 clients. See:
https://vpnsetup.net/clients2

================================================
```

## IPsec VPN 介绍
### 支持协议
- IPsec/L2TP
- Cisco IPsec
- IKEv2

### 管理命令
#### IPsec 管理命令
```bash
## 查看ipsec状态
docker exec -it ipsec-vpn-server ipsec status
# 列出已连接的客户端
docker exec -it ipsec-vpn-server ipsec whack --trafficstatus
```
#### IKEv2 管理命令
```bash
# 添加一个客户端（使用默认选项）
docker exec -it ipsec-vpn-server ikev2.sh --addclient [client name]
# 导出一个已有的客户端的配置
docker exec -it ipsec-vpn-server ikev2.sh --exportclient [client name]
# 列出已有的客户端
docker exec -it ipsec-vpn-server ikev2.sh --listclients
# 显示使用信息
docker exec -it ipsec-vpn-server ikev2.sh -h
```

## 参考资料
### 部署
- IPsec VPN Shell搭建：https://github.com/hwdsl2/setup-ipsec-vpn/blob/master/README-zh.md
- IPsec VPN Docker搭建：https://github.com/hwdsl2/docker-ipsec-vpn-server/blob/master/README-zh.md
### 连接
- IPsec/L2TP VPN 客户端连接：https://github.com/hwdsl2/setup-ipsec-vpn/blob/master/docs/clients-zh.md
- IKEv2 VPN 客户端连接：https://github.com/hwdsl2/setup-ipsec-vpn/blob/master/docs/ikev2-howto-zh.md