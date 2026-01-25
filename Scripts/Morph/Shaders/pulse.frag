
#version 120

uniform sampler2D sampler0;
varying vec2 textureCoord;
varying vec4 color;
uniform float beat;

uniform vec2 magnitude;
uniform float period;

uniform float isPreview;
uniform float previewTime;

float pi = 3.142;

void main() {

    float t = bool(isPreview) ? previewTime : beat;

    vec2 uv = textureCoord;         vec2 center = uv - 0.5;
    

    float x = abs( center.x );          float y = abs( center.y );

    float length = max( x, y ) * 2;


    float step = 1 - smoothstep( 0.125, 1, length );
    
    float r = magnitude.y + 1;      r *= step * 0.5;
    
    float phase = 180 + t;          phase *= pi / period;       phase = cos(phase);
    

    float zoom = 1 + r * abs(phase);        uv = center / zoom + 0.5;

    gl_FragColor = texture2D( sampler0, uv ) * color;

}