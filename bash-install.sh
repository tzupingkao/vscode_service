mkdir -p ~/install/bin
cat > ~/install/bin/code-tunnel.sh <<'SH'
#!/usr/bin/env bash
set -euo pipefail

# 優先找 PATH 中的 code
if command -v code >/dev/null 2>&1; then
  CODE=code
else
  # 後備：從 ~/.vscode-server/bin/ 中抓第一個版本
  BASE="$HOME/.vscode-server/bin"
  VER="$(ls -1 "${BASE}" 2>/dev/null | head -n1)"
  CODE="${BASE}/${VER}/bin/code"
fi

exec "${CODE}" tunnel \
  --accept-server-license-terms \
  --name "$(hostname -s)" \
  --disable-telemetry
SH
chmod +x ~/install/bin/code-tunnel.sh
