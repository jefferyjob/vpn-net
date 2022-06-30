# Shell使用

### 创建一个用户
```bash
sh ovpn_user.sh <username>
```
/etc/openvpn/client/keys 目录下生成以用户名命名的 zip 打包文件，将该压缩包下载到本地解压，即可加载到客户端使用

### 删除一个用户
```bash
sh del_ovpn_user.sh <username>
```
