
#version 120

uniform sampler2D sampler0;
varying vec2 textureCoord;
uniform float beat;

uniform float type;
uniform float period;

uniform float isPreview;
uniform float previewTime;

float stretch = 50;

void main() {

    vec2 uv = textureCoord;

    float t = bool(isPreview) ? previewTime : beat;         t /= 8 * period;

    float ramp = fract(t - 0.5 );           float mask = abs( ramp * 2 - 1 );
    
    if ( type == 1 && uv.x < mask ) { uv.x /= stretch;        uv.x += mask - mask / stretch; }
    if ( type == 2 && uv.y < mask ) { uv.y /= stretch;        uv.y += mask - mask / stretch; }

    gl_FragColor = texture2D( sampler0, uv );

}