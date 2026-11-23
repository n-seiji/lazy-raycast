---
name: raycast-level
description: Use when the user wants to check how well they use Raycast — a Raycast level check, 育成度合い, 通信簿, レベル診断, "私の Raycast は何レベル?". Reads only; scores the setup and shows a report card. For actually improving the setup, use raycast-growth.
---

# Raycast Level(育成度合いチェック)

いまの Raycast がどれくらい育っているかを実データから採点し、「通信簿」を出す。
**読むだけで、何も変更しない**。改善したくなったら raycast-growth へ案内する。

## 手順

1. 「いまの Raycast を読ませてもらうね(読むだけ)」と 1 行伝えてから、下の観点のデータを読み取りツールで集める。
2. 観点ごとに 0〜3 のスコアをつけ、合計からレベルと称号を出す。
3. 通信簿を出す(フォーマットは下)。
4. いちばん低い観点を 1 つ挙げ、「raycast-growth で育てる?」と聞く。
5. 「Raycast Notes に保存する?」と聞き、承認されたら raycast-notes__create-note で保存する
   (前回の通信簿が Notes にあれば、スコアの変化も添える)。

## 観点とデータ源

| 観点 | 読むもの | スコアの目安 |
|------|---------|-------------|
| ⌨️ 呼び出し | raycast-settings__search-settings(hotkey / alias)で設定済みの数 | 0: なし / 1: 1〜3 / 2: 4〜10 / 3: 11+ |
| 📋 クリップボード | clipboard__search-entries(category 別に数回)で copyCount ≥ 2 の entry 数 | 履歴から再利用している形跡の多さ |
| ✂️ Snippets | snippets__list-snippets の数・keyword 付きの数 | 0 / 1〜2 / 3〜9 / 10+ |
| 🔗 Quicklinks | quicklinks__list-quicklinks の数 | 0 / 1〜2 / 3〜9 / 10+ |
| 🧩 拡張 | store__get-installed-extensions の数、うち AI Extension の数 | 0 / 1〜4 / 5〜14 / 15+ |
| 🧘 整える | applications__list-auto-quits、raycast-focus__explore-focus-activity | 使っている機能の数 |
| 🎙️ AI | dictation__search-dictation-history の件数、memory__read-memory の有無 | 使っている機能の数 |

- 数は読み取れた範囲の値。上限で打ち切られた場合は「50+」のように書く。
- **Raycast コマンドの使用回数は取得できない**。年間の使用回数は Raycast Wrapped で見られると添える。
- 既存の Hotkey を読んだら、**付け方のルール**(Hyper + 頭文字など)と **重複** があれば通信簿のひとことに入れる。

## レベルと称号(合計 0〜21)

| 合計 | Lv | 称号 |
|------|----|------|
| 0〜3 | 1 | 🥚 たまご |
| 4〜7 | 2 | 🐣 ひよこ |
| 8〜11 | 3 | 🐥 こども |
| 12〜15 | 4 | 🐓 おとな |
| 16〜18 | 5 | 🦅 たか |
| 19〜21 | 6 | 🐉 りゅう |

## 通信簿のフォーマット

```
## 🐥 Lv3 こども(12 / 21)

⌨️ 呼び出し     ■■□  Hotkey 6 個
📋 クリップボード ■■■  よく再利用してる
...

ひとこと: <使い方の特徴を 1〜2 文で。推測は推測と書く>
いちばん伸びしろ: <観点> → 「育てて」と言えば raycast-growth で改善できます
```

## 守ること

- **書き込み系のツールは使わない**(Notes への保存だけ、承認後に行う)。
- 読み取ったクリップボード・音声入力の **本文を引用しない**。件数・アプリ名・傾向だけを書く。
- 通信簿はスクショで共有されやすい。個人情報(メールアドレス、トークンらしき文字列、人名)を含めない。
