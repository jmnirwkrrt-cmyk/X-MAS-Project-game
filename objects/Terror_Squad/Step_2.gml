if (start = 0)
{
if (index == "metalson")
{

hit_1_index = 9; // номер спрайта с моментом 1 удара
hit_2_index = 16; // номер спрайта с моментом 2 удара
hit_3_index = 23; // номер спрайта с моментом нокаута
jump_start_index = 10; // номер начала роста z
jump_end_index = 20; // номер начала падения z

zmax = 11; // макс. высота 
hp = 120; // здоровье
spd = 2; // скорость движения
damage = 18; // наносимый урон
armor = 10;
}
if (index == "pawn")
{

hit_1_index = 5; // номер спрайта с моментом 1 удара
hit_2_index = 13; // номер спрайта с моментом 2 удара
hit_3_index = 31; // номер спрайта с моментом нокаута
jump_start_index = 10; // номер начала роста z
jump_end_index = 21; // номер начала падения z

zmax = 6; // макс. высота 
hp = 200; // здоровье
armor = 25;
spd = 1.4; // скорость движения
damage = 21; // наносимый урон
}

start = 1;
}



if (instance_exists(X_MAS_team))
{

if (instance_exists(all_land_objects_parent))
{
land_obj = instance_nearest(x,y, all_land_objects_parent);
land_dist = distance_to_object(land_obj);
}
else
{
land_dist = 1000000;
}


if (instance_exists(X_MAS_team))
{
enemy = instance_nearest(x,y, X_MAS_team)


if (flash = 0 and fall = 0 and fight = 0)
{
if (distance_to_object(enemy) > 20)
{
status = "run";
}
else
{
up = 0;
right = 0;
left = 0;
down = 0;
if (flash = 0 and jump < 1 and fall = 0) { hspeed = 0; vspeed = 0; status = "idle"; }
}

if (distance_to_object(enemy) > 1000 and false) // отключено временно
{
status = "flash";
if (x > enemy.x + 15) { direct = "left"; right = 1; left = 0; }
if (x < enemy.x - 15) { direct = "right"; left = 1; right = 0; }
if (y > enemy.y + 15) { direct = "up"; up = 1; down = 0; }
if (y < enemy.y - 15) { direct = "down"; down = 1; up = 0; }
flash = 1;
}

if (status = "run")
{
if (x > enemy.x + 15) { direct = "left"; right = 1; left = 0; }
if (x < enemy.x - 15) { direct = "right"; left = 1; right = 0; }
if (y > enemy.y + 15) { direct = "up"; up = 1; down = 0; }
if (y < enemy.y - 15) { direct = "down"; down = 1; up = 0; }
}
}

}
//////////////////////////////////
if (jump = 0 and land_dist < 100 and fight = 0 and fall = 0 and flash = 0)
{
if ((land_dist < land_obj.image_xscale + 20 or land_dist < image_yscale + 20) and zmax > land_obj.z)
{
jump = 1;
status = "jump";
image_index = 0;
}
if (zmax < land_obj.z and (land_dist < land_obj.image_xscale + 20 or land_dist < image_yscale + 20) and instance_exists(enemy) and collision_line(x,y, enemy.x, enemy.y, all_land_objects_parent, true, true))
{
if (x > land_obj.x)
{
if (x - land_obj.x > y - land_obj.y ) { left = 1; right = 0; direct = "right"; }
if (y - land_obj.y > x - land_obj.x ) { up = 1; down = 0; direct = "up"; }
}
else
{
if (land_obj.x - x < land_obj.y - y ) { right = 1; left = 0; direct = "left"; }
if (land_obj.y - y < land_obj.x - x ) { down = 1; up = 0; direct = "down"; }
}
}
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
if (image_index < jump_end_index) { image_index = jump_end_index; }
z -= zmax / (jump_end_index - jump_start_index);
if (image_index = image_number - 1) { jump = 0; z = 0; status = "idle"; }
}
if (jump = -1 and z > 0 and instance_exists(all_land_objects_parent))
{
if (distance_to_object(land_obj) > land_obj.image_xscale - 0.1 and distance_to_object(land_obj) > land_obj.image_yscale - 0.1)
{
status = "jump";
jump = 3;
}
}
/////////////////////////
if (flash = 1)
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
////////////////////////////////////////
if (left = 1) { hspeed = spd; }
if (right = 1) { hspeed = -spd; }
if (up = 1) { vspeed = -spd; }
if (up = 0) { vspeed = spd; }  

if (fight != 0) { hspeed = 0; vspeed = 0; }

if (up = 0 and down = 0 and fall = 0) { vspeed = 0; }
if (left = 0 and right = 0 and fall = 0) { hspeed = 0; }

if (hspeed = 0 and vspeed = 0 and status = "run" ) { status = "idle"; }
if (jump > 0) { status = "jump"; }

}

