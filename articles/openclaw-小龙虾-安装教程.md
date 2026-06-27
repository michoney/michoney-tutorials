在折腾 NAS 的过程中，我一直在寻找一套能够真正实现“自动化+效率提升”的工具，直到接触到 OpenClaw，才发现很多原本需要手动完成的操作，其实都可以被彻底解放。但问题是：网上几乎没有一套完整、可落地的 NAS 部署教程，要么步骤缺失，要么关键配置一笔带过，新手很容易卡在中途。
![synology plus drive2](https://www.freedidi.com/wp-content/uploads/2026/03/synology_plus_drive2.webp)
这篇文章，我会从**0 到 1 手把手带你完成 OpenClaw 在 NAS 上的完整部署**，包括环境准备、Docker 配置、网络访问、以及 Telegram 对接等关键步骤。同时，我也会把自己在实际部署过程中踩过的坑全部整理出来，比如镜像拉取失败、权限问题、端口无法访问、机器人无响应等常见问题，并给出可直接复现的解决方案。
如果你符合以下情况，这篇文章会对你非常有帮助：
- 第一次在 NAS 上部署 OpenClaw，不知道从哪里开始
- 已经部署成功，但部分功能（如 Telegram）无法正常使用
- 经常遇到各种报错，但不知道问题出在哪里
- 希望搭建一套可以长期稳定运行的自动化系统
相比零散教程，这篇内容更偏向“实战复盘”，不仅告诉你**怎么做**，更重要的是让你知道**为什么会出问题，以及如何避免**。
接下来，我们正式开始，从最基础的环境准备讲起。
# **部署步骤：**
### **1、在Nas里安装Docker管理器**
套件中心→Container Manager
![2026 03 25 203426 scaled](https://www.freedidi.com/wp-content/uploads/2026/03/2026-03-25-203426-scaled.webp)
### **2、下载安装OpenClaw 安装包**
在镜像仓库里面搜索关键词：openclaw，然后下载镜像，推荐选择 1panel openclaw
![2026 03 25 203706](https://www.freedidi.com/wp-content/uploads/2026/03/2026-03-25-203706.webp)
**注意：**如果你在中国大陆，建议通过国内加速镜像进行下载，否则下载速度会很慢！设置步骤：左侧的镜像仓库 – 设置 – 新增: 镜像仓库名称：随便自定义 ， 加速的镜像仓库URL填：https://docker.1ms.run
![2026 03 25 203839](https://www.freedidi.com/wp-content/uploads/2026/03/2026-03-25-203839.webp)
### **3、安装并运行OpenClaw 容器**
在映像里选择刚才下载好的1panel/openclaw 镜像，鼠标右键点击运行
![2026 03 25 204226](https://www.freedidi.com/wp-content/uploads/2026/03/2026-03-25-204226.webp)
配置容器
![2026 03 25 204356](https://www.freedidi.com/wp-content/uploads/2026/03/2026-03-25-204356.webp)
这一步要做18789的端口映射，及容器空间设置，如下图所示：
![2026 03 25 204532](https://www.freedidi.com/wp-content/uploads/2026/03/2026-03-25-204532.webp)
网络由bridge改成host，否则后续无法在其它或外网访问Nas里的Openclaw
![2026 03 25 204657](https://www.freedidi.com/wp-content/uploads/2026/03/2026-03-25-204657.webp)
使用高权限执行容器，并在执行命令后面填写下方的代码：
```
openclaw gateway --allow-unconfigured
```
![20260325 1774432299](https://www.freedidi.com/wp-content/uploads/2026/03/20260325_1774432299.webp)
接着点击完成来创建Openclaw 的容器
![20260325 1774432351](https://www.freedidi.com/wp-content/uploads/2026/03/20260325_1774432351.webp)
### **4、在Nas里开启SSH远程访问权限**
在控制面板找到：终端机和SNMP
![20260325 1774432421](https://www.freedidi.com/wp-content/uploads/2026/03/20260325_1774432421.webp)
进入以后，勾选里面的启用 SSH 功能，这样我们才能通过SSH客户端连接到Nas里面
![20260325 1774432491](https://www.freedidi.com/wp-content/uploads/2026/03/20260325_1774432491.webp)
### **5、下载安装SSH远程终端连接器**
你可以下载这款完全免费的[WindTerm](https://github.com/kingToolbox/WindTerm)，来进行连接使用
【[**点击下载**](https://github.com/kingToolbox/WindTerm)】或【[**备用打包下载**](https://www.dongli7.com/thread-151-1-1.html)】
连接地址：nas群晖的 ip地址 ，比如我是：192.168.1.113
端口：22
用户名：nas 登入账号
密码：nas 登入密码
![20260325 1774432761](https://www.freedidi.com/wp-content/uploads/2026/03/20260325_1774432761.webp)
登入进去以后，通过命令sudo -i 来提升到管理员权限，输入命令：docker ps 来查看当前所安装的Openclaw容器
![20260325 1774432942](https://www.freedidi.com/wp-content/uploads/2026/03/20260325_1774432942.webp)
### **6、进入Openclaw 容器进行配置**
输入命令：
```
sudo docker exec -it openclaw bash
```
来进入到openclaw的容器，注意：如果你之前自定义的容器名称不是openclaw，那么上方的命令你需要将openclaw改成你自定义的容器名称
进入容器以后再执行命令：
```
openclaw onboard
```
来进行后续的配置即可，具体看零度的视频教程演示！
![20260325 1774433161](https://www.freedidi.com/wp-content/uploads/2026/03/20260325_1774433161.webp)
如果你选择对接Telegram的机器人，那么需要打开 @BotFather 进行创建机器人并配对
![20260325 1774433294](https://www.freedidi.com/wp-content/uploads/2026/03/20260325_1774433294.webp)
### **7、在其它电脑/外网上访问 Openclaw**
在openclaw 容器里执行命令：
```
openclaw config
```
将Gateway 模型由 bind mode改为LAN模式，如下：
![20260325 1774433464](https://www.freedidi.com/wp-content/uploads/2026/03/20260325_1774433464.webp)
修改以后，Openclaw的面板地址就会由原来的127.0.0.1 变成我们的nas的访问地址,比如我是：192.168.1.113，这一步非常关键！，它决定了你在nas里部署的Openclaw能不能在其它电脑或外网上访问控制面板。
![20260325 1774433574](https://www.freedidi.com/wp-content/uploads/2026/03/20260325_1774433574.webp)
当然第一次访问的时候它会显示这个错误信息：
origin not allowed (open the ControlUIfrom the gateway host or allow it in gateway.controlUi.allowedOrigins) openclaw
![20260325 1774437102](https://www.freedidi.com/wp-content/uploads/2026/03/20260325_1774437102.webp)
这主要是跨域导致的问权限题，现在我们可以在容器里，一键执行下方的命令来解决这个错误：
```
docker exec openclaw node openclaw.mjs config set gateway.controlUi.allowedOrigins '["http://192.168.1.113:18789","http://localhost:18789"]'
```
**注意：****要将上方命令里的 ip 替换成你自己的 nas 的 ip 地址**
执行命令以后稍等一会，它会自动重启容器，但是重启以后访问它会出现这个错误，就是要求我们通过HTTPS协议进行访问后台，错误信息如下：
control ui requires device identity (use HTTPS or localhost secure context)
![20260325 1774437161](https://www.freedidi.com/wp-content/uploads/2026/03/20260325_1774437161.webp)
这个错误不用慌，我们可以通过下方的命令来解除这个限制：
```
docker exec openclaw node openclaw.mjs config set gateway.controlUi.dangerouslyDisableDeviceAuth true
```
执行重启容器以后，稍等一会就可以正常访问Openclaw的后台了
![20260325 1774434043 scaled](https://www.freedidi.com/wp-content/uploads/2026/03/20260325_1774434043-scaled.webp)
### 感谢您的支持
Tags:[openclaw](https://www.freedidi.com/tag/openclaw)
- [**Next**](https://www.freedidi.com/23580.html)[OpenClaw 装进U盘！即插即用、随拔即走，安全又便携 （3套方案）｜零度解说](https://www.freedidi.com/23580.html)
- [**Previous**](https://www.freedidi.com/23533.html)[Chrome / Edge 越用越卡？关闭这7个隐藏设置，速度直接翻倍！（2026实测）](https://www.freedidi.com/23533.html)
## [如何使用免费白嫖到的甲骨文VPS？ 如何进行连接、搭建VPN、搭建网站](https://www.freedidi.com/6075.html)
- 2022年8月24日
## [优化上网速度，只需电脑上几步操作，让你上网的速度大大提高 | 零度解说](https://www.freedidi.com/331.html)
- 2020年6月10日
## [Windows 用户必备的2个U盘！老司机 “不翻车” 系列，务必早点知道！！ | 零度解说](https://www.freedidi.com/11730.html)
- 2024年3月2日
## [推荐9款超实用的精品软件！完全免费开源，来自GitHub的良心分享！值得收藏 | 零度解说](https://www.freedidi.com/10319.html)
- 2023年8月31日
![](https://www.freedidi.com/wp-content/uploads/2026/06/20260608041301_407040.webp)
### 近期文章
- [Ideogram 4 最强 AI 图片生成模型，真正媲美 GPT-Image / Midjourney ，完全免费开源，支持本地部署！](https://www.freedidi.com/24609.html)
- [Claude Mythos 5 被“蒸馏”了？Qwythos-9B 突然开源，百万 Token 上下文，4GB 显存即可部署！](https://www.freedidi.com/24592.html)
- [Windows Copilot 被逆向！无需 API Key 免费白嫖 GPT-5，对接本地AI Agent，部署教程来了！](https://www.freedidi.com/24570.html)
- [GLM 5.2 正式开源！百万上下文、Agent 编程能力登顶，模型下载及本地部署！](https://www.freedidi.com/24513.html)
- [最强AI模型被禁！这3款开源越狱模型才是安全首选，附下载及本地部署！](https://www.freedidi.com/24498.html)
- [Recent Posts](#tab-recent-4)
- [Popular Posts](#tab-popular-4)
- [Recent Comments](#tab-comments-4)
- [Tags](#tab-tags-4)
[AI](https://www.freedidi.com/category/ai)/[Youtube视频](https://www.freedidi.com/category/youtube%e8%a7%86%e9%a2%91)/[免费资源](https://www.freedidi.com/category/%e5%85%8d%e8%b4%b9%e8%b5%84%e6%ba%90)
[Ideogram 4 最强 AI 图片生成模型，真正媲美 GPT-Image / Midjourney ，完全免费开源，支持本地部署！](https://www.freedidi.com/24609.html)
2026年6月26日
[AI](https://www.freedidi.com/category/ai)/[Youtube视频](https://www.freedidi.com/category/youtube%e8%a7%86%e9%a2%91)/[免费资源](https://www.freedidi.com/category/%e5%85%8d%e8%b4%b9%e8%b5%84%e6%ba%90)
[Claude Mythos 5 被“蒸馏”了？Qwythos-9B 突然开源，百万 Token 上下文，4GB 显存即可部署！](https://www.freedidi.com/24592.html)
2026年6月24日
[AI](https://www.freedidi.com/category/ai)/[OpenAI](https://www.freedidi.com/category/openai)/[OpenClaw](https://www.freedidi.com/category/openclaw)/[Youtube视频](https://www.freedidi.com/category/youtube%e8%a7%86%e9%a2%91)/[免费资源](https://www.freedidi.com/category/%e5%85%8d%e8%b4%b9%e8%b5%84%e6%ba%90)
[Windows Copilot 被逆向！无需 API Key 免费白嫖 GPT-5，对接本地AI Agent，部署教程来了！](https://www.freedidi.com/24570.html)
2026年6月22日
[AI](https://www.freedidi.com/category/ai)/[Youtube视频](https://www.freedidi.com/category/youtube%e8%a7%86%e9%a2%91)/[免费资源](https://www.freedidi.com/category/%e5%85%8d%e8%b4%b9%e8%b5%84%e6%ba%90)
[GLM 5.2 正式开源！百万上下文、Agent 编程能力登顶，模型下载及本地部署！](https://www.freedidi.com/24513.html)
2026年6月18日
[AI](https://www.freedidi.com/category/ai)/[Claude](https://www.freedidi.com/category/claude)/[Gemma](https://www.freedidi.com/category/gemma)/[Llama](https://www.freedidi.com/category/llama)/[OpenClaw](https://www.freedidi.com/category/openclaw)/[Youtube视频](https://www.freedidi.com/category/youtube%e8%a7%86%e9%a2%91)/[免费资源](https://www.freedidi.com/category/%e5%85%8d%e8%b4%b9%e8%b5%84%e6%ba%90)
[最强AI模型被禁！这3款开源越狱模型才是安全首选，附下载及本地部署！](https://www.freedidi.com/24498.html)
2026年6月16日
[免费资源](https://www.freedidi.com/category/%e5%85%8d%e8%b4%b9%e8%b5%84%e6%ba%90)
[Arch Linux：极简、极速、极致自由的系统体验](https://www.freedidi.com/20067.html)
2025年7月9日
[Youtube视频](https://www.freedidi.com/category/youtube%e8%a7%86%e9%a2%91)/[免费资源](https://www.freedidi.com/category/%e5%85%8d%e8%b4%b9%e8%b5%84%e6%ba%90)
[超爽的！电视机上安装这款播放器，简直无敌了！手机也适用，完全免费开源！ | 零度解说](https://www.freedidi.com/20500.html)
2025年8月31日
[Youtube视频](https://www.freedidi.com/category/youtube%e8%a7%86%e9%a2%91)/[免费资源](https://www.freedidi.com/category/%e5%85%8d%e8%b4%b9%e8%b5%84%e6%ba%90)/[限免](https://www.freedidi.com/category/%e9%99%90%e5%85%8d)
[赶紧下载！5款强力杀毒软件，限时免费！附详细安装与激活教程 （2025） | 零度解说](https://www.freedidi.com/20932.html)
2025年10月9日
![Sink 一款简单/快速/安全的链接缩短服务，带有分析功能，100% 基于 Cloudflare 运行!](https://www.freedidi.com/wp-content/themes/gridzone/img/thumb-small.png)
[免费资源](https://www.freedidi.com/category/%e5%85%8d%e8%b4%b9%e8%b5%84%e6%ba%90)
[Sink 一款简单/快速/安全的链接缩短服务，带有分析功能，100% 基于 Cloudflare 运行!](https://www.freedidi.com/21378.html)
2025年10月31日
[免费资源](https://www.freedidi.com/category/%e5%85%8d%e8%b4%b9%e8%b5%84%e6%ba%90)
[免费获取1年的Google Gemini  AI Pro 学生套餐！学生认证就这么简单！保姆级的教程](https://www.freedidi.com/21943.html)
2025年12月3日
- pubo64178418 says:[价格呢？是多少？](https://www.freedidi.com/15144.html#comment-1305)
- huige2012 says:[我去组装一台台式电脑吧，可以帮我写一份配…](https://www.freedidi.com/?p=21947#comment-1304)
- admin says:[如果你的账号之前开通过付费业务，那么你需…](https://www.freedidi.com/?p=22004#comment-1303)
- admin says:[笔记本 RTX4060显卡的显存只有8G…](https://www.freedidi.com/?p=21947#comment-1302)
- huige2012 says:[有远程操作指导的嘛？](https://www.freedidi.com/?p=21947#comment-1301)
- [18](https://www.freedidi.com/tag/18)[2021](https://www.freedidi.com/tag/2021)[ChatGPT](https://www.freedidi.com/tag/chatgpt)[chrome](https://www.freedidi.com/tag/chrome)[edge](https://www.freedidi.com/tag/edge)[edge浏览器](https://www.freedidi.com/tag/edge%e6%b5%8f%e8%a7%88%e5%99%a8)[ExpressVPN](https://www.freedidi.com/tag/expressvpn)[google voice](https://www.freedidi.com/tag/google-voice)[Hermes Agent](https://www.freedidi.com/tag/hermes-agent)[mac os](https://www.freedidi.com/tag/mac-os)[openclaw](https://www.freedidi.com/tag/openclaw)[SS](https://www.freedidi.com/tag/ss)[ssr](https://www.freedidi.com/tag/ssr)[VIP](https://www.freedidi.com/tag/vip)[vpn](https://www.freedidi.com/tag/vpn)[VPN推荐](https://www.freedidi.com/tag/vpn%e6%8e%a8%e8%8d%90)[win10优化](https://www.freedidi.com/tag/win10%e4%bc%98%e5%8c%96)[windows 10](https://www.freedidi.com/tag/windows-10)[Windows 11](https://www.freedidi.com/tag/windows-11)[会员](https://www.freedidi.com/tag/%e4%bc%9a%e5%91%98)[免费VPN](https://www.freedidi.com/tag/%e5%85%8d%e8%b4%b9vpn)[免费软件](https://www.freedidi.com/tag/%e5%85%8d%e8%b4%b9%e8%bd%af%e4%bb%b6)[双系统](https://www.freedidi.com/tag/%e5%8f%8c%e7%b3%bb%e7%bb%9f)[国外VPS推荐](https://www.freedidi.com/tag/%e5%9b%bd%e5%a4%96vps%e6%8e%a8%e8%8d%90)[好用的vpn](https://www.freedidi.com/tag/%e5%a5%bd%e7%94%a8%e7%9a%84vpn)[安卓子系统](https://www.freedidi.com/tag/%e5%ae%89%e5%8d%93%e5%ad%90%e7%b3%bb%e7%bb%9f)[挖矿](https://www.freedidi.com/tag/%e6%8c%96%e7%9f%bf)[排名前五的VPN](https://www.freedidi.com/tag/%e6%8e%92%e5%90%8d%e5%89%8d%e4%ba%94%e7%9a%84vpn)[最好的vpn](https://www.freedidi.com/tag/%e6%9c%80%e5%a5%bd%e7%9a%84vpn)[比特币](https://www.freedidi.com/tag/%e6%af%94%e7%89%b9%e5%b8%81)[油猴插件](https://www.freedidi.com/tag/%e6%b2%b9%e7%8c%b4%e6%8f%92%e4%bb%b6)[浏览器](https://www.freedidi.com/tag/%e6%b5%8f%e8%a7%88%e5%99%a8)[电脑优化](https://www.freedidi.com/tag/%e7%94%b5%e8%84%91%e4%bc%98%e5%8c%96)[神器](https://www.freedidi.com/tag/%e7%a5%9e%e5%99%a8)[科学上网](https://www.freedidi.com/tag/%e7%a7%91%e5%ad%a6%e4%b8%8a%e7%bd%91)[网站推荐](https://www.freedidi.com/tag/%e7%bd%91%e7%ab%99%e6%8e%a8%e8%8d%90)[翻墙](https://www.freedidi.com/tag/%e7%bf%bb%e5%a2%99)[翻墙vpn](https://www.freedidi.com/tag/%e7%bf%bb%e5%a2%99vpn)[翻墙VPS](https://www.freedidi.com/tag/%e7%bf%bb%e5%a2%99vps)[老司机](https://www.freedidi.com/tag/%e8%80%81%e5%8f%b8%e6%9c%ba)[谷歌浏览器](https://www.freedidi.com/tag/%e8%b0%b7%e6%ad%8c%e6%b5%8f%e8%a7%88%e5%99%a8)[软件推荐](https://www.freedidi.com/tag/%e8%bd%af%e4%bb%b6%e6%8e%a8%e8%8d%90)[零度解密](https://www.freedidi.com/tag/%e9%9b%b6%e5%ba%a6%e8%a7%a3%e5%af%86)[零度解说](https://www.freedidi.com/tag/%e9%9b%b6%e5%ba%a6%e8%a7%a3%e8%af%b4)[黑苹果安装教程](https://www.freedidi.com/tag/%e9%bb%91%e8%8b%b9%e6%9e%9c%e5%ae%89%e8%a3%85%e6%95%99%e7%a8%8b)
### 归档
### 分类
