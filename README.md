# ai-papers

按类别整理的 AI 经典论文 PDF 仓库。

## 当前分类

- `gpt/`
  - Improving Language Understanding by Generative Pre-Training
  - Language Models are Unsupervised Multitask Learners
  - Language Models are Few-Shot Learners
  - Training language models to follow instructions with human feedback
- `transformer/`
  - Attention Is All You Need
- `deepseek/`
  - DeepSeek-R1: Incentivizing Reasoning Capability in LLMs via Reinforcement Learning
  - DeepSeekMath: Pushing the Limits of Mathematical Reasoning in Open Language Models
- `multimodal-fusion/`
  - ViLBERT: Pretraining Task-Agnostic Visiolinguistic Representations for Vision-and-Language Tasks
- `qwen/`
  - Qwen Technical Report

## 下载更多论文（LLM + 多模态）

已提供下载脚本（会按类别目录存放，并自动将文件名转换为安全格式，例如用 `_` 代替空格）：

```bash
bash scripts/download_classic_papers.sh
```

脚本默认下载以下类别：

- LLM 方向
  - `gpt/`
  - `llama/`
  - `qwen/`
  - `gemini/`
- 多模态方向
  - `multimodal/`

> 说明：下载链接以官方 PDF/ArXiv 为主。如果网络可访问，脚本会自动下载并跳过已存在文件。
