mkdir -p ~/.config/systemd/user
cat > ~/.config/systemd/user/vscode-tunnel.service <<'UNIT'
[Unit]
Description=VS Code Tunnel (user service)
After=network-online.target

[Service]
Type=simple
ExecStart=%h/install/bin/code-tunnel.sh
Restart=on-failure
RestartSec=3

# 讓 PATH 包含常見路徑（有些環境非互動 shell PATH 會很短）
Environment=PATH=%h/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin

[Install]
WantedBy=default.target
UNIT
