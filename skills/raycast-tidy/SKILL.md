---
name: raycast-tidy
description: Use when the user wants to clean up or declutter their Raycast setup — duplicate or dead quicklinks, unused snippets, conflicting hotkeys and aliases, extensions they no longer need, AI commands — e.g. "Raycast をスッキリさせたい" / "Raycast の棚卸しして" / "quicklink 整理して".
---

# Raycast Tidy(棚卸し・おかたづけ)

今の Raycast を全部読んで「整理候補」を出し、選ばれたものだけ片づける。
**消す前に必ず一覧を見せて承認を取る**。一括削除はしない。

## 1. 棚卸し(読み取りのみ)

| 対象 | ツール | 見るポイント |
|------|-------|-------------|
| Quicklinks | quicklinks__list-quicklinks(+ list-quicklink-tags) | 同じ / ほぼ同じ URL の重複、名前の重複、タグなし、名前から用途が分からないもの |
| Snippets | snippets__list-snippets(+ list-snippet-tags) | キーワードの重複・前方一致の衝突(`;m` と `;mail`)、キーワードなし、同じ本文 |
| Hotkey / Alias | raycast-settings__search-settings(hotkey / alias) | 同じ Hotkey の重複、同じ Alias の重複 |
| 拡張 | store__get-installed-extensions | 機能がかぶっている拡張、長く更新されていないもの、開発版(developmentCopy)の残骸 |
| AI Commands | raycast-settings__search-settings(query: "AI Command") | 数と、Hotkey / Alias の有無だけ(下の注意) |
| Auto Quit | applications__list-auto-quits | もうインストールされていないアプリ |

> **AI Commands の注意**: Raycast MCP / AI Extensions からは AI Commands の名前・プロンプトを読めず、
> 設定 ID(`aiCommand::=::<id>`)と Hotkey / Alias しか見えない。
> 中身の整理は「Search AI Commands で一覧を開いて、使っていないものを教えて」とユーザーに手伝ってもらう。

**使用回数は取れない**。「使っていない」は断定せず、「重複」「衝突」「壊れている」を優先して候補にする。

## 2. レポート

```
## 🧹 Raycast 棚卸し

| 対象 | 数 | 整理候補 |
|------|----|---------|
| Quicklinks | 42 | 重複 3 / タグなし 12 |
| Snippets | 18 | キーワード衝突 2 |
| Hotkey | 31 | 重複 1 |
| 拡張 | 56 | 機能かぶり 2 組 |
| AI Commands | 23 | 中身は要目視 |

### すぐ片づけられるもの(おすすめ順)
1. ...
```

## 3. おかたづけ

1. 候補ごとに「消す / まとめる / タグを付ける / 名前を変える / そのまま」を選んでもらう。
2. 選ばれたものだけ、変更内容を一覧で見せて承認を取ってから実行する
   (quicklinks__update / delete、snippets__update / delete、raycast-settings__update-setting、store__uninstall-store-extension、applications__remove-auto-quit)。
3. 実行後、変更したものの一覧を出す。必要なら raycast-notes__create-note に記録する。

## 守ること

- 削除は 1 件ずつ明示。「全部消して」と言われても、件数と一覧を見せて再確認する。
- Snippet の本文は会話に引用しない(重複判定は内部で行い、名前とキーワードで示す)。
- 共有(チーム)の Snippet / Quicklink は自分だけの判断で消さない。チーム資産であることを伝える。
