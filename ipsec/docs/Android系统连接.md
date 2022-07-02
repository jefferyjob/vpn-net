# Android 连接VPN

## 生成的VPN账号示例

<details>
<summary>
点击展开查看
</summary>

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
</details>

## 连接步骤演示

### L2TP/IPSec

启动 设置 应用程序。  
单击 网络和互联网。或者，如果你使用 Android 7 或更早版本，在 无线和网络 部分单击 更多...。  
单击 VPN。  
单击 添加VPN配置文件 或窗口右上角的 +。  
在 名称 字段中输入任意内容。  
在 类型 下拉菜单选择 L2TP/IPSec PSK。  
在 服务器地址 字段中输入你的 VPN 服务器 IP。  
保持 L2TP 密钥 字段空白。  
保持 IPSec 标识符 字段空白。  
在 IPSec 预共享密钥 字段中输入你的 VPN IPsec PSK。  
单击 保存。  
单击新的VPN连接。  
在 用户名 字段中输入你的 VPN 用户名。  
在 密码 字段中输入你的 VPN 密码。  
选中 保存帐户信息 复选框。  
单击 连接。  
