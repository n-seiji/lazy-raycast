#!/bin/sh
# raycast-level の結果カード(PNG)を決まったデザインで作る。macOS 標準のコマンドだけで動く。
# 使い方: sh card.sh <レベル 1-4> "<タイプ名(英語)>"   例: sh card.sh 3 "Clipboard Artisan"
#   → ~/Downloads/raycast-level.png を作り、画像をクリップボードに入れる(NO_CLIPBOARD=1 で入れない)
set -eu

lv="${1:?usage: card.sh <level 1-4> <type>}"
type="${2:?usage: card.sh <level 1-4> <type>}"
case "$lv" in 1|2|3|4) ;; *) echo "level must be 1-4" >&2; exit 1 ;; esac
# SVG に埋め込むので XML の特殊文字を逃がす
type=$(printf '%s' "$type" | tr '[:lower:]' '[:upper:]' | sed -e 's/&/\&amp;/g' -e 's/</\&lt;/g' -e 's/>/\&gt;/g')

out="${RAYCAST_LEVEL_OUT:-$HOME/Downloads/raycast-level.png}"
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

case "$lv" in 1) stage="Launcher" ;; 2) stage="Extensions" ;; 3) stage="Hotkey" ;; 4) stage="Hyper Key" ;; esac

key() { # key <番号> <x> <記号>
  if [ "$1" -le "$lv" ]; then fill="#FF6363"; else fill="#3B3B42"; fi
  printf '<text x="%s" y="128" font-size="46" fill="%s" font-family="Helvetica Neue">%s</text>\n' "$2" "$fill" "$3"
}

cat > "$tmp/card.svg" <<SVG
<svg xmlns="http://www.w3.org/2000/svg" width="1200" height="675" viewBox="0 0 1200 675">
  <defs>
    <radialGradient id="g1" cx="100%" cy="100%" r="90%">
      <stop offset="0%" stop-color="#FF6363" stop-opacity="0.50"/><stop offset="50%" stop-color="#FF6363" stop-opacity="0.08"/><stop offset="100%" stop-color="#FF6363" stop-opacity="0"/>
    </radialGradient>
    <linearGradient id="line" x1="0" y1="0" x2="1" y2="0">
      <stop offset="0%" stop-color="#FF6363"/><stop offset="100%" stop-color="#FF6363" stop-opacity="0"/>
    </linearGradient>
  </defs>
  <rect width="1200" height="675" fill="#0A0A0B"/>
  <rect width="1200" height="675" fill="url(#g1)"/>
  <text x="96" y="122" font-size="28" fill="#8E8E99" font-family="'Helvetica Neue', sans-serif" font-weight="500" letter-spacing="8">RAYCAST LEVEL</text>
$(key 1 880 '⌘')$(key 2 940 '⌥')$(key 3 1000 '⌃')$(key 4 1060 '⇧')
  <text x="94" y="240" font-size="68" fill="#FF6363" font-family="Didot, 'Bodoni 72', Georgia, serif">Level $lv :</text>
  <text x="90" y="410" font-size="170" fill="#FFFFFF" font-family="Didot, 'Bodoni 72', Georgia, serif" letter-spacing="-4">$stage</text>
  <rect x="96" y="488" width="420" height="3" fill="url(#line)"/>
  <text x="96" y="548" font-size="34" fill="#C9C9D1" font-family="'Helvetica Neue', sans-serif" font-weight="500" letter-spacing="7"><tspan fill="#FF6363">TYPE :</tspan> $type</text>
  <text x="96" y="612" font-size="26" fill="#FF6363" font-family="'Helvetica Neue', sans-serif" font-weight="500" letter-spacing="1">#raycast_meetup_jp</text>
</svg>
SVG

mkdir -p "$(dirname "$out")"
sips -s format png "$tmp/card.svg" --out "$out" >/dev/null 2>&1 || {
  qlmanage -t -s 1200 -o "$tmp" "$tmp/card.svg" >/dev/null 2>&1 && mv "$tmp/card.svg.png" "$out"
}
[ -s "$out" ] || { echo "failed to render card" >&2; exit 1; }

if [ "${NO_CLIPBOARD:-0}" != "1" ]; then
  osascript -e "set the clipboard to (read (POSIX file \"$out\") as «class PNGf»)" >/dev/null
fi
echo "$out"
