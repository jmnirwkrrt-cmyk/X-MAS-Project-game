fall = 0;
jump = 0;
flash = 0;

if (start = 0)
{
if (index == "beetle")
{

hp = 100; // здоровье
armor = 0;
spd = 3; // скорость движения
}

start = 1;
}



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

if (status = "run")
{
if (x > enemy.x + 15) { direct = "left"; right = 1; left = 0; }
if (x < enemy.x - 15) { direct = "right"; left = 1; right = 0; }
if (y > enemy.y + 15) { direct = "up"; up = 1; down = 0; }
if (y < enemy.y - 15) { direct = "down"; down = 1; up = 0; }
}
}

if (land_dist < 100)
{
if ((land_dist < land_obj.image_xscale + 20 or land_dist < image_yscale + 20) and collision_line(x,y, enemy.x, enemy.y, all_land_objects_parent, true, true))
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

str = string_insert(index, "_", 0);
str = string_insert(str, direct, 0);
str = string_insert(str, "_", 0);
if (status != "idle")
{
str = string_insert(str, status, 0);
}
else
{
str = string_insert(str, "run", 0);
}

sprite_index = asset_get_index(str);
if (image_index < jump_end_index and jump = 3) { image_index = jump_end_index; }
//image_speed = 0.5;

image_speed = 0;

if (status != "idle")
{
if (status = "run") { image_index+= spd + 0.2; }
else
if (status = "fly") { image_index++; }
else { if (back = 0) { image_index += 0.5; } else { image_index -= 0.5; } }
}
else { image_index = 0; }

if (hp < 1) { instance_destroy(self); }

