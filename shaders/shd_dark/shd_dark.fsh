//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 sampled_color = texture2D( gm_BaseTexture, v_vTexcoord );
	
	if (sampled_color.rgb == vec3(0, 0, 0)) {
		sampled_color.rgb = vec3(1, 1, 1);
	} else if (sampled_color.rgb == vec3(1, 1, 1)) {
		sampled_color.rgb = vec3(0, 0, 0);
	}
	
	gl_FragColor = sampled_color;
}
