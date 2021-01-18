shader_type canvas_item;

const float PI = 3.14;

float smooth_rect(vec2 uv, vec2 pos, vec2 size, float smoothing) {
	vec2 col = smoothstep(pos - size, pos - size + smoothing, uv);
	col *= smoothstep(1.0 - pos - size, 1.0 - pos - size + smoothing, 1.0 - uv);
	return col.x * col.y;
}

float circle(vec2 uv, vec2 center, float radius, float smoothing) {
	return 1.0 - smoothstep(radius - smoothing, radius, distance(center, uv));
}

mat2 rotate2d(float _angle) {
	return mat2(
		vec2(cos(_angle), -sin(_angle)),
		vec2(sin(_angle), cos(_angle))
	);
}

uniform vec4 crosshair_color;

void fragment() {
  vec2 uv = UV;
  float x = uv.x; float y = uv.y;

  float time_scale = 1.0;
  float scaled_time = TIME * time_scale;

  vec4 color = vec4(0.0);
  float smoothing = 0.01;

  vec2 rotated_uv = uv - vec2(0.5);
  vec2 inv_rotated_uv = uv - vec2(0.5);
  rotated_uv *= rotate2d(scaled_time);
  inv_rotated_uv *= rotate2d(-scaled_time);
  rotated_uv += vec2(0.5);
  inv_rotated_uv += vec2(0.5);

  color += circle(uv, vec2(0.5), 0.5, smoothing);
  color -= circle(uv, vec2(0.5), 0.4, smoothing);
  color -= smooth_rect(rotated_uv, vec2(0.5), vec2(0.5, 0.05), smoothing);
  color = clamp(color, 0.0, 1.0);
  color -= smooth_rect(rotated_uv, vec2(0.5), vec2(0.05, 0.5), smoothing);
  color = clamp(color, 0.0, 1.0);
  color += circle(uv, vec2(0.5), 0.35, smoothing);
  color -= circle(uv, vec2(0.5), 0.3, smoothing);
  color -= smooth_rect(inv_rotated_uv, vec2(0.5), vec2(0.35, 0.05), smoothing);
  color = clamp(color, 0.0, 1.0);
  color -= smooth_rect(inv_rotated_uv, vec2(0.5), vec2(0.05, 0.35), smoothing);
  color = clamp(color, 0.0, 1.0);

  color += circle(uv, vec2(0.5), 0.25, smoothing);
  color -= circle(uv, vec2(0.5), 0.22, smoothing);
  color -= smooth_rect(rotated_uv, vec2(0.5), vec2(0.25, 0.05), smoothing);
  color = clamp(color, 0.0, 1.0);
  color -= smooth_rect(rotated_uv, vec2(0.5), vec2(0.05, 0.25), smoothing);
  color = clamp(color, 0.0, 1.0);


  color += smooth_rect(uv, vec2(0.5), vec2(0.05, 0.1), smoothing);
  color += smooth_rect(uv, vec2(0.5), vec2(0.1, 0.05), smoothing);
  color = clamp(color, 0.0, 1.0);
  color -= smooth_rect(uv, vec2(0.5), vec2(0.05, 0.05), smoothing);
  color = clamp(color, 0.0, 1.0);

  color += circle(uv, vec2(0.5), 0.01, smoothing);

  COLOR = color * crosshair_color;
}