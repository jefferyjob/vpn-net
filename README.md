# 科学上网搭建教程

本教程可协助您快速搭建科学上网服务器，支持各种主流的VPN协议服务。

支持Shell脚本搭建和Docker镜像搭建，方便快捷。

## 协议区别对比

|                | Basic VPN<br />PPTP                                          | STANDARD VPN<br />L2TP/IPsec                                 | SECURE VPN<br />OpenVPN                                      | SECURE VPN<br />SSTP (Very New)                              |
| -------------- | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| 加密/安全      | 128 BIT Basic                                                | 256 BIT Standard                                             | 2048 BIT Very Strong                                         | 2048 BIT Very Strong                                         |
| 支持的操作系统 | Windows<br/>Mac OS X<br/>Linux<br/>iOS<br/>Android<br/>Windows Mobile<br/>DD-WRT | Windows<br/>Mac OS X<br/>Linux<br/>iOS<br/>Android<br/>Windows Mobile<br/>DD-WRT | Windows<br/>Mac OS X<br/>Linux<br/>iOS<br/>Android<br/>Windows Mobile<br/>DD-WRT | Windows<br/>Linux                                            |
| 兼容性         | desktops, laptops, tablets,<br/>smartphones                  | desktops, laptops, tablets,<br/>smartphones                  | desktops, laptops, tablets,<br/>smartphones                  | desktops, laptops                                            |
| 速度           | 由于采用basic加密，所以速度非常快                            | 需要更多 CPU 来加密数据                                      | 最佳性能，即使在高延迟连接时也非常快                         | 最佳性能，即使在高延迟连接时也非常快                         |
| 配置           | 非常简单，协议内置于大多数设备中，不需要额外的软件           | 简单，需要额外的设置，大多数设备内置的协议，不需要额外的软件 | 需要额外的软件，可选需要安装证书                             | Windows 7内置协议，如果在其他操作系统中使用需要额外的软件，需要安装证书 |
| Ports          | TCP 1723                                                     | UDP 500<br/>UDP 1701<br/>UDP 4500                            | ANY<br/>(高度可以定制，可以使用任何可用端口，可以监听TCP和UDP协议) | TCP 443                                                      |
| 被GFW屏蔽难度  | 最不可靠，很容易被阻止/过滤                                  | 不可靠，仍然很容易被阻止/过滤                                | 非常灵活和可定制，很难被阻止或者过滤                         | 协议太新，无法阻止/过滤                                      |
| 概述           | PPTP 非常快速且易于设置。 如果您的设备不支持OpenVPN 或 SSTP VPN，这是一个不错的选择，并且安全性不是您关心的问题之一。 | 如果您的设备不支持 OpenVPN 或 SSTP VPN，并且您关心稍高的安全性，L2TP/IPsec 是一个不错的选择。 | OpenVPN 是所有平台的推荐协议，具有最高的性能、安全性和可靠性。 | SSTP 是 Windows 的推荐协议（未来可能会改进），最高的性能、安全性和可靠性 |

## 推荐等级

此推荐登记的排序，依据服务搭建难易程度、稳定性、客户端配置难易程度，笔者主观看法进行排序。

**☆☆☆☆☆**  

- OpenVpn
- IPsec

**☆☆☆**  

- pptp
- ssr

**☆**  

- WireGuard
