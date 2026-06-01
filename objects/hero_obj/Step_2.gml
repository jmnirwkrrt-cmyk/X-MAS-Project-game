/// @description  Загрузка спрайтов
__view_set( e__VW.Visible, 0, true );
__view_set( e__VW.Object, 0, hero_obj );
if (start = 1 and hero_numb = 1 and ammo < 3) { ammo+= 0.01; }
if (start = 0)
{
if (instance_exists(hero_info)) { instance_destroy(hero_info); }
if (hero_numb == 1)
{
hero_index = "tails";
hit_1_index = 7; // номер спрайта с моментом 1 удара
hit_2_index = 12; // номер спрайта с моментом 2 удара
hit_3_index = 18; // номер спрайта с моментом нокаута
jump_start_index = 6; // номер начала роста z
jump_end_index = 16; // номер начала падения z
ammo = 3;

zmax = 10; // макс. высота 
hp = global.tailsmaxhp; // здоровье
spd = 2; // скорость движения
damage = 15; // наносимый урон
instance_create(x,y, hero_info);
}
if (hero_numb == 2)
{
hero_index = "amy";
hit_1_index = 13; // номер спрайта с моментом 1 удара
hit_2_index = 18; // номер спрайта с моментом 2 удара
hit_3_index = 34; // номер спрайта с моментом нокаута
jump_start_index = 11; // номер начала роста z
jump_end_index = 27; // номер начала падения z
ammo = 200;

zmax = 7; // макс. высота 
hp = global.amymaxhp; // здоровье
spd = 1.5; // скорость движения
damage = 25; // наносимый урон
}
if (hero_numb == 3)
{
hero_index = "sonic";
hit_1_index = 5; // номер спрайта с моментом 1 удара
hit_2_index = 9; // номер спрайта с моментом 2 удара
hit_3_index = 15; // номер спрайта с моментом нокаута
jump_start_index = 12; // номер начала роста z
jump_end_index = 27; // номер начала падения z

zmax = 6; // макс. высота 
hp = global.sonicsmaxhp; // здоровье
spd = 3; // скорость движения
damage = 18; // наносимый урон
}
if (hero_numb == 4)
{
hero_index = "knuckles";
hit_1_index = 5; // номер спрайта с моментом 1 удара
hit_2_index = 10; // номер спрайта с моментом 2 удара
hit_3_index = 18; // номер спрайта с моментом нокаута
jump_start_index = 11; // номер начала роста z
jump_end_index = 24; // номер начала падения z

zmax = 6; // макс. высота 
hp = global.knucklesmaxhp; // здоровье
spd = 0.8; // скорость движения
damage = 25; // наносимый урон
}
if (hero_numb == 5)
{
hero_index = "rouge";
hit_1_index = 7; // номер спрайта с моментом 1 удара
hit_2_index = 17; // номер спрайта с моментом 2 удара
hit_3_index = 29; // номер спрайта с моментом нокаута
jump_start_index = 11; // номер начала роста z
jump_end_index = 24; // номер начала падения z

zmax = 10; // макс. высота 
hp = global.rougemaxhp; // здоровье
spd = 1.8; // скорость движения
damage = 17; // наносимый урон
}
if (hero_numb == 6)
{
hero_index = "shadow";
hit_1_index = 5; // номер спрайта с моментом 1 удара
hit_2_index = 8; // номер спрайта с моментом 2 удара
hit_3_index = 12; // номер спрайта с моментом нокаута
jump_start_index = 10; // номер начала роста z
jump_end_index = 20; // номер начала падения z

zmax = 8; // макс. высота 
hp = global.shadowmaxhp; // здоровье
spd = 3; // скорость движения
damage = 18; // наносимый урон
}
if (hero_numb == 7)
{
hero_index = "silver";
hit_1_index = 12; // номер спрайта с моментом 1 удара
hit_2_index = 17; // номер спрайта с моментом 2 удара
hit_3_index = 26; // номер спрайта с моментом нокаута
jump_start_index = 10; // номер начала роста z
jump_end_index = 24; // номер начала падения z

zmax = 7; // макс. высота 
hp = global.silvermaxhp; // здоровье
spd = 1.8; // скорость движения
damage = 20; // наносимый урон
}
if (hero_numb == 8)
{
hero_index = "snowman";
hit_1_index = 7; // номер спрайта с моментом 1 удара
hit_2_index = 11; // номер спрайта с моментом 2 удара
hit_3_index = 15; // номер спрайта с моментом нокаута
jump_start_index = 11; // номер начала роста z
jump_end_index = 23; // номер начала падения z

zmax = 6; // макс. высота 
hp = global.snowmanmaxhp; // здоровье
spd = 1; // скорость движения
damage = 15; // наносимый урон
}
if (hero_numb == 9)
{
hero_index = "snowmanak";
hit_1_index = 7; // номер спрайта с моментом 1 удара
hit_2_index = 9; // номер спрайта с моментом 2 удара
hit_3_index = 18; // номер спрайта с моментом нокаута
jump_start_index = 11; // номер начала роста z
jump_end_index = 23; // номер начала падения z

zmax = 6; // макс. высота 
hp = global.snowmanmaxhp; // здоровье
spd = 1; // скорость движения
damage = 15; // наносимый урон
}
if (hero_numb == 10)
{
hero_index = "snowmanrifle";
hit_1_index = 7; // номер спрайта с моментом 1 удара
hit_2_index = 9; // номер спрайта с моментом 2 удара
hit_3_index = 18; // номер спрайта с моментом нокаута
jump_start_index = 11; // номер начала роста z
jump_end_index = 23; // номер начала падения z

zmax = 6; // макс. высота 
hp = global.snowmanmaxhp; // здоровье
spd = 1; // скорость движения
damage = 15; // наносимый урон
}
if (hero_numb == 11)
{
hero_index = "snowmanlaser";
hit_1_index = 7; // номер спрайта с моментом 1 удара
hit_2_index = 9; // номер спрайта с моментом 2 удара
hit_3_index = 18; // номер спрайта с моментом нокаута
jump_start_index = 11; // номер начала роста z
jump_end_index = 23; // номер начала падения z

zmax = 6; // макс. высота 
hp = global.snowmanmaxhp; // здоровье
spd = 1; // скорость движения
damage = 15; // наносимый урон
}

///////////////////////////////////////
ammomax = ammo;
hpmax = hp;
instance_create(x,y, hero_info);
start = 1;
}


