---
name: raycast-level
description: Use when the user wants to check how well they use Raycast — a Raycast level check, レベル診断, 使いこなし度, "私の Raycast は何レベル?". Reads only; scores the setup on 7 points and returns one of 4 stages shown as modifier keys (⌘ up to ⌘⌥⌃⇧ Hyper Key). For actually improving the setup, use raycast-growth.
---

# Raycast Level(レベル診断)

いまの Raycast をどれくらい使いこなしているかを、実データから 7 観点で採点し、4 段階(⌘ → ⌘⌥ → ⌘⌥⌃ → ⌘⌥⌃⇧ Hyper Key)で出す。
**読むだけで、何も変更しない**。改善したくなったら raycast-growth へ案内する。

## 手順

1. 「いまの Raycast を読ませてもらうね(読むだけ)」と 1 行伝えてから、下の観点のデータを読み取りツールで集める。
2. 観点ごとに 0〜3 のスコアをつけ、合計から段階を出す。
3. 結果を出す(フォーマットは下)。
4. いちばん低い観点を 1 つ挙げ、「raycast-growth で改善する?」と聞く。
5. 「Raycast Notes に保存する?」と聞き、承認されたら raycast-notes__create-note で保存する
   (前回の結果が Notes にあれば、スコアの変化も添える)。

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
- 既存の Hotkey を読んだら、**付け方のルール**(Hyper + 頭文字など)と **重複** があれば結果のひとことに入れる。

## 4 つの段階(合計 0〜21)

修飾キーが 1 つずつ増えていく 4 段階。4 つ全部そろうと Raycast の **Hyper Key**(⌘⌥⌃⇧)になる。
優劣ではなく「いまキーがいくつ光っているか」として伝える。

| 合計 | 段階 | 表示 |
|------|------|------|
| 0〜5 | Lv1 | ⌘ |
| 6〜10 | Lv2 | ⌘⌥ |
| 11〜15 | Lv3 | ⌘⌥⌃ |
| 16〜21 | Lv4 | ⌘⌥⌃⇧ Hyper Key |

## 結果のフォーマット

```
## Lv3 ⌘⌥⌃(12 / 21)

⌨️ 呼び出し     ■■□  Hotkey 6 個
📋 クリップボード ■■■  よく再利用してる
...

ひとこと: <使い方の特徴を 1〜2 文で。推測は推測と書く>
次の ⇧ まで: あと 4 点(そろうと Hyper Key)
いちばん伸びしろ: <観点> → 「設定を良くして」と言えば raycast-growth で改善できます
```

## 守ること

- **書き込み系のツールは使わない**(Notes への保存だけ、承認後に行う)。
- 読み取ったクリップボード・音声入力の **本文を引用しない**。件数・アプリ名・傾向だけを書く。
- 結果はスクショで共有されやすい。個人情報(メールアドレス、トークンらしき文字列、人名)を含めない。
