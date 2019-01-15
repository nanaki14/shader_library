precision mediump float;

uniform float time;
uniform vec2 resolution;
uniform vec2 mouse;

float plot(vec2 st, float pct) {
  return smoothstep(pct - 0.02,pct, st.y) - smoothstep(pct, pct + 0.02, st.y);
}


void main(void) {
  vec2 uv = (gl_FragCoord.st / resolution) * 2.0 - 1.0;

  vec2 m = 2.0 * (gl_FragCoord.xy / sin(time)) - 1.0;

  gl_FragColor = vec4(uv.y * cos(time), sin(time) / 1.7, uv.x * sin(time), 1.0);
}
