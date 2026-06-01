hit_timer--;

if (building_type == 0) sprite_index = Iglu_S;
if (building_type == 1) sprite_index = House_S;
if (building_type == 2) { sprite_index = Barrel_S; can_be_destroyed = true; }
if (building_type == 3) sprite_index = Rock;


if (image_number > 0)
{
	if (oArena3D.cam_angle <= 45 || oArena3D.cam_angle > 315) image_index = 0;
	if (oArena3D.cam_angle <= 135 && oArena3D.cam_angle > 45) image_index = 1;
	if (oArena3D.cam_angle <= 230 && oArena3D.cam_angle > 135) image_index = 2;
	if (oArena3D.cam_angle <= 315 && oArena3D.cam_angle > 230) image_index = 3;
}






if (true)
{
	if (instance_exists(bullet_3D))
	{
		var bullt = instance_nearest(x, y, bullet_3D);
		if (point_distance_3d(x, y, z, bullt.x, bullt.y, bullt.z) < global.range_to_hit * 2 && bullt.z < z + high && hit_timer < 1)
		{
			instance_destroy(bullt);
			if (can_be_destroyed)
			{
				hit_timer = 5;
				image_blend = c_red;
			}
		}
	}
	if (instance_exists(plasma_3D))
	{
		var bullt = instance_nearest(x, y, plasma_3D);
		if (point_distance_3d(x, y, z, bullt.x, bullt.y, bullt.z) < global.range_to_hit * 2 && bullt.z < z + high && hit_timer < 1)
		{
			instance_destroy(bullt);
			if (can_be_destroyed)
			{
				hit_timer = 5;
				image_blend = c_red;
			}
		}
	}
	if (instance_exists(plasma_bomb_3D))
	{
		var bullt = instance_nearest(x, y, plasma_bomb_3D);
		if (point_distance_3d(x, y, z, bullt.x, bullt.y, bullt.z) < global.range_to_hit && bullt.z < z + high && hit_timer < 1)
		{
			instance_destroy(bullt);
			if (can_be_destroyed)
			{
				hit_timer = 5;
				image_blend = c_red;
			}
		}
	}
}




if (hit_timer == 0)
{
	var rand = irandom_range(0, 5);
	if (rand == 4)
	{
		instance_destroy(self);	exit;
	}
	image_blend = c_white;
}
