sudo apt-get update
sudo apt -y install wget git python3

NVIDIA_DRIVER_VERSION=$(sudo apt-cache search 'linux-modules-nvidia-[0-9]+-gcp$' | awk '{print $1}' | sort | tail -n 1 | head -n 1 | awk -F"-" '{print $4}')
sudo apt -y install linux-modules-nvidia-${NVIDIA_DRIVER_VERSION}-gcp nvidia-driver-${NVIDIA_DRIVER_VERSION}
sudo reboot

sudo apt -y install python3-venv python3-pip
sudo apt-get install -y python3-opencv

sudo apt install --no-install-recommends google-perftools

git clone  https://github.com/AUTOMATIC1111/stable-diffusion-webui.git

# wget https://civitai.com/api/download/models/{modelVersionId} --content-disposition

cd stable-diffusion-webui
./webui.sh --listen --xformers

# gcloud compute ssh stable-diffusion-webui --project stable-diffusion-web-ui-on-gcp --zone asia-east1-c -- -4NL 7880:localhost:7860 