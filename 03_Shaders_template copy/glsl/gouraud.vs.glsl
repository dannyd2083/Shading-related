varying vec4 V_Color;
varying vec3 normalInterp;
varying vec3 vertPos;
uniform vec3 lightColor_Uniform;
uniform vec3  ambientColor_Uniform;
uniform vec3 lightPosition_Uniform;
uniform float  kAmbient_Uniform;
uniform float kDiffuse_Uniform;
uniform float kSpecular_Uniform;
uniform float  shininess_Uniform;
uniform vec3 baseColor;


void main() {
	vec4 vertPos4 = modelViewMatrix * vec4(position, 1.0);
	vertPos = vec3(vertPos4)/vertPos4.w;

	normalInterp = normalMatrix * normal;
	
	vec3 N = normalize(normalInterp);
	vec3 L = normalize(lightPosition_Uniform-vertPos);

	float lambertian = max(dot(N, L), 0.0);
  	float specular = 0.0;
	vec3 V = normalize(-vertPos);
	vec3 R = reflect(-L,N);
	float specAngle = max(dot(R, V), 0.0);
    specular = pow(specAngle, shininess_Uniform);

	V_Color = vec4(kAmbient_Uniform * ambientColor_Uniform * baseColor + 
				   kDiffuse_Uniform * lambertian * lightColor_Uniform + 
				   kSpecular_Uniform * specular * lightColor_Uniform, 1.0);

	// COMPUTE COLOR ACCORDING TO GOURAUD HERE

	
	// V_Color = vec4(1.0, 0.0, 0.0, 1.0);

	// Position
	gl_Position = projectionMatrix *  modelViewMatrix * vec4(position, 1.0);
}