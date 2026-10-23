# Baseline validation

## Automated smoke test

Every push and pull request runs a GLSL syntax check on the current terrain vertex and fragment shaders using `glslangValidator`. The workflow also checks that the essential shader-pack files and `signature.ws` exist.

The terrain prototype currently samples Minecraft's lightmap and discards nearly transparent texels, but the smoke test only checks syntax and required files. It does not verify the visual result of those changes.

This catches basic shader syntax errors and accidental removal of required project files. It **does not** prove that the shader pack loads or renders correctly in Iris.

## Required in-game test

A real Iris runtime test is still required because this repository's CI runner does not launch Minecraft. On the target installation:

1. Record Minecraft version, Iris version, mod loader, operating system, GPU, and driver.
2. Download the repository as a ZIP from GitHub.
3. Confirm `shaders/` is at the ZIP root, not nested inside an extra repository folder.
4. Put the ZIP in the Minecraft `shaderpacks` folder and select it in Iris.
5. Check whether Iris accepts the pack and whether terrain renders normally.
6. If it fails, capture the Iris shader compile log and the latest game log.
7. Test a normal world in daylight, at night, underground, and in another dimension if the pack loads.

## Interpreting results

- **CI smoke test passes:** the two shader files pass the available standalone GLSL syntax check.
- **Iris loads successfully:** the target runtime accepted the pack in that tested setup.
- **Performance/visual tests pass:** record the actual hardware, scene, settings, and results before claiming compatibility.

A passing CI check is not a substitute for in-game testing.
