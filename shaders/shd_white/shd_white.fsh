varying vec2 v_vTexcoord;

void main()
{
    vec4 sampled_color = texture2D(gm_BaseTexture, v_vTexcoord)

    gl_FragColor = vec4(1.0, 1.0, 1.0, sampled_color.a)
}