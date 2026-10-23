#version 120

uniform sampler2D colortex0;
uniform float viewWidth;
uniform float viewHeight;

varying vec2 texcoord;

void main() {
    vec2 pixel = vec2(1.0 / viewWidth, 1.0 / viewHeight);

    vec3 center = texture2D(colortex0, texcoord).rgb;
    vec3 north  = texture2D(colortex0, texcoord + vec2(0.0, -pixel.y)).rgb;
    vec3 south  = texture2D(colortex0, texcoord + vec2(0.0,  pixel.y)).rgb;
    vec3 east   = texture2D(colortex0, texcoord + vec2( pixel.x, 0.0)).rgb;
    vec3 west   = texture2D(colortex0, texcoord + vec2(-pixel.x, 0.0)).rgb;

    // Conservative cross-neighbour sharpening prototype.
    // This is inspired by spatial sharpening, not AMD's FSR/RCAS implementation.
    vec3 neighbourAverage = (north + south + east + west) * 0.25;
    vec3 sharpened = center + (center - neighbourAverage) * 0.20;

    // Limit overshoot to the local neighbourhood to reduce bright/dark halos.
    vec3 localMin = min(center, min(min(north, south), min(east, west)));
    vec3 localMax = max(center, max(max(north, south), max(east, west)));
    gl_FragColor = vec4(clamp(sharpened, localMin, localMax), 1.0);
}
