# Baseline validation

## Automated smoke test

Every push and pull request runs GLSL syntax checks on the terrain, shadow, and final vertex/fragment shaders using `glslangValidator`. The workflow also checks that the essential shader-pack files and `signature.ws` exist.

The terrain prototype samples Minecraft's lightmap and discards nearly transparent texels. An initial four-tap shadow-map lookup is now in the terrain pass, with alpha-aware shadow shaders in `shaders/shadow.vsh` and `shaders/shadow.fsh`. An experimental fullscreen sharpening pass lives in `shaders/final.vsh` and `shaders/final.fsh`; it is FSR-inspired, not a port of AMD FSR. The smoke test only checks syntax and required files, and does not verify visual correctness.

This catches basic shader syntax errors and accidental removal of required project files. It **does not** prove that the shader pack loads or renders correctly in Iris.

## Required in-game test

A real Iris runtime test is still required because this repository's CI runner does not launch Minecraft. On the target installation:

1. Record Minecraft version, Iris version, mod loader, operating system, GPU, and driver.
2. Download the repository as a ZIP from GitHub.
3. Confirm `shaders/` is at the ZIP root, not nested inside an extra repository folder.
4. Put the ZIP in the Minecraft `shaderpacks` folder and select it in Iris.
5. Check whether Iris accepts the pack, terrain renders normally, and shadows are visible without severe acne or dark borders.
6. Check whether the final post-processing pass loads; compare sharpness and inspect edges for halos, then test with it disabled if anything looks wrong.
7. If shadows fail, inspect the shadow-pass and terrain-pass errors; capture the Iris shader compile log and latest game log.
8. Test a normal world in daylight, at night, underground, and in another dimension if the pack loads.

## Interpreting results

- **CI smoke test passes:** the two shader files pass the available standalone GLSL syntax check.
- **Iris loads successfully:** the target runtime accepted the pack in that tested setup.
- **Performance/visual tests pass:** record the actual hardware, scene, settings, and results before claiming compatibility.

A passing CI check is not a substitute for in-game testing.
