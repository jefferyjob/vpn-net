# OpenVPN官方Docker镜像

该镜像是OpenVPN官方发布的Docker镜像，由于搭建步骤比较繁琐，所以**不推荐**使用该镜像搭建 OpenVPN 服务。

## 搭建步骤

- 启动docker容器
- 在容器内安装easy-rsa软件，用于生成CA证书
- 运行data/cmd中的脚本，用于添加用户删除用户
