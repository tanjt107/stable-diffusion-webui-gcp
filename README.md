# stable-diffusion-webui on GCP

## Prerequisites
- GCP Billing account
- `gcloud` CLI

## Useful scripts

### Download from Civitai without upload from local
```sh
wget https://civitai.com/api/download/models/{modelVersionId} --content-disposition
```

### Accessing the Web UI from local
```sh
gcloud compute ssh VM_NAME \
    --project PROJECT_ID \
    --zone ZONE \
    -- -4NL LOCAL_PORT:localhost:REMOTE_PORT 
```

For example
```sh
gcloud compute ssh stable-diffusion-webui --project stable-diffusion-web-ui-on-gcp --zone asia-east1-c -- -4NL 7880:localhost:7860 
```

## Reference
[Tutorial: Deploy stable-diffusion-webui on Google Cloud Computing · AUTOMATIC1111/stable-diffusion-webui · Discussion #9131](https://github.com/AUTOMATIC1111/stable-diffusion-webui/discussions/9131)