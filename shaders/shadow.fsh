#version 120

uniform sampler2D texture;

varying vec2 texcoord;
varying vec4 vertexColor;

void main() {
    // Preserve alpha-cutout silhouettes (leaves, grass, flowers) in the shadow map.
    vec4 texel = texture2D(texture, texcoord) * vertexColor;
    if (texel.a < 0.1) {
        discard;
    }

    // Depth is written by the shadow pass; colour is unused by this prototype.
    gl_FragColor = vec4(1.0);
}
