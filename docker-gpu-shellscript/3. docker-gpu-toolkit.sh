echo "===== 3. NVIDIA Container Toolkit 설치 시작 (apt 사용) ====="
# Docker CE가 정상 실행되는 것을 확인한 후에 진행하세요.

# 3.1. NVIDIA Container Toolkit GPG 키 추가
echo "--> 3.1. NVIDIA Toolkit GPG 키 추가 중..."
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg

# 3.2. NVIDIA Container Toolkit 저장소 추가
echo "--> 3.2. NVIDIA Toolkit 저장소 추가 중..."
curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
    sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
    sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list

# 3.3. 패키지 목록 업데이트 및 Toolkit 설치
echo "--> 3.3. NVIDIA Toolkit 설치 중..."
sudo apt-get update
sudo apt-get install -y nvidia-container-toolkit
# 이전 오류가 여기서 발생했었습니다. 이번에는 성공하는지 확인합니다.

echo "===== 3. NVIDIA Container Toolkit 설치 완료 (오류 발생 시 여기서 중지) ====="