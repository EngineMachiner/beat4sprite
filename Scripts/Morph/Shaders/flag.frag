
#version 120

uniform sampler2D sampler0;
varying vec2 textureCoord;
varying vec4 color;
uniform float beat;

uniform bool bob;
uniform float type;
uniform float skip;
uniform vec2 magnitude;
uniform float period;

uniform float isPreview;
uniform float previewTime;

float pi = 3.142;

void main() {

    float t = bool(isPreview) ? previewTime : beat;            if ( skip > 0 ) t = skip;

    vec2 uv = textureCoord;
    

    vec2 r = magnitude * 0.03;

    if ( !bob ) if ( type == 1 ) r.y = r.x; else r.x = r.y;

    
    float phase = type == 1 ? uv.y : uv.x;          if (bob) phase = type == 1 ? uv.x : uv.y;

    phase *= 6;         phase += t * 2 * pi / period;
    

    float x = r.x * cos(phase);         float y = r.y * sin(phase);

    uv += vec2( x, y );
    

    gl_FragColor = texture2D( sampler0, uv ) * color;

}