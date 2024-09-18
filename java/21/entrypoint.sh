#!/bin/bash

# タイムゾーンを設定、デフォルトはUTC
TZ=${TZ:-UTC}
export TZ

# コンテナの内部IPアドレスを取得して環境変数に設定
CONTAINER_IP=$(hostname -I | awk '{print $1}')
export CONTAINER_IP

# 作業ディレクトリに移動
cd /home/container || exit 1

# Javaのバージョンを表示（デバッグのため）
echo "------------------------------"
java -version
echo "------------------------------"

# 起動コマンドの環境変数を展開
PARSED_COMMAND=$(echo "${STARTUP}" | sed 's/{{/${/g; s/}}/}/g' | eval echo "$(cat -)")

# 実行するコマンドを表示
echo -e "\033[1m\033[33mcontainer@pterodactyl~ \033[0m${PARSED_COMMAND}"

# 環境変数を引き継いでコマンドを実行
exec env ${PARSED_COMMAND}
