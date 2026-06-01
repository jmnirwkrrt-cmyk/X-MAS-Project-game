if (ready && !plane_commander.pause)
{
if (index == 0) { sprite_index = turret_1_s; w_index = 9; AMD = true; AAD = true; }

w_range = global.airweapon[w_index, 8];

if (!instance_exists(parent) || parent.hp < 1) instance_destroy(self);

if (instance_exists(parent)) scale = parent.scale;
speed = 0;
image_xscale = -scale;
image_yscale = -scale;
image_speed = 0;

//if (instance_exists(parent) && parent.image_index > 3 && parent.image_index < 17) image_alpha = 1;
if (instance_exists(parent) && parent.image_index == 0) image_alpha = 1;
else image_alpha = 0;

if (instance_exists(parent)) x = parent.x + lengthdir_x(parent.x - (x_pos + parent.x), parent.image_angle);
if (instance_exists(parent)) y = parent.y + lengthdir_y(parent.y - (x_pos + parent.y), parent.image_angle);

if (instance_exists(EGG_Plane))
{
for(i = 0; i < instance_number(EGG_Plane); i++)
{
if ((target_1 == 0 && !instance_exists(target_1)) || distance_to_object(target_1) > distance_to_object(instance_find(EGG_Plane, i)))
target_1 = instance_find(EGG_Plane, i);
}
}

if (instance_exists(plane_shell))
{
for(i = 0; i < instance_number(plane_shell); i++)
{
if (((target_2 == 0 && !instance_exists(target_2)) || distance_to_object(target_2) > distance_to_object(instance_find(plane_shell, i))) && instance_find(plane_shell, i).side == 2 && instance_find(plane_shell, i).guide == 1)
target_2 = instance_find(plane_shell, i);
}
}

if (target_1 != 0 && instance_exists(target_1) && target_2 != 0 && instance_exists(target_2))
{
if ((distance_to_object(target_1) < distance_to_object(target_2) && AAD) || !AMD) target_cur = target_1;
if ((distance_to_object(target_1) > distance_to_object(target_2) && AMD) || !AAD) target_cur = target_2;
}
else
{
if (target_1 != 0 && instance_exists(target_1) && AAD)
{
target_cur = target_1;
}
if (target_2 != 0 && instance_exists(target_2) && AMD)
{
target_cur = target_2;
}
}

if (target_cur != 0 && instance_exists(target_cur))
{
dir = point_direction(x, y, target_cur.x, target_cur.y) - 90;

if (image_angle > dir - acc || image_angle - 90 < dir - acc) 
{
image_angle = dir;
}
if (image_angle < dir - acc || image_angle - 90 > dir - acc) 
{
image_angle += acc;
}
else
if (image_angle > dir + acc  || image_angle + 90 < dir + acc)
{
image_angle -= acc;
}

image_angle = dir;
w_freq--;

if ((image_angle < dir + 2 && image_angle > dir - 2) || image_angle == dir)
{
if (w_index > 0 && w_freq < 0 && w_range > distance_to_object(target_cur))
{
//w_1a--;
w_freq = global.airweapon[w_index, 7];
shell = instance_create(x, y, plane_shell);
if (w_index != 1 && w_index != 8) shell.guide = true;
shell.index = w_index;
shell.direction = dir + 90;
shell.target_obj = target_cur;
shell.side = 1;
}
}


}


}


