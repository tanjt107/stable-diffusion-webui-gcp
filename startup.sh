sudo apt-get update
sudo apt -y install wget git python3

NVIDIA_DRIVER_VERSION=$(sudo apt-cache search 'linux-modules-nvidia-[0-9]+-gcp$' | awk '{print $1}' | sort | tail -n 1 | head -n 1 | awk -F"-" '{print $4}')
sudo apt -y install linux-modules-nvidia-${NVIDIA_DRIVER_VERSION}-gcp nvidia-driver-${NVIDIA_DRIVER_VERSION}
sudo reboot

sudo apt -y install python3-venv python3-pip
sudo apt-get install -y python3-opencv

sudo apt install --no-install-recommends google-perftools

git clone  https://github.com/AUTOMATIC1111/stable-diffusion-webui.git

cd stable-diffusion-webui
./webui.sh --listen --xformers