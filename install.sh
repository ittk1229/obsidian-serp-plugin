#!/bin/bash

# 自身のvaultのパスを指定
vault_dirpath=path/to/your_obsidian_vault

# プラグイン用のディレクトリを作成
mkdir ${vault_dirpath}/.obsidian/plugins/obsidian-serp-plugin

# プラグインのファイルをコピー
cp ./manifest.json ${vault_dirpath}/.obsidian/plugins/obsidian-serp-plugin
cp ./main.js ${vault_dirpath}/.obsidian/plugins/obsidian-serp-plugin
cp ./styles.css ${vault_dirpath}/.obsidian/plugins/obsidian-serp-plugin
