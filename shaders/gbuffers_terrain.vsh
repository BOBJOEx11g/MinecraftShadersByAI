#version 120

// Conservative fixed-function inputs for the initial Iris terrain pass.
varying vec2 texcoord;
varying vec2 lmcoord;
varying vec4 vertexColor;

void main() {
    gl_Position = ftransform();
    texcoord = (gl_TextureMatrix[0] * gl_MultiTexCoord0).xy;
    lmcoord = (gl_TextureMatrix[1] * gl_MultiTexCoord1).xy;
    vertexColor = gl_Color;
}
