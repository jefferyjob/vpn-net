# Open VPN

## 搭建步骤

### 开放端口

- 1194/udp

### Shell搭建

```bash
wget https://get.vpnsetup.net/ovpn -O openvpn.sh
sudo bash openvpn.sh
```
安装过程演示
```bash
$ bash openvpn.sh

Welcome to this OpenVPN server installer!

Which IPv4 address should be used?
     1) 172.31.9.112
     2) 172.17.0.1
IPv4 address [1]: 1

This server is behind NAT. What is the public IPv4 address or hostname?
Public IPv4 address / hostname [54.92.87.72]:

Which protocol should OpenVPN use?
   1) UDP (recommended)
   2) TCP
Protocol [1]: 1

What port should OpenVPN listen to?
Port [1194]:

Select a DNS server for the clients:
   1) Current system resolvers
   2) Google
   3) 1.1.1.1
   4) OpenDNS
   5) Quad9
   6) AdGuard
DNS server [1]:

Enter a name for the first client:
Name [client]:

OpenVPN installation is ready to begin.
Press any key to continue...

Installing OpenVPN, please wait...
+ apt-get -yqq update
+ apt-get -yqq install openvpn openssl ca-certificates
+ ./easyrsa init-pki
+ ./easyrsa --batch build-ca nopass
+ EASYRSA_CERT_EXPIRE=3650
+ ./easyrsa build-server-full server nopass
+ EASYRSA_CERT_EXPIRE=3650
+ ./easyrsa build-client-full client nopass
+ EASYRSA_CRL_DAYS=3650
+ ./easyrsa gen-crl
+ openvpn --genkey --secret /etc/openvpn/server/tc.key
+ systemctl enable --now openvpn-iptables.service
+ systemctl enable --now openvpn-server@server.service

Finished!

The client configuration is available in: /root/client.ovpn
New clients can be added by running this script again.
```

### 客户端下载
- 下载地址：https://openvpn.net/vpn-client
- MacOS也可以使用：https://tunnelblick.net

## 参考资料
- OpenVPN Shell搭建：https://github.com/hwdsl2/openvpn-install/blob/master/README-zh.md