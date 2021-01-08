#ifndef LIGHT_H
#define LIGHT_H

#include "rtweekend.h"


class light {
    public:
    point3 position;
    vec3 color;

};


class point_light: public light {
   

    public:
        point_light() {
        position = unit_vector(vec3(23,88,0));
        };
        vec3 postion() { return position;}

     public:
        vec3 color;
        vec3 position;
       
};


class direction_light: public light {

    public:
        direction_light() {;
            dir = unit_vector(vec3(13,24,12));
        };
        vec3 direction() {return dir;}
    public:
        vec3 color;
        vec3 dir;
};



#endif