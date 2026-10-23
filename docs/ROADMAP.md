# Project roadmap

## 0 — Establish a valid baseline
- [x] Create initial repository structure.
- [x] Add an initial terrain shader prototype.
- [ ] Validate the current pack in the target Minecraft + Iris version.
- [x] Add initial terrain lightmap sampling and transparent-texel handling.
- [ ] Fix every compile/load error before adding complex effects.
- [ ] Record the exact tested game, Iris, OS, GPU, and driver versions.

## 1 — Realistic baseline, low cost
- [ ] Establish sensible linear/sRGB handling and consistent colour grading.
- [x] Add an experimental fullscreen spatial-sharpening pass as the first post-processing research step (runtime validation pending).
- [ ] Tune daylight, sky, fog, and nighttime colour without crushing shadows.
- [ ] Add configurable ambient shading only where it is stable and inexpensive.
- [ ] Keep a vanilla-like fallback for unsupported paths.

## 2 — Lighting and materials
- [x] Add an initial shadow-map pass with four-tap filtering (runtime validation pending).
- [ ] Tune shadow bias, distance, resolution, and filtering after in-game tests.
- [ ] Improve water appearance with depth-aware colour, animated surface detail, and reflections where feasible.
- [ ] Add custom sky/cloud rendering and subtle foliage movement after the lighting baseline is stable.
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
- [ ] Investigate shaderpack-only reduced-resolution rendering and edge-aware upscaling; see `docs/FSR_EXPERIMENT.md`.
- [ ] Keep advanced effects from becoming mandatory dependencies.
- [ ] Publish a compatibility matrix based on actual tests, not guesses.

## 5 — Reuse and release hygiene
- [ ] Verify the licence of every external source before copying code.
- [ ] Prefer CC0/public-domain material where suitable; do not assume a repository is CC0 without checking its licence.
- [ ] Record source URL, author, licence, files/snippets used, and modifications in `THIRD_PARTY_NOTICES.md`.
- [ ] Preserve any notices required by the licence and clearly label adapted code.
- [ ] Add a release ZIP and reproducible installation notes only after the pack loads successfully.

**Current status:** an initial shadow-map pass and experimental final sharpening pass are committed, but both are unverified in-game. Validate the target Iris runtime before treating them as working. Next visual milestones are water, sky/clouds, and atmospheric colour. The FSR experiment is documented in `docs/FSR_EXPERIMENT.md`; the current filter is not AMD FSR.
