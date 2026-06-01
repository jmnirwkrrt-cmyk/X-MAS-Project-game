sound_type = "";
startsound = 0;
live_time = 1500;

z = 25; // переменная высоты
zmax = 10; // макс. высота 
floor_z = 0;
hp = 100; // здоровье
hpmax = hp;
max_hp = hp;
ammo = 0;
hero_numb = 0;
armor = 0;


speed = 6; // скорость движения
image_speed = 4;
point_x = x;
point_y = y;

/* */
/*  */

// Для интеграции с pActor3D / ареной
screen_x     = x;
screen_y     = y;
shadow_x     = x;
shadow_y     = y;
shadow_scale = 15;
high = 0.5; // Рост

// Вспомогательные флаги движения
move_local_x = 0;
move_local_y = 0;
r = 1;

// Своя скорость вместо hspeed/vspeed
vel_x = 0;
vel_y = 0;

jump = 0;
fight = 0;
flash = 0;
fall  = 0;
super = 0;
back  = 0;
hit   = 0;

energy = 0;
max_energy = 0;