/// Движение
if (keyboard_check_released(vk_shift) and fight = 0 and fall = 0 and jump = 0 and super = 0 and (hero_numb != 8 and hero_numb != 9 and hero_numb != 10 and hero_numb != 11)) 
{
image_index = 0;
status = "flash";
flash = 1;
}
if (keyboard_check(ord("W")) and flash = 0 and fall = 0 and fight = 0 and (super = 0 or (super = 3 and hero_numb = 4 )))
{
up = 1;
down = 0;

status = "run";
direct = "up"; 
}
else { up = 0; }
if (keyboard_check(ord("S")) and flash = 0 and fall = 0 and fight = 0  and (super = 0 or (super = 3 and hero_numb = 4 )))
{
up = 0;
down = 1;

status = "run";
direct = "down";
}
else { down = 0; }
if (keyboard_check(ord("D")) and flash = 0 and fall = 0 and fight = 0  and (super = 0 or (super = 3 and hero_numb = 4 )))
{
right = 1;
left = 0;

status = "run";
direct = "right";

image_xscale = 1; 
}
else { right = 0; }
if (keyboard_check(ord("A")) and flash = 0 and fall = 0 and fight = 0  and (super = 0 or (super = 3 and hero_numb = 4 )))
{
right = 0;
left = 1;

status = "run";
direct = "left";
}
else { left = 0; }

