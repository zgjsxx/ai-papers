#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"

papers=(
  "gpt|Improving Language Understanding by Generative Pre-Training|https://cdn.openai.com/research-covers/language-unsupervised/language_understanding_paper.pdf"
  "gpt|Language Models are Unsupervised Multitask Learners|https://cdn.openai.com/better-language-models/language_models_are_unsupervised_multitask_learners.pdf"
  "gpt|Language Models are Few-Shot Learners|https://arxiv.org/pdf/2005.14165.pdf"

  "llama|LLaMA: Open and Efficient Foundation Language Models|https://arxiv.org/pdf/2302.13971.pdf"
  "llama|Llama 2: Open Foundation and Fine-Tuned Chat Models|https://arxiv.org/pdf/2307.09288.pdf"

  "qwen|Qwen Technical Report|https://arxiv.org/pdf/2309.16609.pdf"
  "qwen|Qwen2 Technical Report|https://arxiv.org/pdf/2407.10671.pdf"

  "gemini|Gemini: A Family of Highly Capable Multimodal Models|https://arxiv.org/pdf/2312.11805.pdf"
  "gemini|Gemini 1.5: Unlocking multimodal understanding across millions of tokens of context|https://arxiv.org/pdf/2403.05530.pdf"

  "multimodal|Learning Transferable Visual Models From Natural Language Supervision|https://arxiv.org/pdf/2103.00020.pdf"
  "multimodal|BLIP-2: Bootstrapping Language-Image Pre-training with Frozen Image Encoders and Large Language Models|https://arxiv.org/pdf/2301.12597.pdf"
  "multimodal|Flamingo: a Visual Language Model for Few-Shot Learning|https://arxiv.org/pdf/2204.14198.pdf"
  "multimodal|Visual Instruction Tuning|https://arxiv.org/pdf/2304.08485.pdf"
)

sanitize_filename() {
  local raw="$1"
  # Replace whitespace with underscores and keep only safe filename chars.
  printf '%s' "$raw" \
    | tr '[:space:]' '_' \
    | sed -E 's/[^[:alnum:]_.-]+/_/g; s/_+/_/g; s/^_+|_+$//g'
}

for entry in "${papers[@]}"; do
  IFS='|' read -r category title url <<<"$entry"

  mkdir -p "$ROOT_DIR/$category"
  safe_title="$(sanitize_filename "$title")"
  output="$ROOT_DIR/$category/$safe_title.pdf"

  if [[ -f "$output" ]]; then
    echo "[skip] $output already exists"
    continue
  fi

  echo "[download] $title"
  curl -fL "$url" -o "$output"
done

echo "Done."
