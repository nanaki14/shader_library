precision mediump float;

uniform float time;
uniform vec2 resolution;
uniform vec2 mouse;

const float sphereSize = 1.0;
const vec3 lightDir = vec3(-0.577, 0.577, 0.577);

float distanceFunc(vec3 p) {
  return length(p) - sphereSize;
}

vec3 getNormal(vec3 p){
    float d = 0.0001;
    return normalize(vec3(
        distanceFunc(p + vec3(  d, 0.0, 0.0)) - distanceFunc(p + vec3( -d, 0.0, 0.0)),
        distanceFunc(p + vec3(0.0,   d, 0.0)) - distanceFunc(p + vec3(0.0,  -d, 0.0)),
        distanceFunc(p + vec3(0.0, 0.0,   d)) - distanceFunc(p + vec3(0.0, 0.0,  -d))
    ));
}

void main(void) {
  vec2 p = (gl_FragCoord.xy * 2.0 - resolution) / min(resolution.x, resolution.y );


  // camera
  vec3 cPos = vec3(0.0, 0.0, 2.0); // カメラの位置
  vec3 cDir = vec3(0.0, 0.0, -1.0); // カメラの向き
  vec3 cUp = vec3(0.0, 1.0, 0.0); // カメラの上方向
  vec3 cSide = cross(cDir, cUp); // 外戚を使って横方向を算出
  float targetDepth = 1.5; // フォーカスする震度

  // ray
  vec3 ray = normalize(cSide * p.x + cUp * p.y + cDir * targetDepth);

  float distance = 0.0; // レイに継ぎ足すオブジェクト感の最短距離
  float rLen = 0.0; // レイに継ぎ足す長さ
  vec3 rPos = cPos; // レイの先端位置

  for(int i = 0; i < 16; i++) {
    distance = distanceFunc(rPos);
    rLen += distance;
    rPos = cPos + ray * rLen;
  }

  if(abs(distance) < 0.001) {
    vec3 normal = getNormal(sin(rPos + time));
    float diff = clamp(dot(lightDir, normal), 0.1, 1.0);
    gl_FragColor = vec4(vec3(diff), 1.0);
  } else {
    gl_FragColor = vec4(vec3(0.0), 1.0);
  }
}