if (instance_exists(X_MAS_team))
{
if (fight = 1)
{
status = "fight";
if (image_index = hit_1_index)
{
if (hit = 0) { fight = 2; }
else { fight = 0; status = "idle"; image_index = 0; }
}
}
if (fight = 2)
{
status = "fight";
if (image_index = hit_2_index)
{
if (hit = 0) { fight = 3; }
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


/////////////////////////



if (fight = 4)
{
fight = 5;
image_index = 0;
status = "block";
hspeed = 0;
vspeed = 0;
}
if (fight = 5)
{
if (image_index > 10) { fight = 6; }
}
if (fight = 6)
{
if (image_index > 19) { back = 1; }
if (image_index = 10) { back = 0; }
if (image_index > 11) { back = 1; }
if (image_index = 5) { back = 0; }
}
if (fight = 7)
{
if (image_index = 0) { fight = 0; status = "idle"; back = 0; }
}
/////////////////////
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
///////////////////
if (hit = 1)
{
fight = 0;
if (status = "idle" or status = "fight")
{
status = "block";
image_index = 9;
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
///////////////////////

if (fight = 8)
{
status = "kick";
image_index = 0;
hspeed = 0;
vspeed = 0;
fight = 9;
}
if (fight = 9)
{
if (image_index = image_number - 1) { image_index = 0; status = "idle"; fight = 0; }
}
}

if (instance_exists(X_MAS_team))
{

if (instance_exists(X_MAS_team))
{
if (status = "idle" and hit = 0 and flash = 0 and jump < 1 and fall = 0 and fight = 0 and hspeed = 0 and vspeed = 0)
{
if (distance_to_object(enemy) < 31)
{
rand = irandom_range(0, 100);
if (enemy.fight = 0)
{
if (fight = 0)
{
if (rand < 25)
{
fight = 1
image_index = 0;
status = "fight";
}
if (rand > 25 and rand < 50)
{
fight = 8
image_index = 0;
status = "kick";
if (x > enemy.x) { direct = "right"; }
if (x < enemy.x) { direct = "left"; }
if (y > enemy.y) { direct = "down"; }
if (y < enemy.y) { direct = "up"; }
}
}
else 
{
if (fight = 5)
{
fight = 6;
}
}
}
else
{
if (hit = 0 and enemy.fight < 4)
{
fight = 4;
}
}
}
}

if (fight = 6 and (enemy.fight < 1 or enemy.fight > 4))
{
fight = 7;
}


if (index = "pawn" and jump < 1 and flash != 1 and flash != 2 and flash != 3 and fall = 0 and fight = 0)
{
rand = irandom_range(0, 100);
if (distance_to_object(enemy) > 100 and distance_to_object(enemy) < 700 and rand < 10)
{
flash = 3;
status = "shoot";
image_index = 0;
hspeed = 0;
vspeed = 0;
}

}
if (flash = 3)
{
if (enemy.x > x) { direct = "right"; } 
if (enemy.x < x) { direct = "left"; }
if (enemy.y > y + 60) { direct = "down"; }
if (enemy.y < y - 60) { direct = "up"; }
hspeed = 0;
vspeed = 0;
if (image_index = 11) { shell = instance_create(x, y, plasma); shell.damage = 40; }
if (image_index = 16) { shell = instance_create(x, y, plasma); shell.damage = 40; }
if (image_index = image_number - 1) { image_index = 0; flash = 0; status = "idle"; }
}

}

}

if (instance_exists(X_MAS_team))
{

str = string_insert(index, "_", 0);
str = string_insert(str, direct, 0);
str = string_insert(str, "_", 0);
str = string_insert(str, status, 0);

sprite_index = asset_get_index(str);
if (image_index < jump_end_index and jump = 3) { image_index = jump_end_index; }
//image_speed = 0.5;

image_speed = 0;

if (status = "run") { image_index+= spd + 0.2; }
else
if (status = "fly") { image_index++; }
else { if (back = 0) { image_index += 0.5; } else { image_index -= 0.5; } }

if (hp < 1)
{
randx = irandom_range(-25, 25);
randy = irandom_range(-25, 25);
instance_create(x + randx, y + randy, Puff_1);
randx = irandom_range(-25, 25);
randy = irandom_range(-25, 25);
instance_create(x + randx, y + randy, Puff_2);
randx = irandom_range(-25, 25);
randy = irandom_range(-25, 25);
instance_create(x + randx, y + randy, Puff_1);
randx = irandom_range(-25, 25);
randy = irandom_range(-25, 25);
instance_create(x + randx, y + randy, Puff_2);
deat = instance_create(x,y, death);
status = "fall";
str = string_insert(index, "_", 0);
str = string_insert(str, direct, 0);
str = string_insert(str, "_", 0);
str = string_insert(str, status, 0);
deat.sprite_index = asset_get_index(str);
deat.image_index = 0;
deat.image_speed = 0.5;
instance_destroy(self);
}

}

