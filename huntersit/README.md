# Missione Honmoon -- thebubugame.com/huntersit

The Italian version of `/hunters`. Same game, same structure, same password
gate -- everything translated.

## What is shared and what is not

- **Artwork is shared, not duplicated.** The image paths point at
  `../hunters/images/` -- feedback art, the question-page guide portraits
  (`faces/`) and the round backgrounds (`scene/`) alike. There is exactly one
  copy of the art in the repo. Renaming or moving `hunters/images/` breaks
  this page too.
- **The code is a standalone copy.** A fix to `hunters/index.html` does not
  reach this file, so real changes to game logic have to be made in both.

## Translation notes

The maths is numerically identical to the English game -- same answers, same
option sets, question for question. Only the wording changed.

The reading round could not be translated word for word, because the whole
point of those questions is the vocabulary. Each English target word was
replaced with an Italian word of comparable difficulty inside the same plot
passage.

**The Italian was deliberately pitched down in August 2026.** The first pass
read like written Italian rather than spoken Italian and was too hard. Three
things changed:

1. **No more passato remoto.** `formarono`, `fece`, `scrissero`, `disse` and
   friends are literary and are not how the language is actually spoken. All
   of it is now passato prossimo or imperfetto: `hanno formato`, `ha fatto`,
   `hanno scritto`, `ha detto`. This was the single biggest fix.
2. **Everyday target words.** The most literary choices were swapped out --
   `sgherro` became `servo`, `turbata` became `inquieta`, `predavano` became
   the concrete noun `prede`, `accumulare` became `radunare`.
3. **`Cosa significa` became `Cosa vuol dire`**, and sentences were shortened.

Current target words:

| English    | Italiano             |
|------------|----------------------|
| preyed on  | prede                |
| barrier    | barriera             |
| banish     | bandire              |
| drained    | svuotate             |
| rebellious | ribelle              |
| disquieted | inquieta             |
| shame      | vergognarsi          |
| enraged    | furioso              |
| minion     | servo                |
| trance     | incantato            |
| impostor   | impostore            |
| amassed    | radunare             |
| destitution| miseria              |
| guilt      | sentirsi in colpa    |
| expose     | smascherare          |
| lyrics     | testo                |
| shelved    | mettere da parte     |
| lured      | attirare             |
| betrayed   | tradite              |
| confronted | affrontare           |
| disguised  | travestirsi          |
| revealing  | mostrare             |
| improvised | improvvisata         |
| repentant  | pentito              |

Character and group names (Rumi, Mira, Zoey, Jinu, Celine, Gwi-Ma, Huntrix,
Saja Boys, Honmoon) are left as they are.

## Gate

Same as `/hunters`: on by default, password `honmoon`, tab title reads
`Esercizi` while locked, and no movie art is requested until it is passed.

See `../hunters/README.md` for how the question banks, art pools and sound
are put together.
