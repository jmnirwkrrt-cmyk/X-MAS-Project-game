//var px = x, py = y, pz = z;
//
//x += vx;
//y += vy;
//z += vz;

if (instance_exists(Terror_Squad_3D))
{
	var target = instance_nearest(x, y, Terror_Squad_3D);
	if (point_distance_3d(x, y, z, target.x, target.y, target.z) < global.range_to_hit)
	{
		instance_destroy(self);
	}
	else
	{
		if (instance_exists(Turret_3D))
		{
			target = instance_nearest(x, y, Turret_3D);
			if (/*target.team_is_enemy &&*/  point_distance_3d(x, y, z, target.x, target.y, target.z) < global.range_to_hit)
			{
				instance_destroy(self);
			}
		}	
	}
}

//life--;
//if (life <= 0) { instance_destroy(); exit; }
//
//// проверка "пролетели цель" (надёжнее, чем distance>prev_distance)
//var tx = target_x - x;
//var ty = target_y - y;
//var tz = target_z - z;
//
//if (tx*dirx + ty*diry + tz*dirz <= 0) {
//    x = target_x; y = target_y; z = target_z;
//    instance_destroy();
//    exit;
//}
//
//// страховка: если вдруг цель внутри/под полом/столбом
//var fz = gm3d_get_pillar_height_at(x, y); // 0 или pillar_height
//if (z <= fz) { instance_destroy(); exit; }
//
//// визуальный угол (только для спрайта)
//image_angle = point_direction(px, py, x, y) - 90;
