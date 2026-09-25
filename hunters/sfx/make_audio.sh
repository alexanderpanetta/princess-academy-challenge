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
# End-of-game reward (16+/20): 30 s from each song's video, with a 3 s fade at the end.
#   hohuFW0zQUw  "Golden" official music video (Netflix)            36-66 s  "I'm done hidin' now ... we're goin' up, up, up"
#   om96KysABLM  "Takedown" film clip (KinoCheck Family)             30-60 s  "I don't think you're ready for the takedown"
#   vjaKvvuRW_g  "What It Sounds Like" film clip (Alex's link)      292-322 s  finale, final chorus
# $4 = crop that removes the film clips' built-in letterbox bars (found with ffmpeg cropdetect)
vid(){ ffmpeg -hide_banner -loglevel error -y -ss "$2" -t 30 -i "$R/v_$1.mp4" \
  -vf "$4scale=960:-2,fps=30,fade=t=in:d=0.4,fade=t=out:st=27:d=3" \
  -af "loudnorm=I=-15:TP=-1.5,afade=t=in:d=0.4,afade=t=out:st=27:d=3" \
  -c:v libx264 -profile:v main -crf 24 -preset slow -pix_fmt yuv420p -c:a aac -b:a 128k -movflags +faststart "../video/$3"; }
vid hohuFW0zQUw 36  golden.mp4   ''
vid om96KysABLM 30  takedown.mp4 'crop=1280:536:0:92,'
vid vjaKvvuRW_g 292 wisl.mp4     'crop=1280:536:0:92,'
exit 0
# (retired 2026-09-25: full-song audio for the old ending)
full(){ ffmpeg -hide_banner -loglevel error -y -ss "$2" -t "$3" -i "$R/$1.m4a" -af "loudnorm=I=-15:TP=-1.5,afade=t=out:st=$(($3-3)):d=3" -c:a aac -b:a 96k "$4"; }
full yebNIHKAC4A 0 180 full-golden.m4a       # the lyric video runs on ~20 s of quiet outro after the song ends at ~2:58
full Ve_a9CXjlQc 0 180 full-takedown.m4a
full LK0jCxxgcno 0 245 full-wisl.m4a
ffmpeg -hide_banner -loglevel error -y -i "$R/CQeezCdF4mk.m4a" -af "silenceremove=start_periods=1:start_threshold=-45dB,areverse,silenceremove=start_periods=1:start_threshold=-45dB,areverse,loudnorm=I=-15:TP=-1.5" -c:a aac -b:a 96k sad-trombone.m4a
