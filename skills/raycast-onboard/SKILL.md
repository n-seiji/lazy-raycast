---
name: raycast-onboard
description: Use when the user wants to get started with Raycast, learn Raycast basics hands-on, or says things like "Raycast のオンボーディングして" / "Raycast の使い方を教えて" / "Raycast 入門". Runs short hands-on missions and checks each one with Raycast's own tools before moving on.
---

# Raycast Onboard(ハンズオン)

Raycast をまだ育てていない人と、手を動かしながら基本を覚える。
**説明より体験**。1 ミッション = 1 機能、30 秒〜1 分で終わるものだけ。

## 進め方

1. 最初に 1 行で挨拶し、「ミッションを順に出すので、やったら『できた』と送ってね」と伝える。
2. 下のミッションを **1 つずつ** 出す。一度に複数出さない。
3. ユーザーが「できた」「done」などと言ったら、**必ず該当ツールで実際の状態を確認する**。
   - 確認できた → 一言ほめて、何が便利かを 1 行で添え、次のミッションへ。
   - 確認できない → 責めずに、よくあるつまずきを 1 つだけヒントとして出し、もう一度待つ。
   - 3 回確認できなければ「スキップしよう」と提案して次へ。
4. 各ミッションには `@manual`(manual__search-manual-pages / read-manual-page)で該当ページを探し、
   「詳しくはここ」として URL を 1 つ添える。説明を自分の記憶で書かない。
5. 全部終わったら、クリアしたミッションを一覧にして、「次はレベルを見てみる?(raycast-level)」と案内する。

## ミッション

| # | ミッション | 指示 | 確認方法 |
|---|-----------|------|---------|
| 1 | Clipboard History | 合言葉「らーめん」をコピー → 何か別の文字をコピー → Clipboard History を開いて「らーめん」を貼り付ける | clipboard__search-entries(query: らーめん)で entry があり、copyCount が 2 以上 or updatedAt が createdAt より新しい |
| 2 | Hotkey | Clipboard History に好きな Hotkey を付ける | raycast-settings__search-settings(query: "Clipboard History hotkey")→ currentValue が (none) 以外 |
| 3 | Snippet | 自分のメールアドレスを Snippet にして、キーワード(例 `;mail`)を付ける | snippets__list-snippets で新しい snippet があり keyword が設定されている |
| 4 | Quicklink | よく開くサイトを Quicklink にする | quicklinks__list-quicklinks で新しい quicklink がある |
| 5 | Store | Store で気になる拡張を 1 つ入れる(迷ったら提案する) | store__get-installed-extensions に増えている |

- 開始前に、各ミッションの現在の状態を読み取って「もうできているもの」はスキップしてよい(「もう使いこなしてるね!」と一言)。
- ミッションの合言葉や例は、ユーザーの言語・状況に合わせて変えてよい。

## 守ること

- **書き込み系のツールは使わない**。設定・作成はユーザー自身の手でやってもらうのがハンズオンの目的。
  ユーザーが「代わりにやって」と頼んだときだけ実行し、その前に内容を見せて確認を取る。
- クリップボードや Snippet の中身は、確認に必要な範囲でだけ読む。本文を会話に引用しない。
- テンポ重視。1 メッセージは短く、箇条書き 3 行以内を目安にする。
