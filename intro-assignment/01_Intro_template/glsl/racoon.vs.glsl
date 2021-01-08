// Create shared variable for the vertex and fragment shaders
varying vec3 interpolatedNormal;
varying vec3 racoonPos;
mat4 translate;
mat4 scale;
varying float distV;
uniform vec3 remotePosition;
uniform float emphasize;
uniform int rcState;


/* HINT: YOU WILL NEED A DIFFERENT SHARED VARIABLE TO COLOR ACCORDING TO POSITION */

void main() {
    // Set shared variable to vertex normal
    interpolatedNormal = normal;
    
    // translate[0] = vec4(1.0, 0.0, 0.0, 0.0);
    // translate[1] = vec4(0.0, 1.0, 0.0, 0.0);
    // translate[2] = vec4(0.0, 0.0, 0.0, 1.0);
    // translate[3] = vec4(0.0, 0.0, 0,0, 1.0);
    
    scale[0] = vec4(1.8,0.0,0.0,0.0);
    scale[1] = vec4(0.0,1.8,0.0,0.0);
    scale[2] = vec4(0.0,0.0,1.8,0.0);
    scale[3] = vec4(0.0,0.0,0.0,1.0);
    racoonPos = position;
    racoonPos.z = racoonPos.z-1.1;
    vec4 worldPos = modelMatrix * vec4(racoonPos, 1.0);
    // vec3 dist = (remotePosition - racoonPos); 
    // distV = distance(racoonPos, remotePosition);
    distV = distance(vec3(worldPos),remotePosition);

    // distV = length(distV);

    // Multiply each vertex by the model-view matrix and the projection matrix to get final vertex position
    gl_Position = projectionMatrix * modelViewMatrix * scale * vec4(racoonPos, 1.0);

    if(rcState == 4)
    {
        if(mod(distV, 2.0) >= 0.5)
        {
            gl_Position = projectionMatrix * modelViewMatrix* scale * vec4(racoonPos + vec3(0,-emphasize,0), 1.0);
        }
        if(mod(distV, 2.0) < 0.5)
        {
            gl_Position = projectionMatrix * modelViewMatrix* scale * vec4(racoonPos + vec3(0,emphasize,0), 1.0);
        }
    }
    if(rcState == 5)
    {
        if (distV <= 4.0)
        {
            gl_Position = projectionMatrix * modelViewMatrix* scale * vec4(racoonPos * vec3(emphasize,emphasize,emphasize), 1.0);
        }
    }
     if(rcState == 6)
    {
        if (distV <= 4.0)
        {
            gl_Position = projectionMatrix * modelViewMatrix* scale * vec4(racoonPos/vec3(emphasize,emphasize,emphasize), 1.0);
        }
    }

}
