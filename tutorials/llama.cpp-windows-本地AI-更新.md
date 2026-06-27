最近，llama.cpp又迎来了一次非常重要的更新。对于经常在 Windows 上折腾本地 AI 大模型的用户来说，这次更新可以说相当实用。
因为现在官方已经开始真正意义上的：“降低 Windows 本地 AI 的使用门槛”！
![20260518064042 404956 scaled](https://www.freedidi.com/wp-content/uploads/2026/05/20260518064042_404956-scaled.webp)
![20260518110005 256951 scaled](https://www.freedidi.com/wp-content/uploads/2026/05/20260518110005_256951-scaled.webp)
以前很多人第一次接触本地大模型，最头疼的其实不是模型本身，而是各种环境问题：
- CUDA 版本不匹配
- DLL 缺失
- 驱动不兼容
- CMake 编译失败
- 环境变量错误
- Vulkan / HIP 配置复杂
- Windows 编译过程报错
尤其很多新手，教程还没看完，就已经被环境问题劝退了。
但现在不一样了。
在 llama.cpp 最新发布的 b9196 版本中，官方已经直接提供了多种 Windows 预编译版本，很多情况下已经可以做到：下载 → 解压 → 双击运行！这对于 Windows 本地 AI 用户来说，绝对算是一件好事。
![20260518105919 469897 scaled](https://www.freedidi.com/wp-content/uploads/2026/05/20260518105919_469897-scaled.webp)
# llama.cpp 是什么？
llama.cpp 官方 GitHub是目前最流行的本地 GGUF 模型推理框架之一。
![20260518064922 507431](https://www.freedidi.com/wp-content/uploads/2026/05/20260518064922_507431.webp)
## **官方下载：【**[**点击前往**](https://github.com/ggml-org/llama.cpp/releases/tag/b9196)**】 或 【**[**网盘下载**](https://pan.quark.cn/s/4c9a7547159b)**】、【**[**整合下载**](https://pan.cloudeop.com/s/55038F2FB7450D9F)**】**
很多大家熟悉的本地模型，其实都可以通过 llama.cpp 运行：
- Qwen
- Llama
- DeepSeek
- Gemma
- Hermes
- Dolphin
- Mistral
- Mixtral
尤其现在 GGUF 生态越来越成熟，很多模型都会第一时间发布 GGUF 量化版本。
# **视频教程：**
而 llama.cpp 最大的优势就是：
轻量
跨平台
支持 GPU
支持 CPU
支持 GGUF
而且现在甚至已经支持：
多模态
图片理解
Vision 模型
OpenAI 风格 API
网页聊天界面
# llama.cpp 最新 Windows 版本支持什么？
目前官方 Release 页面已经直接提供：
- Windows x64 CPU
- Windows x64 CUDA 12.4
- Windows x64 CUDA 13.1
- Windows x64 Vulkan
- Windows x64 HIP Radeon
- Windows x64 SYCL
- Windows ARM64 CPU
这意味着：
## NVIDIA 用户
可以直接选择：CUDA 12.4 或者 CUDA 13.1
如果你是：
- RTX 3060
- RTX 4060
- RTX 4070
- RTX 4080
- RTX 4090
基本建议优先 CUDA。
## AMD 用户
现在终于不用完全依赖 ROCm 了。
你可以：HIP 或者 Vulkan
很多情况下，Vulkan 反而比 HIP 更稳定。
## Intel 用户
现在 Intel 核显、Arc 独显也终于有得玩了。
可以尝试：SYCL 或者 Vulkan
虽然性能和 NVIDIA 还有差距，但已经能正常跑很多 GGUF 小模型。
# 如何启动 GGUF 模型？
例如：gemma-4-31b-jang-crack-Q4_K_M.gguf
启动方式其实非常简单。
进入 llama.cpp 目录：
```
llama-server.exe -m models\你的模型.gguf -ngl 999
```
其中：-ngl 999 代表尽量把模型全部加载到 GPU。
启动成功后，浏览器打开：http://127.0.0.1:8080
即可进入网页聊天界面。
# 如何启动 GGUF 多模态视觉模型？
加载视觉模型需要2个文件，一个是主模型文件，另外一个就是 mmproj 视觉模型加载文件
目前支持较好的包括：
## Qwen2-VL / Qwen2.5-VL
目前中文视觉能力最强之一：
- OCR
- 截图理解
- 网页识别
- 中文图片问答
表现都非常强。
### **主模型下载：【**[**点击前往**](https://huggingface.co/unsloth/Qwen2.5-VL-7B-Instruct-GGUF/tree/main)**】或 【**[**网盘下载**](https://pan.quark.cn/s/733595f75bd0)**】、【**[**备用下载**](https://pan.cloudeop.com/s/84D41F7FA2AF25B0)**】**
![20260518071309 620194](https://www.freedidi.com/wp-content/uploads/2026/05/20260518071309_620194.webp)
比如我让它给做视频封面的点击率测试，居然可以做到100%正确！当然它的功能远不止这些…….
**多模态模型启用：**
```
llama-server.exe -m "models\主模型.gguf" --mmproj "models\mmproj视觉模型.gguf" -ngl 999
```
# 无审查模型：
**1、Llama3-8b-DarkIdol 是比较热门的无审查的开源大模型**
**支持中文、日文和英语，非常适合角色扮演。**
### 模型下载：【[点击前往](https://huggingface.co/aifeifei798/llama3-8B-DarkIdol-2.3-Uncensored-32K/tree/main)】或 【[**打包下载**](https://pan.quark.cn/s/5fc210f9bab4)】打包版下载即可使用无需合并转换格式
下载合并为GGUF模型格式
```
huggingface-cli download aifeifei798/llama3-8B-DarkIdol-2.3-Uncensored-32K --local-dir DarkIdol-HF --local-dir-use-symlinks False
```
然后用 llama.cpp 转 GGUF：
```
git clone https://github.com/ggerganov/llama.cpp
cd llama.cpp
pip install -r requirements.txt

python convert_hf_to_gguf.py ../DarkIdol-HF --outtype f16 --outfile ../DarkIdol-F16.gguf
```
需要量化成 Q4_K_M的话可以命令：
```
llama-quantize.exe ../DarkIdol-F16.gguf ../DarkIdol-Q4_K_M.gguf Q4_K_M
```
![20260518065228 136336](https://www.freedidi.com/wp-content/uploads/2026/05/20260518065228_136336.webp)
**2、Gemma-4-31b-jang-crack-Q4_K_M 是 Google 开源的无审查大模型**
这是一个在本地跑：听话、高效、不乱加道德判断的AI
- **推理能力扎实：在数学和代码相关任务上表现突出，尤其长上下文处理（原生支持128K，部分可扩展到256K）。你甚至可以把整个项目代码库或一本技术手册一次性喂给它，它不会轻易“失忆”。**
- **参数效率高：**
26B MoE版本激活参数不多，跑起来相对轻快，在很多基准上效率比同级别模型更好。
- **开源友好：**
Apache 2.0协议，允许修改、商用和二次分发，这对想自己折腾或做副业的朋友来说非常实用。
官方版的主要问题是安全对齐层比较厚，很多正常的技术探讨或创意场景容易被挡住。越狱版通过社区技术（abliteration等）移除了这部分限制，保留了绝大部分原始能力。
### 模型下载：【[点击前往](https://huggingface.co/dealignai/Gemma-4-31B-JANG_4M-CRACK/tree/main)】或 【[**打包下载**](https://pan.quark.cn/s/808e747af63c)】、【[备用下载](https://pan.cloudeop.com/s/89009C6DAE757ED0)】
![20260518094514 729207](https://www.freedidi.com/wp-content/uploads/2026/05/20260518094514_729207.webp)
# 更多越狱模型：
1、Hermes-3 【[**点击下载**](https://huggingface.co/NousResearch/Hermes-3-Llama-3.1-8B)】
2、Qwen 越狱模型【[**点击下载**](https://huggingface.co/zemelee/qwen2.5-jailbreak)】
3、Deepseek 越狱模型【[**点击下载**](https://huggingface.co/huihui-ai)】
## **多种模态自由切换运行：**
如果我们同时下载了多种不同的模型，为了方便统一管理，在运行的时候我们可以使用零度的这个脚本，来实现多模型自由切换运行，注意将里面的模型名称改成你自己的！
```
@echo off
chcp 65001 >nul
cd /d C:\Users\LINGDU\Desktop\llama-b9196-bin-win-cuda-13.1-x64

echo 请选择模型：
echo 1. Gemma 31B
echo 2. Qwen VL 多模态
echo 3. DeepSeek

set /p choice=输入数字：

if "%choice%"=="1" llama-server.exe -m "models\gemma-4-31b-jang-crack-Q4_K_M.gguf" -ngl 999
if "%choice%"=="2" llama-server.exe -m "models\Qwen2.5-VL-7B-Instruct-Q4_K_M.gguf" --mmproj "models\mmproj-BF16.gguf" -ngl 999
if "%choice%"=="3" llama-server.exe -m "models\deepseek.gguf" -ngl 999

pause
```
将上方的命令保存到文本文档里，另存为的时候选择utf-8格式，最后将txt后缀改成bat即可！双击运行即可看到下方的选项
![20260518070758 415709](https://www.freedidi.com/wp-content/uploads/2026/05/20260518070758_415709.webp)
输入模型对应的数字就可以成功启动模型
![20260518070850 012830 scaled](https://www.freedidi.com/wp-content/uploads/2026/05/20260518070850_012830-scaled.webp)
![20260518070854 219316 scaled](https://www.freedidi.com/wp-content/uploads/2026/05/20260518070854_219316-scaled.webp)
![20260518110131 957575 scaled](https://www.freedidi.com/wp-content/uploads/2026/05/20260518110131_957575-scaled.webp)
### 感谢您的支持
- [**Next**](https://www.freedidi.com/24249.html)[Google I/O 彻底炸了！Gemini 3.5 Flash + Gemini Omni，AI 开始进入“执行时代”](https://www.freedidi.com/24249.html)
- [**Previous**](https://www.freedidi.com/24192.html)[Claude Code + Ollama 太强了！免费本地 AI 开发助手来了！无需 Claude API！｜零度解说](https://www.freedidi.com/24192.html)
## [OpenAI  不可思议！植入机器人大脑会发生什么？…. Figure 1 | 零度解说](https://www.freedidi.com/11828.html)
- 2024年3月15日
## [Photoprism 开源相册的搭建教程](https://www.freedidi.com/2543.html)
- 2021年11月28日
## [最好的免费VPN | 全球排名前五 | 这5款免费VPN亲测速度安全性都非常的棒！](https://www.freedidi.com/150.html)
- 2020年4月18日
## [MSRT- 微软官方的 Windows 恶意软件删除工具下载](https://www.freedidi.com/2915.html)
- 2022年1月8日
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
