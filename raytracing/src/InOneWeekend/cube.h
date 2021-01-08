#ifndef CUBE_H
#define CUBE_H

#include "rtweekend.h"

#include "triangle.h"
#include "hittable.h"


class cube : public hittable {
    public:
        cube() {}

        cube(point3 cen, double l, shared_ptr<material> m)
            : center(cen), length(l), mat_ptr(m) {};

        virtual bool hit(
            const ray& r, double t_min, double t_max, hit_record& rec) const override;

    public:
        point3 center;
        double length;
        shared_ptr<material> mat_ptr;
};


bool cube::hit(const ray& r, double t_min, double t_max, hit_record& rec) const {
    auto neighbor_y = operator+(center,vec3(0,length,0));
    auto neighbor_x = operator+(center,vec3(length,0,0));
    auto neighbor_z = operator+(center,vec3(0,0,length));

    auto diagonal_left = operator+(center,vec3(0,length,length));
    auto diagonal_right = operator+(center,vec3(length,length,0));
    auto diagonal_bottom = operator+(center,vec3(length,0,length));
    auto diagonal_top = operator+(center,vec3(length,length,length));

    return
    triangle(center,neighbor_y,neighbor_x,mat_ptr).hit(r,t_min,t_max,rec) ||
    triangle(center,neighbor_y,neighbor_z,mat_ptr).hit(r,t_min,t_max,rec) ||
    triangle(center,neighbor_z,neighbor_x,mat_ptr).hit(r,t_min,t_max,rec) ||
    triangle(diagonal_left,neighbor_z,neighbor_y,mat_ptr).hit(r,t_min,t_max,rec) ||
    triangle(diagonal_right,neighbor_y,neighbor_x,mat_ptr).hit(r,t_min,t_max,rec) ||
    triangle(diagonal_bottom,diagonal_left,diagonal_right,mat_ptr).hit(r,t_min,t_max,rec)||
    triangle(diagonal_top,diagonal_left,neighbor_z,mat_ptr).hit(r,t_min,t_max,rec) ||
    triangle(diagonal_top,diagonal_right,neighbor_x,mat_ptr).hit(r,t_min,t_max,rec) ||
    triangle(diagonal_top,diagonal_bottom,neighbor_z,mat_ptr).hit(r,t_min,t_max,rec) ||
    triangle(diagonal_top,diagonal_bottom,neighbor_x,mat_ptr).hit(r,t_min,t_max,rec);

    
    // return true;
}


#endif
