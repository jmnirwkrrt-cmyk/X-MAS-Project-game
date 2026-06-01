/// @description pActor3D основы
/// pActor3D: Create
// Экранные координаты, их будет считать арена
screen_x = x;
screen_y = y;

shadow_x = x;
shadow_y = y;
shadow_scale = 1;

high = 2; // Рост

coll_radius = 26 // Радиус коллизии

call_in_robot_type = "metalson";
call_in_timer = global.robotic_elevators_timer;

hp = 255 * global.current_diff_mn;
max_hp = hp;

energy = 200;
max_energy = energy;

z = 0;
floor_z = 0;

image_index = 0;
image_speed = 0;