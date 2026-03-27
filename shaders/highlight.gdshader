shader_type canvas_item;

uniform bool shine = false;

group_uniforms Shine;
uniform vec3 shine_color: source_color;
uniform float shine_angle = -45;
uniform float shine_duration = 5;
uniform float shine_speed = 800;
uniform float shine_width = 10;
group_uniforms;

void fragment()
{
	if (shine) {
		// Shine
		vec2 coord = SCREEN_UV / SCREEN_PIXEL_SIZE;
		float dist = abs(
			sin(radians(shine_angle)) * coord.x +
			cos(radians(shine_angle)) * coord.y +
			mod(TIME * shine_speed, shine_duration * shine_speed) - shine_duration * shine_speed * 0.5f
		);
		vec4 tex = texture(TEXTURE, UV);
		COLOR = dist <= shine_width ? vec4(shine_color, 1.f) * tex.a  : tex;
	}
}