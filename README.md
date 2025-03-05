# ARDA: Final Installation Repository

This repository provides the final setup and instructions for deploying and running the ARDA project on a compatible system with CUDA GPU support.

## Prerequisites
### 1. System Requirements
- NVIDIA GPU with CUDA 11.7 support
- Ubuntu 20.04 or compatible Linux distribution
- Docker (recommended for containerized deployment)

### 2. Recommended Hardware
- Minimum 16GB RAM
- NVIDIA GPU with 16GB VRAM or higher
- At least 50GB free disk space


### Manual Installation

#### Step 1: Install System Dependencies
```bash
sudo bash install_requirements.sh
```

#### Step 2: Install Python Dependencies
```bash
pip3 install --no-cache-dir -U pip setuptools wheel \
    && pip install --no-cache-dir -r requirements.txt
```

#### Step 3: Prepare Models
```bash
pip install gdown
gdown --folder <GDrive_Link>
```

#### Step 4: Run Inference
```bash
python3 inference.py
```

## Troubleshooting
- Ensure CUDA and GPU drivers are correctly installed
- Verify TensorFlow GPU support by checking `tf.test.is_built_with_cuda()`
- Check NVIDIA container toolkit is installed for Docker GPU support

## Notes
- Replace `<GDrive_Link>` with the actual link to your model files
- Recommended Python version: 3.10
- GPU acceleration requires compatible NVIDIA GPU and CUDA toolkit


