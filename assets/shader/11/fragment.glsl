precision highp float;

uniform float time;
uniform vec2 resolution;
uniform sampler2D texture;

vec3 render(vec2 p) {
  vec4 t = texture2D(texture, p);
  vec3 c = vec3(0.0);

  c += vec3(t.r, t.g, t.b);

  return c;
}

void main(void) {
  vec2 uv = (gl_FragCoord.xy / resolution) * 2.0 - 1.0 ;
  vec2 tuv = gl_FragCoord.xy / resolution;

  vec4 c = vec4(render(tuv), 1.0);

  gl_FragColor = c;
}
