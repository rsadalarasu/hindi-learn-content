# AramSei Learn Hindi — Content Packs

Downloadable DBHPS exam packs for the AramSei Learn Hindi app
(`rsadalarasu/learnhindi`, Android + iOS, `com.aramseilearn.ushindilearn`).

Packs download into the app on demand, so the app itself stays small.
**First pack: Parichaya (the first exam level).**

## Pack format (per pack, shipped as a GitHub Release zip)

```
pack-prathmik-v1.zip
  manifest.json        # pack id, version, level, lesson list, sha256 of files
  lessons/*.json       # one JSON per lesson: title, text, words, quiz
  audio/*.mp3          # optional, generated from verified text
  images/*.png         # optional, real photos only
```

`packs/manifest.json` at this repo root lists every released pack
(id, version, download URL, sha256, size) — the app reads it to offer
downloads and verify integrity (SHA-256 checked before install).

## Rules (standing)

- Every lesson is **original writing aligned to the DBHPS syllabus**.
  Never ship scans, text, or audio from the Sabha's prescribed
  textbooks (Subodh Hindi Patamala, Rachana, etc.) — those are copyrighted.
- Real photos only, never cropped or stretched; no emoji anchors.
- Each pack version bumps `version` and gets a new Release zip + sha256.

## Releasing a pack

1. Edit the pack under `packs/<level>/`, bump `version` in its manifest.
2. `tools/make_pack.sh <level>` — zips, hashes, writes `packs/manifest.json`.
3. Tag `pack-<level>-v<N>` and attach the zip + `.sha256` as a GitHub Release.

## Syllabus source

`docs/hpsabha-exams.md` (+ `hpsabha-exams.json`) — full extraction from
the official DBHPS site https://www.dbhpscentral.org (exam pages,
syllabus, books, fees), 2026-11-18. hpsabha.com is a DIFFERENT
organisation (Mauritius) — never use it as the syllabus source.
