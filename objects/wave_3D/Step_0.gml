if (instance_exists(Terror_Squad_3D))
{
	for (var i = 0; i < instance_number(Terror_Squad_3D); i++)
	{
		var inst = instance_find(Terror_Squad_3D, i);
		if (!variable_instance_exists(inst, "hp") || !variable_instance_exists(inst, "direct")) continue;
		if (point_distance_3d(x, y, z, inst.x, inst.y, inst.z) > global.range_to_hit * 4 || inst.fall > 0) continue;
		inst.flash = 0;
		inst.jump = 0;
		if (inst.object_index == metal_sonic_3D || inst.object_index == egg_pawn_3D)
		inst.fall = 1;
		if (inst.x > x) { inst.vel_x = 5; }
		if (inst.x < x) { inst.vel_x = -5; }
		if (inst.y > y) { inst.vel_y = -5; }
		if (inst.y < y) { inst.vel_y = 5; }
		inst.hp -= damage;
		
	}
}