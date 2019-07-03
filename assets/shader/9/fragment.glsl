precision highp float;

uniform float time;
uniform vec2 resolution;


float gTime = 0.0;

vec3 returnSinBeam(
    vec2 p,
    vec3 diff,
    float h,
    float split,
    bool sum
  ) {
    // float s = step(smoothstep(p.y + sin(p.x), 0.01, -0.01), p.y);
    float s = 0.01 / abs(p.y + sin(p.x * 10.0) * 0.3);
    float r;
    float g;
    float b;

    if (sum) {
      r = 0.01 / abs(p.y + vec2(diff.r, 0.0).x + sin(p.x * split + time) * h);
      g = 0.01 / abs(p.y + vec2(diff.g, 0.0).x + sin(p.x * split + time) * h);
      b = 0.01 / abs(p.y + vec2(diff.b, 0.0).x + sin(p.x * split + time) * h);
    } else {
      r = 0.01 / abs(p.y + vec2(diff.r, 0.0).x + sin(p.x * split - time) * h);
      g = 0.01 / abs(p.y + vec2(diff.g, 0.0).x + sin(p.x * split - time) * h);
      b = 0.01 / abs(p.y + vec2(diff.b, 0.0).x + sin(p.x * split - time) * h);
    }

    return vec3(r, g, b);
  }

vec3 render(vec2 uv) {

  vec3 diff = vec3(-0.01, 0.0015, 0.005);

  vec3 c = returnSinBeam(uv, diff, 0.3, 10.0, false);

  c += returnSinBeam(uv, diff, 0.5, 13.0, true);
  c += returnSinBeam(uv, diff, 0.9, 15.0, false);

  return vec3(c);

}

void main(void) {
  vec2 uv = (gl_FragCoord.st / resolution) * 2.0 - 1.0;

  vec3 c = vec3(0.0);
  const int iter = 32;

  for (int i = 0; i < iter; i++) {
    gTime = time - float(i) * 0.0015;
   c += render(uv);
  }

  c /= float(iter);

  gl_FragColor = vec4(c, 1.0);
}
