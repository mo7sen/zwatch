shader_type canvas_item;

float smooth_rect(vec2 uv, vec2 pos, vec2 size, float smoothing) {
  vec2 col = smoothstep(pos - size, pos - size + smoothing, uv);
  col *= smoothstep(1.0 - pos - size, 1.0 - pos - size + smoothing, 1.0 - uv);
  return col.x * col.y;
}

float rect(vec2 uv, vec2 pos, vec2 size) {
  return smooth_rect(uv, pos, size, 0.0);
}

float circle(in vec2 uv, in vec2 center, in float radius, in float smoothing) {
	return 1.0 - smoothstep(radius - smoothing, radius, distance(center, uv));
}

uniform vec4 crosshair_color;
const float CROSSHAIR_GAPSIZE = 0.03;

void fragment() {
	vec4 crosshair = vec4(0.0);
	crosshair += circle(UV, vec2(0.5), 0.4, 0.01);
	crosshair -= circle(UV, vec2(0.5), 0.3, 0.01);
	
	crosshair += rect(UV, vec2(0.5), vec2(CROSSHAIR_GAPSIZE, abs(sin(TIME)) * 0.1 + 0.1));
	crosshair += rect(UV, vec2(0.5), vec2(abs(sin(TIME)) * 0.1 + 0.1, CROSSHAIR_GAPSIZE));
	
	COLOR = crosshair * crosshair_color;
}