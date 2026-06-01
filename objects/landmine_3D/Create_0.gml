
// Коллизия
col_radius  = 10;
r = col_radius;

// Состояние по вертикали (используется твоим jump-кодом)
z       = 0;
floor_z = 0;  // текущий локальный пол (0 или вершина столба)
zmax    = 0;
hp = 0;
fall = 0;
fight = 0;
fly = 0;
jump = 0
flash = 0;
armor = 0;


// Вспомогательные флаги движения
move_local_x = 0;
move_local_y = 0;

// Своя скорость вместо hspeed/vspeed
vel_x = 0;
vel_y = 0;

// Для интеграции с pActor3D / ареной
screen_x     = x;
screen_y     = y;
shadow_x     = x;
shadow_y     = y;
shadow_scale = 0;
high = 0.25; // Рост


time = 50; // Время жизни



image_speed = 0.5;

