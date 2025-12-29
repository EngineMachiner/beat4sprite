
#version 120

uniform sampler2D sampler0;
varying vec2 textureCoord;
uniform float beat;

uniform float period;

uniform float isPreview;
uniform float previewTime;

float pi = 3.142;
float stripes = 64;
float smoothness = 0.5;

void main() {

    float t = bool(isPreview) ? previewTime : beat;

    vec2 uv = textureCoord;         float edge = cos( uv.y * stripes );
    
    float direction = smoothstep( - smoothness, smoothness, edge ) * 2 - 1;

    float phase = t * 2 * pi / period;        uv.x += direction * cos(phase) / 300;

    gl_FragColor = texture2D( sampler0, uv );

}