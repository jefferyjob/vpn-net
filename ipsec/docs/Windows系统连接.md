# Windows10 连接VPN

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



## 连接VPN

提供两种方式连接VPN，分别为L2TP/IPSec和IKEv2，你可以任选其一连接。

### L2TP/IPSec

右键单击系统托盘中的无线/网络图标。
选择 打开"网络和 Internet"设置，然后在打开的页面中单击 网络和共享中心。
单击 设置新的连接或网络。
选择 连接到工作区，然后单击 下一步。
单击 使用我的Internet连接 (VPN)。
在 Internet地址 字段中输入你的 VPN 服务器 IP。
在 目标名称 字段中输入任意内容。单击 创建。
返回 网络和共享中心。单击左侧的 更改适配器设置。
右键单击新创建的 VPN 连接，并选择 属性。
单击 安全 选项卡，从 VPN 类型 下拉菜单中选择 "使用 IPsec 的第 2 层隧道协议 (L2TP/IPSec)"。
单击 允许使用这些协议。选中 "质询握手身份验证协议 (CHAP)" 和 "Microsoft CHAP 版本 2 (MS-CHAP v2)" 复选框。
单击 高级设置 按钮。
单击 使用预共享密钥作身份验证 并在 密钥 字段中输入你的 VPN IPsec PSK。
单击 确定 关闭 高级设置。
单击 确定 保存 VPN 连接的详细信息。

### IKEv2

Windows 8, 10 和 11 用户可以自动导入 IKEv2 配置

将生成的 .p12 文件安全地传送到你的计算机。
右键单击 [ikev2_config_import.cmd](assets/windows/ikev2_config_import.cmd) 并保存这个辅助脚本到与 .p12 文件 相同的文件夹。
右键单击保存的脚本，选择 属性。单击对话框下方的 解除锁定，然后单击 确定。
右键单击保存的脚本，选择 以管理员身份运行 并按提示操作。