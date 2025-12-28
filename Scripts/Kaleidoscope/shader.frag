
#version 120

uniform sampler2D sampler0;
varying vec2 textureCoord;
uniform vec2 textureSize;
uniform float beat;

uniform float zoom;
uniform float rate;
uniform float sides; // Number of mirrored segments (e.g., 6 or 8)
uniform float tiles;

uniform float isPreview;
uniform float previewTime;

vec2 mirror( vec2 uv ) {

    // Taken from the tile shader.

    vec2 tile = floor(uv);         uv = fract(uv);

    vec2 modTile = mod( tile, 2 );

    if ( modTile.x > 0.5 ) uv.x = 1 - uv.x;
    if ( modTile.y > 0.5 ) uv.y = 1 - uv.y;

    return uv;

}

void main() {

    vec2 uv = textureCoord;         float t = bool(isPreview) ? previewTime : beat;


    // Tiling.

    float n = max( 1, tiles );            uv = fract( uv * n ) - 0.5;


    float aspect = textureSize.x / textureSize.y;

    if ( aspect > 1 ) uv.x *= aspect; else uv.y /= aspect;  // Scale it, make it square.

    
    // Convert Cartesian (x, y) to Polar (radius, angle).

    float r = length(uv);            float a = atan( uv.y, uv.x );


    // Divide the circle into 'sides' segments. tau is 2pi

    float tau = 6.28318530718;          float slice = tau / sides;
    

    // Reflect the angle to create the symmetry.

    a = mod( a, slice );            if ( a > slice / 2 ) a = slice - a;


    r *= zoom; // Zoom.


    // Convert back to Cartesian for texture sampling.

    a += t * 0.2 / rate;         uv = r * vec2( cos(a), sin(a) );
    

    // 5. Map back to [0, 1] range for texture sampling.
    
    // Use mirror() to repeat the texture if zooming out far.

    uv += 0.5;          gl_FragColor = texture2D( sampler0, mirror(uv) );

}