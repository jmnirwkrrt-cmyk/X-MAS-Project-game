
sound_play(laser_sound); sound_volume(laser_sound, global.soundvolume);

// Коллизия
col_radius  = 1;
r = col_radius;

// Состояние по вертикали (используется твоим jump-кодом)
z       = 0;
floor_z = 0;  // текущий локальный пол (0 или вершина столба)
zmax    = 0;

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
high = 0.2; // Рост


// Параметры пули
speed = 20;
damage = 0;
penetration = 0;
target_x = 0;
target_y = 0;
target_z = 0;
target_dist = 0;
target_diff = 0;
target_prev_distance = 9999;


/*
// target_x/target_y/target_z должны быть уже "обрезаны" твоим рейкастом
// spd — твоя скорость (НЕ переменная speed!)
spd = speed; // если у тебя уже есть speed как аргумент — лучше переименуй в spd

// убиваем встроенную кинематику GM, чтобы она не мешала
speed  = 0;
hspeed = 0;
vspeed = 0;
gravity = 0;

var dx = target_x - x;
var dy = target_y - y;
var dz = target_z - z;

dist_total = sqrt(dx*dx + dy*dy + dz*dz);
if (dist_total < 0.0001) { instance_destroy(); exit; }

dirx = dx / dist_total;
diry = dy / dist_total;
dirz = dz / dist_total;

vx = dirx * spd;
vy = diry * spd;
vz = dirz * spd;

life = 1800;
*/