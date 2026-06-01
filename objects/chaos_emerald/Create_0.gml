/// @description pActor3D основы
/// pActor3D: Create
// Экранные координаты, их будет считать арена
screen_x = x;
screen_y = y;

shadow_x = x;
shadow_y = y;
shadow_scale = 1;

high = 0.6; // Рост

coll_radius = 16 // Радиус коллизии

emerald_sprite = spr_nothing;
emerald_color = c_white;

founded = false; // Найден ли изумруд
taken_by = noone; // Кем взят (если взят)
evacuated = false;

z = 0;
floor_z = 0;