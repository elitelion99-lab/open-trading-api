#!/bin/bash
echo "🚀 KIS 자동매매 환경 설정 시작..."

# 1. requirements 설치
pip install -r /workspaces/open-trading-api/requirements.txt -q
pip install flask flask-cors -q

# 2. kis-autotrading 클론
if [ ! -d "/workspaces/kis-autotrading" ]; then
  gh auth token | xargs -I{} git clone https://{}@github.com/elitelion99-lab/kis-autotrading.git /workspaces/kis-autotrading
fi

# 3. KIS 설정 폴더 생성
mkdir -p /home/codespace/KIS/config

echo "✅ 설정 완료!"
