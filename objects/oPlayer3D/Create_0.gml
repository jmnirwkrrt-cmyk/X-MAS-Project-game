/// oPlayer3D: Create
/// 3D-игрок для арены


/*
1 - tails
2 - amy
3 - sonic
4 - knuckles
5 - rouge
6 - shadow
7 - silver
8 - snowman
9 - snowman_ak
10 - snowman_rifle
11 - snowman_laser
*/

massive_index = 0;

// === БАЗОВЫЕ СТАТЫ ===
hero_numb  = 2;
hero_index = "tails";
hp = 100; // здоровье
max_hp = hp;
healed_hp = 0;
energy = 100; // энергия (рывки, суперспособности)
energy_cost_super_1 = 30;
energy_cost_super_2 = 50;
energy_cost_flash = 20;
energy_cost_fly = 20;
armor = 0;

amy_tornado_hit_done = false;

max_energy = energy;
spd = 4;
damage = 10;
ammo = 0;
max_ammo = ammo;
reload_time = 0;
reload = reload_time;

// Коллизия
col_radius  = 16;

// Состояние по вертикали (используется твоим jump-кодом)
z       = 0;
floor_z = 0;  // текущий локальный пол (0 или вершина столба)
zmax    = 10;

// Логическое состояние
status = "idle";
direct = "right";

// Вспомогательные флаги движения
move_local_x = 0;
move_local_y = 0;

// Своя скорость вместо hspeed/vspeed
vel_x = 0;
vel_y = 0;

// Боёвка / спец-состояния
jump = 0;
fight = 0;
flash = 0;
fall  = 0;
super = 0;
back  = 0;
hit   = 0;

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
image_speed = 0;

start = 0;
sound_type = "";
enemy_count = 0;
massive_index = 0;
startsound = 0;

hit_1_index = 1;
hit_2_index = 2;
hit_3_index = 3;
jump_start_index = 2;
jump_end_index = 4;

gm3d_combat_ensure(id);