if (keyboard_check_released(vk_space) and flash = 0 and jump = 0 and fight = 0  and fall = 0 and super = 0)
{
jump = 1;
image_index = 0;
}
if (jump = 1 and image_index = jump_start_index)
{
jump = 2;
}
if (jump = 2)
{
z += zmax / (jump_end_index - jump_start_index);
if (image_index = jump_end_index) { jump = 3; }
}
if (jump = 3)
{

z -= zmax / (jump_end_index - jump_start_index);
if (image_index = image_number - 1) { jump = 0; z = 0; status = "idle"; }
}
//
if ((jump = 2 and (hero_numb = 5 or hero_numb = 1) and keyboard_check_released(vk_space)) or jump = -2)
{
if (jump = 2) { image_index = 0; cycle = 3; }
if (image_index = image_number - 1) { cycle--; }
z = zmax;
jump = -2;
status = "fly";
if (image_index = image_number - 1 and cycle = 0) { image_index = 0; jump = 3; status = "jump"; }
}
if (jump = -1 and z > 0 and instance_exists(all_land_objects_parent))
{
land = instance_nearest(x,y, all_land_objects_parent);
if (distance_to_object(land) > land.image_xscale - 0.1 and distance_to_object(land) > land.image_yscale - 0.1)
{
jump = 3;
}
}
if (jump = -1)
{
if (image_index = image_number - 1) { status = "idle"; }
}
/////////////////////////////
if (flash = 1 and hero_numb != 9 and hero_numb != 10 and hero_numb != 11)
{
if (direct = "up") { vspeed = -10; }
if (direct = "down") { vspeed = 10; }
if (direct = "left") { hspeed = -10; }
if (direct = "right") { hspeed = 10; }
if (image_index = image_number - 1) { flash = 2; }
}
if (flash = 2)
{
status = "run";
if (hspeed > 0) { hspeed -= 0.17; }
if (hspeed < 0) { hspeed += 0.17; }
if (vspeed > 0) { vspeed -= 0.17; }
if (vspeed < 0) { vspeed += 0.17; }
if (vspeed > -0.15 and vspeed < 0.15) { vspeed = 0; }
if (hspeed > -0.15 and hspeed < 0.15) { hspeed = 0; }
if (hspeed = 0 and vspeed = 0) { status = "idle"; image_index = 0; flash = 0; }
}
/////////////////////////////
if (up = 1)
{
vspeed = -spd;
}
if (down = 1)
{
vspeed = spd;
}
if (left = 1)
{
hspeed = -spd;
}
if (right = 1)
{
hspeed = spd;
}

if (flash = 0)
{
if (right = 0 and left = 0 and fall = 0)
{
hspeed = 0;
}
if (up = 0 and down = 0 and fall = 0)
{
vspeed = 0;
}
}
if (fight != 0) { vspeed = 0; hspeed = 0; }
//if (jump = 3) { vspeed = 0; hspeed = 0; }

/////////////////////////////

if (hspeed = 0 and vspeed = 0 and status = "run" ) { status = "idle"; }
if (jump > 0) { status = "jump"; }
if (jump == -2) { status = "fly"; }



/// Бой
//if (keyboard_check_released(ord('O'))) { fall = 1; } // удалить
if (keyboard_check_released(ord("O"))) // удалить
{  
hero_numb++;
start = 0;
if (hero_numb > 11) { hero_numb = 1; } 
}
if (keyboard_check_released(ord("Q"))) 
{  
if (fight = 0 and jump < 1 and flash = 0 and fall = 0 and super = 0)
{
fight = 7;
status = "kick";
image_index = 0;
hspeed = 0;
vspeed = 0;
}
}
/////////////////////////////////
if (keyboard_check_released(ord("F")))
{
if (fight = 0 and jump < 1 and flash = 0 and fall = 0 and super = 0)
{
delay = 0;
fight = 1;
image_index = 0;
}
delay++;
}
if (keyboard_check_pressed(ord("G")) and hero_numb != 6)
{

if (fight = 0 and jump < 1 and flash = 0 and fall = 0 and super = 0)
{
fight = 4;
image_index = 0;
status = "block";
hspeed = 0;
vspeed = 0;
}
}

