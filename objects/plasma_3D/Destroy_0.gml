var puff = instance_create(x, y, Puff_1_3D);
puff.z = z;


if (instance_exists(X_MAS_team_3D))
{
	var target = instance_nearest(x, y, X_MAS_team_3D);
	if (point_distance_3d(x, y, z, target.x, target.y, target.z) < global.range_to_hit)
	{
		
		if (target.hero_numb != 3 || target.energy < target.energy_cost_super_1)
		{
			
			if (target.armor < penetration) { penetration = target.armor; target.hit = 1; }
			if (damage + penetration > target.armor) { target.hp -= (damage - (target.armor - penetration)); }
			else { var ring = instance_create(x,y, Blue_Ring_3D); ring.z = z; }
			target.hit = 1;
			target.status = "idle";
			target.vel_x = 0;
			target.vel_y = 0;
		}
		else if (target.hero_numb == 3) target.energy -= target.energy_cost_super_1;
	}
	else
	{
		if (instance_exists(Turret_3D))
		{
			target = instance_nearest(x, y, Turret_3D);
			if (!target.team_is_enemy && point_distance_3d(x, y, z, target.x, target.y, target.z) < global.range_to_hit)
			{
				target.hp -= damage;
			}
		}	
	}
}
