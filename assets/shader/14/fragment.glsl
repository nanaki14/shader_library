precision mediump float;

uniform float time;
uniform vec2 resolution;
uniform vec2 mouse;
uniform sampler2D texture;

#define VERT false
// #define THR ( mouse.x < 1.0 ? ( sin( time * 2.0 ) * 0.5 + 0.3 ) : mouse.x / resolution.x )
#define THR ( mouse.x < 1.0 ? ( 0.8 + sin(time * 1.0 * 3.14) * 0.1 ) : mouse.x / resolution.x )
#define SHADOW true
#define REVERSE false

float gray( vec3 c ) {
    return dot( c, vec3( 0.299, 0.587, 0.114 ) );
}

vec3 toRgb( float i ) {
    // return vec3(
    //     mod( i, 256.0 ),
    //     mod( floor( i / 256.0 ), 256.0 ),
    //     floor( i / 65536.0 )
    // ) / 255.0;
    return vec3(
        mod( i, 256.0 ),
        mod( i, 256.0 ),
        mod( i, 256.0 )
    ) / 255.0;
}

bool thr( float v ) {
    return SHADOW ? ( THR < v ) : ( v < THR );
}

vec4 draw( vec2 uv ) {
    vec2 dirVec = VERT ? vec2( 0.0, 1.0 ) : vec2( 1.0, 0.0 );
    float wid = VERT ? resolution.y : resolution.x;
    float pos = VERT ? floor( uv.y * resolution.y ) : floor( uv.x * resolution.x );

    float val = gray( texture2D( texture, uv ).xyz );

    if ( !thr( val ) ) {
        float post = pos;
        float rank = 0.0;
        float head = 0.0;
        float tail = 0.0;

        // for ( int i = 0; i < int( wid ); i ++ ) {
        for ( int i = 0; i < 600; i ++ ) {
            post -= 1.0;
            if ( post == -1.0 ) { head = post + 1.0; break; }
            vec2 p = dirVec * ( post + 0.5 ) / wid + dirVec.yx * uv;
            float v = gray( texture2D( texture, p ).xyz );
            if ( thr( v ) ) { head = post + 1.0; break; }
            if ( v <= val ) { rank += 1.0; }
        }

        post = pos;
        // for ( int i = 0; i < int( wid ); i ++ ) {
        for ( int i = 0; i < 600; i ++ ) {
            post += 1.0;
            if ( wid == post ) { tail = post - 1.0; break; }
            vec2 p = dirVec * ( post + 0.5 ) / wid + dirVec.yx * uv;
            float v = gray( texture2D( texture, p ).xyz );
            if ( thr( v ) ) { tail = post - 1.0; break; }
            if ( v < val ) { rank += 1.0; }
        }

        pos = REVERSE ? ( tail - rank ) : ( head + rank );
    }

    return vec4( toRgb( pos ), 1.0 );
}

void main(void) {
  vec4 c = draw( gl_FragCoord.xy / resolution.xy );
  c = vec4(
        smoothstep(0.5, 1.0, c.x),
        c.y,
        0.1 + 0.8 * c.z,
        1.0
     );
  gl_FragColor = c;
}
