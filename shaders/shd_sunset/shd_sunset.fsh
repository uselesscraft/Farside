//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 sampled_color = texture2D( gm_BaseTexture, v_vTexcoord );
	vec3 sunset = vec3(1.0, 0.78, 0.48);
	
	if (sampled_color.r > 0.1 &&
    sampled_color.g > 0.1 &&
    sampled_color.b > 0.1)
	{
	    sampled_color.rgb = mix(sampled_color.rgb, sunset, 0.85);
	}
	
	gl_FragColor = sampled_color;
}
