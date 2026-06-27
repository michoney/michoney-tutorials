如果你想打造一个完全本地运行、无需 API Key、可接入微信的 AI 助手系统，这套方案可以说是目前最香的组合之一：Hermes Agent + WebUI + Ollama + Gemma 4**,**不仅免费，而且隐私可控、可扩展性极强，非常适合做自动化助手、私域 AI、甚至商业化探索。
![2026 04 15 14 20 57.00 03 36 11.Still001 scaled](https://www.freedidi.com/wp-content/uploads/2026/04/2026-04-15-14-20-57.00_03_36_11.Still001-scaled.webp)
## 一、整体架构说明
先快速理解一下整体结构：
- **Ollama + Gemma 4**本地大模型推理
- **Hermes Agent**AI Agent 调度核心
- **Hermes WebUI**可视化操作界面
- **微信接入**实现真实应用场景
## 二、下载本地模型（Ollama + Gemma 4）
首先，我们需要准备本地大模型环境。
### 安装 Ollama
官网安装： 【[**点击前往**](https://ollama.com)】 下载最新版
安装完成后，拉取 Gemma 4 模型：
```
ollama run gemma4
```
### （你也可以选择更大版本，比如 26B / 31B，看你电脑配置）
### 获取 API 地址
Ollama 默认会启动本地服务：http://127.0.0.1:11434
但 Hermes Agent 需要用你局域网 IP来访问。
在 CMD 输入：
```
ipconfig
```
找到类似： IPv4 地址 . . . . . . . . . . . : 192.168.1.228
那么你的 API 地址就是： http://192.168.1.228:11434/v1
⚠️ 这个地址非常关键，后面要填到 Hermes 配置里！
## **三、部署 WSL 2（Linux 子系统）**
Hermes Agent 官方推荐 Linux 环境，这里我们用**WSL2**。
## **前期准备：**
在开始之前，建议大家安装下 Windows Terminal，它是一款新式、快速、高效、强大且高效的Windows 的终端程序，适用于命令行工具和命令提示符，PowerShell和 WSL 等 Shell 用户。可以方便我们切换不同的系统！
### 【[**点击下载**](https://apps.microsoft.com/detail/9n0dx20hk701?hl=zh-CN)】
### 一、安装 WSL2
在PowerShell（管理员）执行：
安装完成后重启电脑，然后安装Ubuntu**，**
检查版本：
确保输出结果是：WSL2
## 四、部署 Hermes Agent + UI
进入 Ubuntu 后，开始核心部署。
### 安装 Hermes Agent
```
curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh | bash
```
```
安装完成后，可以执行：
```
```
hermes doctor
```
检查环境是否正常。
### 安装 Hermes WebUI
```
git clone https://github.com/nesquena/hermes-webui.git hermes-webui
cd hermes-webui
./start.sh
```
启动后，一般访问：
http://127.0.0.1:8787
```
即可打开 UI 页面 🎉
```
## **Mac 系统一键部署命令:**
```
git clone https://github.com/nesquena/hermes-webui.git hermes-webui
cd hermes-webui
python3 bootstrap.py
```
引导程序将：
1. 检测 Hermes Agent，如果缺少，则尝试使用官方安装程序（`curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh | bash`）。
1. 查找或创建包含 WebUI 依赖项的 Python 环境。
1. 启动 Web 服务器并等待`/health`。
1. 除非通过验证，否则请打开浏览器`--no-browser`。
1. 将您直接导入 WebUI 中的首次运行引导向导。
## 五、配置 Hermes 对接本地 Gemma 4
运行：
```
hermes setup
```
进入配置界面后：
### 关键配置项：
- **Model Provider**：选择 OpenAI Compatible
- **Base URL**：填入你的 Ollama 地址
```
http://192.168.1.228:11434/v1
```
- **Model Name**：
```
gemma4
```
⚠️ 如果提示上下文不足（比如你之前遇到的 8K 限制问题）：
可以修改：
```
model:
  context_length: 8192
```
或者换更大的模型。
## 六、Hermes Agent 对接微信（重点）
### 进入配置
```
hermes setup
```
### 选择微信接入
找到：
```
messaging platforms
```
选择：
```
weixin / wechat
```
### 扫码登录
系统会弹出二维码：
用微信扫码登录即可完成绑定
### 完成效果
完成后你就拥有：
- 一个**微信 AI 助手**
- 基于本地模型（无需 API）
- 可执行自动化任务（Agent能力）
## 七、最终效果展示
部署完成后，你的系统具备：
✅ 本地 AI（Gemma 4）
✅ 可视化 UI 管理
✅ 微信实时对话
✅ 无需 Token / 无费用
✅ 完全私有化部署
## 八、常见问题（避坑指南）
### 1. 模型上下文不足报错
错误示例：
```
context window too small
```
解决：
- 换更大模型（如 7B+）
- 或手动设置 context_length
### 2. Ollama 无法被访问
检查：
- 是否用的是`127.0.0.1`（❌）
- 是否改为局域网 IP（✅）
### 3. WebUI 无法打开
尝试：
```
./start.sh
```
或者检查端口占用。
### 4. 微信掉线问题
这是微信协议限制，建议：
- 保持 Hermes 常驻运行
- 避免频繁重启
## 九、总结
这套方案的核心价值在于：
**零成本 + 本地化 + 可扩展 AI Agent**
相比传统 OpenAI API 方案：
- 不用花钱
- 不怕封号
- 数据更安全
如果你做：
- 私域流量运营
- 自动客服
- AI 工具开发
这套架构非常值得你深入研究。
### 感谢您的支持
Tags:[Hermes Agent](https://www.freedidi.com/tag/hermes-agent)
- [**Next**](https://www.freedidi.com/23768.html)[Google 把 AI 搜索搬进 Windows！这款官方 App，可能会改变你的使用习惯](https://www.freedidi.com/23768.html)
- [**Previous**](https://www.freedidi.com/23720.html)[Gemma 4 越狱了！ 谷歌最强开源模型，这才是用户真正需要的本地AI！](https://www.freedidi.com/23720.html)
## [由AI生成的超真实的美图！Stable-diffusion 来源网络](https://www.freedidi.com/9455.html)
- 2023年5月21日
## [电脑中毒了？只需8分钟！一步步教你彻底清除顽固病毒！！| 零度解说](https://www.freedidi.com/12998.html)
- 2024年7月22日
## [OpenAI 放大招！正式推出 o3 与 o4-mini，全工具解锁 、看图思考，全面超越 o1！实测效果 + 免费使用攻略 | 零度解说](https://www.freedidi.com/19141.html)
- 2025年4月17日
## [Cloudflare 高速免费VPN！速度极快、自动优选IP、无限流量！海量节点随便用，秒开4K、8K视频！| 零度解说](https://www.freedidi.com/21265.html)
- 2025年10月24日
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
[Youtube视频](https://www.freedidi.com/category/youtube%e8%a7%86%e9%a2%91)/[免费资源](https://www.freedidi.com/category/%e5%85%8d%e8%b4%b9%e8%b5%84%e6%ba%90)
[Cloudflare Pages 永久白嫖！ 搭建免费无限图床、影视聚合、待办提醒等 | LibreTV | SubsTracker |Telegraph Image | 零度解说](https://www.freedidi.com/19957.html)
2025年7月3日
[Youtube视频](https://www.freedidi.com/category/youtube%e8%a7%86%e9%a2%91)/[免费资源](https://www.freedidi.com/category/%e5%85%8d%e8%b4%b9%e8%b5%84%e6%ba%90)
[永久免费服务器，16G内存、双核CPU、50~500G硬盘空间，HuggingFace Spaces 跑AI项目、部署实用工具，还能SSH远程管理？ | 零度解说](https://www.freedidi.com/20462.html)
2025年8月25日
[OpenAI](https://www.freedidi.com/category/openai)/[Sora](https://www.freedidi.com/category/sora)/[Youtube视频](https://www.freedidi.com/category/youtube%e8%a7%86%e9%a2%91)/[免费资源](https://www.freedidi.com/category/%e5%85%8d%e8%b4%b9%e8%b5%84%e6%ba%90)
[重磅！OpenAI 正式发布 Sora 2！免费无限玩，邀请码、提示词全公开！AI视频生成太强了！ | 零度解说](https://www.freedidi.com/20896.html)
2025年10月5日
[免费资源](https://www.freedidi.com/category/%e5%85%8d%e8%b4%b9%e8%b5%84%e6%ba%90)
[Cloudflare Workers 免费搭建精美的个人导航站！](https://www.freedidi.com/21347.html)
2025年10月31日
[Youtube视频](https://www.freedidi.com/category/youtube%e8%a7%86%e9%a2%91)/[免费资源](https://www.freedidi.com/category/%e5%85%8d%e8%b4%b9%e8%b5%84%e6%ba%90)/[限免](https://www.freedidi.com/category/%e9%99%90%e5%85%8d)
[赶紧下载！5款 “限时免费” 软件！得到就是赚到，立马帮你省下数百刀！ | 零度解说](https://www.freedidi.com/21895.html)
2025年11月29日
- pubo64178418 says:[价格呢？是多少？](https://www.freedidi.com/15144.html#comment-1305)
- huige2012 says:[我去组装一台台式电脑吧，可以帮我写一份配…](https://www.freedidi.com/?p=21947#comment-1304)
- admin says:[如果你的账号之前开通过付费业务，那么你需…](https://www.freedidi.com/?p=22004#comment-1303)
- admin says:[笔记本 RTX4060显卡的显存只有8G…](https://www.freedidi.com/?p=21947#comment-1302)
- huige2012 says:[有远程操作指导的嘛？](https://www.freedidi.com/?p=21947#comment-1301)
- [18](https://www.freedidi.com/tag/18)[2021](https://www.freedidi.com/tag/2021)[ChatGPT](https://www.freedidi.com/tag/chatgpt)[chrome](https://www.freedidi.com/tag/chrome)[edge](https://www.freedidi.com/tag/edge)[edge浏览器](https://www.freedidi.com/tag/edge%e6%b5%8f%e8%a7%88%e5%99%a8)[ExpressVPN](https://www.freedidi.com/tag/expressvpn)[google voice](https://www.freedidi.com/tag/google-voice)[Hermes Agent](https://www.freedidi.com/tag/hermes-agent)[mac os](https://www.freedidi.com/tag/mac-os)[openclaw](https://www.freedidi.com/tag/openclaw)[SS](https://www.freedidi.com/tag/ss)[ssr](https://www.freedidi.com/tag/ssr)[VIP](https://www.freedidi.com/tag/vip)[vpn](https://www.freedidi.com/tag/vpn)[VPN推荐](https://www.freedidi.com/tag/vpn%e6%8e%a8%e8%8d%90)[win10优化](https://www.freedidi.com/tag/win10%e4%bc%98%e5%8c%96)[windows 10](https://www.freedidi.com/tag/windows-10)[Windows 11](https://www.freedidi.com/tag/windows-11)[会员](https://www.freedidi.com/tag/%e4%bc%9a%e5%91%98)[免费VPN](https://www.freedidi.com/tag/%e5%85%8d%e8%b4%b9vpn)[免费软件](https://www.freedidi.com/tag/%e5%85%8d%e8%b4%b9%e8%bd%af%e4%bb%b6)[双系统](https://www.freedidi.com/tag/%e5%8f%8c%e7%b3%bb%e7%bb%9f)[国外VPS推荐](https://www.freedidi.com/tag/%e5%9b%bd%e5%a4%96vps%e6%8e%a8%e8%8d%90)[好用的vpn](https://www.freedidi.com/tag/%e5%a5%bd%e7%94%a8%e7%9a%84vpn)[安卓子系统](https://www.freedidi.com/tag/%e5%ae%89%e5%8d%93%e5%ad%90%e7%b3%bb%e7%bb%9f)[挖矿](https://www.freedidi.com/tag/%e6%8c%96%e7%9f%bf)[排名前五的VPN](https://www.freedidi.com/tag/%e6%8e%92%e5%90%8d%e5%89%8d%e4%ba%94%e7%9a%84vpn)[最好的vpn](https://www.freedidi.com/tag/%e6%9c%80%e5%a5%bd%e7%9a%84vpn)[比特币](https://www.freedidi.com/tag/%e6%af%94%e7%89%b9%e5%b8%81)[油猴插件](https://www.freedidi.com/tag/%e6%b2%b9%e7%8c%b4%e6%8f%92%e4%bb%b6)[浏览器](https://www.freedidi.com/tag/%e6%b5%8f%e8%a7%88%e5%99%a8)[电脑优化](https://www.freedidi.com/tag/%e7%94%b5%e8%84%91%e4%bc%98%e5%8c%96)[神器](https://www.freedidi.com/tag/%e7%a5%9e%e5%99%a8)[科学上网](https://www.freedidi.com/tag/%e7%a7%91%e5%ad%a6%e4%b8%8a%e7%bd%91)[网站推荐](https://www.freedidi.com/tag/%e7%bd%91%e7%ab%99%e6%8e%a8%e8%8d%90)[翻墙](https://www.freedidi.com/tag/%e7%bf%bb%e5%a2%99)[翻墙vpn](https://www.freedidi.com/tag/%e7%bf%bb%e5%a2%99vpn)[翻墙VPS](https://www.freedidi.com/tag/%e7%bf%bb%e5%a2%99vps)[老司机](https://www.freedidi.com/tag/%e8%80%81%e5%8f%b8%e6%9c%ba)[谷歌浏览器](https://www.freedidi.com/tag/%e8%b0%b7%e6%ad%8c%e6%b5%8f%e8%a7%88%e5%99%a8)[软件推荐](https://www.freedidi.com/tag/%e8%bd%af%e4%bb%b6%e6%8e%a8%e8%8d%90)[零度解密](https://www.freedidi.com/tag/%e9%9b%b6%e5%ba%a6%e8%a7%a3%e5%af%86)[零度解说](https://www.freedidi.com/tag/%e9%9b%b6%e5%ba%a6%e8%a7%a3%e8%af%b4)[黑苹果安装教程](https://www.freedidi.com/tag/%e9%bb%91%e8%8b%b9%e6%9e%9c%e5%ae%89%e8%a3%85%e6%95%99%e7%a8%8b)
### 归档
### 分类
