varying vec3 V_Normal_VCS;
varying vec3 V_ViewPosition;

void main() {

	// ADJUST THESE VARIABLES TO PASS PROPER DATA TO THE FRAGMENTS
	// V_Normal_VCS = vec4(1.0,0.0,0.0, 1.0);
	// V_ViewPosition = vec4(1.0,0.0,0.0, 1.0);
	vec4 vertPos4 = modelViewMatrix * vec4(position, 1.0);
	V_ViewPosition = vec3(vertPos4)/vertPos4.w;
	V_Normal_VCS = normalMatrix * normal;

	gl_Position = projectionMatrix *  modelViewMatrix * vec4(position, 1.0);
}