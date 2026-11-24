# lazy-raycast

面倒だから任せちゃおう。Raycast の設定を Raycast AI にやってもらうための Skills 集。

| Skill | こんなときに | やること |
|-------|-------------|---------|
| `raycast-onboard` | 「Raycast のオンボーディングして」 | 普段の作業を聞いて Quicklink・Snippet・Hotkey・拡張を作り、「このように呼び出せます」と案内する |
| `raycast-level` | 「私の Raycast は何レベル?」 | 実データから 7 観点で採点し、レベル(Launcher → Extensions → Hotkey → Hyper Key の 4 段階)と、「Clipboard Artisan」などのタイプを出す。結果カードの画像と X の投稿リンク(#raycast_meetup_jp)も出す(読むだけ) |
| `raycast-growth` | 「設定を良くして」 | Hotkey・Alias・Snippets・Quicklinks・拡張・設定・AI モデル・Agent などを提案し、承認したものを実際に設定する。最近のリリースから関係ありそうな新機能も拾う |
| `raycast-tidy` | 「Raycast をスッキリさせたい」 | Quicklinks / Snippets / Hotkey / 拡張などを棚卸しし、重複・衝突を承認制で片づける |

## 必要なもの

- Raycast v2.13 以降(Mac / Windows)
- Raycast Pro(AI と Skills は有料プランの機能。7 日間の無料トライアルあり)

## インストール

```sh
git clone https://github.com/n-seiji/lazy-raycast ~/lazy-raycast
```

Raycast の **Settings → AI → Skills → Skill Folders** の「+」で `~/lazy-raycast/skills` を追加する。
1 分ほどで 4 つの Skill が一覧に出る。

> `~/.claude/skills` などに各 Skill のフォルダを置いても読み込まれる(Claude Code でもそのまま使える)。

## 使い方

AI Chat か Quick AI で話しかけるだけ。Skill は内容に応じて自動で読み込まれる。
確実に使いたいときは `@raycast-onboard` のようにメンションする。

## 安全について

- 読み取りは自動、書き込み(設定変更・削除・インストール)は毎回内容を見せて承認を取る。
- Raycast AI の **Settings → AI → Tools → Permissions** が Auto(既定)なら、破壊的な操作の前に Raycast が承認カードを出す。
- クリップボードや音声入力の本文は会話に引用しない。

## Claude Code などから使う(おまけ)

Raycast の **Settings → MCP → Raycast MCP Server** を ON にして Connect App で接続すると、
外部の agent からも同じ Skill を Raycast のツール付きで使える。
接続先の agent では Raycast は確認を出さないので、agent 側の承認設定を確認すること。

## 公式 Examples もどうぞ

Raycast MCP Server の設定画面(**Examples → Show All**)に、公式のプロンプトが 16 個ある。
「Find Extensions for My Apps」「Teach Raycast About Me」「Teach Dictation How I Write」など。
コピーして接続した agent に貼るだけで使える。

## Agent「Raycast コーチ」

4 つの Skill を使い分けるコーチ役の Agent。`agents/raycast-coach.deeplink.txt` のリンクを開くと取り込み画面が出る
(または **Import Agents** コマンドで `agents/raycast-coach.json` を読み込む)。
