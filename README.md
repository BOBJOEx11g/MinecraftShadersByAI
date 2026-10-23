# MinecraftShadersByAI

An experimental Minecraft shader pack built by AI, one step at a time.

## Status

This is the initial scaffold, not a finished visual shader. The first milestone is a minimal Iris-compatible pack structure; visual effects will be added and tested incrementally.

## Requirements

- Minecraft Java Edition
- Iris Shaders
- A compatible graphics driver

## Install for testing

1. Download or clone this repository.
2. Make sure the shader-pack files are at the root of a folder or ZIP, with `shaders/` directly inside it.
3. Put the ZIP in Minecraft's `shaderpacks` folder.
4. Select it in Iris's shader-pack menu.

If it fails to load on your Minecraft/Iris version, check the shader compile log before adding more effects.

## Roadmap

- [x] Establish project structure
- [ ] Confirm the minimum pack loads on the target Minecraft and Iris versions
- [ ] Add a simple atmospheric colour pass
- [ ] Add configurable effects and performance options
- [ ] Test on integrated and discrete GPUs

See [`docs/ROADMAP.md`](docs/ROADMAP.md) for the next steps.
