# SSR.sh 搭建SSR/SS服务端教程


> #### 相关链接
>
> 境外服务器：https://www.vultr.com/?ref=8214267  
> 本站ssr脚本预览：https://raw.githubusercontent.com/mailjobblog/demo_code/main/linux/vpn/ssh.sh/ssr.sh  

> #### SSR\SS 客户端配置下载
>
> windows系统 ssr下载地址：https://github.com/shadowsocksrr/shadowsocksr-csharp/releases/download/4.9.0/ShadowsocksR-win-4.9.0.zip  
> Android系统 ssr下载地址：https://github.com/shadowsocksrr/shadowsocksr-android/releases/download/3.5.4/shadowsocksr-android-3.5.4.apk  
> Mac系统 ssr下载地址：https://github.com/qinyuhang/ShadowsocksX-NG-R/releases/download/1.4.3-R8-build3/ShadowsocksX-NG-R8.dmg  
> windows、Mac系统 ss下载地址：https://www.sednax.com/  
> ios系统：大陆下载不了。请淘宝买一个非大陆的Apple id，然后登陆搜索wingy、outline、SuperWingy、RocketWingy 等软件，你也可以直接搜ss或者ssr，会出现相关软件的。  
>

> #### 其他链接
>
> 原文链接：https://viencoding.com/article/122#comment-287  
> 原ssr脚本预览：https://github.com/luvvien/ssr-install-shellscript  
> 其他vpn搭建方法，以及vpn提速方法：https://www.codeob.com/


## 服务器地址要求

- 需要购买境外服务器，例如香港或者日本，一个月大约是5美金。
- 购买地址：https://www.vultr.com/?ref=8214267
## 系统要求

- CentOS 6+ 或者 Debian 6+ 或者 Ubuntu 14.04+（包含最新的ubuntu18、ubuntu19） 
- 注: 我们通常使用ubuntu16或者18
- 下文将以 `ubuntu18` 为例

## 安装前

```
安装前先检查服务器是否有安装gcc编译器和wget下载软件

如果提示找不到 wget 的，请执行 apt-get install -y wget（debian/ubuntu系统可用）安装，没提示错误就不用管了
```

## 开始安装

#### 一键安装：将以下命令复制到你已连接的服务器命令行中

```
wget -N --no-check-certificate https://raw.githubusercontent.com/luvvien/ssr-install-shellscript/master/ssr.sh && chmod +x ssr.sh && bash ssr.sh
```

#### 好了，执行上述命令之后, 我们看到以下提示:

```
--2019-03-14 11:39:39--  https://raw.githubusercontent.com/luvvien/ssr-install-shellscript/master/ssr.sh
Resolving raw.githubusercontent.com (raw.githubusercontent.com)... 151.101.8.133
Connecting to raw.githubusercontent.com (raw.githubusercontent.com)|151.101.8.133|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 61665 (60K) [text/plain]
Saving to: ‘ssr.sh’
ssr.sh                                              100%[==================================================================================================================>]  60.22K  --.-KB/s    in 0.002s
Last-modified header missing -- time-stamps turned off.
2019-03-14 11:39:39 (38.9 MB/s) - ‘ssr.sh’ saved [61665/61665]
  ShadowsocksR 一键管理脚本 [v2.0.38]
  ---- Toyo | doub.io/ss-jc42 ----
  1. 安装 ShadowsocksR
  2. 更新 ShadowsocksR
  3. 卸载 ShadowsocksR
  4. 安装 libsodium(chacha20)
————————————
  5. 查看 账号信息
  6. 显示 连接信息
  7. 设置 用户配置
  8. 手动 修改配置
  9. 切换 端口模式
————————————
 10. 启动 ShadowsocksR
 11. 停止 ShadowsocksR
 12. 重启 ShadowsocksR
 13. 查看 ShadowsocksR 日志
————————————
 14. 其他功能
 15. 升级脚本
 当前状态: 已安装 并 已启动
 当前模式: 单端口
请输入数字 [1-15]：
```

