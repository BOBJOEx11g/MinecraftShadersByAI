# MinecraftShadersByAI

An experimental Minecraft Java shader pack aiming for **high visual realism with broad hardware compatibility**.

The goal is not to force every GPU to run the same expensive effects. The pack should scale: a conservative default, optional quality tiers, and graceful fallbacks for features that a device cannot handle.

## Project status

Early prototype. The terrain shaders are undergoing their first automated syntax checks; the pack has **not yet been verified in a running Minecraft + Iris instance**. Do not treat compatibility or visual quality as proven until runtime test results are recorded.

## Design goals

- **Realistic, coherent lighting:** natural daylight and sky colours, believable shadows, atmospheric fog, water, clouds, and restrained colour grading.
- **Performance first:** avoid expensive effects by default; profile each feature; offer Low, Medium, High, and Ultra-style options as they become feasible.
- **Broad compatibility:** prefer common GLSL features and conservative shader paths; include simpler fallbacks rather than requiring ray tracing or a specific GPU vendor.
- **Good defaults:** the pack should look good without users having to tune dozens of settings.
- **Transparent provenance:** only reuse code whose licence and source can be verified. Credit upstream authors, retain required notices, and record exactly what was reused or adapted.
- **Preserve project signatures:** `signature.ws` is intentionally part of the repository and must not be deleted as cleanup.

## Compatibility promise

The goal is to support as many Iris-capable systems as practical, not to promise every GPU or driver will work. Minecraft version, Iris version, operating system, graphics API, GPU features, and driver bugs all affect compatibility. The minimum path will be tested first; advanced effects will be optional.

## Requirements

- Minecraft Java Edition with a compatible Iris installation
- A graphics driver supported by the user's Minecraft/Iris setup

## Install for testing

1. Download the repository ZIP from GitHub.
2. Ensure the ZIP's root contains the `shaders/` folder directly.
3. Put the ZIP in Minecraft's `shaderpacks` folder.
4. Select it in Iris's shader-pack menu.
5. If it fails, enable Iris debug mode and share the shader compile log before changing unrelated settings.

## Development

- [Roadmap](docs/ROADMAP.md)
- [Compatibility and visual design](docs/COMPATIBILITY_AND_DESIGN.md)
- [Baseline testing instructions](docs/TESTING.md)
- [Third-party notices and reuse policy](THIRD_PARTY_NOTICES.md)

A GitHub Actions workflow runs a standalone GLSL syntax smoke test on pushes and pull requests. That check is useful, but it does not replace testing the pack in Minecraft with Iris.
