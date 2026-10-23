# Compatibility and visual design

## Main principle

Aim for realistic rendering that scales down. A shader pack cannot guarantee support on every GPU, operating system, driver, Minecraft version, or Iris version. Compatibility claims must be backed by tests.

## Rendering strategy

1. Start with the most conservative supported shader path and validate it on the target Iris version.
2. Add one effect at a time; keep each change easy to isolate and revert.
3. Prefer established shader-pack conventions supported by Iris over vendor-specific extensions.
4. Treat ray tracing, hardware-specific features, and very expensive screen-space effects as optional experiments, never baseline requirements.
5. Provide low-cost alternatives when a feature is unavailable or too slow.
6. Avoid adding optional effects until the pack compiles and renders correctly in normal gameplay.

## Visual realism priorities

1. Consistent exposure and colour handling.
2. Convincing daylight, sky, and atmospheric fog.
3. Stable shadow mapping and sensible shadow bias.
4. Natural water and translucent materials.
5. Subtle ambient shading and contact cues.
6. Clouds, foliage motion, and optional screen-space effects.
7. Expensive extras only if they justify their frame-time cost.

Realism is not simply maximum brightness, saturation, bloom, or shadow darkness. Each effect must be compared against vanilla scenes under different weather, time-of-day, and dimension conditions.

## Performance tiers

- **Low:** minimize samples and resolution, disable costly optional effects, prioritize stable frame time.
- **Medium:** balanced shadows and atmosphere.
- **High:** higher-quality filtering and optional water/cloud features.
- **Ultra:** experimental costly effects; may require stronger hardware.

Exact options will be chosen only after measurements. Never claim a tier works on a device until tested.

## Testing record

For every test, record:
- Minecraft version
- Iris version and mod loader
- Operating system
- GPU and driver version
- Resolution and preset
- Scene and weather conditions
- Average FPS or frame time, visual issues, and shader compile log

Iris debug mode can help inspect shader loading and compilation. See the [Iris documentation](https://shaders.properties/current/reference/overview/).
