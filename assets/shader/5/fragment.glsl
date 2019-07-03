precision highp float;

uniform float time;
uniform vec2 resolution;

float circle(vec2 p) {
  return length(p);
}

void main() {
  vec2 uv = (gl_FragCoord.xy / resolution) * 2.0 - 1.0 ;

  float d = circle(uv);

  gl_FragColor = vec4(vec3(1.0 - smoothstep(0.79, 0.8, d)), 1.0);
}
