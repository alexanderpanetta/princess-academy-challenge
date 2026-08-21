# Missione Honmoon -- thebubugame.com/huntersit

The Italian version of `/hunters`. Same game, same structure, same password
gate -- everything translated.

## What is shared and what is not

- **Artwork is shared, not duplicated.** The image paths point at
  `../hunters/images/`, so there is exactly one copy of the 2.3 MB of art in
  the repo. Renaming or moving `hunters/images/` breaks this page too.
- **The code is a standalone copy.** A fix to `hunters/index.html` does not
  reach this file, so real changes to game logic have to be made in both.

## Translation notes

The maths is numerically identical to the English game -- same answers, same
option sets, question for question. Only the wording changed.

The reading round could not be translated word for word, because the whole
point of those questions is the vocabulary. Each English target word was
replaced with an Italian word of comparable difficulty inside the same plot
passage:

| English    | Italiano                  |
|------------|---------------------------|
| preyed on  | predavano                 |
| barrier    | barriera                  |
| banish     | bandire                   |
| rebellious | ribelle                   |
| vocalist   | solista                   |
| disquieted | turbata                   |
| shame      | vergogna                  |
| enraged    | andare su tutte le furie  |
| minion     | sgherro                   |
| trance     | trance                    |
| impostor   | impostore                 |
| amassed    | accumulare                |
| destitution| miseria                   |
| guilt      | senso di colpa            |
| expose     | smascherare               |
| lyrics     | testo                     |
| sabotage   | sabotare                  |
| lured      | attirare                  |
| betrayed   | tradite                   |
| confronted | affrontò                  |
| improvised | improvvisata              |
| repentant  | pentito                   |

Character and group names (Rumi, Mira, Zoey, Jinu, Celine, Gwi-Ma, Huntrix,
Saja Boys, Honmoon) are left as they are.

## Gate

Same as `/hunters`: on by default, password `honmoon`, tab title reads
`Esercizi` while locked, and no movie art is requested until it is passed.

See `../hunters/README.md` for how the question banks, art pools and sound
are put together.
