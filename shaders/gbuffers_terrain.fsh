#version 120

uniform sampler2D texture;
varying vec2 texcoord;
varying vec4 vertexColor;

void main() {
    vec4 texel = texture2D(texture, texcoord);
    gl_FragColor = texel * vertexColor;
}
