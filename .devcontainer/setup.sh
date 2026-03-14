#!/bin/bash
echo "KIS 자동매매 환경 설정 시작..."
pip install -r /workspaces/open-trading-api/requirements.txt -q
pip install flask flask-cors -q
if [ ! -d "/workspaces/kis-autotrading" ]; then
  gh auth token | xargs -I{} git clone https://{}@github.com/elitelion99-lab/kis-autotrading.git /workspaces/kis-autotrading
fi
mkdir -p /home/codespace/KIS/config
mkdir -p /workspaces/kis-autotrading/config
cat > /home/codespace/KIS/config/kis_devlp.yaml << YAML
my_app: "${KIS_APP_KEY}"
my_sec: "${KIS_APP_SECRET}"
paper_app: "${KIS_PAPER_APP_KEY}"
paper_sec: "${KIS_PAPER_APP_SECRET}"
my_htsid: "@2940616"
my_acct_stock: "44220949"
my_acct_future: ""
my_paper_stock: "50174334"
my_paper_future: ""
my_prod: "01"
my_agent: "Mozilla/5.0"
prod: "https://openapi.koreainvestment.com:9443"
ops: "ws://ops.koreainvestment.com:21000"
vps: "https://openapivts.koreainvestment.com:29443"
vops: "ws://ops.koreainvestment.com:31000"
my_token: ""
YAML
cp /home/codespace/KIS/config/kis_devlp.yaml /workspaces/kis-autotrading/config/
echo "설정 완료!"
