#version 120

uniform sampler2D texture;
uniform sampler2D lightmap;
uniform sampler2D shadowtex0;

uniform mat4 shadowModelView;
uniform mat4 shadowProjection;

const int shadowMapResolution = 1024;
const float shadowDistance = 96.0;

varying vec2 texcoord;
varying vec2 lmcoord;
varying vec4 vertexColor;
varying vec3 feetPlayerPos;

float sampleShadow(vec3 shadowCoord) {
    if (shadowCoord.x <= 0.0 || shadowCoord.x >= 1.0 ||
        shadowCoord.y <= 0.0 || shadowCoord.y >= 1.0 ||
        shadowCoord.z <= 0.0 || shadowCoord.z >= 1.0) {
        return 1.0;
    }

    vec2 texel = vec2(1.0 / float(shadowMapResolution));
    float bias = 0.0012;
    float visible = 0.0;

    visible += step(shadowCoord.z - bias, texture2D(shadowtex0, shadowCoord.xy + texel * vec2(-0.5, -0.5)).r);
    visible += step(shadowCoord.z - bias, texture2D(shadowtex0, shadowCoord.xy + texel * vec2( 0.5, -0.5)).r);
    visible += step(shadowCoord.z - bias, texture2D(shadowtex0, shadowCoord.xy + texel * vec2(-0.5,  0.5)).r);
    visible += step(shadowCoord.z - bias, texture2D(shadowtex0, shadowCoord.xy + texel * vec2( 0.5,  0.5)).r);

    return visible * 0.25;
}

void main() {
    vec4 texel = texture2D(texture, texcoord) * vertexColor;
    if (texel.a < 0.1) {
        discard;
    }

    vec3 illumination = texture2D(lightmap, lmcoord).rgb;

    vec3 shadowViewPos = (shadowModelView * vec4(feetPlayerPos, 1.0)).xyz;
    vec4 shadowClipPos = shadowProjection * vec4(shadowViewPos, 1.0);
    shadowClipPos.z -= 0.0012;
    vec3 shadowNDCPos = shadowClipPos.xyz / shadowClipPos.w;
    vec3 shadowCoord = shadowNDCPos * 0.5 + 0.5;

    float visibility = sampleShadow(shadowCoord);
    float skyLight = clamp(illumination.g * 1.5, 0.0, 1.0);
    float directLight = mix(1.0, mix(0.38, 1.0, visibility), skyLight);

    gl_FragColor = vec4(texel.rgb * illumination * directLight, texel.a);
}