if (fight != 0 and super = 0 and fight < 4)
{

if (fight = 1 and delay > 0)
{
status = "fight";
if (image_index = hit_1_index)
{
if (delay > 1 and hit = 0) { fight = 2; }
else { fight = 0; status = "idle"; image_index = 0; }
}
}
if (fight = 2)
{
status = "fight";
if (image_index = hit_2_index)
{
if (delay > 2 and hit = 0) { fight = 3; }
else { fight = 0; status = "idle"; image_index = 0; }
}
}
if (fight = 3)
{
status = "fight";
if (image_index = image_number - 1)
{
fight = 0;
status = "idle";
image_index = 0;
}
}
}
//////////////////////////
if (fight > 3)
{
if (fight = 4)
{
if (image_index > 10 and hero_numb != 1) { fight = 5; }
if (image_index > 5 and hero_numb = 1) { fight = 5; }
}
if (fight = 5)
{
if (image_index > 19 and hero_numb != 1) { back = 1; }
if (image_index = 10 and hero_numb != 1) { back = 0; }
if (image_index > 11 and hero_numb = 1) { back = 1; }
if (image_index = 5 and hero_numb = 1) { back = 0; }
}
if (fight = 6)
{
if (image_index = 0) { fight = 0; status = "idle"; back = 0; }
}

if (keyboard_check_released(ord("G")))
{

fight = 6;
if (hero_numb != 1) { image_index = 20; }
else { image_index =  10; }
}
}
///////////////////////////
if (fall = 1)
{
fall = 2;
status = "fall";
jump = 0;
image_index = 0;
}
if (fall = 2)
{
if (image_index = image_number - 1) { fall = 0; status = "idle"; hspeed = 0; vspeed = 0; }
if (hspeed > 0) { hspeed -= 0.17; }
if (hspeed < 0) { hspeed += 0.17; }
if (vspeed > 0) { vspeed -= 0.17; }
if (vspeed < 0) { vspeed += 0.17; }
if (vspeed > -0.15 and vspeed < 0.15) { vspeed = 0; }
if (hspeed > -0.15 and hspeed < 0.15) { hspeed = 0; }
}

if (hit = 1)
{
fight = 0;
if (status = "idle" or status = "fight")
{
status = "block";
image_index = 9;
if (hero_numb = 6) { status = "fight"; back = 1; image_index = 3; }
}
hit = 2;
}
if (hit = 2)
{
if (status != "run")
{
if (hspeed > 0) { hspeed -= 0.17; }
if (hspeed < 0) { hspeed += 0.17; }
if (vspeed > 0) { vspeed -= 0.17; }
if (vspeed < 0) { vspeed += 0.17; }
if (vspeed > -0.15 and vspeed < 0.15) { vspeed = 0; }
if (hspeed > -0.15 and hspeed < 0.15) { hspeed = 0; }
}
if (image_index = image_number - 1 or image_index = 0) { hit = 0; image_index = 0; }
}


///////////////////////////

if (fight = 7)
{
if (image_index = image_number - 1) { image_index = 0; status = "idle"; fight = 0; }
}

////////////////////////////

if ((hero_numb = 9 or hero_numb = 10 or hero_numb = 11) and fall = 0 and jump < 1 and super = 0)
{
if (mouse_check_button_released(mb_left)) 
{
if (image_index = 0) { flash = 0; }
}
if (mouse_check_button_pressed(mb_left) and flash = 0) 
{
hspeed = 0;
vspeed = 0;
flash = 1;
image_index = 0; 
rand = irandom_range(1, 2)
if (rand = 1) { status = "shoot"; }
if (rand = 2) { status = "shootsit"; }
if (hero_numb = 10)
{
bull = instance_create(x,y, bullet);
bull.damage = global.rifledamage;
bull.penetration = 10;
bull.direction = point_direction(x,y, mouse_x, mouse_y);
bull.image_angle = bull.direction;
}

if (hero_numb = 11) 
{ 
laser = instance_create(x,y, laser_ray);
laser.target_x = mouse_x;
laser.target_y = mouse_y;
if (instance_exists(Terror_Squad))
{
enemy = instance_nearest(mouse_x, mouse_y, Terror_Squad);
if (point_distance(mouse_x, mouse_y, enemy.x, enemy.y) < 30) { enemy.hp -= global.laserrifledamage; instance_create(mouse_x, mouse_y, Puff_2); }
}
}
}
if (flash = 1)
{
if (mouse_x > x) { direct = "right"; } 
if (mouse_x < x) { direct = "left"; }
if (mouse_y > y + 60) { direct = "down"; }
if (mouse_y < y - 60) { direct = "up"; }
if (hero_numb = 9 and image_index = 1)
{
bull = instance_create(x,y, bullet);
rand_x = irandom_range(-10, 10); rand_y = irandom_range(-10, 10);
bull.direction = point_direction(x,y, mouse_x + rand_x, mouse_y + rand_y);
bull.damage = global.akdamage;
bull.image_angle = bull.direction;
}
if (hero_numb = 9 and image_index = 5)
{
bull = instance_create(x,y, bullet);
rand_x = irandom_range(-10, 10); rand_y = irandom_range(-10, 10);
bull.direction = point_direction(x,y, mouse_x + rand_x, mouse_y + rand_y);
bull.damage = global.akdamage;
bull.image_angle = bull.direction;
}
if (hero_numb = 9 and image_index = 10)
{
bull = instance_create(x,y, bullet);
rand_x = irandom_range(-10, 10); rand_y = irandom_range(-10, 10);
bull.direction = point_direction(x,y, mouse_x + rand_x, mouse_y + rand_y);
bull.damage = global.akdamage;
bull.image_angle = bull.direction;
}
if (image_index = image_number - 1) { flash = 0; status = "idle"; }
}
}

