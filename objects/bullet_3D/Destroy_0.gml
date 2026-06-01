randx = irandom_range(-0.1, 0.1);
randy = irandom_range(-0.1, 0.1);
var puff = instance_create(x + randx, y + randy, Puff_1_3D);
puff.z = z;
var sound = bullet_hit_1;

r = irandom_range(0, 1);
if (r == 0) { sound = bullet_hit_1; }
if (r == 1) { sound = bullet_hit_1; }

if (instance_exists(Terror_Squad_3D))
{
	var target = instance_nearest(x, y, Terror_Squad_3D);
	if (point_distance_3d(x, y, z, target.x, target.y, target.z) < global.range_to_hit)
	{
		if (target.armor < penetration) { penetration = target.armor; target.hit = 1; sound = bullet_hit_2; }
		if (damage + penetration > target.armor) { target.hp -= (damage - (target.armor - penetration)); puff = instance_create(x + randx, y + randy, Puff_2_3D); sound = bullet_hit_2; }
		else { var ring = instance_create(x,y, Blue_Ring_3D); ring.z = z; sound = rikochet; }
		var rand = irandom_range(0, 10);
		if (rand < 4)
		{
			target.hit = 1;
			target.status = "block";
			target.vel_x = 0;
			target.vel_y = 0;
		}
	}
	else
	{
		if (instance_exists(Turret_3D))
		{
			target = instance_nearest(x, y, Turret_3D);
			if (/*target.team_is_enemy && */point_distance_3d(x, y, z, target.x, target.y, target.z) < global.range_to_hit)
			{
				 var ring = instance_create(x,y, Blue_Ring_3D); ring.z = z; sound = rikochet;
				instance_destroy(self);
			}
		}	
	}
}

sound_play(sound); sound_volume(sound, global.voicevolume);