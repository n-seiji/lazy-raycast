---
name: raycast-onboard
description: Use when the user wants to get started with Raycast, set up Raycast for the first time, or says things like "Raycast のオンボーディングして" / "Raycast の使い方を教えて" / "Raycast 入門". Asks what the user does every day, creates the settings for them, and shows how to call each one.
---

# Raycast Onboard(聞く → 作る → 呼び出し方を案内)

Raycast をまだ設定していない人に、**普段の作業を聞いて、設定を代わりに作り、呼び出し方を教える**。
ユーザーは質問に答えて、最後に 1 回試すだけ。設定画面を探させない。

## 進め方

1. 最初に 1 行で挨拶し、「いくつか質問するので答えてね。設定はこちらで作るよ」と伝える。
2. 下のステップを **1 つずつ** 進める。一度に複数聞かない。
3. 各ステップは次の順で回す。
   1. **聞く**: 「聞くこと」を 1 つだけ質問する。答えに迷っていたら例を 2〜3 個出す。
   2. **見せる**: 作る内容(名前・値・キーワードや Hotkey)を具体的に見せ、承認を取る。
   3. **作る**: 承認されたら「作るもの」のツールで作成し、読み直して反映を確認する。
   4. **案内する**: 「このように呼び出せます」と、実際の打ち方・押し方を 1 行で伝える。
   5. **試してもらう**: 1 回やってみてもらい、うまくいったら次のステップへ。
4. 説明には `@manual`(manual__search-manual-pages / read-manual-page)で該当ページを探し、
   「詳しくはここ」として URL を 1 つ添える。説明を自分の記憶で書かない。
5. 全部終わったら、作ったものと呼び出し方を一覧にして、「いまのレベルを見てみる?(raycast-level)」と案内する。

## ステップ

| # | 機能 | 聞くこと | 作るもの | 案内の例 |
|---|------|---------|---------|---------|
| 1 | Quicklinks | 毎日開くサイトやフォルダは? | quicklinks__create-quicklink(検索 URL は `{argument}` 付き) | 「Raycast を開いて `gh` と打って Enter で開けます」 |
| 2 | Snippets | 何度も打っている定型文は?(メールアドレス、住所、挨拶など) | snippets__create-snippet(keyword は `;` 始まり) | 「どのアプリでも `;mail` と打つと展開されます」 |
| 3 | Hotkey | いちばんよく使うアプリやコマンドは? | raycast-settings__update-setting(既存と重複しない組み合わせ) | 「⌥ Space → いつでも `⌃⌥S` で Slack が開きます」 |
| 4 | 拡張 | 仕事で使っているサービスは?(GitHub、Notion、Slack など) | store__search-store で探して提案 → store__install-store-extension | 「`Search Repositories` と打つと GitHub を検索できます」 |
| 5 | Clipboard History | (質問なし)コピーした履歴を使ったことはある? | raycast-settings__update-setting で Clipboard History に Hotkey | 「`⌃⌥V` でコピー履歴から貼り付けられます」 |

- 開始前に各機能の現在の状態を読み取り、もう設定があるものは「もう使いこなしてるね!」と一言添えてスキップしてよい。
- 例やキーワードは、ユーザーの言語・答えに合わせて変える。

## 守ること

- **作る前に必ず内容を見せて承認を取る**。1 回の承認で 1 つの作成。
- 既存の Hotkey / Alias / Snippet keyword / Quicklink 名と **衝突する値は提案しない**。
- クリップボードや Snippet の中身は、確認に必要な範囲でだけ読む。本文を会話に引用しない。
- テンポ重視。1 メッセージは短く、箇条書き 3 行以内を目安にする。
