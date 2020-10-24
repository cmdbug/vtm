#ifdef GLES
precision highp float;
#endif
uniform mat4 u_mvp;
uniform vec4 u_color;
uniform float u_alpha;
uniform vec3 u_light;
attribute vec4 a_pos;
attribute vec2 a_normal;
varying vec4 color;

#ifdef SHADOW
uniform mat4 u_light_mvp;
varying vec4 v_shadow_coords;
#endif

void main() {
    // change height by u_alpha
    vec4 pos = a_pos;
    pos.z *= u_alpha;
    gl_Position = u_mvp * pos;
    // normalize face x/y direction
    vec2 enc = (a_normal / 255.0);

    vec3 r_norm;
    // 1² - |xy|² = |z|²
    r_norm.xy = enc * 2.0 - 1.0;
    // normal points up or down (1,-1)
    float dir = -1.0 + (2.0 * abs(mod(a_normal.x, 2.0)));
    // recreate z vector
    r_norm.z = dir * sqrt(clamp(1.0 - (r_norm.x * r_norm.x + r_norm.y * r_norm.y), 0.0, 1.0));
    r_norm = normalize(r_norm);

    float l = dot(r_norm, normalize(u_light));

    #ifdef SHADOW
    bool hasLight = l > 0.0;
    #endif

    //l *= 0.8;
    //vec3 opp_light_dir = normalize(vec3(-u_light.xy, u_light.z));
    //l += dot(r_norm, opp_light_dir) * 0.2;

    // [-1,1] to range [0,1]
    l = (1.0 + l) / 2.0;

    #ifdef SHADOW
    if (hasLight) {
        l = 0.75 + l * 0.25;
    } else {
        l = 0.5 + l * 0.3;
    }
    #else
    l = 0.75 + l * 0.25;
    #endif

    // extreme fake-ssao by height
    l += (clamp(a_pos.z / 2048.0, 0.0, 0.1) - 0.05);
    color = vec4(u_color.rgb * (clamp(l, 0.0, 1.0)), u_color.a) * u_alpha;

    #ifdef SHADOW
    if (hasLight) {
        vec4 positionFromLight = u_light_mvp * a_pos;
        v_shadow_coords = (positionFromLight / positionFromLight.w);
    } else {
        // Discard shadow on unlighted faces
        v_shadow_coords = vec4(-1.0);
    }
    #endif
}

$$

#ifdef GLES
precision highp float;
#endif
varying vec4 color;

#ifdef SHADOW
varying vec4 v_shadow_coords; // the coords in shadow map

uniform sampler2D u_shadowMap;
uniform vec4 u_lightColor;
uniform float u_shadowRes;
uniform int u_mode;

const bool DEBUG = false;

const float transitionDistance = 0.05; // relative transition distance at the border of shadow tex
const float minTrans = 1.0 - transitionDistance;

const int pcfCount = 2; // the number of surrounding pixels to smooth shadow
const float biasOffset = 0.005; // offset to remove shadow acne
const float pcfTexels = float((pcfCount * 2 + 1) * (pcfCount * 2 + 1));

#if GLVERSION == 20
float decodeFloat (vec4 color) {
    const vec4 bitShift = vec4(
    1.0 / (256.0 * 256.0 * 256.0),
    1.0 / (256.0 * 256.0),
    1.0 / 256.0,
    1.0
    );
    return dot(color, bitShift);
}
#endif
#endif

void main() {
    #ifdef SHADOW
    float shadowX = abs((v_shadow_coords.x - 0.5) * 2.0);
    float shadowY = abs((v_shadow_coords.y - 0.5) * 2.0);
    if (shadowX > 1.0 || shadowY > 1.0) {
        // Outside the light texture set to 0.0
        gl_FragColor = vec4(color.rgb * u_lightColor.rgb, color.a);
        if (DEBUG) {
            gl_FragColor = vec4(0.0, 1.0, 0.0, 0.1);
        }
    } else {
        // Inside set to 1.0; make a transition to the border
        float shadowOpacity = (shadowX < minTrans && shadowY < minTrans) ? 1.0 :
        (1.0 - (max(shadowX - minTrans, shadowY - minTrans) / transitionDistance));
        float distanceToLight = clamp(v_shadow_coords.z - biasOffset, 0.0, 1.0); // avoid unexpected shadow

        // smooth shadow at borders
        float shadowDiffuse = 0.0;
        float texelSize = 1.0 / u_shadowRes;
        for (int x = -pcfCount; x <= pcfCount; x++) {
            for (int y = -pcfCount; y <= pcfCount; y++) {
                #if GLVERSION == 30
                float depth = texture2D(u_shadowMap, v_shadow_coords.xy + vec2(x, y) * texelSize).r;
                #else
                float depth = decodeFloat(texture2D(u_shadowMap, v_shadow_coords.xy + vec2(x, y) * texelSize));
                #endif
                if (distanceToLight > depth) {
                    shadowDiffuse += 1.0;
                }
            }
        }
        shadowDiffuse /= pcfTexels;
        shadowDiffuse *= shadowOpacity;

        if (DEBUG && shadowDiffuse < 1.0) {
            gl_FragColor = vec4(shadowDiffuse, color.gb, 0.1);
        } else {
            gl_FragColor = vec4((color.rgb * u_lightColor.rgb) * (1.0 - u_lightColor.a * shadowDiffuse), color.a);
        }
    }
    #else
    gl_FragColor = color;
    #endif
}
