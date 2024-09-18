varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec4 pal_colblack;
uniform vec4 pal_coldgray;
uniform vec4 pal_collgray;
uniform vec4 pal_colwhite;

void main()
{
	vec4 colblack = vec4(0.0/255.0,0.0/255.0,0.0/255.0,255.0/255.0);
	vec4 coldgray = vec4(82.0/255.0,82.0/255.0,82.0/255.0,255.0/255.0);
	vec4 collgray = vec4(167.0/255.0,167.0/255.0,167.0/255.0,255.0/255.0);
	vec4 colwhite = vec4(255.0/255.0,255.0/255.0,255.0/255.0,255.0/255.0);
	vec4 colbase = v_vColour*texture2D(gm_BaseTexture,v_vTexcoord);
	if (colbase == colblack)
	{
		gl_FragColor = pal_colblack;
	}
	if (colbase == coldgray)
	{
		gl_FragColor = pal_coldgray;
	}
	if (colbase == collgray)
	{
		gl_FragColor = pal_collgray;
	}
	if (colbase == colwhite)
	{
		gl_FragColor = pal_colwhite;
	}
}