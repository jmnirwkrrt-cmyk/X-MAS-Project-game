
image_angle++;

direction = point_direction(x, y, target_x, target_y);
if (z < target_z) z += (target_diff / target_dist) * speed;
else
if (z > target_z) z -= (target_diff / target_dist) * speed;

var distance = point_distance_3d(x, y, z, target_x, target_y, target_z);
if (distance > target_prev_distance) instance_destroy(self);
target_prev_distance = distance;


if (distance < 1) instance_destroy(self);
