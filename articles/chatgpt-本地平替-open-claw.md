如果现在让我推荐一套最适合普通用户跑本地模型 + Agent 的方案，我会毫不犹豫地推荐：**Hermes + Qwen3.6 最新开源模型。**这套组合最大的优势就是：免费、好用、灵活，而且非常适合日常使用**。**
![20260503095446 906599 scaled](https://www.freedidi.com/wp-content/uploads/2026/05/20260503095446_906599-scaled.webp)
无论你是想让 AI 帮你处理自动化任务，还是辅助代码编写、中文理解、逻辑推理，Qwen3.6 都已经可以满足大多数人的日常需求。相比很多需要订阅、需要充值 Token 的在线 AI 服务，本地部署最大的好处就是——**真正做到 Token 自由。**
你不用担心每次对话都在消耗额度，也不用每个月支付固定会员费。模型运行在自己的电脑上，数据不上传到第三方平台，隐私也完全掌握在自己手里。而 Hermes Agent 的加入，则让这套方案变得更加实用。
![20260503095807 463571 scaled](https://www.freedidi.com/wp-content/uploads/2026/05/20260503095807_463571-scaled.webp)
部署完成后，你可以把它变成一个真正属于自己的 AI 助手：
支持手机随时对话，支持开机自动启动，也可以长时间保持在线。无论是写代码、查资料、整理内容，还是执行一些自动化操作，它都可以成为你电脑上的 24 小时 AI 助理。
![20260503103520 607578](https://www.freedidi.com/wp-content/uploads/2026/05/20260503103520_607578.webp)
简单来说，**Hermes 负责 Agent 能力，Qwen3.6 负责大模型能力**。两者结合之后，就可以在本地打造一套免费、私有、可长期使用的 AI 工作流。
对于想体验本地 AI、又不想被 Token 限制的朋友来说，这套方案非常值得尝试。
![20260503095834 756839 scaled](https://www.freedidi.com/wp-content/uploads/2026/05/20260503095834_756839-scaled.webp)
接下来，我会从零开始，带大家一步一步把 Hermes + Qwen3.6 部署到自己的电脑上，让你的本地 AI 助手真正跑起来。
## 部署教程：
```
# PowerShell 管理员运行
wsl --install           # 装 Ubuntu 24.04
wsl --set-default-version 2
```
重启后再执行安装Ubuntu 24.04系统
```
wsl --install -d Ubuntu-24.04
```
装完会自动重启，重启后会弹出 Ubuntu 窗口让你设置用户名和密码（随便设，记住就行）。
Ubuntu 24.04 装好并登录成功，现在先验证 GPU 是否直通正常：
```
nvidia-smi
```
![20260503100923 038590](https://www.freedidi.com/wp-content/uploads/2026/05/20260503100923_038590.webp)
**第二步：装 Python 和 pip**
```
sudo apt update && sudo apt install -y python3-pip python3-venv
```
如果你出现下方这个错误的话，那么主要是因为显卡驱动太旧了，现在我们去更新下驱动！
![20260503101203 742156](https://www.freedidi.com/wp-content/uploads/2026/05/20260503101203_742156.webp)
升级 Windows NVIDIA 驱动 【[**点击前往**](https://www.nvidia.com/en-us/drivers/)】去 Windows 下载最新驱动，WSL2 会自动继承；
![20260503101343 737006](https://www.freedidi.com/wp-content/uploads/2026/05/20260503101343_737006.webp)
更新驱动以后，本来我是想通过vllm或者DFlash进行加速运行，但是考虑到很多人的显存没有那么大，可能会爆显存所以我们改用 llama.cpp 方案，更稳定。
**第三步：安装 llama.cpp**
```
sudo apt install -y cmake build-essential git
git clone https://github.com/ggerganov/llama.cpp
cd llama.cpp
cmake -B build -DGGML_CUDA=ON -DCMAKE_CUDA_ARCHITECTURES=89
cmake --build build -j$(nproc)
```
好，如果出现这个错误的话，这主要是因为 CUDA Toolkit 没装导致的。WSL2 里需要单独装，运行：
```
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2404/x86_64/cuda-keyring_1.1-1_all.deb
sudo dpkg -i cuda-keyring_1.1-1_all.deb
sudo apt update
sudo apt install -y cuda-toolkit-12-8
```
这个下载比较大（约2GB），耐心等….  下载好以后现在设置路径然后重新编译：
```
export PATH=/usr/local/cuda-12.8/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-12.8/lib64:$LD_LIBRARY_PATH
echo 'export PATH=/usr/local/cuda-12.8/bin:$PATH' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda-12.8/lib64:$LD_LIBRARY_PATH' >> ~/.bashrc

cd ~/llama.cpp
rm -rf build
cmake -B build -DGGML_CUDA=ON -DCMAKE_CUDA_ARCHITECTURES=89
cmake --build build -j$(nproc)
```
**第四步：下载开源的本地模型**
编译大概需要5-10分钟，编译成功！现在下载模型并启动，运行：
```
hf download unsloth/Qwen3.6-27B-GGUF \
  Qwen3.6-27B-UD-Q4_K_XL.gguf \
  --local-dir ~/models/
```
这个文件约 17GB，下载完贴最后几行，我们再启动服务。如果下载很慢或卡住，那么你可以切换到 ModelScope 国内镜像。
这里需要注意，因为我的显存是24G的，所有我选择 Qwen3.6-27B，如果你的显存没这么大，那么可以选择尺寸小一点的模型，比如[Qwen3.5](https://ollama.com/library/qwen3.5)
![20260503102018 545320](https://www.freedidi.com/wp-content/uploads/2026/05/20260503102018_545320.webp)
下载好模型以后，现在启动模型服务：（注意把下方命令中的模型名称替换成你自己的）：
```
~/llama.cpp/build/bin/llama-server \
  --model ~/models/Qwen3.6-27B-UD-Q4_K_XL.gguf \
  --n-gpu-layers 99 \
  --ctx-size 32768 \
  --flash-attn on \
  --temp 1.0 \
  --top-p 0.95 \
  --top-k 20 \
  --presence-penalty 1.5 \
  --port 8080
```
**🎉 成功启动！**
![20260503102254 626208](https://www.freedidi.com/wp-content/uploads/2026/05/20260503102254_626208.webp)
现在打开 Windows 浏览器访问：http://localhost:8080，就能看到内置聊天界面，直接开始和 Qwen3.6-27B 对话了。
![20260503102332 115652 scaled](https://www.freedidi.com/wp-content/uploads/2026/05/20260503102332_115652-scaled.webp)
亲测效果极快
![20260503102422 112884 scaled](https://www.freedidi.com/wp-content/uploads/2026/05/20260503102422_112884-scaled.webp)
默认它是开启深度思考模式的，如果需要关闭 Thinking 模式要在启动命令里加参数，先 Ctrl+C 停掉服务，然后：
```
~/llama.cpp/build/bin/llama-server \
  --model ~/models/Qwen3.6-27B-UD-Q4_K_XL.gguf \
  --n-gpu-layers 99 \
  --ctx-size 32768 \
  --flash-attn on \
  --temp 1.0 \
  --top-p 0.95 \
  --top-k 20 \
  --presence-penalty 1.5 \
  --chat-template-kwargs '{"enable_thinking":false}' \
  --port 8080
```
**关掉 Thinking（非思考模式）**
速度快 20-30%
适合：简单问答、写作、代码补全、解释代码
不适合：复杂算法设计、debug 难题、架构分析
**开启 Thinking（思考模式）**
速度慢，但推理质量明显更好
适合：复杂编程问题、多步骤逻辑、需要深思熟虑的任务
### **第五步：安装对接 Hermes Agent**
第一步：先保持 llama-server 运行（新开一个 WSL2 终端窗口，让模型服务继续跑在 8080）
第二步：在当前终端安装 Hermes Agent
```
curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh | bash
```
安装程序会自动处理所有依赖（Python、Node.js、ripgrep、ffmpeg），你只需要有 git 就行。
选最后的 Custom endpoint (enter URL manually)，然后填：
URL: http://localhost:8080/v1
API Key: 随便填比如 12345678
Model: 会自动识别
![20260503103017 984365](https://www.freedidi.com/wp-content/uploads/2026/05/20260503103017_984365.webp)
接下来就按照提示，进行配置即可，比如我们可以对接第三方聊天工具：Telegram，当然你可以选择微信、QQ、Discord等
![20260503103144 810910](https://www.freedidi.com/wp-content/uploads/2026/05/20260503103144_810910.webp)
对接以后就可以在任何地方，通过TG来调用并控制电脑上的 Hermes Agent，执行自动化任务， 编写代码，撰写文章等，它就是你24小时帮你免费干活的 AI 助手和代理！
![20260503103335 411814](https://www.freedidi.com/wp-content/uploads/2026/05/20260503103335_411814.webp)
最后我们写个启动脚本，每次开机自动启动 llama-server，不用手动跑命令。创建一个启动脚本，每次打开 WSL2 自动启动 llama-server。
先创建脚本文件：
```
cat > ~/start-llm.sh << 'EOF'
#!/bin/bash
echo "Starting Qwen3.6-27B llama-server..."
~/llama.cpp/build/bin/llama-server \
  --model ~/models/Qwen3.6-27B-UD-Q4_K_XL.gguf \
  --n-gpu-layers 99 \
  --ctx-size 65536 \
  --flash-attn on \
  --temp 1.0 \
  --top-p 0.95 \
  --top-k 20 \
  --presence-penalty 1.5 \
  --port 8080 \
  --host 0.0.0.0 &

echo "llama-server started, PID: $!"
echo "API: http://localhost:8080/v1"
echo "Chat UI: http://localhost:8080"
EOF
chmod +x ~/start-llm.sh
```
然后设置 WSL2 启动时自动运行：
```
echo '# Auto-start llama-server' >> ~/.bashrc
echo 'if ! pgrep -f "llama-server" > /dev/null 2>&1; then' >> ~/.bashrc
echo '    ~/start-llm.sh' >> ~/.bashrc
echo 'fi' >> ~/.bashrc
```
这样每次打开 WSL2 终端，如果 llama-server 没在跑就自动启动，已经在跑就跳过不重复启动。
### 感谢您的支持
- [**Next**](https://www.freedidi.com/24067.html)[你的密码正在裸奔！Edge 浏览器以明文形式暴露！赶紧删除卸载](https://www.freedidi.com/24067.html)
- [**Previous**](https://www.freedidi.com/24014.html)[免费上字幕！本地开源模型、Google AI 两套最强方案！99%的准确率](https://www.freedidi.com/24014.html)
## [Clear Cache 浏览器缓存的精确细分、定向清理插件](https://www.freedidi.com/19618.html)
- 2025年6月12日
## [OpenVPN客户端下载+免费节点](https://www.freedidi.com/2690.html)
- 2021年12月26日
## [KB5007262 补丁，提升Windows 11 下SSD固态硬盘的性能!](https://www.freedidi.com/3405.html)
- 2022年1月17日
## [赶快升级！谷歌 Chrome 100 浏览器！新增多种功能，CPU、内存占用暴降！| 零度解说](https://www.freedidi.com/4550.html)
- 2022年4月1日
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
