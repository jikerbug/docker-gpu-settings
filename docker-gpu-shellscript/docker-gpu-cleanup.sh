echo "===== 1. 기존 환경 제거 시작 ====="

# 1.1. Snap으로 설치된 Docker 제거
echo "--> 1.1. Snap Docker 제거 중..."
sudo snap remove --purge docker


# 1.2. apt로 설치되었을 수 있는 NVIDIA Container Toolkit 관련 패키지 제거 (오류 무시)
echo "--> 1.2. apt NVIDIA Container Toolkit 패키지 제거 시도 중 (오류 발생 가능, 무시)..."
sudo apt-get purge -y nvidia-container-toolkit nvidia-container-runtime nvidia-docker2 libnvidia-container-tools libnvidia-container1 || echo "apt Toolkit 패키지 제거 중 오류 발생 (무시)"
sudo apt-get autoremove -y

# 1.3. NVIDIA Container Toolkit 저장소 설정 및 GPG 키 파일 삭제 (파일이 없어도 오류 없음)
echo "--> 1.3. NVIDIA Toolkit 저장소/키 파일 제거 중..."
sudo rm -f /etc/apt/sources.list.d/nvidia-container-toolkit.list
sudo rm -f /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg

# 1.4. 기존 Docker 데몬 설정 파일 제거 (파일이 없어도 오류 없음)
echo "--> 1.4. Docker 데몬 설정 파일 제거 중..."
sudo rm -f /etc/docker/daemon.json

# 1.5. apt 패키지 목록 업데이트 및 시스템 상태 정리
echo "--> 1.5. apt 업데이트 및 시스템 정리 중..."
sudo apt-get update
sudo apt-get autoremove -y
sudo systemctl daemon-reload

echo "===== 1. 기존 환경 제거 완료 ====="