这里有很多个选项，我们通常来说只关注第一个 1. 安装 ShadowsocksR，但是有的人安装后忘记账号连接信息了，或者需要更改密码等设置，这样我们就要用到其他选项了。  
然后最下面有当前状态，如果有跟我一样显示已安装的，可以选择3. 卸载 ShadowsocksR 先卸载，然后重新执行一键安装命令，通常情况下，大家都是显示未安装状态。下面我们就从未安装转台开始：

#### 1.输入1开始安装
提示信息：

```
[信息] 开始设置 ShadowsocksR账号配置...
请输入要设置的ShadowsocksR账号 端口
(默认: 2333):
```

注：小白的话就不要输入端口了，就用默认2333就好了，专业人士可以选择自己喜欢的端口。

> ###### 这个 `2333` 端口是需要开启的
>
> 据我的文章购买vultr服务器的，可以参照下文，将`2333`端口（或者你自定义的端口）  
>
> ###### Vultr端口开放指南（可以跳过端口开放设置，默认开放全部端口）
>
> 添加一个组，点下图中蓝色的按钮，然后随便起个名字，我就叫`vpn`了。
> 
>![](http://img.github.mailjob.net/jefferyjob.github.io/20210123133141.png)
> 
>之后呢，我们就开始添加端口了，首先点一次右侧的`+`，下面会自动添加两条新纪录，然后修改红框框的内容，第一个选择`TCP`，第二个填写`2333`(或者你自定义的端口，但是要跟之前安装ss、ssr服务时设置的对应)，然后再点右侧的加号，最后会有三条记录，就像下面的图一样
> 
>![](http://img.github.mailjob.net/jefferyjob.github.io/20210123133207.png)
> 最后，在instance列表，找到你的instance，点开查看详情，然后将你instance与刚刚设置的组绑定。
>
> ![](http://img.github.mailjob.net/jefferyjob.github.io/20210123133219.png)
>
> 选择刚刚那个vpn的组，然后点蓝色的按钮就好了。



#### 2.好了，我们继续！按回车键进入下一步：

提示信息：

```
——————————————————————————————
        端口 : 2333
——————————————————————————————
请输入要设置的ShadowsocksR账号 密码
(默认: vien.tech):
```

这里你得设置一个密码，这个可以别默认了，你要非要用我的博客地址做密码也没人拦你。输入密码后，回车进入下一步。

#### 3.无论遇到什么都回车

我们先不粘贴提示信息了，因为下面的每一步，你都不需要更改，`全部回车`即可。（专业人士可以自行选择，自行操作）

#### 4.安装完成

屏幕自己滚够了之后，提示如下信息：

```
===================================================
 ShadowsocksR账号 配置信息：
 I  P       : 149.28.146.144
 端口       : 2333
 密码       : vien.tech
 加密       : aes-128-ctr
 协议       : auth_sha1_v4_compatible
 混淆       : plain
 设备数限制 : 0(无限)
 单线程限速 : 0 KB/S
 端口总限速 : 0 KB/S
 SS    链接 : ss://YWVzLTEyOC1jdHI6dmllbi50ZWNoQDE0OS4yOC4xNDYuMTQ0OjIzMzM
 SS  二维码 : /qrcode?base64=ss://YWVzLTEyOC1jdHI6dmllbi50ZWNoQDE0OS4yOC4xNDYuMTQ0OjIzMzM
 SSR   链接 : ssr://MTQ5LjI4LjE0Ni4xNDQ6MjMzMzphdXRoX3NoYTFfdjQ6YWVzLTEyOC1jdHI6cGxhaW46ZG1sbGJpNTBaV05v
 SSR 二维码 : /qrcode?base64=ssr://MTQ5LjI4LjE0Ni4xNDQ6MjMzMzphdXRoX3NoYTFfdjQ6YWVzLTEyOC1jdHI6cGxhaW46ZG1sbGJpNTBaV05v
  提示:
在浏览器中，打开二维码链接，就可以看到二维码图片。
协议和混淆后面的[ _compatible ]，指的是 兼容原版协议/混淆。
接下来客户端下载和配置请参考：/article/122
===================================================
vultr限时注册送50刀：/article/114
outline搭建vpn教程：/article/93
更多文章：
===================================================
```

恭喜你，大功告成，这样我们就安装好shadowsocks和shadowsocksR了，这些提示信息请保留，先不要关闭，马上就用到了。

## 如何使用？

**1、下载ssr客户端**

**2、配置客户端并连接**

***<a、有的客户端支持链接方式，复制粘贴就好，也就是类似于这个`ss://YWVzLTEyOC1jd` 或者` ssr://MTQ5LjI4LjE0Ni4xND` 当然，要区分你连的ss还是ssr***

***<b、有的客户端支持二维码方式，那就复制提示信息里面的二维码链接到浏览器，我的博客会替你生成二维码，以Mac电脑上的ss为例：
复制`/qrcode?base64=ss://YWVzLTEyOC1j`到浏览器：***

***<c、好吧，如果你的客户端很笨，上面的都不支持，那只能原始的手动填入信息了，还记得上面让你保留的信息吗？都在那里！***

**这是 SSR 的配置（win + mac）：**

<img src="http://img.github.mailjob.net/jefferyjob.github.io/20210123173717.png" style="zoom: 30%;" />
<img src="http://img.github.mailjob.net/jefferyjob.github.io/20210123133238.png" style="zoom: 30%;" />

**SS的配置：**

<img src="http://img.github.mailjob.net/jefferyjob.github.io/20210123133301.png" style="zoom:30%;" />

## 服务器管理以及配置

#### 1、如何配置多个账号

```
注意：添加成功后，要去服务器开放添加的这个端口，参见上文中提到的【Vultr端口开放指南】方法

第一种办法（使用管理命令）
# 进入安装目录，bash 执行 ssr.sh 命令进行管理
root@vultr:/usr/local/src# pwd
/usr/local/src
root@vultr:/usr/local/src# ls
ssr.sh
root@vultr:/usr/local/src# bash ssr.sh 
# 可以看到此处是[单端口]模式，需要把它改成[多端口]模式
————————————
  5. 查看 账号信息
  6. 显示 连接信息
  7. 设置 用户配置
  8. 手动 修改配置
  9. 切换 端口模式
————————————
当前模式: 单端口

# 运行sh文件后，输入 9 ，切换多端口模式
# 多端口模式下,选择7设置用户配置,然后选择1添加用户配置
# 第一次配置多端口时,需要设置各种参数,根据提示即可,第二次添加用户时,只需要设置端口和密码即可


第二种办法（修改配置文件）
> cd /etc/shadowsocksr
> vim /etc/shadowsocksr

# 可以看到一个json字符串，类似于这样
{
    *** 此处略去 ***
    "password": "mailjob",
    *** 此处略去 ***
}

# 现在把它改成多个账号
{
    *** 此处略去 ***
    "port_password": {
        "端口1": "密码1", 
        "端口2": "密码2", 
        "端口3": "密码3", 
        "端口4": "密码4"
    }, 
    *** 此处略去 ***
}

# linux ssr 重启
> /etc/init.d/ssr restart

# 如不能联网，则关闭防火墙（尽量别关闭防火墙，检查端口问题）
> service iptables restart
> service iptablesstopchkconfig iptablesoff
```

#### 2、linux管理ssr日常命令

```
启动：
> /etc/init.d/ssr start
停止:
> /etc/init.d/ssr stop
重启：
> /etc/init.d/ssr restart
状态：
> /etc/init.d/ssr status

# 下方为测试用例
root@vultr:/usr/local/src# /etc/init.d/ssr help
使用方法: /etc/init.d/ssr { start | stop | restart | status }
root@vultr:/usr/local/src# /etc/init.d/ssr status
[信息] ShadowsocksR (PID 3121) 正在运行...
root@vultr:/usr/local/src# /etc/init.d/ssr 
使用方法: /etc/init.d/ssr { start | stop | restart | status }
root@vultr:/usr/local/src# /etc/init.d/ssr status
[信息] ShadowsocksR (PID 3121) 正在运行...
```

