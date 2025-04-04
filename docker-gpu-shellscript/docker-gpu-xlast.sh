echo "===== 4. Docker 설정 및 재시작 시작 ====="
# Toolkit 설치가 성공적으로 완료된 후에 진행하세요.

# 4.1. Docker가 NVIDIA 런타임을 사용하도록 설정
echo "--> 4.1. Docker가 NVIDIA 런타임 사용하도록 설정 중..."
sudo nvidia-ctk runtime configure --runtime=docker

# 4.2. Docker 서비스 재시작 (표준 서비스 이름 사용)
echo "--> 4.2. Docker 서비스 재시작 중..."
sudo systemctl restart docker.service

# 4.3. Docker 서비스 상태 재확인
echo "--> 4.3. Docker 서비스 상태 재확인 중..."
sudo systemctl status docker.service
# 여기서도 'Active: active (running)' 상태인지 확인하세요.

echo "===== 4. Docker 설정 및 재시작 완료 ====="

echo "===== 5. 최종 작동 검증 시작 ====="

# 5.1. GPU 테스트 컨테이너 실행
echo "--> 5.1. GPU 테스트 컨테이너 실행 중..."
# sudo 없이 사용하도록 설정했다면 sudo 생략 가능
sudo docker run --rm --gpus all nvidia/cuda:12.1.0-base-ubuntu22.04 nvidia-smi

echo "===== 5. 최종 작동 검증 완료 (nvidia-smi 출력 확인) ====="