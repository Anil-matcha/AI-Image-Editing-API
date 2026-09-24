#!/usr/bin/env bash
set -euo pipefail
: "${MUAPI_API_KEY:?Set MUAPI_API_KEY first}"
curl --fail-with-body -sS -X POST https://api.muapi.ai/api/v1/gpt4o-edit \
  -H "Content-Type: application/json" \
  -H "x-api-key: $MUAPI_API_KEY" \
  -d '{"prompt": "Replace the barista with a humanoid robot in a sleek metallic design.", "image_url": "https://example.com/replace-with-your-file", "mask_image_url": "https://example.com/replace-with-your-file"}'
