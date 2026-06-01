/// @description pActor3D основы
/// pActor3D: Create
// Экранные координаты, их будет считать арена
screen_x = x;
screen_y = y;

shadow_x = x;
shadow_y = y;
shadow_scale = 1;

high = 2.3; // Рост

coll_radius = 32 // Радиус коллизии

z = 0;
floor_z = 0;

can_be_destroyed = false;
hit_timer = -1;
building_type = 0; // 0 - иглу, 1 - домик, 2 - бочка (взрывоопасная), 3 - камень

image_index = 0;
image_speed = 0;
image_blend = c_white;