/// Способности
if (keyboard_check_released(vk_control) and flash = 0 and fight = 0 and jump < 1 and fall = 0 and hero_numb != 8 and hero_numb != 9 and hero_numb != 10 and hero_numb != 11)
{
if (super = 0) { super = 1 }
else { if (super = 1 and hero_numb = 1 and image_index = 13) { super = 3; } if (super = 1) { super = 0; status = "idle"; } if (super = 3 and hero_numb = 4) { super = 4; } }
}

if (hero_numb = 1) 
{
if (super = 1)
{
if (mouse_x > x) { direct = "right"; } 
if (mouse_x < x) { direct = "left"; }
if (mouse_y > y + 60) { direct = "down"; }
if (mouse_y < y - 60) { direct = "up"; }
}
if (super = 1)
{
status = "shoot";
if (image_index != 13) { image_index = 0; }

if (mouse_check_button_released(mb_left) and ammo > 1) 
{ 
ammo--;
super = 2; 
}
}
if (super = 2)
{
if (image_index = 18) 
{ 
laser = instance_create(x,y, laser_ray); 
laser.target_x = mouse_x;
laser.target_y = mouse_y;
if (instance_exists(Terror_Squad))
{
enemy = instance_nearest(mouse_x, mouse_y, Terror_Squad);
if (point_distance(mouse_x, mouse_y, enemy.x, enemy.y) < 30) { enemy.hp -= global.laserpistoldamage; instance_create(mouse_x, mouse_y, Puff_1); }
}
}
if (image_index = image_number - 1) { super = 1; image_index = 13; }
}

if (super = 3) 
{
if (image_index > 13) { image_index = 13; back = 1; }
if (image_index = 0) { back = 0; super = 0; status = "idle"; }
}

}
//
if (hero_numb = 2) 
{
if (super = 1 or super = 2)
{
if (mouse_x > x) { direct = "right"; } 
if (mouse_x < x) { direct = "left"; }
if (mouse_y > y + 60) { direct = "down"; }
if (mouse_y < y - 60) { direct = "up"; }
}
if (super = 1)
{
status = "shoot";
image_index = 0;

if (mouse_check_button_pressed(mb_left) and ammo > 0) { super = 2; }
}
if (super = 2)
{
if (image_index = image_number - 1) { back = 1; }
if (image_index = 9) { back = 0; }
ammo--;
bull = instance_create(x,y, bullet);
bull.damage = global.minigundamage;
rand_x = irandom_range(-10, 10); rand_y = irandom_range(-10, 10);
bull.direction = point_direction(x,y, mouse_x + rand_x, mouse_y + rand_y);
bull.image_angle = bull.direction;
if (mouse_check_button_released(mb_left) or ammo < 1) { super = 3; back = 1;}
}
if (super = 3)
{
if (image_index = 0) { super = 0; back = 0; status = "idle"; }
}

}
//
if (hero_numb = 3) 
{
if (super = 1)
{
status = "wave";
image_index = 0;
super = 2;
wav = instance_create(x, y, wave);
if (direct = "left") { wav.hspeed = -10; }  
if (direct = "right") { wav.hspeed = 10; }
if (direct = "up") { wav.vspeed = -10; }
if (direct = "down") { wav.vspeed = 10; }
}
if (super = 2)
{
if (image_index = image_number - 1) { super = 0; image_index = 0; status = "idle"; }
}

}
//
if (hero_numb = 4) 
{
if (super = 1)
{
status = "dig";
image_index = 0;
super = 2;
}
if (super = 2)
{
if (image_index = 30) { super = 3; image_index = 30; }
}
if (super = 3)
{
status = "dig";
image_index = 30;
}
if (super = 4)
{
status = "dig";
back = 1;
if (image_index = 0) { back = 0; status = "idle"; super = 0; }
}

}
//
if (hero_numb = 5) 
{
if (super = 1)
{
status = "block";
image_index = 0;
super = 2;
}
if (super = 2)
{
if (image_index = 10) { super = 3; back = 1;  }
}
if (super = 3)
{
if (image_index = 0) { back = 0; super = 0; status = "idle"; }
}
if (super > 0 and super < 4 and hp < 100) { hp += 0.01; }

}
//
if (hero_numb = 6) 
{
if (super = 1)
{
status = "kick";
image_index = 0;

if (mouse_check_button_released(mb_left)) { super = 2; }
}
if (super = 2)
{
if (image_index = 7) { super = 3; x = mouse_x; y = mouse_y; back = 1; }
}
if (super = 3)
{
if (image_index = 0) { back = 0; super = 0; status = "idle"; }
}

}
//
if (hero_numb = 7) 
{
if (super = 1)
{
if (mouse_x > x) { direct = "right"; } 
if (mouse_x < x) { direct = "left"; }
if (mouse_y > y + 60) { direct = "down"; }
if (mouse_y < y - 60) { direct = "up"; }
}
if (super = 1)
{
status = "telekinez";
image_index = 0;

if (mouse_check_button_released(mb_left)) 
{
if (instance_exists(Terror_Squad))
{
enemy = instance_nearest(mouse_x, mouse_y, Terror_Squad);
if (point_distance(mouse_x, mouse_y, enemy.x, enemy.y) < 30)
{
instance_create(mouse_x, mouse_y, freeze);
}
}
super = 2;
}
}
if (super = 2)
{
if (image_index = image_number - 1) { super = 0; image_index = 0; status = "idle"; }
}

}

