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

vec3 render(vec2 p) {
  float t = sin(time * 4.0) / 2.0 + 0.5;

  // p.y += mix(0.5, -0.5, t);
  // p.y += mix(0.5, -0.5, pow(pow(t, 5.0), 0.4));
  // p.y += mix(0.5, -0.5, pow(exp(-3.0 * t), 2.0));
  p += (hash(time * 15.0) * 2.0 - 1.0) * 1.14 * exp(-16.5 * fract(time * 4.0));

  float d = circle(p);

  return vec3(1.0 - smoothstep(0.5, 0.51, d));
}

void main(void) {
  vec2 uv = (gl_FragCoord.xy / resolution) * 2.0 - 1.0 ;

  float cos = cos(time);
  // 速度や雰囲気変わる
  float sin = sin(time);

  for (int i = 0; i < 1; i++) {
    // 密度
    uv = abs(vec2(uv * 1.5)) - 0.75;
    uv *= mat2(cos, sin, -sin, cos);
  }

  vec3 c = vec3(0.0);

  const int iter = 16;

  c += vec3(render(uv));

  gl_FragColor = vec4(c, 1.0);
}
