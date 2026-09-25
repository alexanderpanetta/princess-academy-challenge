#!/bin/sh
# Rebuilds the reward audio in hunters/sfx/ from full-length downloads in _raw_audio/ (git-ignored).
# Sources (yt-dlp -x --audio-format m4a):
#   yebNIHKAC4A  "Golden" official lyric video (Sony Pictures Animation)
#   Ve_a9CXjlQc  "Takedown" HUNTR/X soundtrack (Republic Records)
#   LK0jCxxgcno  "What It Sounds Like" HUNTR/X album audio (lyric channel; Alex's link vjaKvvuRW_g is a film clip with dialogue)
#   CQeezCdF4mk  sad trombone sound effect
# Chorus windows were found with Whisper timestamps + YouTube's most-replayed heatmap.
set -e
cd "$(dirname "$0")"; R=../../_raw_audio
cut(){ ffmpeg -hide_banner -loglevel error -y -ss "$2" -t 30 -i "$R/$1.m4a" -af "loudnorm=I=-15:TP=-1.5,afade=t=in:d=0.4,afade=t=out:st=27:d=3" -c:a aac -b:a 96k "$3"; }
cut yebNIHKAC4A 64.5  chorus-golden.m4a     # "We're goin' up, up, up, it's our moment ... gonna be golden"
cut Ve_a9CXjlQc 32.5  chorus-takedown.m4a   # "I don't think you're ready for the takedown ... take it down"
cut LK0jCxxgcno 179.5 chorus-wisl.m4a       # final chorus: "We broke into a million pieces ... this is what it sounds like"
full(){ ffmpeg -hide_banner -loglevel error -y -ss "$2" -t "$3" -i "$R/$1.m4a" -af "loudnorm=I=-15:TP=-1.5,afade=t=out:st=$(($3-3)):d=3" -c:a aac -b:a 96k "$4"; }
full yebNIHKAC4A 0 180 full-golden.m4a       # the lyric video runs on ~20 s of quiet outro after the song ends at ~2:58
full Ve_a9CXjlQc 0 180 full-takedown.m4a
full LK0jCxxgcno 0 245 full-wisl.m4a
ffmpeg -hide_banner -loglevel error -y -i "$R/CQeezCdF4mk.m4a" -af "silenceremove=start_periods=1:start_threshold=-45dB,areverse,silenceremove=start_periods=1:start_threshold=-45dB,areverse,loudnorm=I=-15:TP=-1.5" -c:a aac -b:a 96k sad-trombone.m4a