// от 5
if (keyboard_check_released(vk_alt) and flash = 0 and fight = 0 and jump < 1 and fall = 0 and hero_numb != 9 and hero_numb != 10 and hero_numb != 11 and hero_numb != 3 and hero_numb != 5 and hero_numb != 8)
{
if (super = 0) { super = 5 }
else { super = 0; }
}


if (hero_numb = 1) 
{
if (super = 5 and instance_exists(bpla)) { super = 0; }
if (super = 5)
{
status = "unpack";
image_index = 0;
super = 6;
instance_create(x,y, bpla);
}
if (super = 6)
{
if (image_index = image_number - 1) { image_index = 0; status = "idle"; super = 0;  }
}

}

if (hero_numb = 2) 
{
if (super = 5)
{
status = "tornado";
image_index = 0;
super = 6;
}
if (super = 6)
{
if (image_index = image_number - 1) { image_index = 0; status = "idle"; super = 0;  }
}

}

if (hero_numb = 4) 
{
if (super = 5)
{
status = "mine";
image_index = 0;
super = 6;
}
if (super = 6)
{
if (image_index = image_number - 1) { image_index = 0; mine = instance_create(x, y, landmine); mine.depth = depth + 1; status = "idle"; super = 0;  }
}

}

if (hero_numb = 6) 
{
if (super = 5)
{
status = "field";
image_index = 0;
super = 6;
}
if (super = 6)
{
if (image_index = image_number - 1) { image_index = 0; status = "idle"; super = 0;  }
}

}


if (hero_numb = 7) 
{
if (super = 5)
{
if (mouse_x > x) { direct = "right"; } 
if (mouse_x < x) { direct = "left"; }
if (mouse_y > y + 60) { direct = "down"; }
if (mouse_y < y - 60) { direct = "up"; }
}
if (super = 5)
{
status = "telekinez";
image_index = 0;

if (mouse_check_button_released(mb_left)) 
{ 
super = 6;
if (instance_exists(Terror_Squad))
{
enemy = instance_nearest(mouse_x, mouse_y, Terror_Squad);
if (point_distance(mouse_x, mouse_y, enemy.x, enemy.y) < 30)
 {
    enemy.fall = 1;
    enemy.fight = 0;
    enemy.jump = 0;
    enemy.status = "fall";
    enemy.hp -= 10; instance_create(mouse_x, mouse_y, Puff_1); 
    if (x > enemy.x) { hspeed = 5; }
    if (x < enemy.x) { hspeed = -5; }
    if (y > enemy.y) { vspeed = -5; }
    if (y < enemy.y) { vspeed = 5; }
 }
}
}
}
if (super = 6)
{
if (image_index = image_number - 1) { super = 0; image_index = 0; status = "idle"; }
}

}

