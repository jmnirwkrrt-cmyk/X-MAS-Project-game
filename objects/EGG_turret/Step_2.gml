if (ready && !plane_commander.pause)
{
	// -------------------------------------------------
	// Настройка типа турели
	// -------------------------------------------------
	switch (index)
	{
		case 0:
			sprite_index = turret_1_s;
			w_index = 8;
			AMD = false;
			AAD = true;
			break;

		case 1:
			sprite_index = turret_2_s;
			w_index = 12;
			AMD = true;
			AAD = false;
			break;

		case 2:
			sprite_index = turret_3_s;
			w_index = 12;
			AMD = true;
			AAD = true;
			break;

		case 3:
			sprite_index = turret_4_s;
			w_index = 11;
			AMD = true;
			AAD = true;
			break;
	}

	w_range = global.airweapon[w_index, 8];

	// -------------------------------------------------
	// Родитель уничтожен -> турель тоже
	// -------------------------------------------------
	if (!instance_exists(parent) || parent.hp < 1)
	{
		instance_destroy(self);
		exit;
	}

	scale = parent.scale;

	speed = 0;
	image_speed = 0;

	// [FIX] не зеркалим по двум осям сразу
	image_xscale = scale;
	image_yscale = scale;

	if (parent.image_index == 0) image_alpha = 1;
	else image_alpha = 0;

	// -------------------------------------------------
	// Позиция турели относительно самолёта
	// [FIX] опираемся на фактическое направление корпуса
	// -------------------------------------------------
	var a = parent.direction - 90;

	var lx = x_pos * parent.scale;
	var ly = y_pos * parent.scale;

	var rx = lx * dcos(a) - ly * dsin(a);
	var ry = lx * dsin(a) + ly * dcos(a);

	x = parent.x + rx;
	y = parent.y + ry;

	// -------------------------------------------------
	// Сброс протухших целей
	// -------------------------------------------------
	if (target_1 != noone)
	{
		if (!instance_exists(target_1) || target_1.hp <= 0 || point_distance(x, y, target_1.x, target_1.y) > w_range)
		{
			target_1 = noone;
		}
	}

	if (target_2 != noone)
	{
		if (!instance_exists(target_2) || point_distance(x, y, target_2.x, target_2.y) > w_range || target_2.side == 2)
		{
			target_2 = noone;
		}
	}

	target_cur = noone;

	// -------------------------------------------------
	// Поиск самолёта
	// -------------------------------------------------
	if (AAD && (target_1 == noone || !instance_exists(target_1)))
	{
		var best_plane = noone;
		var best_plane_dist = 999999999;

		for (var i = 0; i < instance_number(XMAS_Plane); i++)
		{
			var target = instance_find(XMAS_Plane, i);
			if (!instance_exists(target)) continue;
			if (target.hp <= 0) continue;

			var dist = point_distance(x, y, target.x, target.y);
			if (dist > w_range) continue;

			var is_target_already = false;
			if (instance_number(XMAS_Plane) > 1 || global.current_diff_mn == global.heavy_diff_mn)
			for (var q = 0; q < instance_number(EGG_turret); q++)
			{
				var other_turret = instance_find(EGG_turret, q);
				if (other_turret == self) continue;
				if (other_turret.parent != parent) continue;
				if (other_turret.target_1 == target)
				{
					is_target_already = true;
					break;
				}
			}
			if (is_target_already) continue;

			if (dist < best_plane_dist)
			{
				best_plane = target;
				best_plane_dist = dist;
			}
		}

		target_1 = best_plane;
	}

	// -------------------------------------------------
	// Поиск снаряда
	// -------------------------------------------------
	if (AMD && (target_2 == noone || !instance_exists(target_2)))
	{
		var best_shell = noone;
		var best_shell_dist = 999999999;

		for (var i = 0; i < instance_number(plane_shell); i++)
		{
			var target = instance_find(plane_shell, i);
			if (!instance_exists(target)) continue;
			if (target.side == 2 || !target.guide) continue;

			var dist = point_distance(x, y, target.x, target.y);
			if (dist > w_range) continue;

			var is_target_already = false;
			for (var q = 0; q < instance_number(EGG_turret); q++)
			{
				var other_turret = instance_find(EGG_turret, q);
				if (other_turret == self) continue;
				if (other_turret.parent != parent) continue;
				if (other_turret.target_2 == target)
				{
					is_target_already = true;
					break;
				}
			}
			if (is_target_already) continue;

			if (dist < best_shell_dist)
			{
				best_shell = target;
				best_shell_dist = dist;
			}
		}

		target_2 = best_shell;
	}

	// -------------------------------------------------
	// Выбор текущей цели
	// -------------------------------------------------
	var plane_ok = (AAD && target_1 != noone && instance_exists(target_1));
	var shell_ok = (AMD && target_2 != noone && instance_exists(target_2));

	if (plane_ok && shell_ok)
	{
		if (point_distance(x, y, target_1.x, target_1.y) <= point_distance(x, y, target_2.x, target_2.y))
			target_cur = target_1;
		else
			target_cur = target_2;
	}
	else if (plane_ok)
	{
		target_cur = target_1;
	}
	else if (shell_ok)
	{
		target_cur = target_2;
	}

	// -------------------------------------------------
	// Наведение и стрельба
	// -------------------------------------------------
	if (target_cur != noone && instance_exists(target_cur))
	{
		var dist_to_target = point_distance(x, y, target_cur.x, target_cur.y);
		var dir = point_direction(x, y, target_cur.x, target_cur.y);

		image_angle = dir + 90;

		w_freq--;

		if (w_freq < 0 && dist_to_target <= w_range)
		{
			w_freq = global.airweapon[w_index, 7];

			var shell = instance_create(x, y, plane_shell);
			shell.index = w_index;
			shell.direction = dir;
			shell.target_obj = target_cur;
			shell.side = 2;

			if (w_index != 1 && w_index != 8)
			{
				shell.guide = true;
			}
		}
	}
}