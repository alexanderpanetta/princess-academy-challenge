# Honmoon Quest -- thebubugame.com/hunters

A KPop Demon Hunters themed quiz: **10 story (reading) questions**, then
**10 battle math questions**. Unlisted, like `/math` -- nothing links to it
from the home page, and `robots.txt` plus a `noindex` meta tag keep it out
of search engines and AI crawlers.

Everything lives in `index.html`. No build step, no dependencies.

## Questions

Two banks near the top of the `<script>` block:

- `READING_POOL` -- 10 slots x 3 variants = 30 questions
- `MATH_POOL`    -- 10 slots x 3 variants = 30 questions

Each playthrough draws **one random question per slot**, and the four answers
are shuffled at runtime, so the right answer is never in a predictable place.
Adding a fourth variant to any slot just means adding another object to that
slot's array.

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

- `images/good/h01..h27.jpg` -- Huntrix, Derpy the tiger, the chibis. Shown on a right answer.
- `images/evil/d01..d10.jpg` -- Saja Boys, Gwi-Ma's demons. Shown on a wrong answer.
- `images/title-bg.jpg`, `images/results-bg.jpg`

Pictures are drawn from a shuffled bag, so the same one never appears twice in
a row. To add or remove art, drop files in and update `HERO_COUNT` /
`DEMON_COUNT` -- the filenames are generated from those numbers.

## Sound

The happy sting and the somber sting are **synthesised in the browser** with
the Web Audio API -- nothing to download, nothing to license, no latency.

To swap in real audio: put `correct.mp3` and `wrong.mp3` in `hunters/sfx/`
and set `SFX_FILES_PRESENT = true`. The synth stays as the fallback.

## Password gate

Off by default. In `index.html`:

```js
const GATE_ENABLED  = false;   // set true to require the password
const GATE_PASSWORD = 'honmoon';
```

Client-side only -- it keeps the page from being casually browsed, it is not
real security. It remembers a pass for the browser session.

## Deploy

Push to `main`; Cloudflare Pages picks it up.
