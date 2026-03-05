# プロジェクト開始時に使用する
# ターミナルを再起動すると環境変数のこの変更が確認できる。
# windowをリロードするとソース管理も反映される。
# vscodeのフォルダもatma_udemyを開きカーネル(.venv/bin/python)を作成する。

# bashスクリプトの安全装置3点セット
set -euo pipefail

# uvのセットアップ
## インストール
curl -LsSf https://astral.sh/uv/install.sh | sh
## パスを通す
export PATH=/root/.local/bin:$PATH
## uvのキャッシュを/workspace配下にする
export UV_CACHE_DIR=/workspace/.cache/uv
mkdir -p /workspace/.cache/uv

# uvの初期化
uv init
uv add --dev nbstripout ipykernel
uv python install 3.12.12

# gitのセットアップ
git config --global user.email "runpod@example.com"
git config --global user.name "runpod"
uv run nbstripout --install



