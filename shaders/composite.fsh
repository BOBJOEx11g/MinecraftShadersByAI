#version 120

uniform sampler2D colortex0;
uniform sampler2D depthtex0;

uniform mat4 gbufferProjectionInverse;
uniform mat4 gbufferModelViewInverse;
uniform vec3 cameraPosition;
uniform vec3 sunPosition;
uniform float frameTimeCounter;

varying vec2 texcoord;

float hashCloud(vec2 p) {
    return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453);
}

float cloudNoise(vec2 p) {
    vec2 i = floor(p);
    vec2 f = fract(p);
    f = f * f * (3.0 - 2.0 * f);

    float a = hashCloud(i);
    float b = hashCloud(i + vec2(1.0, 0.0));
    float c = hashCloud(i + vec2(0.0, 1.0));
    float d = hashCloud(i + vec2(1.0, 1.0));
    return mix(mix(a, b, f.x), mix(c, d, f.x), f.y);
}

float cloudDensity(vec3 worldPos) {
    vec2 p = worldPos.xz * 0.0032;
    p += vec2(frameTimeCounter * 0.003, frameTimeCounter * 0.0017);

    float broad = cloudNoise(p);
    float detail = cloudNoise(p * 2.7 + vec2(19.3, 7.1));
    float shape = broad * 0.75 + detail * 0.25;
    return smoothstep(0.53, 0.72, shape);
}

vec4 renderClouds(vec4 sceneColor) {
    float depth = texture2D(depthtex0, texcoord).r;
    if (depth < 0.99999) {
        return sceneColor;
    }

    vec2 ndc = texcoord * 2.0 - 1.0;
    vec4 viewH = gbufferProjectionInverse * vec4(ndc, 1.0, 1.0);
    vec3 viewRay = normalize(viewH.xyz / max(abs(viewH.w), 0.00001));
    vec3 worldRay = normalize(mat3(gbufferModelViewInverse) * viewRay);

    if (worldRay.y < 0.035) {
        return sceneColor;
    }

    const float cloudBase = 150.0;
    const float cloudTop = 190.0;
    float tEnter = max((cloudBase - cameraPosition.y) / worldRay.y, 0.0);
    float tExit = max((cloudTop - cameraPosition.y) / worldRay.y, 0.0);
    if (tExit <= tEnter) {
        return sceneColor;
    }

    float stepLength = (tExit - tEnter) / 8.0;
    float densitySum = 0.0;
    float lightingSum = 0.0;
    vec3 sunWorld = normalize(mat3(gbufferModelViewInverse) * sunPosition);
    float sunLight = clamp(0.62 + sunWorld.y * 0.34, 0.35, 0.96);

    for (int i = 0; i < 8; i++) {
        float t = tEnter + (float(i) + 0.5) * stepLength;
        vec3 worldPos = cameraPosition + worldRay * t;
        worldPos.xz = mod(worldPos.xz, 8192.0);

        float height01 = clamp((worldPos.y - cloudBase) / (cloudTop - cloudBase), 0.0, 1.0);
        float verticalProfile = smoothstep(0.0, 0.22, height01)
                              * (1.0 - smoothstep(0.68, 1.0, height01));
        float density = cloudDensity(worldPos) * verticalProfile;

        densitySum += density * (stepLength / 22.0);
        lightingSum += density * sunLight;
    }

    float alpha = clamp(1.0 - exp(-densitySum * 2.8), 0.0, 0.88);
    if (alpha <= 0.005) {
        return sceneColor;
    }

    float lightFactor = lightingSum / max(densitySum * (22.0 / max(stepLength, 0.0001)), 0.0001);
    vec3 cloudColor = mix(vec3(0.34, 0.39, 0.48), vec3(0.96, 0.97, 1.0), clamp(lightFactor, 0.0, 1.0));
    return vec4(mix(sceneColor.rgb, cloudColor, alpha), sceneColor.a);
}

void main() {
    vec4 sceneColor = texture2D(colortex0, texcoord);
    /* DRAWBUFFERS:0 */
    gl_FragData[0] = renderClouds(sceneColor);
}
