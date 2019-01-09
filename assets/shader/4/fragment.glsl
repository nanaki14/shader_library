precision mediump float;

uniform float time;
uniform vec2 resolution;

void main() {
    vec2 st = gl_FragCoord.xy/resolution;
  vec3 color = vec3(0.0);

  vec2 bl = step(vec2(0.1), st);
  vec2 tr = step(vec2(0.1), 1.0 - st);

  color = vec3(bl.x * bl.y * tr.x * tr.y);

  gl_FragColor = vec4(color, 1.0);
}
