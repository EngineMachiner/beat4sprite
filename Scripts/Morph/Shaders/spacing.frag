
#version 120

uniform sampler2D sampler0;
varying vec2 textureCoord;
uniform float beat;

uniform float period;

uniform float isPreview;
uniform float previewTime;

void main() {

    float t = bool(isPreview) ? previewTime : beat;

    float stripes = 64;         vec2 uv = textureCoord;         float smoothness = 0.5;
    
    float edge = cos( uv.y * stripes );
    
    float direction = smoothstep( - smoothness, smoothness, edge ) * 2 - 1;

    float phase = t * 3.125 * 2 / period;        uv.x += direction * cos(phase) / 300;

    gl_FragColor = texture2D( sampler0, uv );

}