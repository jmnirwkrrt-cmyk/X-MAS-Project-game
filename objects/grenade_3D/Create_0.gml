oArena3D.grenades--;
throwv = 10;
speed = 10;


// Коллизия
col_radius  = 1;
r = col_radius;

// Состояние по вертикали (используется твоим jump-кодом)
z       = 0;
floor_z = 0;  // текущий локальный пол (0 или вершина столба)
zmax    = 120;

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
shadow_scale = 0.5;
high = 0.25; // Рост


// Параметры гранаты
damage = 35;
penetration = 0;
target_x = 0;
target_y = 0;
target_z = 0;
target_dist = 0;
target_diff = 0;
target_prev_distance = 9999;




/*
// Входные: target_x, target_y, target_z
// Опционально: arc_h (высота дуги), g (гравитация), spin

// чтобы GM не добавлял своё движение
speed   = 0;
hspeed  = 0;
vspeed  = 0;
gravity = 0;

g = 0.35;              // подбирай под ощущения
arc_h = 140;           // насколько выше максимума (z/target_z) поднимать вершину
spin = 12;             // скорость вращения спрайта

var dx = target_x - x;
var dy = target_y - y;
var dz = target_z - z;

var dist2d = sqrt(dx*dx + dy*dy);
if (dist2d < 0.0001) { instance_destroy(); exit; }

// выбираем вершину дуги
var apex_z = max(z, target_z) + arc_h;

// начальная вертикальная скорость, чтобы долететь до apex_z
var up = apex_z - z;
if (up < 0) up = 0;
vz = sqrt(2 * g * up);

// время вверх и вниз до target_z
var t_up = (g > 0) ? (vz / g) : 0;

var down = apex_z - target_z;
if (down < 0) down = 0;
var t_down = (g > 0) ? sqrt(2 * down / g) : 0;

T = t_up + t_down;
if (T < 1) T = 1;

// горизонтальная скорость, чтобы за T прийти в target_x/y
vx = dx / T;
vy = dy / T;

// таймеры/страховки
t = 0;
life = ceil(T) + 90;

// для ориентации/оверфлоу
dirx2d = dx / dist2d;
diry2d = dy / dist2d;
*/