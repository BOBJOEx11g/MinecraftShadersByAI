#version 120

uniform sampler2D texture;
uniform sampler2D lightmap;

varying vec2 texcoord;
varying vec2 lmcoord;
varying vec4 vertexColor;

void main() {
    vec4 texel = texture2D(texture, texcoord) * vertexColor;

    // Keep transparent texels in cutout terrain from drawing as solid pixels.
    if (texel.a < 0.1) {
        discard;
    }

    // Respect Minecraft's lightmap so block and sky illumination remain intact.
    vec3 illumination = texture2D(lightmap, lmcoord).rgb;
    gl_FragColor = vec4(texel.rgb * illumination, texel.a);
}
