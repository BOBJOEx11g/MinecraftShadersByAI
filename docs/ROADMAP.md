# Project roadmap

## 0 — Establish a valid baseline
- [x] Create initial repository structure.
- [x] Add an initial terrain shader prototype.
- [ ] Validate the current pack in the target Minecraft + Iris version.
- [ ] Fix every compile/load error before adding complex effects.
- [ ] Record the exact tested game, Iris, OS, GPU, and driver versions.

## 1 — Realistic baseline, low cost
- [ ] Establish sensible linear/sRGB handling and consistent colour grading.
- [ ] Tune daylight, sky, fog, and nighttime colour without crushing shadows.
- [ ] Add configurable ambient shading only where it is stable and inexpensive.
- [ ] Keep a vanilla-like fallback for unsupported paths.

## 2 — Lighting and materials
- [ ] Implement shadow mapping with adjustable resolution and filtering.
- [ ] Improve water appearance with modest reflections and animated surface detail.
- [ ] Add subtle foliage movement and atmospheric effects.
- [ ] Tune translucent materials and emissive blocks.
- [ ] Compare day, night, caves, rain, snow, and Nether/End where supported.

## 3 — Scalable quality tiers
- [ ] Low: simplest path, minimal shadows/effects, reduced sampling.
- [ ] Medium: balanced shadows and atmosphere.
- [ ] High: better filtering, clouds, water and optional screen-space effects.
- [ ] Ultra: optional expensive effects, enabled only after profiling and compatibility checks.
- [ ] Ensure each optional effect can be disabled independently where practical.

## 4 — Compatibility and performance
- [ ] Test on integrated graphics and discrete GPUs from more than one vendor when available.
- [ ] Test multiple supported Minecraft/Iris versions and driver versions.
- [ ] Track frame time, memory use, visual artifacts, and compile failures.
- [ ] Keep advanced effects from becoming mandatory dependencies.
- [ ] Publish a compatibility matrix based on actual tests, not guesses.

## 5 — Reuse and release hygiene
- [ ] Verify the licence of every external source before copying code.
- [ ] Prefer CC0/public-domain material where suitable; do not assume a repository is CC0 without checking its licence.
- [ ] Record source URL, author, licence, files/snippets used, and modifications in `THIRD_PARTY_NOTICES.md`.
- [ ] Preserve any notices required by the licence and clearly label adapted code.
- [ ] Add a release ZIP and reproducible installation notes only after the pack loads successfully.

**Current status:** the prototype is unverified in-game. The immediate priority is a clean load and a repeatable baseline, not adding costly effects prematurely.
