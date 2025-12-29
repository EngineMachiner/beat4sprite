
// This is only used for the tiled kaleidoscope.
// It is very improbable that a shader will be used for tiling because of custom behaviour.
// Creates a mirrored symmetric texture.

#version 120

uniform sampler2D sampler0;
varying vec2 textureCoord;

void main() {

    vec2 uv = textureCoord;         //uv += beat * 0.05;

    vec2 tile = floor(uv);         uv = fract(uv);

    vec2 modTile = mod( tile, 2 );

    if ( modTile.x > 0.5 ) uv.x = 1 - uv.x;
    if ( modTile.y > 0.5 ) uv.y = 1 - uv.y;

    gl_FragColor = texture2D( sampler0, uv );

}