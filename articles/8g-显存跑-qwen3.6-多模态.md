估计很多人不相信这是真的，一个非常大的误解，大多数人都会认为：35B 大模型 = 必须 24G 显存才能跑，但最近我实测发现，即使只有一张 RTX 3070 8G 显卡，只要搭配足够的内存，再通过llama.cpp的 CPU Offload 和 MoE 优化，居然真的可以跑起来QwenQwen3.6-35B-A3B 模型。速度还非常快！
![20260522113534 921247](https://www.freedidi.com/wp-content/uploads/2026/05/20260522113534_921247.webp)
**甚至：**
- 支持长上下文
- 支持 Flash Attention
- 支持多模态（视觉）
- 支持本地网页 UI
这篇文章，就带大家完整实测与部署
# 一、我的硬件配置
本次测试平台：
CPU：i7-12700
GPU：RTX 3070 8GB
RAM：32G × 2
系统：Windows 11
推理框架：llama.cpp CUDA 12.4
![20260522113714 803209 scaled](https://www.freedidi.com/wp-content/uploads/2026/05/20260522113714_803209-scaled.webp)
# 二、为什么 8G 显存也能跑 35B？
这是这次测试最关键的地方。
Qwen3.6-35B-A3B：
35B 总参数
每次只激活约 3B
也就是说：并不是所有参数同时参与推理
因此：GPU 不需要一次性加载完整 35B ，再结合 llama.cpp 的：CPU Offload ；就能实现：GPU 跑注意力层、RAM 跑专家层。这也是：RTX3070 8G 成功运行 35B 的核心原因！
# 三、部署教程
### 1、下载 llama.cpp
推荐下载：【[**Github下载**](https://github.com/ggml-org/llama.cpp)】、【[**网盘下载**](https://pan.quark.cn/s/4c9a7547159b)】或 【[**整合包下载**](https://pan.cloudeop.com/s/55038F2FB7450D9F)】
### llama.cpp 最新版支持 N卡、A卡、I卡 还有纯CPU运行，同时也可以在Mac、Linux系统上运行！所以几乎可以在任何电脑上进行运行。
![20260522112459 822918](https://www.freedidi.com/wp-content/uploads/2026/05/20260522112459_822918.webp)
2、安装显卡驱动，比如 N卡选择 CUDA 13.1，如果是  A卡请自行升级到最新版即可
【[**驱动下载**](https://developer.nvidia.com/cuda-13-1-0-download-archive)】或 【[**打包下载**](https://pan.quark.cn/s/9e48dc99be51)】
## 四、下载模型
本次使用模型：Qwen3.6-35B-A3B-UD-Q4_K_M.gguf
量化格式：Q4_K_M
这是目前：
- 精度
- 显存
- 速度
综合平衡最好的格式之一。
### 模型下载：
### 【[**Huggingface下载**](https://huggingface.co/unsloth/Qwen3.6-35B-A3B-GGUF/tree/main)】或 【[**网盘下载**](https://pan.quark.cn/s/a73edf858ba4)】
# 五、多模态模型注意事项（非常重要）
这里很多人会踩坑。
Qwen3.6 多模态模型：必须搭配 mmproj
否则：
- 图片上传按钮灰色
- 无法识图
- Vision 不工作
例如：mmproj-BF16.gguf
# 六、最终启动命令（3070 8G 优化版）
下面是我最终稳定运行的配置：
```
@echo off
chcp 65001 >nul
cd /d C:\Users\LINGDU\Desktop\llama-b9196-bin-win-cuda-12.4-x64

llama-server.exe ^
 -m "models\Qwen3.6-35B-A3B-UD-Q4_K_M.gguf" ^
 --mmproj "models\mmproj-BF16.gguf" ^
 -ngl 99 ^
 --n-cpu-moe 999 ^
 --flash-attn on ^
 --jinja ^
 -c 32768 ^
 -t 12 ^
 -b 512 ^
 -ub 128 ^
 --cache-type-k q4_0 ^
 --cache-type-v q4_0 ^
 --mlock ^
 --host 127.0.0.1 ^
 --port 8080

pause
```
注意将上面的llama.cpp的存放路径改成你自己的，因为我是放在桌面上的，所以路径是：C:\Users\LINGDU\Desktop\llama-b9196-bin-win-cuda-12.4-x64 务必改成你自己的路径！
将上面的启动命令另存为启动.bat 批处理脚本，打开运行即可！
![20260522113318 731775](https://www.freedidi.com/wp-content/uploads/2026/05/20260522113318_731775.webp)
成功运行后在浏览器上访问本地的地址：127.0.0.1:8080 就可以正式使用！
![20260522113416 200844 scaled](https://www.freedidi.com/wp-content/uploads/2026/05/20260522113416_200844-scaled.webp)
### 感谢您的支持
- [**Next**](https://www.freedidi.com/24284.html)[Qwen3.6-35B-A3B 越狱版来了！目前最强“无审查”开源模型？6G 显存都能跑，本地 AI 彻底自由了](https://www.freedidi.com/24284.html)
- [**Previous**](https://www.freedidi.com/24249.html)[Google I/O 彻底炸了！Gemini 3.5 Flash + Gemini Omni，AI 开始进入“执行时代”](https://www.freedidi.com/24249.html)
## [给美女换衣服！ Stable Diffusion 进阶教程！你学会了吗？| 零度解说](https://www.freedidi.com/9270.html)
- 2023年5月12日
![UptimeFlare 在Cloudflare Workers 上搭建一个网站监控服务！免费开源](https://www.freedidi.com/wp-content/themes/gridzone/img/thumb-medium.png)
## [UptimeFlare 在Cloudflare Workers 上搭建一个网站监控服务！免费开源](https://www.freedidi.com/21369.html)
- 2025年10月31日
## [Ghost Downloader 3 – 开源、跨平台、智能多线程下载神器 （Win/Mac/Linux）](https://www.freedidi.com/20155.html)
- 2025年7月15日
## [Runway （GEN-2） 燃爆AI视频创作领域！一句话秒出4K高清大片！](https://www.freedidi.com/10882.html)
- 2023年11月4日
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
[AI](https://www.freedidi.com/category/ai)/[OpenAI](https://www.freedidi.com/category/openai)/[Youtube视频](https://www.freedidi.com/category/youtube%e8%a7%86%e9%a2%91)/[免费资源](https://www.freedidi.com/category/%e5%85%8d%e8%b4%b9%e8%b5%84%e6%ba%90)
[ChatGPT「学习模式」火爆上线！免费使用，教育AI要崩盘？最新实测来了! | 零度解说](https://www.freedidi.com/20334.html)
2025年7月31日
[免费资源](https://www.freedidi.com/category/%e5%85%8d%e8%b4%b9%e8%b5%84%e6%ba%90)
[Wan2.2-Animate 图片转视频！完美角色一致性，动画替换模型，本地部署教程！](https://www.freedidi.com/20685.html)
2025年9月23日
[免费资源](https://www.freedidi.com/category/%e5%85%8d%e8%b4%b9%e8%b5%84%e6%ba%90)
[Ventoy 使用教程, 当下最好用的U盘启动盘制作神器！](https://www.freedidi.com/21182.html)
2025年10月20日
[gemini](https://www.freedidi.com/category/gemini)/[Youtube视频](https://www.freedidi.com/category/youtube%e8%a7%86%e9%a2%91)/[免费资源](https://www.freedidi.com/category/%e5%85%8d%e8%b4%b9%e8%b5%84%e6%ba%90)
[谷歌突然发布 Gemini 3.0！强到离谱，Pro 版免费开放使用，附实测与开通教程！| 零度解说](https://www.freedidi.com/21720.html)
2025年11月19日
[VPN](https://www.freedidi.com/category/vpn)/[免费资源](https://www.freedidi.com/category/%e5%85%8d%e8%b4%b9%e8%b5%84%e6%ba%90)
[免费高速的V2ray节点，下载速度可以飙到920M+ ！来自Amazon的无限分享](https://www.freedidi.com/22225.html)
2025年12月28日
- pubo64178418 says:[价格呢？是多少？](https://www.freedidi.com/15144.html#comment-1305)
- huige2012 says:[我去组装一台台式电脑吧，可以帮我写一份配…](https://www.freedidi.com/?p=21947#comment-1304)
- admin says:[如果你的账号之前开通过付费业务，那么你需…](https://www.freedidi.com/?p=22004#comment-1303)
- admin says:[笔记本 RTX4060显卡的显存只有8G…](https://www.freedidi.com/?p=21947#comment-1302)
- huige2012 says:[有远程操作指导的嘛？](https://www.freedidi.com/?p=21947#comment-1301)
- [18](https://www.freedidi.com/tag/18)[2021](https://www.freedidi.com/tag/2021)[ChatGPT](https://www.freedidi.com/tag/chatgpt)[chrome](https://www.freedidi.com/tag/chrome)[edge](https://www.freedidi.com/tag/edge)[edge浏览器](https://www.freedidi.com/tag/edge%e6%b5%8f%e8%a7%88%e5%99%a8)[ExpressVPN](https://www.freedidi.com/tag/expressvpn)[google voice](https://www.freedidi.com/tag/google-voice)[Hermes Agent](https://www.freedidi.com/tag/hermes-agent)[mac os](https://www.freedidi.com/tag/mac-os)[openclaw](https://www.freedidi.com/tag/openclaw)[SS](https://www.freedidi.com/tag/ss)[ssr](https://www.freedidi.com/tag/ssr)[VIP](https://www.freedidi.com/tag/vip)[vpn](https://www.freedidi.com/tag/vpn)[VPN推荐](https://www.freedidi.com/tag/vpn%e6%8e%a8%e8%8d%90)[win10优化](https://www.freedidi.com/tag/win10%e4%bc%98%e5%8c%96)[windows 10](https://www.freedidi.com/tag/windows-10)[Windows 11](https://www.freedidi.com/tag/windows-11)[会员](https://www.freedidi.com/tag/%e4%bc%9a%e5%91%98)[免费VPN](https://www.freedidi.com/tag/%e5%85%8d%e8%b4%b9vpn)[免费软件](https://www.freedidi.com/tag/%e5%85%8d%e8%b4%b9%e8%bd%af%e4%bb%b6)[双系统](https://www.freedidi.com/tag/%e5%8f%8c%e7%b3%bb%e7%bb%9f)[国外VPS推荐](https://www.freedidi.com/tag/%e5%9b%bd%e5%a4%96vps%e6%8e%a8%e8%8d%90)[好用的vpn](https://www.freedidi.com/tag/%e5%a5%bd%e7%94%a8%e7%9a%84vpn)[安卓子系统](https://www.freedidi.com/tag/%e5%ae%89%e5%8d%93%e5%ad%90%e7%b3%bb%e7%bb%9f)[挖矿](https://www.freedidi.com/tag/%e6%8c%96%e7%9f%bf)[排名前五的VPN](https://www.freedidi.com/tag/%e6%8e%92%e5%90%8d%e5%89%8d%e4%ba%94%e7%9a%84vpn)[最好的vpn](https://www.freedidi.com/tag/%e6%9c%80%e5%a5%bd%e7%9a%84vpn)[比特币](https://www.freedidi.com/tag/%e6%af%94%e7%89%b9%e5%b8%81)[油猴插件](https://www.freedidi.com/tag/%e6%b2%b9%e7%8c%b4%e6%8f%92%e4%bb%b6)[浏览器](https://www.freedidi.com/tag/%e6%b5%8f%e8%a7%88%e5%99%a8)[电脑优化](https://www.freedidi.com/tag/%e7%94%b5%e8%84%91%e4%bc%98%e5%8c%96)[神器](https://www.freedidi.com/tag/%e7%a5%9e%e5%99%a8)[科学上网](https://www.freedidi.com/tag/%e7%a7%91%e5%ad%a6%e4%b8%8a%e7%bd%91)[网站推荐](https://www.freedidi.com/tag/%e7%bd%91%e7%ab%99%e6%8e%a8%e8%8d%90)[翻墙](https://www.freedidi.com/tag/%e7%bf%bb%e5%a2%99)[翻墙vpn](https://www.freedidi.com/tag/%e7%bf%bb%e5%a2%99vpn)[翻墙VPS](https://www.freedidi.com/tag/%e7%bf%bb%e5%a2%99vps)[老司机](https://www.freedidi.com/tag/%e8%80%81%e5%8f%b8%e6%9c%ba)[谷歌浏览器](https://www.freedidi.com/tag/%e8%b0%b7%e6%ad%8c%e6%b5%8f%e8%a7%88%e5%99%a8)[软件推荐](https://www.freedidi.com/tag/%e8%bd%af%e4%bb%b6%e6%8e%a8%e8%8d%90)[零度解密](https://www.freedidi.com/tag/%e9%9b%b6%e5%ba%a6%e8%a7%a3%e5%af%86)[零度解说](https://www.freedidi.com/tag/%e9%9b%b6%e5%ba%a6%e8%a7%a3%e8%af%b4)[黑苹果安装教程](https://www.freedidi.com/tag/%e9%bb%91%e8%8b%b9%e6%9e%9c%e5%ae%89%e8%a3%85%e6%95%99%e7%a8%8b)
### 归档
### 分类
