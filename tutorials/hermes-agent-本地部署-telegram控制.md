如果你最近在折腾 AI Agent，大概率已经听说过 OpenClaw。但这几天我实际体验下来，发现一个更有意思的方向——**Hermes Agent**。它不仅是一个 Agent，更像一个**可以持续进化的 AI 个体**。
这篇文章，我不讲概念，直接带你完整走一遍：从安装，到接入 Telegram，再到解决一个“几乎所有人都会踩”的坑！
# 一、Hermes Agent 是什么？
Hermes Agent 是由 Nous Research 打造的一个自学习 AI Agent，它的核心特点是：
- 内置学习循环（会成长）
- 支持长期记忆
- 支持多模型切换
- 可以在云端运行
- 支持 Telegram / 自动化控制
![屏幕截图 2026 04 11 211204](https://www.freedidi.com/wp-content/uploads/2026/04/屏幕截图-2026-04-11-211204.webp)
**简单说一句：**它不是一个工具，而是一个“会成长的 AI”。
# 部署教程：
# 🛠 二、安装 Hermes（快速流程）
安装过程本身不复杂，核心步骤如下，但需要区分不同的系统
### **1、Windows一键安装命令：**
Powershell （管理员）
```
irm https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.ps1 | iex
```
![屏幕截图 2026 04 11 211528](https://www.freedidi.com/wp-content/uploads/2026/04/屏幕截图-2026-04-11-211528.webp)
### 2、Mac/Linux/WSL2 一键安装命令：
```
curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh | bash
```
![屏幕截图 2026 04 11 211743](https://www.freedidi.com/wp-content/uploads/2026/04/屏幕截图-2026-04-11-211743.webp)
```
过程中你会遇到：
```
- 是否导入 OpenClaw 数据 → 建议 YES
- 是否 migration → 必须 YES
- setup 选择 → Quick setup
## Telegram 接入（关键步骤）
在 setup 过程中，你可以选择：Telegram（强烈推荐）
然后：
1. 打开 Telegram 搜索 @BotFather
1. 创建 Bot
1. 获取 Token
1. 填入 Hermes
## 安全配置
建议填写：
- Allowed user ID（只允许自己使用）在TG上搜索： @userinfobot 来获取你Telegram账户的ID
避免别人调用你的 AI。
# 三、最大坑：Telegram 没反应？
很多人（包括我）会卡在这里：
Telegram 发消息
**完全没有任何回复**
## 常见错误表
`Telegram: python-telegram-bot not installed`
`No adapter available for telegram`
## 本质原因
不是没安装依赖
是装错环境
Hermes 使用的是：
**自己的虚拟环境（venv）**
而不是：
你系统的 Python / conda 四、正确解决方案（关键）
## 第一步：找到 Hermes 环境
cd $env:LOCALAPPDATA\hermes\hermes-agent
```
你会看到：

venv
```
## 第二步：给 Hermes 的 Python 安装依赖
.\venv\Scripts\python.exe -m ensurepip .\venv\Scripts\python.exe -m pip install python-telegram-bot
## 第三步：验证
hermes doctor
看到：
```
✓ python-telegram-bot
```
## 第四步：启动 gateway
```
hermes gateway
```
### Telegram 无法连接的解决的完整步骤如下：
1、进入安装目录下执行命令：
```
cd $env:LOCALAPPDATA\hermes\hermes-agent
.\venv\Scripts\python.exe -m pip install python-telegram-bot
```
2、进入后通过 Python 安装 pip和telegram依赖环境：
```
.\venv\Scripts\python.exe -m ensurepip
.\venv\Scripts\python.exe -m pip install --upgrade pip
.\venv\Scripts\python.exe -m pip install python-telegram-bot
```
安装成功后在新的窗口执行命令：
```
hermes gateway
```
就可以看到对接成功
![2026 04 11 15 00 32.00 07 01 15.Still005 scaled](https://www.freedidi.com/wp-content/uploads/2026/04/2026-04-11-15-00-32.00_07_01_15.Still005-scaled.webp)
### 五、测试 Telegram 控制
打开 Telegram，给你的 Bot 发送：
```
hello
```
如果正常：
AI 会直接回复
终端也会有日志
### 六、Hermes vs OpenClaw（关键区别）
---
一句话总结：OpenClaw 是工具，Hermes 是“会成长的AI”。
### 七、Hermes 的真正优势
很多人会问：“为什么它没有UI？”其实这是设计理念：AI 不应该被困在网页里
**Hermes 的核心是：**
- 常驻运行
- 随时调用
- 像人一样交互
### Hermes Agent 给我的感觉是：
不是“更强的工具”
而是“下一代形态”
它最大的不同是：
- 会学习
- 会记忆
- 可以长期运行
- 可以远程控制
### 你可以继续探索：
- 多模型切换（OpenRouter）
- 自动任务（cron）
- 多Agent协作
如果你正在做 AI 内容创作，这套工具非常值得深入。
### 感谢您的支持
- [**Next**](https://www.freedidi.com/23720.html)[Gemma 4 越狱了！ 谷歌最强开源模型，这才是用户真正需要的本地AI！](https://www.freedidi.com/23720.html)
- [**Previous**](https://www.freedidi.com/23690.html)[最强编程AI来了！Qwen3.6-Plus 两天登顶，Agent能力拉满！普通人也能写软件](https://www.freedidi.com/23690.html)
## [Z-Library 被美国FBI再次黑掉登录域，但每个用户的秘密 URL 仍然有效！](https://www.freedidi.com/9154.html)
- 2023年5月6日
## [ESET 病毒扫描工具被曝严重漏洞，黑客借此部署后门程序悄然绕过检测！](https://www.freedidi.com/19088.html)
- 2025年4月11日
## [Cryptomator 免费开源的云端及本地文件加密工具！](https://www.freedidi.com/1865.html)
- 2021年7月27日
## [一个自建平台即可搞定：ChatGPT、Claude、Google Gemini、Mistral、LLaMA2等主流AI大模型的无缝切换使用！](https://www.freedidi.com/11876.html)
- 2024年3月23日
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
[【限免】Ashampoo LocaLingo 免费许可证 – 安全的离线翻译](https://www.freedidi.com/20635.html)
2025年9月16日
[免费资源](https://www.freedidi.com/category/%e5%85%8d%e8%b4%b9%e8%b5%84%e6%ba%90)
[绕过微软联网账号的限制！用本地用户安装Windows 11 系统，最新3种方法！](https://www.freedidi.com/21151.html)
2025年10月18日
[VPN](https://www.freedidi.com/category/vpn)/[免费资源](https://www.freedidi.com/category/%e5%85%8d%e8%b4%b9%e8%b5%84%e6%ba%90)
[Surfshark VPN 黑五优惠活动！最低$1.89 /月，免费赠送4个月，10Gbps 网络端口！](https://www.freedidi.com/21656.html)
2025年11月17日
[VPN](https://www.freedidi.com/category/vpn)/[免费资源](https://www.freedidi.com/category/%e5%85%8d%e8%b4%b9%e8%b5%84%e6%ba%90)
[Octohide VPN – 快速安全的VPN！简单好用、速度快！](https://www.freedidi.com/22153.html)
2025年12月22日
[mac](https://www.freedidi.com/category/mac)/[Youtube视频](https://www.freedidi.com/category/youtube%e8%a7%86%e9%a2%91)/[免费资源](https://www.freedidi.com/category/%e5%85%8d%e8%b4%b9%e8%b5%84%e6%ba%90)
[PearOS：一款高度类似 macOS 的 Linux 系统！ 附安装教程 + 使用体验](https://www.freedidi.com/23479.html)
2026年3月19日
- pubo64178418 says:[价格呢？是多少？](https://www.freedidi.com/15144.html#comment-1305)
- huige2012 says:[我去组装一台台式电脑吧，可以帮我写一份配…](https://www.freedidi.com/?p=21947#comment-1304)
- admin says:[如果你的账号之前开通过付费业务，那么你需…](https://www.freedidi.com/?p=22004#comment-1303)
- admin says:[笔记本 RTX4060显卡的显存只有8G…](https://www.freedidi.com/?p=21947#comment-1302)
- huige2012 says:[有远程操作指导的嘛？](https://www.freedidi.com/?p=21947#comment-1301)
- [18](https://www.freedidi.com/tag/18)[2021](https://www.freedidi.com/tag/2021)[ChatGPT](https://www.freedidi.com/tag/chatgpt)[chrome](https://www.freedidi.com/tag/chrome)[edge](https://www.freedidi.com/tag/edge)[edge浏览器](https://www.freedidi.com/tag/edge%e6%b5%8f%e8%a7%88%e5%99%a8)[ExpressVPN](https://www.freedidi.com/tag/expressvpn)[google voice](https://www.freedidi.com/tag/google-voice)[Hermes Agent](https://www.freedidi.com/tag/hermes-agent)[mac os](https://www.freedidi.com/tag/mac-os)[openclaw](https://www.freedidi.com/tag/openclaw)[SS](https://www.freedidi.com/tag/ss)[ssr](https://www.freedidi.com/tag/ssr)[VIP](https://www.freedidi.com/tag/vip)[vpn](https://www.freedidi.com/tag/vpn)[VPN推荐](https://www.freedidi.com/tag/vpn%e6%8e%a8%e8%8d%90)[win10优化](https://www.freedidi.com/tag/win10%e4%bc%98%e5%8c%96)[windows 10](https://www.freedidi.com/tag/windows-10)[Windows 11](https://www.freedidi.com/tag/windows-11)[会员](https://www.freedidi.com/tag/%e4%bc%9a%e5%91%98)[免费VPN](https://www.freedidi.com/tag/%e5%85%8d%e8%b4%b9vpn)[免费软件](https://www.freedidi.com/tag/%e5%85%8d%e8%b4%b9%e8%bd%af%e4%bb%b6)[双系统](https://www.freedidi.com/tag/%e5%8f%8c%e7%b3%bb%e7%bb%9f)[国外VPS推荐](https://www.freedidi.com/tag/%e5%9b%bd%e5%a4%96vps%e6%8e%a8%e8%8d%90)[好用的vpn](https://www.freedidi.com/tag/%e5%a5%bd%e7%94%a8%e7%9a%84vpn)[安卓子系统](https://www.freedidi.com/tag/%e5%ae%89%e5%8d%93%e5%ad%90%e7%b3%bb%e7%bb%9f)[挖矿](https://www.freedidi.com/tag/%e6%8c%96%e7%9f%bf)[排名前五的VPN](https://www.freedidi.com/tag/%e6%8e%92%e5%90%8d%e5%89%8d%e4%ba%94%e7%9a%84vpn)[最好的vpn](https://www.freedidi.com/tag/%e6%9c%80%e5%a5%bd%e7%9a%84vpn)[比特币](https://www.freedidi.com/tag/%e6%af%94%e7%89%b9%e5%b8%81)[油猴插件](https://www.freedidi.com/tag/%e6%b2%b9%e7%8c%b4%e6%8f%92%e4%bb%b6)[浏览器](https://www.freedidi.com/tag/%e6%b5%8f%e8%a7%88%e5%99%a8)[电脑优化](https://www.freedidi.com/tag/%e7%94%b5%e8%84%91%e4%bc%98%e5%8c%96)[神器](https://www.freedidi.com/tag/%e7%a5%9e%e5%99%a8)[科学上网](https://www.freedidi.com/tag/%e7%a7%91%e5%ad%a6%e4%b8%8a%e7%bd%91)[网站推荐](https://www.freedidi.com/tag/%e7%bd%91%e7%ab%99%e6%8e%a8%e8%8d%90)[翻墙](https://www.freedidi.com/tag/%e7%bf%bb%e5%a2%99)[翻墙vpn](https://www.freedidi.com/tag/%e7%bf%bb%e5%a2%99vpn)[翻墙VPS](https://www.freedidi.com/tag/%e7%bf%bb%e5%a2%99vps)[老司机](https://www.freedidi.com/tag/%e8%80%81%e5%8f%b8%e6%9c%ba)[谷歌浏览器](https://www.freedidi.com/tag/%e8%b0%b7%e6%ad%8c%e6%b5%8f%e8%a7%88%e5%99%a8)[软件推荐](https://www.freedidi.com/tag/%e8%bd%af%e4%bb%b6%e6%8e%a8%e8%8d%90)[零度解密](https://www.freedidi.com/tag/%e9%9b%b6%e5%ba%a6%e8%a7%a3%e5%af%86)[零度解说](https://www.freedidi.com/tag/%e9%9b%b6%e5%ba%a6%e8%a7%a3%e8%af%b4)[黑苹果安装教程](https://www.freedidi.com/tag/%e9%bb%91%e8%8b%b9%e6%9e%9c%e5%ae%89%e8%a3%85%e6%95%99%e7%a8%8b)
### 归档
### 分类
