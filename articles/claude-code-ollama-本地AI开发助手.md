最近一段时间，Claude Code 在 AI 开发圈突然火了起来。原因很简单。它可能是目前最接近“真正 AI 程序员”的工具之一。和传统聊天式 AI 不同，Claude Code 并不仅仅只是回答问题，而是可以真正读取你的项目、修改代码、执行终端命令，甚至自动修复错误。某种程度上来说，它更像是一个真正的 AI Agent。
![20260515101213 308264 scaled](https://www.freedidi.com/wp-content/uploads/2026/05/20260515101213_308264-scaled.webp)
不过问题也很现实：Claude 官方 API 的价格并不便宜。
尤其在：
- 长上下文
- 大型项目
- 多轮 Agent 调用
- 自动修 Bug
![20260515100806 288366 scaled](https://www.freedidi.com/wp-content/uploads/2026/05/20260515100806_288366-scaled.webp)
这些场景下，Token 消耗会非常夸张。于是最近，一个新的玩法开始流行起来：
# 使用 Ollama 本地模型，直接接管 Claude Code。
而实现这一切的核心工具，就是最近很火的：**CC Switch**
![20260515100936 078792](https://www.freedidi.com/wp-content/uploads/2026/05/20260515100936_078792.webp)
### **接下来我们就来进行本地部署，完整实现100%免费使用Claude Code 桌面的要求！**
# **步骤过程：**
前期必备的环境准备，安装[Git](https://git-scm.com/)
**1、安装 Claude Code 官方桌面版**
**【**[**点击前往**](https://claude.com/download)**】或 【**[**备用下载**](https://pan.quark.cn/s/cb0c7cb397f7)**】**
![20260515103603 992240](https://www.freedidi.com/wp-content/uploads/2026/05/20260515103603_992240.webp)
**2、安装最新版 Ollama 客户端**
**【**[**点击前往**](https://ollama.com/)**】**
开源模型推荐：[Qwen 3.6](https://ollama.com/library/qwen3.6)/[3.5](https://ollama.com/library/qwen3.5)、[Gemma4](https://ollama.com/library/gemma4)、[Deepseek R1](https://ollama.com/library/deepseek-r1)、[GLM](https://ollama.com/library/glm-4.7-flash)等，根据自己显存的大小来选择对应的模型
![20260515102121 597347 scaled](https://www.freedidi.com/wp-content/uploads/2026/05/20260515102121_597347-scaled.webp)
**3、下载 CC Switch 开源工具**
【[**点击前往**](https://github.com/farion1231/cc-switch)】 或 【[**打包下载**](https://pan.quark.cn/s/f34fb963e317)】
![20260515101952 035275 scaled](https://www.freedidi.com/wp-content/uploads/2026/05/20260515101952_035275-scaled.webp)
**CC Switch 相关配置:**
请求地址：http://127.0.0.1:11434/v1
API 格式：OpenAI Chat Completions
认证字段选择：ANTHROPIC_API_KEY
![20260515103033 089829 scaled](https://www.freedidi.com/wp-content/uploads/2026/05/20260515103033_089829-scaled.webp)
### Claude Code 桌面版在自定义的配置文件末尾需要加入注册表修改命令：
```
"inferenceModels"="[\"haiku\",\"sonnet\",\"opus\"]"
```
**让 CC Switch 强行注入模型名称到claude Code里进行显示！**
# 可能有人会疑问：Claude Code 到底强在哪里？
很多人第一次接触 Claude Code 时，都会误以为：这只是一个“高级聊天工具”。但实际上，它和普通 AI 聊天客户端完全不是一个东西。
传统 AI：你问一句，它回答一句。而 Claude Code：会真正读取整个项目结构。
例如：
```
src/
components/
package.json
docker-compose.yml
```
```
然后：
```
- 自动分析代码
- 修改文件
- 安装依赖
- 执行命令
- 修复报错
- 重新运行项目
整个过程更像：
```
AI + IDE + Terminal
```
```
而不是普通聊天机器人。
```
这也是为什么很多开发者开始把它称为：AI 开发 Agent
# Ollama + Claude Code 是怎么实现的？
而最近越来越多人开始尝试：
# Claude Code + Ollama
简单来说就是：
让 Claude Code 继续负责：
- Agent 能力
- 项目操作
- 自动化执行
而真正的大脑，则交给本地模型。
例如：
- Qwen
- DeepSeek
- Gemma
- GLM
这些模型都可以通过 Ollama 本地运行。
但问题在于：
Claude Code 默认只支持 Claude 官方 API。
于是：
CC Switch 这种工具就出现了。
它本质上其实是一个：
# API 转发层
Claude Code 以为自己正在调用 Claude。
但实际上：
请求已经被 CC Switch 转发到了本地 Ollama。
于是最终实现：
```
Claude Code 外壳 
+ 
本地 AI 模型
```
实际体验怎么样？
这次我主要测试了：
- Qwen
- DeepSeek
几个本地模型。
实际体验下来。
如果只是：
- HTML 页面
- 小型项目
- 自动化脚本
- Docker
- VPS 运维
其实已经相当能用了。
例如一句话：
“帮我生成一个赛博朋克风格的个人主页网站。”
本地模型会直接：
- 创建项目
- 生成网页
- 添加动画
- 配置特效
- 自动运行
整个过程已经有一种：
# AI 正在真正工作的感觉
尤其在 Claude Code 的 Agent 模式下，这种观感会非常强。
# 但本地模型目前仍然存在明显短板
当然。
现阶段的本地模型，还远远无法完全替代 Claude Sonnet。
特别是：
- 长上下文理解
- 大型工程能力
- 多步骤推理
- 项目架构能力
差距仍然明显。
尤其项目一旦复杂起来。
本地模型就很容易：
- 逻辑混乱
- 修改错误文件
- 死循环修 Bug
- 上下文遗忘
这一点目前和 Claude Sonnet 仍然有不小差距。
# 多模态兼容性目前问题也不少
另外这次测试中，还有一个比较明显的问题：
# Vision 多模态兼容性
例如：
虽然 Ollama 已经支持不少 Vision 模型。
但：
Claude Code + CC Switch 这套链路，目前对于图片支持并不完整。
经常会出现：
你明明上传了图片。
AI 却提示：
“我没有看到图片。”
本质原因其实不是模型不支持 Vision。
而是：
Claude Code 本身更偏向：
```
代码 Agent
```
而不是：
```
多模态聊天客户端
```
所以目前：
- 编程
- Terminal
- 自动化
体验很好。
但：
- 图片
- OCR
- 多模态聊天
兼容性仍然一般。
# 本地 AI Agent，可能才刚刚开始
不过不得不说。
Claude Code + Ollama 这一套玩法，确实让人第一次感受到：
# AI 正在从聊天工具，变成真正的生产力工具。
尤其随着：
- Qwen3
- DeepSeek
- GLM
- Gemma
这些本地模型不断升级。
未来：
完全本地化的 AI Agent。
很可能会越来越强。
而对于很多开发者来说：
一个：
- 完全本地
- 零 API 成本
- 无 Token 焦虑
的 AI 开发助手。
吸引力确实越来越大。
### 感谢您的支持
- [**Next**](https://www.freedidi.com/24211.html)[Windows 本地 AI 又升级了！llama.cpp 官方支持 CUDA 13 / Vulkan / HIP / SYCL，一键跑 GGUF 无审查模型！](https://www.freedidi.com/24211.html)
- [**Previous**](https://www.freedidi.com/24187.html)[Windows 11 最完整备份与还原教程：重装后软件、数据一个不丢！别等后悔才想起！](https://www.freedidi.com/24187.html)
## [OpenClaw 爆火的AI神器！Clawdbot 安装部署教程](https://www.freedidi.com/22680.html)
- 2026年1月30日
## [App Secret 手机数据加密！可对 照片、视频、笔记、提醒或联系人进行加密【限免】](https://www.freedidi.com/18190.html)
- 2025年1月14日
## [怎么回事？Youtube 给我们邮寄了两块10万订阅奖牌，开箱一探究竟！ | 零度解说](https://www.freedidi.com/1444.html)
- 2021年6月16日
## [Ubuntu 24.04 LTS 正式发布！代号 “Noble Numbat”，性能提升明显](https://www.freedidi.com/12334.html)
- 2024年5月5日
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
