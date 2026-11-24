---
name: raycast-growth
description: Use when the user wants to improve or level up their Raycast setup — "設定を良くして" / "Raycast を育てて" / "もっと便利にして" / "おすすめの設定をして" — or wants to know what is new in Raycast ("最近のリリースを教えて" / "新機能ある?") — including hotkeys, aliases, snippets, quicklinks, extensions, auto quit, Raycast settings, AI models, agents, and AI commands. Proposes concrete changes and applies the approved ones.
---

# Raycast Growth(設定の提案・変更)

いまの使い方に合わせて、Raycast の設定を提案し、承認されたものを **実際に変える**。
「提案 → 承認 → 適用 → 確認」を 1 セットずつ回す。

## 手順

1. 何を良くしたいか聞く。特に希望がなければ、下の「メニュー」を上から順に診断して、
   効果が大きそうなものを **最大 3 つ** 選ぶ(raycast-level の結果が会話にあれば、低い観点を優先)。
   **3 つのうち 1 つは必ず「拡張」にする**: 使っているアプリ・サービスに合う未インストールの拡張を
   store__search-store で探し、おすすめを 1〜3 個、名前と「何ができるか」1 行で出す。
   合うものが本当に見つからなかったときだけ、「おすすめの拡張は見つからなかった」と 1 行で伝える。
2. 1 つずつ、**変更内容を具体的に** 見せる(何を・どの値に・なぜ)。
3. 承認されたものだけ適用し、読み直して反映を確認してから「できたよ」と伝える。
4. 最後に変えたものの一覧を出し、「もう一度 raycast-level でレベルを見る?」と聞く。

## メニュー

| # | 対象 | 診断 | 適用 |
|---|-----------|------|------|
| 1 | **Hotkey** | raycast-settings__search-settings(hotkey)で既存のルール(Hyper + 頭文字など)と重複を把握。よく使うアプリは applications__search-applications と、シェルが使えれば `mdls -name kMDItemUseCount` で推定 | raycast-settings__update-setting。ルールに合わせ、空いている組み合わせだけ。素の ⌥ + 文字は避ける |
| 2 | **Alias** | よく使いそうなコマンドで alias が空のもの | raycast-settings__update-setting(短い英字 2〜4 文字) |
| 3 | **Snippets** | clipboard__search-entries で何度もコピーしているテキスト、メール・住所など定型 | snippets__create-snippet(keyword は `;` 始まりなど既存ルールに合わせる) |
| 4 | **Quicklinks** | 何度もコピーしている URL、開いているタブ(browser__get-open-tabs)、作業フォルダ(file-search__list-recent-files) | quicklinks__create-quicklink(検索 URL は `{argument}` 付きにする) |
| 5 | **拡張** | 使っているアプリ・サービスに対して store__search-store で `installed: false` のもの | store__install-store-extension |
| 6 | **Auto Quit** | 重い・たまにしか使わないアプリ(applications__list-auto-quits で既存確認) | applications__set-auto-quit |
| 7 | **Raycast の設定** | raycast-settings__search-settings で既定のままの便利設定を探し、manual__search-manual-pages で意味を確認 | raycast-settings__update-setting |
| 8 | **AI のモデル** | 「AI Chat Default Model」「AI Commands」の現在値と選べるモデル一覧 | raycast-settings__update-setting |
| 9 | **Agent / AI Command** | 繰り返しの依頼や定型の文章作業 | 下の「ディープリンクで作る」 |
| 10 | **最近のリリース** | 下の「最近のリリースをピックアップする」 | 関係する設定があれば raycast-settings__update-setting |

## 最近のリリースをピックアップする

「最近のリリースを教えて」「新機能ある?」と言われたとき、または診断の最後に 1 回だけ行う。

1. Web Search で公式の changelog(https://www.raycast.com/changelog)から **直近 3 リリース** を読む。
   記憶で書かない。読めなかったら「changelog を読めなかった」と伝えてこの手順をやめる。
2. いまの設定(入っている拡張、Hotkey、Snippets / Quicklinks の数、使っている AI 機能)と照らして、
   **この人に関係がありそうなものを最大 3 つ** 選ぶ。全部を並べない。
3. 1 つずつ「何が変わったか(1 行)/ あなたの場合どう使えるか(1 行)/ 試し方(1 行)」で伝え、
   バージョンと changelog の URL を添える。
4. 設定を変えると使える機能なら、いつもの「提案 → 承認 → 適用 → 確認」に進む。

## ディープリンクで作る(Agent / AI Command)

MCP には作成ツールがないので、Raycast の取り込み用ディープリンクを組み立てて開く。
取り込み画面で **ユーザーが Import を押して確定** する。

```
raycast://presets/import?preset=<URL エンコードした JSON>
  JSON: {"name","description","instructions","creativity","icon","model","web_search","image_generation","tools":[{"name","id"}]}

raycast://prompts/import?prompts=<URL エンコードした JSON>(複数なら &prompts= を繰り返す)
  JSON: {"title","prompt","creativity","icon","model"}
```

- `creativity`: none / low / medium / high / maximum
- `model`: 「AI Chat Default Model」設定の選択肢にある id(例: `anthropic-claude-sonnet-5-5`)
- `tools` の id: 組み込みは `builtin_package_<名前>`(例: `builtin_package_calendar`)
- AI Command のプロンプトでは `{selection}` `{clipboard}` `{argument name="..."}` が使える
- 開き方: `@terminal` で `open "<link>"`、または browser__create-tab で URL を開く

## 守ること

- **1 回の承認で 1 つの変更**。まとめて「全部やって」と言われても、一覧を見せて再確認する。
- 既存の Hotkey / Alias / Snippet keyword と **衝突する値は提案しない**。
- 上書きするときは、元の値を必ず見せる(戻せるように)。
- クリップボードや音声入力の本文は会話に引用しない。
