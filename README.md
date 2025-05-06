# Obsidian SERP - Obsidian Search Engine Result Page

Obsidian SERP（Search Engine Results Page）は、ノートの検索結果を表示するインターフェースを提供します。
外部の検索 API と連携することで、より効率的・効果的な検索を実現します。

```jsonc
// ${API Base Url}/search?q=Obsidian
{
  "results": [
    {
      "title": "Obsidianの基本的な使い方",
      "linkpath": "9-inbox/Obsidianの基本的な使い方.md",
      "snippet": "Obsidianは、マークダウン形式でノートを作成し、リンクを使ってノート同士を繋げることができるツールです。このガイドでは、Obsidianのインストールから基本的な使い方まで説明します。 インスト..."
    },
    {
      "title": "Obsidianのプラグイン紹介",
      "linkpath": "9-inbox/Obsidianのプラグイン紹介.md",
      "snippet": "Obsidianにはさまざまなプラグインがあり、機能を拡張できます。例えば、タスク管理用のプラグインや、外部APIとの連携を実現するプラグインがあります。このノートではおすすめのプラグインを紹介します..."
    },
    {
      "title": "Obsidianのリンクとタグの活用法",
      "linkpath": "9-inbox/Obsidianのリンクとタグの活用法.md",
      "snippet": "Obsidianではノート間をリンクで繋げることができます。リンクやタグを活用することで、情報の整理が飛躍的に効率化します。この記事では、リンクとタグをどう使いこなすかを詳しく解説します。 リンクの活..."
    }
  ]
}
```

↓

![Image from Gyazo](https://i.gyazo.com/9deab48b03104d0fb17ab34bd85fb0db.png)

## インストール方法

1. 以下のコマンドを実行

```sh
# ObsidianのVaultでない，任意のフォルダで以下を実行
git clone https://github.com/ittk1229/obsidian-serp-plugin.git
cd obsidian-serp-plugin

# ${valt_dirpath}を自身のObsidianのVaultを示すディレクトリに置き換えて実行
# ./install.sh からも実行可能
mkdir ${vault_dirpath}/.obsidian/plugins/obsidian-serp-plugin
cp ./manifest.json ${vault_dirpath}/.obsidian/plugins/obsidian-serp-plugin
cp ./main.js ${vault_dirpath}/.obsidian/plugins/obsidian-serp-plugin
cp ./styles.css ${vault_dirpath}/.obsidian/plugins/obsidian-serp-plugin
```

2. Obsidian を再起動
3. Obsidian の設定を開く
4. 「コミュニティプラグイン」に移動し、「SERP」を有効化
5. 「SERP」の設定画面から検索 API の URL を設定（詳細は[設定のセクション](#設定)で）

## 使用方法

### 検索ビューの表示

- コマンドパレット（`Ctrl/Cmd+P`）から「Open SERP View」を実行
- または、下記のいずれかのコマンドを実行すれば自動的に検索ビューが開きます

### コマンド

| コマンド             | 説明                                                                                         | デフォルトショートカット |
| -------------------- | -------------------------------------------------------------------------------------------- | ------------------------ |
| Open SERP View       | 検索ビューを開く                                                                             | -                        |
| Focus Query Box      | クエリ入力欄にフォーカス&クエリを選択状態に                                                  | `Ctrl/Cmd+K`             |
| Search Selected Text | アクティブなエディタの選択されているテキストで検索（選択範囲がない場合はノートの全文で検索） | `Ctrl/Cmd+Shift+S`       |

## 設定

プラグインの設定画面から以下の内容を設定できます。

- `API Base URL`: 検索 API の URL を設定

## API 統合

Obsidian SERP は、次の形式に従う外部検索 API に接続できます。

この形式に対応した検索 API の実装を含むリポジトリを近日公開します。

- **検索エンドポイント**: `GET /search?q={query}`
  - クエリに対する検索結果を取得

```jsonc
{
  "results": [
    {
      "title": "Obsidianの基本的な使い方",
      "linkpath": "9-inbox/Obsidianの基本的な使い方.md",  // Vaultからの相対パス
      "snippet": "Obsidianは、マークダウン形式でノートを作成し、リンクを使ってノート同士を繋げることができるツールです。このガイドでは、Obsidianのインストールから基本的な使い方まで説明します。 インスト..."
    },
  ]
}
```

- **インデックスの状態**（Optional）: `GET /index/status`
  - 利用するインデックスの状態を取得

```jsonc
{
  "last_indexed": "05/06 17:39", // 任意の形式の日付を表す文字列
  "note_count": 5587
}
```

- **インデックス再構築**（Optional）: `POST /index`
  - インデックスの再構築を実行
