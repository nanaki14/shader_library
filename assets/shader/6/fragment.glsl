precision mediump float;

uniform float time;
uniform vec2 resolution;

float circle(vec2 p) {
  return length(p);
}

void main() {
  vec2 st = gl_FragCoord.xy/resolution.xy;
  vec3 color = vec3(0.0);

  vec2 pos = vec2(0.5) - st;

  float r = length(pos) * 2.5;
  float a = atan(pos.y, pos.x);

  float f = cos(a * 10.0);

  color = vec3(1.0 - smoothstep(f, f + 0.02, r));

  gl_FragColor = vec4(color, 1.0);
}
