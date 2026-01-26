
#version 120

uniform sampler2D sampler0;
varying vec2 textureCoord;
varying vec4 color;
uniform float beat;

uniform vec3 magnitude;
uniform float period;

uniform float isPreview;
uniform float previewTime;

float pi = 3.142;

void main() {

    float t = bool(isPreview) ? previewTime : beat;

    vec2 uv = textureCoord;         vec2 center = uv - 0.5;

    vec3 mag = magnitude + 1;


    float length = length(center) * 2;


    float step = 1 - smoothstep( 0, 1, length );        float r = mag.z * step * 0.75;

    float phase = t * 2 * pi / period;          phase = cos(phase);


    float x = cos(r * phase );            float y = sin( r * phase );

    uv.x = center.x * x - center.y * y;
    uv.y = center.x * y + center.y * x;         uv += 0.5;

    gl_FragColor = texture2D( sampler0, uv ) * color;

}