#version 120

// Positions and normals are passed into player/world space for shadow lookup.
varying vec2 texcoord;
varying vec2 lmcoord;
varying vec4 vertexColor;
varying vec3 feetPlayerPos;
varying vec3 worldNormal;

uniform mat4 gbufferModelViewInverse;

void main() {
    gl_Position = ftransform();
    texcoord = (gl_TextureMatrix[0] * gl_MultiTexCoord0).xy;
    lmcoord = (gl_TextureMatrix[1] * gl_MultiTexCoord1).xy;
    vertexColor = gl_Color;
    feetPlayerPos = (gbufferModelViewInverse * gl_ModelViewMatrix * gl_Vertex).xyz;
    worldNormal = normalize(mat3(gbufferModelViewInverse) * gl_NormalMatrix * gl_Normal);
}
