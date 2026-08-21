# Honmoon Quest -- thebubugame.com/hunters

A KPop Demon Hunters themed quiz: **10 story (reading) questions**, then
**10 battle math questions**. Unlisted, like `/math` -- nothing links to it
from the home page, and `robots.txt` plus a `noindex` meta tag keep it out
of search engines and AI crawlers.

Everything lives in `index.html`. No build step, no dependencies.

## Questions

Two banks near the top of the `<script>` block:

- `READING_POOL` -- 10 slots x 5 variants = 50 questions
- `MATH_POOL`    -- 10 slots x 5 variants = 50 questions

Each playthrough draws **one random question per slot**, and the four answers
are shuffled at runtime, so the right answer is never in a predictable place.
That is 5^10 -- just under 10 million -- possible question sets per round.
Adding a sixth variant to any slot just means adding another object to that
slot's array; nothing else has to change.

Every question carries a `note`, shown on the feedback card. On a wrong answer
the note appears together with the correct answer -- that is the teaching
moment, so it is worth keeping the notes plain and short.

### What the maths is actually drilling

Slots 3, 4 and 5 are the ones that matter most:

- **Slot 3** -- subtraction undoes addition (`7 + 5 = 12`, so `12 - 5 = 7`)
- **Slot 4** -- same sum, bigger tens (`3 + 4 = 7`, so `13 + 4 = 17`)
- **Slot 5** -- same difference, bigger tens (`8 - 5 = 3`, so `38 - 5 = 33`)

These mirror the Apple Tree game at `/math`. The rest of the slots are
adding, taking away, groups-of, comparing, missing addends and two-step
word problems, all wrapped in movie situations.

## Art

**On the feedback card, after each answer:**

- `images/good/h01..h27.jpg` -- Huntrix, Derpy the tiger, the chibis. Right answer.
- `images/evil/d01..d10.jpg` -- Saja Boys, Gwi-Ma's demons. Wrong answer.

**On the question pages themselves:**

- `images/faces/f01..f09.jpg` -- square character portraits. One sits beside the
  round name as the "guide" asking the question, and it changes every question.
- `images/scene/bg-story.jpg` -- Huntrix silhouettes in mist, behind round 1.
- `images/scene/bg-math.jpg` -- Saja Boys silhouettes on red, behind round 2.

The two scene images are **pre-blurred and pre-darkened at build time**
(ffmpeg `gblur` + `eq`), so they read as atmosphere rather than competing with
the text, and the browser does no work. A scrim gradient is baked into the
`SCRIM` constant on top of that. If you swap either image, blur it first or
the questions get hard to read.

Round 2 also swaps the accent from pink to red -- the round name and the ring
around the guide portrait -- via a `round-math` class on the question screen.

**On the title and results screens:** `images/title-bg.jpg`, `images/results-bg.jpg`.

Pictures are drawn from shuffled bags, so the same one never appears twice in
a row. To add or remove art, drop files in and update `HERO_COUNT`,
`DEMON_COUNT` or `FACE_COUNT` -- the filenames are generated from those numbers.

**Everything above is attached by `unlockUI()`**, never by parse-time CSS or
JS, so a locked page still requests no artwork at all. If you add a new image
anywhere, wire it in there too or it will leak past the gate.

## Sound

The happy sting and the somber sting are **synthesised in the browser** with
the Web Audio API -- nothing to download, nothing to license, no latency.

To swap in real audio: put `correct.mp3` and `wrong.mp3` in `hunters/sfx/`
and set `SFX_FILES_PRESENT = true`. The synth stays as the fallback.

## Password gate

**On.** The page opens as a grey box that asks for a password and says
nothing else.

```js
const GATE_ENABLED  = true;
const GATE_PASSWORD = 'honmoon';
```

While locked, the page gives away nothing:

- tab title is `Practice`, not the game's name
- no artwork, no colour, no wording naming the film
- **none of the movie images are even requested** -- the preload and both
  screen backgrounds are attached by `unlockUI()`, which only runs after the
  password is accepted

Verified: a locked page makes exactly one network request, for the Google
Fonts stylesheet. Once unlocked, the tab title, the palette and the art all
switch on, and a pass is remembered for the rest of the browser session.

Client-side only -- it keeps the page from being casually browsed, it is not
real security. To take it back down, set `GATE_ENABLED = false`.

## Deploy

Push to `main`; Cloudflare Pages picks it up.
