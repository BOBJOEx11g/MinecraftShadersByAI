# Changelog

All notable project changes are documented here. Entries describe committed code and documentation, not features confirmed to work in-game.

## [Unreleased] — 2026-10-23

### Added
- Initial terrain vertex and fragment shaders for Minecraft terrain rendering.
- Terrain lightmap sampling and transparent-texel discard handling.
- Experimental shadow vertex/fragment shaders, including alpha cutouts for leaves, grass, and other transparent textures.
- A four-tap shadow-map sampling prototype with a conservative normal-aware world-space bias.
- An original procedural cloud pass in the fullscreen composite stage: sky-depth masking, inverse-projection view rays, a bounded cloud layer, animated two-scale noise, and short ray marching.
- An experimental fullscreen post-processing pass with conservative five-sample sharpening and local min/max clamping to reduce halos.
- GitHub Actions GLSL smoke tests for terrain, shadow, composite-cloud, and final-pass shaders, plus checks for required project files.
- Project documentation covering design goals, compatibility, roadmap, testing, third-party code provenance, and the FSR research experiment.
- A `.gitattributes` rule asking GitHub Linguist to classify `signature.ws` as Whitespace.

### Changed
- Enabled the initial shadow-map settings in `shaders/shaders.properties`.
- Updated the roadmap and testing instructions to track the shadow prototype, cloud pass, and post-processing experiment.
- Documented the current sharpening filter as FSR-inspired research, **not** an implementation of AMD FSR.
- Kept `signature.ws` intact; only its GitHub language classification rule was changed.

### Not yet implemented
- Physically convincing volumetric clouds, cloud shadows on terrain, and cloud-aware sky scattering.
- Realistic water with depth-aware colour, animated detail, and reflections.
- Fully tuned atmospheric fog, daylight/night colour, ambient occlusion/contact shading, foliage movement, and refined translucent/emissive materials.
- Tested Low/Medium/High/Ultra quality presets.
- Actual FSR integration or verified reduced-resolution upscaling.

### Validation status
- GitHub Actions performs GLSL syntax smoke tests on selected shaders; these checks do not prove that Iris loads the pack or that its uniforms and render-pass interactions are correct.
- The shader pack has **not yet been confirmed to load or render correctly in Minecraft + Iris**.
- Shadow coordinates, shader uniforms/settings, cloud appearance, visual artifacts, and performance still require in-game testing. No FPS improvement or broad compatibility is claimed.

## Project direction
Prioritize realistic native-resolution lighting, shadows, water, sky/clouds, and foliage first. Revisit upscaling/FSR research after the visual baseline is stable and tested.