if (hero_numb = 8 or hero_numb = 9 or hero_numb = 10 or hero_numb = 11)
{
if (flash = 0 and fight = 0 and super = 0 and jump = 0 and fall = 0 and instance_exists(throw_grenade))
{
super = 2;
image_index = 0;
hspeed = 0;
vspeed = 0;
status = "grenade";

tx = throw_grenade.x;
ty = throw_grenade.y;
instance_destroy(throw_grenade);
}
if (super = 2)
{
if (image_index = 8)
{
global.grenades--;
grenad = instance_create(x, y, grenade);
grenad.target_x = tx;
grenad.target_y = ty;
grenad.direction = point_direction(x, y, tx, ty);
}
if (image_index = image_number - 1) { super = 0; status = "idle"; image_index = 0; }
}
}

/// Анимация
if (hero_numb = 1)
{
image_xscale = 1; image_yscale = 1;
}
if (hero_numb = 2)
{
if (direct = "left") { image_xscale = 1.1; image_yscale = 1.1; } 
else 
if (direct = "down") { image_xscale = 1.2; image_yscale = 1.2; } 
else
if (direct = "right") { image_xscale = 1.1; image_yscale = 1.1; } 
else { image_xscale = 1; image_yscale = 1; }
}
if (hero_numb = 3)
{
if (direct = "left") { image_xscale = 1.1; image_yscale = 1.1; } 
else
if (direct = "down") { image_xscale = 1.2; image_yscale = 1.2; } 
else
if (direct = "right") { image_xscale = 1.1; image_yscale = 1.1; } 
else { image_xscale = 1; image_yscale = 1; }
}
if (hero_numb = 4)
{
if (direct = "down" or direct = "left") { image_xscale = 1.2; image_yscale = 1.2; } 
else { image_xscale = 1; image_yscale = 1; }
}
if (hero_numb = 5)
{
if (direct = "left") { image_xscale = 1.2; image_yscale = 1.2; } 
else { image_xscale = 1; image_yscale = 1; }
}
if (hero_numb = 6)
{
if (direct = "left") { image_xscale = 1.1; image_yscale = 1.1; } 
else 
if (direct = "down") { image_xscale = 1.2; image_yscale = 1.2; } 
else
if (direct = "right") { image_xscale = 1.1; image_yscale = 1.1; } 
else { image_xscale = 1; image_yscale = 1; }
}
if (hero_numb = 7)
{
if (direct = "left") { image_xscale = 1.1; image_yscale = 1.1; } 
else
if (direct = "down") { image_xscale = 1.2; image_yscale = 1.2; } 
else
if (direct = "right") { image_xscale = 1.1; image_yscale = 1.1; } 
else { image_xscale = 1; image_yscale = 1; }
}
if (hero_numb = 8 or hero_numb = 9 or hero_numb = 10 or hero_numb = 11)
{
if (direct = "right") { image_xscale = 1.1; image_yscale = 1.1; } 
else { image_xscale = 1; image_yscale = 1; }
}

if (hero_numb != 9 and hero_numb != 10 and hero_numb != 11)
{
str = string_insert(hero_index, "_", 0);
}
else
{
if (status = "kick") { str = string_insert("snowman", "_", 0); }
else
if (status = "fall") { str = string_insert("snowman", "_", 0); }
else
if (status = "grenade") { str = string_insert("snowman", "_", 0); }
else
str = string_insert(hero_index, "_", 0);
}
str = string_insert(str, direct, 0);
str = string_insert(str, "_", 0);
str = string_insert(str, status, 0);

sprite_index = asset_get_index(str);
if (image_index < jump_end_index and jump = 3) { image_index = jump_end_index; }
//image_speed = 0.5;

image_speed = 0;

if (status = "run" and hero_numb != 6) { image_index+= spd + 0.2; }
else
if (status = "fly" and hero_numb = 1) { image_index++; }
else
if (status = "run" and hero_numb = 6) { image_index++; }
else
if (status = "shoot" and hero_numb = 10) { image_index+= 0.25; }
else { if (super != 1) { if (back = 0) { image_index += 0.5; } else { image_index -= 0.5; } } }
// число должно всегда в итоге получатся целым и не более единицы, иначе будет пропуск кадров
//if (image_index = image_number) { image_index = 0; }
//else { image_index++; } // синхронизация end_step и смены изображений для своевременной реакцииz
