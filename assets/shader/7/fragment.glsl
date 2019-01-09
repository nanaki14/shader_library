precision mediump float;

uniform float time;
uniform vec2 resolution;

float circle(vec2 p) {
  return length(p);
}

vec2 hash(float p) {
  vec3 p3 = fract(vec3(p) * vec3(0.1031, 0.1030, 0.0973));
  p3 += dot(p3, p3.yzx + 19.19);

  return fract((p3.xx + p3.yz) * p3.zy);
}

void main(void) {
  vec2 uv = (gl_FragCoord.xy / resolution) * 2.0 - 1.0 ;

  float t = sin(time * 4.0) / 2.0 + 0.5;

  // uv.y += mix(0.5, -0.5, t);
  // uv.y += mix(0.5, -0.5, pow(pow(t, 5.0), 0.4));
  uv.y += mix(0.5, -0.5, pow(exp(-3.0 * t), 2.0));
  uv += (hash(time) * 2.0 - 1.0) * 0.14 * exp(-6.5 * fract(time));

  float d = circle(uv);


  vec3 c = vec3(1.0 - smoothstep(0.29, 0.3, d));

  gl_FragColor = vec4(c, 1.0);
}
