最近，AI 视频生成领域突然冒出了一个极具争议的名字 —— Sulphur 2。它被不少网友称为“开源版 Sora”，不仅支持文生视频、图片转视频，而且最大的卖点只有四个字：**真正无审查**。目前网上已经开始出现大量使用 Sulphur 2 生成的敏感视频内容，甚至有些演示视频不得不打上马赛克后才能公开展示。这也让它在短时间内迅速爆火，成为近期 AI 圈讨论度最高的视频模型之一。
![20260511111848 809070 scaled](https://www.freedidi.com/wp-content/uploads/2026/05/20260511111848_809070-scaled.webp)
更让人意外的是，Sulphur 2 并不是那种只能跑在顶级服务器上的“实验室模型”。相反，它主打的恰恰是“本地部署”。官方与社区版本已经支持在普通消费级显卡上运行，甚至 8G 显存也可以启动体验。对于很多普通用户来说，这意味着你不再需要昂贵的云端订阅，也不需要 API Key，更不用排队等待生成，只要一台电脑，就能在本地自由生成 AI 视频。老司机们又有“大福利”了！
![20260511112126 122543 scaled](https://www.freedidi.com/wp-content/uploads/2026/05/20260511112126_122543-scaled.webp)
接下来，我们就来实测一下它的实际表现，以及如何在本地完成部署使用。
## 部署教程：
**1、下载最新版的 ComfyUI 客户端**
【[**点击前往**](https://comfy.org/)】或 【[**备用打包下载**](https://pan.quark.cn/s/5ffd1cfd41e8)】
![20260511112415 119523 scaled](https://www.freedidi.com/wp-content/uploads/2026/05/20260511112415_119523-scaled.webp)
下载后直接安装即可，如果你之前安装过旧版的ComfyUI，那么同样建议升级到最新版，否则部分模型可能不兼容，无法正常运行
![20260511112753 979461 scaled](https://www.freedidi.com/wp-content/uploads/2026/05/20260511112753_979461-scaled.webp)
**2、下载 Sulphur 2 开源无审查模型**
目前该模型有满血版和蒸馏版，前者需要32G以上的显存，适合电脑配置高的用户，小显存你就选择蒸馏版的压缩GGUF模型
**1、Sulphur 2 官方下载**
**【**[**点击前往**](https://huggingface.co/SulphurAI/Sulphur-2-base)**】或 【**[**网盘下载**](https://pan.quark.cn/s/7326db62a968)**】、【**[**打包下载**](https://pan.cloudeop.com/s/FACAC3DCD3B42D5F)**】**
如果你的显存大于32G，那么你可以选择bf16精度的模型，生成质量最高，如果你的显存是8G以上的，那么建议选择fp8精度的模型，它对显存要求会更少，速度也更快！注意：模型大小不等于显存大小，只需你的硬盘空间足够即可！
![20260511113245 928617](https://www.freedidi.com/wp-content/uploads/2026/05/20260511113245_928617.webp)
**2、Sulphur 2 蒸馏模型下载**
**【**[**点击前往**](https://huggingface.co/vantagewithai/LTX2.3-10Eros-GGUF)**】或 【**[**网盘下载**](https://pan.quark.cn/s/c5ff78c06558)**】、【**[**备用下载**](https://pan.cloudeop.com/s/9B1F40D7A20ED5A5)**】**
蒸馏版模型是gguf格式的文件，需要配合 ComfyUI-GGUF 插件进行使用！
![20260511113158 582426](https://www.freedidi.com/wp-content/uploads/2026/05/20260511113158_582426.webp)
下载好模型以后跟着教程操作，将模型放入对应的文件夹下
**3、图生视频**
**下载工作流**重启并进入 ComfyUI 客户端，在（模板-视频）中下载 LTX-2.3:图生视频，来获取生成的工作流，载入后将默认的主模型切换到之前下载好的无审查的Sulphur 2模型
![20260511113910 889627](https://www.freedidi.com/wp-content/uploads/2026/05/20260511113910_889627.webp)
最后上传图片，就可以通过图片生成你需要的任何视频了
![20260511114026 970937 scaled](https://www.freedidi.com/wp-content/uploads/2026/05/20260511114026_970937-scaled.webp)
**4、文生视频**
先下载工作流 【[**点击下载**](https://pan.quark.cn/s/186d6ff2bb14)】或【[**备用下载**](https://pan.cloudeop.com/s/4CF2170676EF0BE6)】
获取到工作流后，直接拖入ComfyUI 客户端，在文本输入里填写你需要的提示词，就可以通过文字生成视频了！
![20260511132103 956067](https://www.freedidi.com/wp-content/uploads/2026/05/20260511132103_956067.webp)
### 打赏支持×感谢您的支持
支付宝微信支付BitcoinUSDT
- [**Next**](https://www.freedidi.com/24171.html)[AI 开发包大规模投毒：Mistral、TanStack、Guardrails AI 集体中招，npm 供应链正在失控？](https://www.freedidi.com/24171.html)
- [**Previous**](https://www.freedidi.com/24128.html)[Bitcoin 挖矿进入低利润时代？比特币 8 万美元附近，矿企仍然亏损](https://www.freedidi.com/24128.html)
## [AI 声音克隆神器！MockingBird  轻松实现用自己的声音进行文字转语音 ！附最新安装、使用教程！| 零度解说](https://www.freedidi.com/9753.html)
- 2023年6月19日
## [Mac 安装 Windows 11 系统！最完美的方案，超级流畅丝滑，完全免费，支持 M1/M2/Intel，支持拖拽互传文件！ | 零度解说](https://www.freedidi.com/12536.html)
- 2024年5月22日
## [显卡何时恢复原价？真的都去挖矿了吗？为你揭秘卡荒的真相！ | 零度解说](https://www.freedidi.com/1435.html)
- 2021年6月7日
## [Windows Server 2025 正式发布！低配电脑也能轻松驾驭，无广告更纯净！ 免费下载+激活](https://www.freedidi.com/19562.html)
- 2025年6月8日
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
