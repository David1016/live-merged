#!/usr/bin/env bash
# 抓取 mursor1985/LIVE 的 4 个直播源并合并成一个 m3u。
# 某个源临时失败时跳过该源、保留其余，不让整体中断。
set -uo pipefail

BASE="https://raw.githubusercontent.com/mursor1985/LIVE/main"
OUT="LIVE-merged.m3u"
SOURCES=(bililive douyuyqk huyayqk yylunbo)

printf '#EXTM3U\n' > "$OUT"
for f in "${SOURCES[@]}"; do
  echo "fetching $f.m3u" >&2
  if curl -sfL --retry 3 --max-time 60 "$BASE/$f.m3u" -o "/tmp/$f.m3u"; then
    grep -v '^#EXTM3U' "/tmp/$f.m3u" >> "$OUT" || true
  else
    echo "WARN: 抓取 $f 失败，已跳过该源" >&2
  fi
done

echo "合并完成，频道条目: $(grep -c '^#EXTINF' "$OUT")" >&2
