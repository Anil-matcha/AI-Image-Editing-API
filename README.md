# AI Image Editing API

Compare instruction-based, masked, and reference-driven image editing workflows. Use the model-specific schema for required image, mask, and prompt fields.

[Muapi AI Image Editing API landing page](https://muapi.ai/ai-image-editing-api) · [API reference](https://muapi.ai/docs/api-reference) · [Create an API key](https://muapi.ai/access-keys)

## Related Projects

- [Image-Face-Swap-API](https://github.com/Anil-matcha/Image-Face-Swap-API)
- [AI-Character-Consistency-API](https://github.com/Anil-matcha/AI-Character-Consistency-API)

## What this API covers

Use the endpoint that matches the task and input media. The routes below are enabled Muapi model IDs checked against the current model catalog; availability, request fields, and pricing can change, so verify the linked landing page and endpoint schema before production use.

| Endpoint | Purpose | Category |
|---|---|---|
| `gpt4o-edit` | Edit Image | `Image to Image` |
| `nano-banana-2-edit` | v2 Image Edit | `Image to Image` |
| `qwen-image-edit` | Edit Image | `Image to Image` |

## Quick start

Muapi uses an asynchronous REST contract. Submit a JSON request with your API key, save the returned `request_id`, then poll the result endpoint. Replace sample URLs with files you control and fields with values supported by the selected endpoint.

```bash
curl -X POST https://api.muapi.ai/api/v1/gpt4o-edit \
  -H "Content-Type: application/json" \
  -H "x-api-key: $MUAPI_API_KEY" \
  -d '{
    "prompt": "Replace the barista with a humanoid robot in a sleek metallic design.",
    "image_url": "https://example.com/replace-with-your-file",
    "mask_image_url": "https://example.com/replace-with-your-file"
  }'
```

### Request fields in this example

| Field | Requirement | Notes |
|---|---|---|
| `prompt` | Required | Text prompt describing the image, what you want the final edited image to look like. |
| `image_url` | Required | URL of the input image to erase from. |
| `mask_image_url` | Required | The URL of the binary mask image that represents the area that will be cleaned. |

### Poll for the result

```bash
curl "https://api.muapi.ai/api/v1/predictions/$REQUEST_ID/result" \
  -H "x-api-key: $MUAPI_API_KEY"
```

Poll until the task status is `completed` or `failed`. Read the response’s output URLs on completion; download outputs you need to retain, since provider-hosted URLs may expire.

## Choosing an endpoint

Compare supported inputs and output behavior first, then resolution, duration, quality controls, latency, and price for your use case. Similar names do not guarantee interchangeable request schemas. This repository lists representative routes; the [landing page](https://muapi.ai/ai-image-editing-api) contains the current task-specific explanation, examples, and pricing context.

## Errors and production notes

- Keep the API key in an environment variable; do not commit credentials.
- Validate inputs against the selected endpoint’s current schema.
- Handle non-success HTTP responses and failed task states explicitly.
- Retry only when appropriate for the error; avoid submitting duplicate billable jobs after a timeout without checking the original `request_id`.
- Confirm current pricing and availability on the Muapi page before estimating production cost.

## Links

- [Muapi AI Image Editing API](https://muapi.ai/ai-image-editing-api)
- [API reference](https://muapi.ai/docs/api-reference)
- [Playground](https://muapi.ai/playground)
- [API key setup](https://muapi.ai/access-keys)
