fall = 0;
jump = -1;

if (start = 0)
{
if (index == "ufo")
{

hp = 300; // здоровье
armor = 50;
spd = 2; // скорость движения
}

start = 1;
}

z = 10

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
if (distance_to_object(enemy) > 0)
{
status = "run";
}
else
{
up = 0;
right = 0;
left = 0;
down = 0;
if (flash = 0 and jump = 0 and fall = 0) { hspeed = 0; vspeed = 0; status = "idle"; }
}

if (status = "run" and distance_to_object(enemy) > 110)
{
rand_x = irandom_range(0, room_width);
rand_y = irandom_range(0, room_width);
if (x > enemy.x + 15) { direct = "left"; right = 1; left = 0; }
if (x < enemy.x - 15) { direct = "right"; left = 1; right = 0; }
if (y > enemy.y + 15) { direct = "up"; up = 1; down = 0; }
if (y < enemy.y - 15) { direct = "down"; down = 1; up = 0; }
}
else
{
if (x > rand_x + 15) { direct = "left"; right = 1; left = 0; }
if (x < rand_x - 15) { direct = "right"; left = 1; right = 0; }
if (y > rand_y + 15) { direct = "up"; up = 1; down = 0; }
if (y < rand_y - 15) { direct = "down"; down = 1; up = 0; }
}
}

if (land_dist < 100)
{
if (land_obj.z > z and (land_dist < land_obj.image_xscale + 20 or land_dist < image_yscale + 20) and collision_line(x,y, enemy.x, enemy.y, all_land_objects_parent, true, true))
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

}
//////////////////////////////////

/////////////////////////

////////////////////////////////////////
if (left = 1) { hspeed = spd; }
if (right = 1) { hspeed = -spd; }
if (up = 1) { vspeed = -spd; }
if (up = 0) { vspeed = spd; }  

if (fight != 0) { hspeed = 0; vspeed = 0; }

if (up = 0 and down = 0) { vspeed = 0; }
if (left = 0 and right = 0) { hspeed = 0; }

if (hspeed = 0 and vspeed = 0 and status = "run" ) { status = "idle"; }

if (instance_exists(X_MAS_team))
{

if (jump < 1 and flash != 1 and flash != 2 and flash != 3 and fall = 0 and fight = 0)
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
if (image_index = 0) { shell = instance_create(x, y, plasma_bomb); shell.damage = 40; }
if (image_index = 0) { shell = instance_create(x, y, plasma_bomb); shell.damage = 40; }
if (image_index = image_number - 1) { image_index = 0; flash = 0; status = "idle"; }
}
}
else { flash = 0; } 

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

if (hp < 1) { instance_create(x,y, Explode); instance_destroy(self); }

