# Dockerfile

# NVIDIA 공식 CUDA 런타임 이미지를 기반으로 사용합니다.
# 호스트의 NVIDIA 드라이버 버전과 호환되는 CUDA 버전을 선택하는 것이 좋습니다.
FROM pytorch/pytorch:2.5.1-cuda12.4-cudnn9-runtime


# 컨테이너가 시작될 때 실행할 기본 명령어를 설정합니다.
# nvidia-smi를 실행하여 GPU 정보를 출력합니다.
CMD ["nvidia-smi"]