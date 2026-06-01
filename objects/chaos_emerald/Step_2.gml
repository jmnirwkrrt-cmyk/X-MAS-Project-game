visible = founded;
if (evacuated) visible = false;
if (!visible) sprite_index = spr_nothing;
else sprite_index = chaos_emerald_s;

image_blend = emerald_color;
oArena3D.emerald_taken_by = taken_by;


if (instance_exists(oPlayer3D) && !evacuated)
{
	var obj = instance_nearest(x, y, oPlayer3D);
	if (!founded)
	{
		if (point_distance_3d(x, y, z, obj.x, obj.y, obj.z) < global.emerald_search_radius) founded = true;
	}
	else
	{
		if (point_distance_3d(x, y, z, obj.x, obj.y, obj.z) < global.emerald_search_radius / 2) taken_by = obj;
	}
}



if (!evacuated)
{
	if (instance_exists(taken_by) && taken_by != noone)
	{
		if (instance_exists(landed_transport))
		{
			var obj = instance_nearest(x, y, landed_transport);
			if (point_distance_3d(x, y, z, obj.x, obj.y, obj.z) < global.evacuation_zone_radius)
			{
				evacuated = true;	
				taken_by = instance_find(landed_transport, 0);
				oArena3D.emerald_taken_by = instance_find(landed_transport, 0);
				exit;
			}
		}
		if (taken_by != landed_transport)
		{
			if (!instance_exists(taken_by) || taken_by.hp < 1) { taken_by = noone; exit; }
			x = taken_by.x;
			y = taken_by.y;
			z = taken_by.z + 40;
			floor_z = taken_by.floor_z;
		}
	}
	else
	{
		z = floor_z;	
	}
}