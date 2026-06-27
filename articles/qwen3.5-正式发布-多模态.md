就在刚刚，Qwen正式发布了全新的开源模型系列 —— Qwen3.5 多模态模型。这一次更新，可以说在开源模型领域掀起了不小的震动。不仅性能几乎“屠榜”，而且全面迈向了原生多模态智能体时代，真正把开源模型带入了一个新的阶段。
![3.5banner](https://www.freedidi.com/wp-content/uploads/2026/03/3.5banner.png)
Qwen3.5 多模态系列覆盖了从 0.8B 到 397B 的多个尺寸版本，适配不同硬件环境和应用场景。其中 0.8B 和 2B 两款模型体积极小，但推理速度极快，非常适合移动设备、物联网设备以及低延迟实时交互场景。在边缘端部署时，这类小模型可以实现更快响应和更低功耗，对于需要即时反馈的应用来说意义重大。
![2026 03 03 15 40 31.00 00 13 19.Still006 scaled](https://www.freedidi.com/wp-content/uploads/2026/03/2026-03-03-15-40-31.00_00_13_19.Still006-scaled.webp)
4B 版本则是“平民级”中的性能担当。它在资源消耗和性能之间取得了极佳平衡，非常适合作为轻量级 Agent 的核心大脑。对于本地部署用户或显存有限的开发者来说，这是一个兼顾智能水平与成本的理想选择。
9B 模型的表现则更进一步。它的综合能力可以媲美许多超大参数开源模型，在推理能力与多模态理解方面表现优异，同时对显存的要求却远低于百亿级以上模型，是服务器端部署中性价比极高的通用模型方案。
而最引人关注的，是开源的 Qwen3.5 397B-17B 模型。该模型总参数达到 3970 亿，但每次前向传播仅激活 170 亿参数，采用创新的混合架构，将线性注意力机制与稀疏混合专家（MoE）结构结合，在保持强大能力的同时显著优化了推理效率与成本。这种“高智能密度”的设计理念，让它在推理、编程、智能体能力、多模态理解等基准测试中全面领先。
![HCaJnUQaoAAaMIc](https://www.freedidi.com/wp-content/uploads/2026/03/HCaJnUQaoAAaMIc.jpg)
Qwen3.5 还大幅扩展了多语言与方言支持，从 119 种提升至 201 种语言与变体，为全球开发者与企业用户提供更广泛的可用性和更完善的支持。模型发布后迅速引爆 AI 社区，连Elon Musk也在社交媒体上点赞评论，称其“智能密度令人印象深刻”。
![v2 e008fa7bd56746d8ac22af470b2a0db8@46958 oswg519302oswg1080oswg1358 img 000](https://www.freedidi.com/wp-content/uploads/2026/03/v2_e008fa7bd56746d8ac22af470b2a0db8@46958_oswg519302oswg1080oswg1358_img_000.jpg)
![v2 7b877f49aede4ea9943693648114caa6@46958 oswg123255oswg1080oswg587 img 000](https://www.freedidi.com/wp-content/uploads/2026/03/v2_7b877f49aede4ea9943693648114caa6@46958_oswg123255oswg1080oswg587_img_000.jpg)
真正让 Qwen3.5 脱颖而出的，是它的原生多模态与 Agent 能力。它不仅可以理解文本与图像，还能够边思考、边搜索、边调用工具，实现真正意义上的智能体协作。在代码与智能体方向，Qwen3.5 可以协助进行网页开发、游戏开发，尤其是在前端构建与界面适配方面表现出色。开发者只需输入自然语言指令，它便能生成可运行代码，并支持实时迭代。
基于 Qwen3.5 底座模型打造的 Qwen Code，更进一步提升了 Web-coding 体验。它能够将自然语言直接转化为代码，实现实时开发与创意生成任务，包括网页构建、项目原型设计，甚至视频生成等创新型任务，为日常编程与探索性开发带来流畅高效的体验。
![2026 03 03 15 40 31.00 02 38 20.Still008 scaled](https://www.freedidi.com/wp-content/uploads/2026/03/2026-03-03-15-40-31.00_02_38_20.Still008-scaled.png)
在视觉智能体方向，Qwen3.5 可以自主操作手机或电脑完成任务。移动端已适配主流应用，支持自然语言驱动操作；电脑端则可处理跨应用数据整理与多步骤流程自动化，有效减少重复人工操作，显著提升效率。
![2026 03 03 15 40 31.00 03 02 24.Still009 scaled](https://www.freedidi.com/wp-content/uploads/2026/03/2026-03-03-15-40-31.00_03_02_24.Still009-scaled.webp)
视觉编程能力同样令人惊艳。Qwen3.5 可以将草图转化为结构清晰的前端代码，将简单游戏视频还原为逻辑框架，甚至将长视频内容提炼为结构化网页或可视化图表，大幅降低从创意到实现的门槛。
![2026 03 03 15 40 31.00 03 12 17.Still010 scaled](https://www.freedidi.com/wp-content/uploads/2026/03/2026-03-03-15-40-31.00_03_12_17.Still010-scaled.webp)
在空间智能理解方面，Qwen3.5 通过对图像像素与位置信息的建模，在物体计数、相对位置判断与空间关系描述任务中更加精准。它能够有效缓解因遮挡或视觉变化带来的误判，在自动驾驶场景理解与机器人导航等具身智能领域展现出良好潜力。
相比上一代视觉语言模型，Qwen3.5 在学科解题与复杂视觉推理任务上更加稳健。它能够结合图像内容与上下文进行多步逻辑推理，为教育与科研领域的多模态 Agent 应用提供更加可靠的基础能力。
![2026 03 03 15 40 31.00 03 42 24.Still011 scaled](https://www.freedidi.com/wp-content/uploads/2026/03/2026-03-03-15-40-31.00_03_42_24.Still011-scaled.webp)
![2026 03 03 15 40 31.00 04 03 12.Still012 scaled](https://www.freedidi.com/wp-content/uploads/2026/03/2026-03-03-15-40-31.00_04_03_12.Still012-scaled.webp)
如果你想在本地部署 Qwen3.5，可以通过Ollama来运行模型。Ollama 支持完全本地化部署与离线运行，保障数据安全，同时也能与自动化工具OpenClaw快速集成。不同尺寸模型对显存要求不同，例如部分版本约需 6GB 左右显存即可运行，而更大尺寸模型则需要更高显存配置。根据自身硬件条件选择合适版本即可。
通过 Ollama 下载模型后，可在终端运行对应命令进行加载。如果希望更友好地使用，也可以通过外部 UI 插件直接调用本地模型。在集成 OpenClaw 后，Qwen3.5 可以实现网页搜索、信息收集、结构化报告生成，以及自动化编程任务。
## **安装部署教程**
**1、下载Ollama 最新官方客户端：【**[**点击下载**](https://ollama.com/)**】**
![屏幕截图 2026 03 03 212939](https://www.freedidi.com/wp-content/uploads/2026/03/屏幕截图-2026-03-03-212939.webp)
**2、下载 Qwen3.5 最新模型**
安装好Ollama客户端以后，现在我们需要下载对应的 Qwen3.5 模型，根据自己的需要和硬件配置来选择合适的模型大小
【[**点击前往**](https://ollama.com/library/qwen3.5)】
或者可以直接使用模型下载命令来完成：
```
ollama run qwen3.5:9b
ollama run qwen3.5:35b
```
安装号模型以后，如果想直接通过可视化的UI操作界面，来先使用的话，那么可以使用下方的这个浏览器来实现，它是完全免费的。
**浏览器插件：**【[**点击下载**](https://chromewebstore.google.com/detail/page-assist-a-web-ui-for/jfgfiigpkhlkbnfnbobbkinehhfdhndo)】
![unnamed](https://www.freedidi.com/wp-content/uploads/2026/03/unnamed.png)
**3、安装部署 OpenClaw**
下载好模型以后通过下面的命令来安装最新的OpenClaw客户端：
```
ollama launch openclaw
```
**4、对接 Telegarm 电报机器人**
如果需要接入 Telegram，只需在 OpenClaw 中重新进入配置流程，选择本地 Ollama 模型，创建 Telegram Bot 并填写 Bot Token，通过配对命令完成绑定即可。完成后，你就可以在 Telegram 中直接调用本地 Qwen3.5 模型进行对话、写代码或执行自动化任务，全程本地运行，无需额外 API 费用。
打开你的 Telegram，搜索 @BotFather，发送 /newbot，来创建一个新的机器人，按提示设置：
给 Bot 起个名字，比如我设置为 lingduopenclaw
设置用户名（必须以 bot 结尾，比如 lingduopenclawbot  ）
最后会给你一串 Token：
8123121125:AAExamegv-0FQCfhfbazmp4405V0XAJCKfk
输入 token 进行对接，并进入到刚才创建的机器人里，第一次打开会显示还未正式对接，但是会在里面提供配对码，比如我的是 Pairing code: DLW7HQ69
现在只需重新打开一个新的 Powershell 窗口，然后在里面输入配对命令即可
```
openclaw pairing approve telegram 这里填写你的配对码
```
当你看到这个界面的话说明已经和Telegram配对成功了！
### **5、重启后启动的命令：**
**6、彻底卸载并删除OpenClaw**
总的来说，Qwen3.5 的发布不仅刷新了开源模型的性能上限，也让原生多模态智能体真正走向普及。从移动端到服务器，从轻量部署到超大规模模型，从视觉理解到自动化编程，它正在构建一个更完整、更高效的开源 AI 生态。
### 感谢您的支持
Tags:[openclaw](https://www.freedidi.com/tag/openclaw)
- [**Next**](https://www.freedidi.com/23120.html)[GPT-5.3 Instant 正式发布：速度更快、推理更强，免费开放使用（实测体验）](https://www.freedidi.com/23120.html)
- [**Previous**](https://www.freedidi.com/23077.html)[Cloudflare WARP 免费 VPN 复活了！Zero Trust 最新完整设置教程（高速稳定｜4K/8K 秒开实测）](https://www.freedidi.com/23077.html)
## [【AI绘画】Stable-Diffusion 通过骨架分析插件ControlNet 来制作超有意境的图片](https://www.freedidi.com/8474.html)
- 2023年2月24日
## [Hermes Agent 桌面版正式发布！Windows / macOS / Linux 全平台支持，小白也能轻松上手！](https://www.freedidi.com/24419.html)
- 2026年6月8日
## [Windows 10 【极限精简版】重磅发布！Tiny10 23H1，速度超快，只需7.8G空间！支持 64 位系统和中文， 拯救你的低配老旧电脑 | 零度解说](https://www.freedidi.com/9645.html)
- 2023年6月9日
## [ChatGPT 最新有趣的实用方式！OpenAI整合Edge浏览器，让它给我们DIY电脑、办理签证….](https://www.freedidi.com/8392.html)
- 2023年2月12日
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
[注册永久免费域名，托管到 CloudFlare ，自动免费续订、提醒！](https://www.freedidi.com/20033.html)
2025年7月7日
[AI](https://www.freedidi.com/category/ai)/[gemini](https://www.freedidi.com/category/gemini)/[Youtube视频](https://www.freedidi.com/category/youtube%e8%a7%86%e9%a2%91)/[免费资源](https://www.freedidi.com/category/%e5%85%8d%e8%b4%b9%e8%b5%84%e6%ba%90)
[Google 放大招！正式发布 Nano-Banana 图片AI神器，角色一致性堪称完美！人人都能免费用 | 零度解说](https://www.freedidi.com/20482.html)
2025年8月29日
[免费资源](https://www.freedidi.com/category/%e5%85%8d%e8%b4%b9%e8%b5%84%e6%ba%90)
[Microsoft Defender（微软安全卫士）永久免费且好用！](https://www.freedidi.com/20918.html)
2025年10月9日
![Cloudflare-workers-blog 搭建一个免费的动态博客！有前端和后台](https://www.freedidi.com/wp-content/themes/gridzone/img/thumb-small.png)
[免费资源](https://www.freedidi.com/category/%e5%85%8d%e8%b4%b9%e8%b5%84%e6%ba%90)
[Cloudflare-workers-blog 搭建一个免费的动态博客！有前端和后台](https://www.freedidi.com/21363.html)
2025年10月31日
[Windows 10](https://www.freedidi.com/category/windows-10)/[Windows 11](https://www.freedidi.com/category/windows-11)/[Youtube视频](https://www.freedidi.com/category/youtube%e8%a7%86%e9%a2%91)/[免费资源](https://www.freedidi.com/category/%e5%85%8d%e8%b4%b9%e8%b5%84%e6%ba%90)
[Windows 11 电脑越用越卡？只需这几步设置，瞬间起飞！ 跟 Win 10一样流畅运行！ | 零度解说](https://www.freedidi.com/21934.html)
2025年12月2日
- pubo64178418 says:[价格呢？是多少？](https://www.freedidi.com/15144.html#comment-1305)
- huige2012 says:[我去组装一台台式电脑吧，可以帮我写一份配…](https://www.freedidi.com/?p=21947#comment-1304)
- admin says:[如果你的账号之前开通过付费业务，那么你需…](https://www.freedidi.com/?p=22004#comment-1303)
- admin says:[笔记本 RTX4060显卡的显存只有8G…](https://www.freedidi.com/?p=21947#comment-1302)
- huige2012 says:[有远程操作指导的嘛？](https://www.freedidi.com/?p=21947#comment-1301)
- [18](https://www.freedidi.com/tag/18)[2021](https://www.freedidi.com/tag/2021)[ChatGPT](https://www.freedidi.com/tag/chatgpt)[chrome](https://www.freedidi.com/tag/chrome)[edge](https://www.freedidi.com/tag/edge)[edge浏览器](https://www.freedidi.com/tag/edge%e6%b5%8f%e8%a7%88%e5%99%a8)[ExpressVPN](https://www.freedidi.com/tag/expressvpn)[google voice](https://www.freedidi.com/tag/google-voice)[Hermes Agent](https://www.freedidi.com/tag/hermes-agent)[mac os](https://www.freedidi.com/tag/mac-os)[openclaw](https://www.freedidi.com/tag/openclaw)[SS](https://www.freedidi.com/tag/ss)[ssr](https://www.freedidi.com/tag/ssr)[VIP](https://www.freedidi.com/tag/vip)[vpn](https://www.freedidi.com/tag/vpn)[VPN推荐](https://www.freedidi.com/tag/vpn%e6%8e%a8%e8%8d%90)[win10优化](https://www.freedidi.com/tag/win10%e4%bc%98%e5%8c%96)[windows 10](https://www.freedidi.com/tag/windows-10)[Windows 11](https://www.freedidi.com/tag/windows-11)[会员](https://www.freedidi.com/tag/%e4%bc%9a%e5%91%98)[免费VPN](https://www.freedidi.com/tag/%e5%85%8d%e8%b4%b9vpn)[免费软件](https://www.freedidi.com/tag/%e5%85%8d%e8%b4%b9%e8%bd%af%e4%bb%b6)[双系统](https://www.freedidi.com/tag/%e5%8f%8c%e7%b3%bb%e7%bb%9f)[国外VPS推荐](https://www.freedidi.com/tag/%e5%9b%bd%e5%a4%96vps%e6%8e%a8%e8%8d%90)[好用的vpn](https://www.freedidi.com/tag/%e5%a5%bd%e7%94%a8%e7%9a%84vpn)[安卓子系统](https://www.freedidi.com/tag/%e5%ae%89%e5%8d%93%e5%ad%90%e7%b3%bb%e7%bb%9f)[挖矿](https://www.freedidi.com/tag/%e6%8c%96%e7%9f%bf)[排名前五的VPN](https://www.freedidi.com/tag/%e6%8e%92%e5%90%8d%e5%89%8d%e4%ba%94%e7%9a%84vpn)[最好的vpn](https://www.freedidi.com/tag/%e6%9c%80%e5%a5%bd%e7%9a%84vpn)[比特币](https://www.freedidi.com/tag/%e6%af%94%e7%89%b9%e5%b8%81)[油猴插件](https://www.freedidi.com/tag/%e6%b2%b9%e7%8c%b4%e6%8f%92%e4%bb%b6)[浏览器](https://www.freedidi.com/tag/%e6%b5%8f%e8%a7%88%e5%99%a8)[电脑优化](https://www.freedidi.com/tag/%e7%94%b5%e8%84%91%e4%bc%98%e5%8c%96)[神器](https://www.freedidi.com/tag/%e7%a5%9e%e5%99%a8)[科学上网](https://www.freedidi.com/tag/%e7%a7%91%e5%ad%a6%e4%b8%8a%e7%bd%91)[网站推荐](https://www.freedidi.com/tag/%e7%bd%91%e7%ab%99%e6%8e%a8%e8%8d%90)[翻墙](https://www.freedidi.com/tag/%e7%bf%bb%e5%a2%99)[翻墙vpn](https://www.freedidi.com/tag/%e7%bf%bb%e5%a2%99vpn)[翻墙VPS](https://www.freedidi.com/tag/%e7%bf%bb%e5%a2%99vps)[老司机](https://www.freedidi.com/tag/%e8%80%81%e5%8f%b8%e6%9c%ba)[谷歌浏览器](https://www.freedidi.com/tag/%e8%b0%b7%e6%ad%8c%e6%b5%8f%e8%a7%88%e5%99%a8)[软件推荐](https://www.freedidi.com/tag/%e8%bd%af%e4%bb%b6%e6%8e%a8%e8%8d%90)[零度解密](https://www.freedidi.com/tag/%e9%9b%b6%e5%ba%a6%e8%a7%a3%e5%af%86)[零度解说](https://www.freedidi.com/tag/%e9%9b%b6%e5%ba%a6%e8%a7%a3%e8%af%b4)[黑苹果安装教程](https://www.freedidi.com/tag/%e9%bb%91%e8%8b%b9%e6%9e%9c%e5%ae%89%e8%a3%85%e6%95%99%e7%a8%8b)
### 归档
### 分类
