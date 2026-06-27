这两年，AI Agent 无疑是人工智能领域最热门的方向之一。从 OpenAI 推出的 Codex，到 Anthropic 持续升级的 Claude Code，越来越多的 AI 开始具备“自主完成任务”的能力。它们不仅能够理解用户的指令，还可以调用工具、搜索资料、编写代码，甚至直接操作电脑完成复杂工作流程。对于很多用户来说，这也意味着 AI 正在从传统的聊天助手，逐步进化为真正能够帮助人们工作的数字助理。
![20260612092616 419670 scaled](https://www.freedidi.com/wp-content/uploads/2026/06/20260612092616_419670-scaled.webp)
不过，现阶段大多数先进的 AI Agent 方案都依赖云端服务。无论是 API 调用还是订阅会员，长期使用都会产生不小的成本。尤其是对于需要频繁执行任务、进行网页搜索、资料整理或自动化操作的重度用户来说，Token 消耗和订阅费用往往是一笔不容忽视的开支。
![20260612092754 916069 scaled](https://www.freedidi.com/wp-content/uploads/2026/06/20260612092754_916069-scaled.webp)
而就在最近，来自法国的 AI 公司 H Company 正式发布了全新的 Holo 3.1 Agent 模型。它最大的亮点在于支持本地部署，并且能够与 OpenClaw 等 Agent 框架进行对接，从而让 AI 获得真正的电脑操作能力。对于拥有 中高端显卡的用户而言，这意味着可以在自己的电脑上搭建一套完全本地化的 AI Agent 系统，无需支付额外订阅费用，也不用担心 Token 限制，实现真正意义上的“无限使用”。
![20260612093112 813085 scaled](https://www.freedidi.com/wp-content/uploads/2026/06/20260612093112_813085-scaled.webp)
最关键的是 Holo 3.1 作为本地 Agent 专用模型，在各项性能指标都超于了Qwen 3.5 35B A3B模型，在本地部署AI代理绝对是当下的最佳首先开源模型！
![20260612092942 256633](https://www.freedidi.com/wp-content/uploads/2026/06/20260612092942_256633.webp)
那么 Holo 3.1 的实际效果究竟如何？在接入 OpenClaw 之后，它能否像真人一样打开浏览器、搜索资料、整理信息并完成复杂任务？接下来我们就从部署安装、模型配置以及实际案例测试三个方面，带大家全面体验这款备受关注的本地 Agent 模型。
# 部署教程
## **1、安装 Llama.cpp**
这次我们同样选择llama.cp来进行部署，因为无论是速度还是性能，llama.cp都优于Ollama 和 LMStudio
### **下载方式：**
**1、GitHub 下载【**[**点击前往**](https://github.com/ggml-org/llama.cpp)**】、或****【**[**备用下载**](https://pan.quark.cn/s/206cde2b2f7a)**】、【**[**网盘下载**](https://pan.cloudeop.com/s/5631D3E868F2D017)**】 内含启动脚本**
下载后将其进行解压，然后在根目录下创建一个新的文件夹，将其命名为 models，作为接下来存放模型的地方。
## 2、模型下载
模型该如何选择？根据下方的推荐选择适合自己的对应尺寸的模型即可
模型合集下载：【[链接直达](https://huggingface.co/collections/Hcompany/holo31)】或 【[**打包下载**](https://pan.quark.cn/s/79ee2b97141a)】或 【[**备用下载**](https://pan.cloudeop.com/s/28FA35F5AD238903)】
不同分类尺寸
35B：【[点击前往](https://huggingface.co/Hcompany/Holo-3.1-35B-A3B-GGUF)】或 【[**打包下载**](https://pan.quark.cn/s/e9dced993ed8)】、【[**备用下载**](https://pan.cloudeop.com/s/9159B1B1B56C0BB6)】
9B  ：【[点击前往](https://huggingface.co/prithivMLmods/Holo-3.1-9B-GGUF/tree/main)】或 【[**打包下载**](https://pan.quark.cn/s/d4eb7d0b1ab7)】、【[**备用下载**](https://pan.cloudeop.com/s/099B0927C9DEFB41)】
4B  ：【[点击前往](https://huggingface.co/mradermacher/Holo-3.1-4B-GGUF/tree/main)】或 【[**打包下载**](https://pan.quark.cn/s/fde9aa395ef4)】、【[**备用下载**](https://pan.cloudeop.com/s/0C0C8F38169F31A9)】
0.8 ：【[点击前往](https://huggingface.co/mradermacher/Holo-3.1-0.8B-i1-GGUF/tree/main)】或 【[**打包下载**](https://pan.quark.cn/s/19f510d81bc1)】、【[**备用下载**](https://pan.cloudeop.com/s/90B03A668C585929)】
因为我们使用Llama.cpp来加载本地模型，所有必须选择GGUF格式的模型文件，模型文件含主模型和视觉模型，都需要下载下来
![20260612094844 463366 scaled](https://www.freedidi.com/wp-content/uploads/2026/06/20260612094844_463366-scaled.webp)
## 3、启动脚本
将下方的启动脚本另存为一个bat批处理文件，或者【[**直接下载**](https://pan.quark.cn/s/08c4a16fa98b)】【[**备用下载**](https://pan.cloudeop.com/s/D3791A1134DFAADA)】脚本文件
```
@echo off
chcp 65001 >nul
title Holo 3.1 VLM 一键启动器

set LLAMA=llama-server.exe

:MENU
cls

echo ==========================================
echo         Holo 3.1 VLM 启动器
echo ==========================================
echo.
echo 1. 8GB显卡推荐（0.8B）
echo 2. 12GB显卡推荐（4B）
echo 3. 16GB显卡推荐（9B）
echo 4. 24GB显卡推荐（35B-A3B）
echo.
echo 5. CPU模式（4B）
echo.
echo 0. 退出
echo.

set /p CHOICE=请选择：

if "%CHOICE%"=="1" goto GPU8
if "%CHOICE%"=="2" goto GPU12
if "%CHOICE%"=="3" goto GPU16
if "%CHOICE%"=="4" goto GPU24
if "%CHOICE%"=="5" goto CPU
if "%CHOICE%"=="0" exit

goto MENU

:: ==========================================
:: RTX 8GB
:: ==========================================

:GPU8

"%LLAMA%" ^
-m models\Holo-3.1-0.8B.i1-Q6_K.gguf ^
-ngl 999 ^
-c 8192 ^
-fa ^
--cache-type-k q4_0 ^
--cache-type-v q4_0 ^
--temp 0.2 ^
--top-p 0.9 ^
--host 127.0.0.1 ^
--port 1234

pause
goto MENU

:: ==========================================
:: RTX 12GB
:: ==========================================

:GPU12

"%LLAMA%" ^
-m models\Holo-3.1-4B.Q8_0.gguf ^
--mmproj models\Holo-3.1-4B.mmproj-Q8_0.gguf ^
-ngl 999 ^
-c 16384 ^
-fa ^
--cache-type-k q4_0 ^
--cache-type-v q4_0 ^
--temp 0.2 ^
--top-p 0.9 ^
--host 127.0.0.1 ^
--port 1234

pause
goto MENU

:: ==========================================
:: RTX 16GB
:: ==========================================

:GPU16

"%LLAMA%" ^
-m models\Holo-3.1-9B.Q8_0.gguf ^
--mmproj models\Holo-3.1-9B.mmproj-q8_0.gguf ^
-ngl 999 ^
-c 24576 ^
-fa ^
--cache-type-k q8_0 ^
--cache-type-v q8_0 ^
--temp 0.2 ^
--top-p 0.9 ^
--host 127.0.0.1 ^
--port 1234

pause
goto MENU

:: ==========================================
:: RTX 24GB
:: ==========================================

:GPU24


"%LLAMA%" ^
-m models\q4_k_m.gguf ^
--mmproj models\mmproj.f16.gguf ^
-ngl 999 ^
-c 65536 ^
--flash-attn on ^
--cache-type-k q8_0 ^
--cache-type-v q8_0 ^
--temp 0.2 ^
--top-p 0.9 ^
--repeat-penalty 1.05 ^
--host 127.0.0.1 ^
--port 1234

pause
goto MENU

:: ==========================================
:: CPU模式
:: ==========================================

:CPU

"%LLAMA%" ^
-m models\Holo-3.1-0.8B.i1-Q6_K.gguf ^
-ngl 0 ^
-c 4096 ^
--threads 16 ^
--temp 0.2 ^
--host 127.0.0.1 ^
--port 1234

pause
goto MENU
```
注意：脚本的模型文件名称还有路径，你可以自定义修改，相关的启动参数优化已经帮你设置好，当然也可以根据需要进行修改。启动以后会安装Node.js环境等，启动后会看到如下界面，最后选择适合自己的模型大小启动即可
![20260612095428 449459](https://www.freedidi.com/wp-content/uploads/2026/06/20260612095428_449459.webp)
## 4、安装 Openclaw
当我们部署好本地模型Holo3.1以后，接下来就是将其对接到AI Agent，比如我们可以选择OpenClaw 或者 Hemes 都可以，这次我们先拿小龙虾 OpenClaw 来做测试，只需在电脑上以管理员身份打开 Powershell，然后执行下方的一键安装命令：
Windows
```
powershell -c "irm https://openclaw.ai/install.ps1 | iex"
```
macOS/Linux
```
curl -fsSL https://openclaw.ai/install.sh | bash
```
小龙虾的部署过程看[**视频演示**](https://youtu.be/p6ScdPXdaX4)，只需重点注意在模型提供商这里要跟入下截图来进行设置，API Base URL地址填写：http://127.0.0.1:1234/v1
密钥留空不用填写。
![20260612095922 584623](https://www.freedidi.com/wp-content/uploads/2026/06/20260612095922_584623.webp)
启动模式选择浏览器启动
![20260612100059 024677](https://www.freedidi.com/wp-content/uploads/2026/06/20260612100059_024677.webp)
就可以自动进入到OpenClaw的可视化的操作界面，在底部就可以看到正常加载到本地的 Holo3.1 开源模型，Off 意思是自动关闭思考模式，因为作为Agent模型，不需要思考过程，否则启动会非常耗时间。
![20260612100204 041048 scaled](https://www.freedidi.com/wp-content/uploads/2026/06/20260612100204_041048-scaled.webp)
成功启动小龙虾以后，建议安装几个必备的浏览器自动化的 skills
```
openclaw skills install agent-browser-cli
openclaw skills install use-my-browser
```
安装后再通过命令：openclaw gateway 重启下 OpenClaw 即可！或直接在对话框输入/new 也可以，最后实测，浏览器自动化操作，非常的丝滑流程，最让我意想不到的是，速度确实很快很快！！！ 比之前的Qwen 3.5 模型不知快了多少倍，本地模型执行AI Agent 任务，几乎不需要等待的，直接秒执行！
![20260612101554 184640 scaled](https://www.freedidi.com/wp-content/uploads/2026/06/20260612101554_184640-scaled.webp)
通过开源的Holo3.1模型，你只需一张性能不错的独立显卡，几乎可以代理那些付费的API，如果你的任务不是特别复杂且难度极高的推理。那么这个最新的开源模型就是最佳的本地部署方案！真正完全免费、无需Token、无需绑定任何付费套餐！真正让你实现本地 AI 自由……
### 感谢您的支持
- [**Next**](https://www.freedidi.com/24478.html)[必更！Windows 11 迎来2026年最强更新，CPU秒开鸡血模式，老电脑都变流畅了！](https://www.freedidi.com/24478.html)
- [**Previous**](https://www.freedidi.com/24419.html)[Hermes Agent 桌面版正式发布！Windows / macOS / Linux 全平台支持，小白也能轻松上手！](https://www.freedidi.com/24419.html)
## [Premiere Pro 和 After Effects 的硬件升级【官方建议】](https://www.freedidi.com/4649.html)
- 2022年4月18日
## [本地部署 Llama3.1 最强开源大模型！支持 Windows、MacOS](https://www.freedidi.com/13105.html)
- 2024年7月26日
## [Windows 11 更新 Alt+Tab UI 设计：毛玻璃横向排列，更漂亮！附开启教程 | 零度解说](https://www.freedidi.com/2985.html)
- 2022年1月9日
## [软件推荐！这9款精品级的Windows工具，让电脑好用数倍不止 | 零度解说](https://www.freedidi.com/4898.html)
- 2022年5月24日
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
