original_object = noone;
image_speed = 0;
object_x = 0;
object_y = 0;
object_z = 0;

first_run = true;
massive_index = 0;

// Коллизия
col_radius  = 16;

// Состояние по вертикали (используется твоим jump-кодом)
z       = 0;
floor_z = 0;  // текущий локальный пол (0 или вершина столба)
zmax    = 10;

// Для интеграции с pActor3D / ареной
screen_x     = x;
screen_y     = y;
shadow_x     = x;
shadow_y     = y;
shadow_scale = 30;
high = 1; // Рост
sight_obj = noone;

// Для сортировки 2D
depth = room_height - y;
