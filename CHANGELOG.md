# Changelog

All notable project changes are documented here. This project is an early experimental shader pack; entries describe code and documentation committed to the repository, not features confirmed to work in-game.

## [Unreleased] — 2026-10-23

### Added
- Initial terrain vertex and fragment shaders for Minecraft terrain rendering.
- Terrain lightmap sampling and transparent-texel discard handling.
- Experimental shadow vertex/fragment shaders, including alpha cutouts for leaves, grass, and other transparent textures.
- An initial four-tap shadow-map sampling prototype in the terrain fragment shader.
- An experimental fullscreen post-processing pass with conservative five-sample sharpening and local min/max clamping to reduce halos.
- GitHub Actions GLSL smoke tests for selected terrain, shadow, and final-pass shaders, plus checks for required project files.
- Project documentation covering design goals, compatibility, roadmap, testing, third-party code provenance, and the FSR research experiment.
- A `.gitattributes` rule asking GitHub Linguist to classify `signature.ws` as Whitespace.

### Changed
- Enabled the initial shadow-map settings in `shaders/shaders.properties`.
- Updated the roadmap and testing instructions to track the shadow prototype and post-processing experiment.
- Documented the current sharpening filter as FSR-inspired research, **not** an implementation of AMD FSR.
- Kept `signature.ws` intact; only its GitHub language classification rule was changed.

### Not yet implemented
- Realistic water with depth-aware colour, animated detail, and reflections.
- Custom sky, clouds, atmospheric fog, and tuned daylight/night colours.
- Ambient occlusion/contact shading, foliage movement, and refined translucent/emissive materials.
- Tested Low/Medium/High/Ultra quality presets.
- Actual FSR integration or verified reduced-resolution upscaling.

### Validation status
- Shader syntax checks are configured in GitHub Actions, but a passing smoke test only checks the files covered by that workflow.
- The shader pack has **not yet been confirmed to load or render correctly in Minecraft + Iris**.
- Shadow coordinates, shader uniforms/settings, visual quality, artifacts, and performance still require in-game testing. No FPS improvement or broad compatibility is claimed.

## Project direction
Prioritize realistic native-resolution lighting, shadows, water, sky/clouds, and foliage first. Revisit upscaling/FSR research after the visual baseline is stable and tested.
