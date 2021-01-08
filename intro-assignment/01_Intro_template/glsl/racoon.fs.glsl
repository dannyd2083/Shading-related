// Create shared variable. The value is given as the interpolation between normals computed in the vertex shader
varying vec3 interpolatedNormal;
/* HINT: YOU WILL NEED A DIFFERENT SHARED VARIABLE TO COLOR ACCORDING TO POSITION */
varying float change;
varying float distV;
uniform float u_time;
uniform int rcState;
uniform float emphasize;
void main() {
  // Set final rendered color according to the surface normal


  vec3 color = vec3(normalize(interpolatedNormal));

	if(rcState == 1)
  {
	color= vec3(1, 0, 0);
  }
	if(rcState == 2)
  {
	color = vec3(0, 1, 0);
  }
	if(rcState == 3)
  {
	color = vec3(0, 0, 1);
  }
  // gl_FragColor = vec4(0.0, 1.0, 0.949, 1.0);
  if((distV <= 4.0) && ((rcState == 1) || (rcState == 2) ||(rcState == 3)))
  {
    gl_FragColor = vec4(color + vec3(emphasize,emphasize,emphasize),1.0); // REPLACE ME
  }
  else
  {
     gl_FragColor = vec4(normalize(interpolatedNormal),1.0);
  }
  
    

}
