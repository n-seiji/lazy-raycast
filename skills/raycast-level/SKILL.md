---
name: raycast-level
description: Use when the user wants to check how well they use Raycast — a Raycast level check, レベル診断, 使いこなし度, "私の Raycast は何レベル?". Reads only; scores the setup on 7 points and returns one of 4 levels (Launcher, Extensions, Hotkey, Hyper Key) and a type. For actually improving the setup, use raycast-growth.
---

# Raycast Level(レベル診断)

いまの Raycast をどれくらい使いこなしているかを、実データから 7 観点で採点し、レベル(Launcher → Extensions → Hotkey → Hyper Key の 4 段階)と **タイプ** を出す。
**読むだけで、何も変更しない**。改善したくなったら raycast-growth へ案内する。

## 手順

1. 「いまの Raycast を読ませてもらうね(読むだけ)」と 1 行伝えてから、下の観点のデータを読み取りツールで集める。
2. 観点ごとに 0〜3 のスコアをつけ、合計からレベルを、いちばん高い観点からタイプを出す。
3. 結果を出す(フォーマットは下)。
4. いちばん低い観点を 1 つ挙げ、「raycast-growth で改善する?」と聞く。
5. 結果のテキストの最後に、**必ず** 下の「共有する」の X 投稿リンクを付ける(聞かずに出す。省略しない)。
   そのあとで「結果カード」の画像を作る。**リンクが先、画像が後**。
6. 「Raycast Notes に保存する?」と聞き、承認されたら raycast-notes__create-note で保存する
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

Raycast の使い方が深まる順に 4 段階。名前は Raycast の機能そのもの。
優劣ではなく「いまどこまで使っているか」として伝える。

| 合計 | 段階 | 名前 | どんな状態か | 表示 |
|------|------|------|-------------|------|
| 0〜5 | 1 | Launcher | アプリやファイルを開くランチャーとして使っている | ⌘ |
| 6〜10 | 2 | Extensions | Clipboard History や拡張など、機能を足して使っている | ⌘⌥ |
| 11〜15 | 3 | Hotkey | よく使うものは Hotkey / Alias / Snippet で一発で呼んでいる | ⌘⌥⌃ |
| 16〜21 | 4 | Hyper Key | 呼び出しにルールがあり、AI や自動化まで任せている | ⌘⌥⌃⇧ |

結果では **「Level 3 : Hotkey」** のように、数字と名前を並べて呼ぶ。

**合計点(○ / 21)は結果に出さない**。レベルと観点ごとのバーだけを見せる。

## タイプ(いちばんスコアが高い観点で決める)

優劣ではなく使い方の傾向。同点なら数が多いほう、それも同じなら表の上を優先する。

| いちばん高い観点 | タイプ |
|-----------------|-------|
| ⌨️ 呼び出し | Hotkey Master |
| 📋 クリップボード | Clipboard Artisan |
| ✂️ Snippets | Snippet Maker |
| 🔗 Quicklinks | Quicklink Guide |
| 🧩 拡張 | Extension Collector |
| 🧘 整える | Tidy Expert |
| 🎙️ AI | AI Delegator |

全観点が 0〜1 のときは「Just Getting Started」とする。タイプ名は英語のまま出す。

## 結果のフォーマット

```
## Level 3 : Hotkey ⌘⌥⌃ ・ Clipboard Artisan

⌨️ 呼び出し     ■■□  Hotkey 6 個
📋 クリップボード ■■■  よく再利用してる
...

ひとこと: <使い方の特徴を 1〜2 文で。推測は推測と書く>
次の Level 4 : Hyper Key まで: <あと何を増やせば上がるかを 1 行で。点数は書かない>
いちばん伸びしろ: <観点> → 「設定を良くして」と言えば raycast-growth で改善できます

[X で共有する](https://x.com/intent/post?text=...&hashtags=raycast_meetup_jp&url=...)
結果カードをクリップボードに入れます。投稿画面で ⌘V を押すと画像付きで共有できます
```

## 結果カード(画像)を作る

結果のテキストと X の投稿リンクを出した直後に、**確認なしで** ターミナルのツールでこの Skill のフォルダにある
`card.sh` を 1 回だけ実行する。デザインは固定で、変わるのは段階の名前とタイプ名だけ(画像生成ツールは使わない)。

```sh
sh "<この SKILL.md があるフォルダ>/card.sh" <段階の数字 1〜4> "<タイプ名(英語)>"
# 例: sh ~/lazy-raycast/skills/raycast-level/card.sh 3 "Clipboard Artisan"
```

- フォルダが分からないときは、次で探す:
  `find ~ -maxdepth 8 -path ~/Library -prune -o -path '*/skills/raycast-level/card.sh' -print -quit`
- 成功すると `~/Downloads/raycast-level.png` ができ、**画像がクリップボードに入る**。出力されたパスを伝える
- 渡すのはレベルとタイプ名だけ。**数、アプリ名、個人情報は入れない**(共有されるため)
- ターミナルのツールが使えない・失敗したときは、「カードは作れなかった」と 1 行だけ伝えて先へ進む

## 共有する(X の投稿リンク)

結果のテキストの最後(画像を作る前)に、投稿画面を開くリンクを **毎回必ず** 1 つ出す。
**投稿はしない**。リンクを開いて、ユーザーが自分で投稿ボタンを押す。

```
https://x.com/intent/post?text=<URL エンコードした本文>&hashtags=raycast_meetup_jp&url=https%3A%2F%2Fgithub.com%2Fn-seiji%2Flazy-raycast
```

- 本文の例: `私の Raycast Level は「Level 3 : Hotkey」(Clipboard Artisan)でした`(レベル・タイプだけ。数や中身は入れない)
- ハッシュタグは `raycast_meetup_jp`(`#` は付けない。X が付ける)
- 本文は必ず URL エンコードする(スペースは `%20`、日本語・記号も)
- リンクは Markdown のリンクにして、そのままクリックできるようにする
- リンクの下に 1 行:「結果カードをクリップボードに入れます。投稿画面で ⌘V を押すと画像付きで共有できます」

## 守ること

- **書き込み系のツールは使わない**(Notes への保存だけ、承認後に行う)。結果カードの作成(card.sh)は Raycast の設定を変えないので確認なしでよい。
- 読み取ったクリップボード・音声入力の **本文を引用しない**。件数・アプリ名・傾向だけを書く。
- 結果はスクショで共有されやすい。個人情報(メールアドレス、トークンらしき文字列、人名)を含めない。
