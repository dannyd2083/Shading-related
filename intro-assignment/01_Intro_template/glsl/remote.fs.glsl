uniform int rcState;


void main() {
	// HINT: WORK WITH rcState HERE

	//Paint it red

	if(rcState == 1)
	{
		gl_FragColor = vec4(1, 0, 0, 1);
	}
	if(rcState == 2)
	{
		gl_FragColor = vec4(0, 1, 0, 1);
	}
	if(rcState == 3)
	{
		gl_FragColor = vec4(0, 0, 1, 1);
	}
	if(rcState == 4)
	{
		gl_FragColor = vec4(0,1,1,1);
	}
	if(rcState == 5)
	{
		gl_FragColor = vec4 (1,0,1,1);
	}
	if(rcState == 6)
	{
		gl_FragColor = vec4 (0.5,0.3,0.5,1);
	}
}