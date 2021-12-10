# Shadowsocks查看服务器上面的 用户连接数/设备数 方法

## 基础教程

本方法仅适用于 Debian/Ubuntu 系统(部分代码支持CentOS)，ShadowsocksR 服务端和Shadowsocks Python 服务端！
首先，我们是使用netstat命令来查询当前服务器（VPS）的连接数据。

```
以下方法适用于 ShadowsocksR(Python) 的服务端，因为ShadowsocksR服务端由 Python 编写，并且默认开启ipv6，所以很容易过滤出一些信息。
```

以下方法适用于 ShadowsocksR(Python) 的服务端，因为ShadowsocksR服务端由 Python 编写，并且默认开启ipv6，所以很容易过滤出一些信息。

#### 显示出由Python建立完成的TCP链接列表

```
# 显示所有进出链接
netstat -anp |grep 'ESTABLISHED' |grep 'python'

# 仅显示链接服务器的用户连接
netstat -anp |grep 'ESTABLISHED' |grep 'python' |grep 'tcp6'

# 仅显示链接服务器的用户连接数量
netstat -anp |grep 'ESTABLISHED' |grep 'python' |grep 'tcp6' |wc -l

# 仅显示链接服务器的用户连接并写入到文件
netstat -anp |grep 'ESTABLISHED' |grep 'python' |grep 'tcp6'>>/root/log.txt

# 如果你是多用户版(多个端口)的服务端，那么你可以用这个命令

# 显示当前链接服务器的用户的SS端口
netstat -anp |grep 'ESTABLISHED' |grep 'python' |grep 'tcp6' |awk '{print $4}' |sort -u

# CentOS6系统用这个，CentOS7用上面那个。
netstat -anp |grep 'ESTABLISHED' |grep 'python' |grep 'tcp' | grep '::ffff:' |awk '{print $4}' |sort -u

# 显示当前链接服务器的用户的SS端口数量
netstat -anp |grep 'ESTABLISHED' |grep 'python' |grep 'tcp6' |awk '{print $4}' |sort -u |wc -l

# CentOS6系统用这个，CentOS7用上面那个。
netstat -anp |grep 'ESTABLISHED' |grep 'python' |grep 'tcp' | grep '::ffff:' |awk '{print $4}' |sort -u |wc -l

# 显示当前所有链接SS的用户IP
netstat -anp |grep 'ESTABLISHED' |grep 'python' |grep 'tcp6' |awk '{print $5}' |awk -F ":" '{print $1}' |sort -u

# 显示当前所有链接SS的用户IP数量
netstat -anp |grep 'ESTABLISHED' |grep 'python' |grep 'tcp6' |awk '{print $5}' |awk -F ":" '{print $1}' |sort -u |wc -l
```

```
第一条命令

把所有的进出链接都列出来，Shadowsocks客户端在链接服务器后 本地的IP和端口 是 “进” 的，服务器在接收到Shadowsocks客户端的数据后会去访问指定的网站或IP，而这是 “出”的。这一条命令就是把这 一进一出 的信息都列出来，可以知道 客户端用户连接的是哪个 SS端口，还有客户 自身的IP和端口。

第二条命令

仅显示链接服务器的用户的链接，也就是上面一段话中说的 “进”，这个命令不会吧服务器在访问的网站或IP给列出来，纯粹用来看 Shadowsocks用户的链接信息。

第三条命令

仅显示链接服务器的用户连接数量，有时候链接 当前服务器的 Shadowsocks用户很多，你只想知道有几个人链接，那就用这一条命令（这个链接数量不是准确的，具体看下面的注意说明）。

第四条命令

仅显示链接服务器的用户连接并写入到文件，有时候在ssh上面查看大量文本不是一个好主意，所以保存到某个目录，然后自己去用sftp下载下来看信息是个不错的选择。

第五条命令

显示当前链接服务器的用户的SS端口，这个命令会去除重复的，最后显示的只有 正在链接SS服务器的用户的SS端口。

第六条命令

显示当前链接服务器的用户的SS端口数量，这个就是显示 数量。

第七条命令

显示当前所有链接SS的用户IP，这个命令会去除重复的，最后显示的只有 正在链接SS服务器的用户的IP。

第八条命令

显示当前所有链接SS的用户IP数量，这个就是显示 数量。
注意：你经常会看到 用户IP一样但后面的端口不一样(1.1.1.1:2333、1.1.1.1:6666)，那是因为他的SS客户端开了好几条TCP链接，所以一般情况下还是一个人在使用，但是也不排除路由器局域网情况下多个人同时使用，这时候也是这样显示的。
```

#### 进阶教程

如果你想单独查看一个SS端口的链接数，那你可以看看下面几条命令。

```
# 列出 当前SS端口连接的链接数。比如：服务器IP是 233.233.233.233 ，然后你想要知道链接数的端口是10000 ，那命令就是第二行的示例
# 示例 netstat -anp |grep 'ESTABLISHED' |grep 'python' |grep 'tcp6' |grep 233.233.233.233:10000
>> netstat -anp |grep 'ESTABLISHED' |grep 'python' |grep 'tcp6' |grep VPS_IP:SS_Port

# 显示 当前SS端口连接的链接数，这个只是显示有几个链接数。示例如上。
# 示例 netstat -anp |grep 'ESTABLISHED' |grep 'python' |grep 'tcp6' |grep 233.233.233.233:10000 |wc -l/li>
>> netstat -anp |grep 'ESTABLISHED' |grep 'python' |grep 'tcp6' |grep VPS_IP:SS_Port |wc -l/li>
```
