# FSR-inspired post-processing experiment

## Goal

Explore how far a conventional Iris shaderpack can push spatial upscaling and image reconstruction without requiring a separate client mod or external upscaler. Keep the baseline broadly compatible and treat advanced rendering as an optional experiment until tested.

## Important distinction

AMD FidelityFX Super Resolution 1 (FSR 1) is a specific two-stage spatial upscaler: EASU reconstructs/upscales an image and RCAS sharpens the result. A simple sharpening filter is **not FSR**, and a full integration needs the source image, correct render-target dimensions, a suitable pipeline stage, and compatible sampling behavior.

Iris documents composite-style passes and a final fullscreen pass. That gives shaderpacks a place to experiment with post-processing, but does not automatically mean a pack can control Minecraft's entire render resolution or reproduce every part of a game's native FSR integration.

References:
- Iris program overview: https://shaders.properties/current/reference/programs/overview/
- Iris final pass: https://shaders.properties/current/reference/programs/final/
- AMD FSR 1 overview and integration notes: https://gpuopen.com/fidelityfx-superresolution/
- Official FSR 1 source and MIT licence: https://github.com/GPUOpen-Effects/FidelityFX-FSR

## Current prototype

- `shaders/final.vsh` supplies texture coordinates for a fullscreen post-process.
- `shaders/final.fsh` applies a conservative five-sample, cross-neighbour sharpening filter with local min/max clamping.
- The filter is an original, FSR-inspired experiment. It is **not** AMD's EASU or RCAS code, and the project does not claim to implement FSR yet.
- Runtime behavior and image quality have not been verified in Minecraft + Iris. If the final pass fails to load or produces artifacts, disable/remove the experimental pass before changing the terrain baseline.

## Next steps

1. Test that Iris recognizes and executes the final pass on the target version.
2. Compare screenshots with the effect enabled and disabled; inspect thin geometry, text/UI boundaries, foliage, water, and high-contrast edges for halos or aliasing.
3. Measure frame time rather than assuming sharpening is free.
4. Investigate whether reduced-resolution render targets can be configured reliably in the target Iris shader-pack pipeline, and how that interacts with Minecraft's other render stages.
5. Only then prototype edge-aware upscaling. Evaluate a real port of AMD's FSR 1 only if its shader/API assumptions can be met; retain its MIT licence notice and document all modifications if code is reused.

## Non-goals for this first experiment

- Do not claim FSR 2/3, temporal reconstruction, motion-vector support, or frame generation.
- Do not claim performance gains without measurements.
- Do not remove or alter `signature.ws`.
