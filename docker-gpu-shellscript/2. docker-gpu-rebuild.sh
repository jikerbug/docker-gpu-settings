echo "===== 2. Docker CE 설치 시작 (apt 사용) ====="

# 2.1. 필수 패키지 설치
echo "--> 2.1. 필수 패키지 설치 중..."
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg lsb-release

# 2.2. Docker 공식 GPG 키 추가
echo "--> 2.2. Docker GPG 키 추가 중..."
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# 2.3. Docker 저장소 설정
echo "--> 2.3. Docker 저장소 설정 중..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# 2.4. Docker 엔진 설치
echo "--> 2.4. Docker 엔진 설치 중..."
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# 2.5. Docker 서비스 상태 확인 (매우 중요!)
echo "--> 2.5. Docker 서비스 상태 확인 중..."
sudo systemctl status docker.service
# 여기서 'Active: active (running)' 상태인지 확인하세요. 아니라면 이 단계에서 문제 해결 필요.

# 2.6. (선택 사항) sudo 없이 docker 명령어 사용 설정
# echo "--> 2.6. (선택 사항) 현재 사용자를 docker 그룹에 추가합니다. 적용하려면 재로그인하세요."
# sudo usermod -aG docker $USER
# newgrp docker # 현재 쉘에 즉시 적용 (또는 로그아웃 후 재로그인)

echo "===== 2. Docker CE 설치 완료 ====="