
#version 120

uniform sampler2D sampler0;
varying vec2 textureCoord;
uniform float beat;

uniform bool bob;
uniform float type;
uniform float skip;
uniform vec2 magnitude;
uniform float period;

uniform float isPreview;
uniform float previewTime;

void main() {

    float t = bool(isPreview) ? previewTime : beat;            if ( skip > 0 ) t = skip;

    vec2 uv = textureCoord;         float phase = type == 1 ? uv.y : uv.x;

    if (bob) phase = type == 1 ? uv.x : uv.y;

    vec2 r = magnitude * 0.03;          phase = phase * 6 + t * 3.125 * 2 / period;
    
    if ( !bob ) if ( type == 1 ) r.y = r.x; else r.x = r.y;

    uv.x += r.x * cos(phase);           uv.y += r.y * sin(phase);

    gl_FragColor = texture2D( sampler0, uv );

}