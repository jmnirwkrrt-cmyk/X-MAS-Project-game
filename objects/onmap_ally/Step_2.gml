if (indx != 0)
{
	// =========================================================
	// Макс. скорость
	// =========================================================
	global.escortally[indx, 1] = 9999999999999999;

	for (var i = 4; i < global.escortally[indx, 0] + 4; i++)
	{
		if (global.santaplanes[global.escortally[indx, i], 1] < 1) continue;

		if (i == 4) // [FIX] было "="
		{
			global.escortally[indx, 1] = global.planedata[global.santaplanes[global.escortally[indx, i], 0], 6] - speed_deviation;
		}
		else if (global.planedata[global.santaplanes[global.escortally[indx, i], 0], 6] < global.escortally[indx, 1] && i > 4)
		{
			global.escortally[indx, 1] = global.planedata[global.santaplanes[global.escortally[indx, i], 0], 6] - speed_deviation;
		}
	}

	if (global.escortally[indx, 1] < 0) global.escortally[indx, 1] = 0; // [FIX]

	// =========================================================
	// Дальность РЛС
	// =========================================================
	global.escortally[indx, 3] = 0;

	for (var i = 4; i < global.escortally[indx, 0] + 4; i++)
	{
		if (global.santaplanes[global.escortally[indx, i], 1] < 1) continue;

		if (i == 4) // [FIX] было "="
		{
			global.escortally[indx, 3] = global.planedata[global.santaplanes[global.escortally[indx, i], 0], 14]; // [FIX] было santaplanes[...,1]
		}
		else if (global.planedata[global.santaplanes[global.escortally[indx, i], 0], 14] > global.escortally[indx, 3] && i > 4)
		{
			global.escortally[indx, 3] = global.planedata[global.santaplanes[global.escortally[indx, i], 0], 14];
		}
	}
	radar_range = global.escortally[indx, 3] * (image_xscale + basic_size);

	// =========================================================
	// Есть ли живые самолёты
	// =========================================================
	var has_planes = false;

	for (var i = 4; i < global.escortally[indx, 0] + 4; i++)
	{
		if (global.santaplanes[global.escortally[indx, i], 1] > 0)
		{
			has_planes = true;
			break;
		}
	}

	if (!has_planes && !infight)
	{
		instance_destroy(self);
		exit;
	}

	// =========================================================
	// Обновление целей по статусу ДО движения
	// =========================================================
	if (status == 1)
	{
		if (instance_exists(target))
		{
			point_x = target.base_x; // [FIX]
			point_y = target.base_y; // [FIX]
		}
		else
		{
			status = 2;
		}
	}
	
	if (status == 3)
	{
		var city_home = instance_nearest(x, y, onmap_city);
		if (instance_exists(city_home))
		{
			point_x = city_home.x; // [FIX]
			point_y = city_home.y; // [FIX]
		}
	}

	// =========================================================
	// Движение в координатах маршрута (base_x/base_y -> point_x/point_y)
	// [FIX] вместо старой схемы с length_x/length_y, которая давала кружение
	// =========================================================
	speed = global.escortally[indx, 1];
	speed *= (image_xscale - basic_size + basic_size);
	speed *= global.timespeed;
	speed /= global.mapsize;

	if (speed < 0) speed = 0;

	var dist_to_target = point_distance(base_x, base_y, point_x, point_y);
	var move_dir = point_direction(base_x, base_y, point_x, point_y);

	if (dist_to_target > 0)
	{
		if (dist_to_target <= speed)
		{
			base_x = point_x; // [FIX] снап к точке, чтобы не было вечного перелёта через неё
			base_y = point_y;
		}
		else
		{
			base_x += lengthdir_x(speed, move_dir);
			base_y += lengthdir_y(speed, move_dir);
		}
	}

	// =========================================================
	// Пересчёт экранных координат уже ПОСЛЕ движения
	// =========================================================
	if (point_x > map_obj.basic_x) point_xn = point_x + (point_x - 450) * (map_obj.image_xscale - 1);
	if (point_x < map_obj.basic_x) point_xn = point_x - (450 - point_x) * (map_obj.image_xscale - 1);
	if (point_y > map_obj.basic_y) point_yn = point_y + (point_y - 450) * (map_obj.image_yscale - 1);
	if (point_y < map_obj.basic_y) point_yn = point_y - (450 - point_y) * (map_obj.image_yscale - 1);

	image_xscale = map_obj.image_xscale - basic_size;
	image_yscale = map_obj.image_yscale - basic_size;

	if (base_x > map_obj.basic_x) new_x = base_x + (base_x - 450) * (map_obj.image_xscale - 1);
	if (base_x < map_obj.basic_x) new_x = base_x - (450 - base_x) * (map_obj.image_xscale - 1);
	if (base_y > map_obj.basic_y) new_y = base_y + (base_y - 450) * (map_obj.image_yscale - 1);
	if (base_y < map_obj.basic_y) new_y = base_y - (450 - base_y) * (map_obj.image_yscale - 1);

	point_xn = point_xn + (map_obj.x - map_obj.basic_x);
	point_yn = point_yn + (map_obj.y - map_obj.basic_y);

	x = new_x + (map_obj.x - map_obj.basic_x);
	y = new_y + (map_obj.y - map_obj.basic_y);

	direction = point_direction(x, y, point_xn, point_yn);
	image_angle = direction;

	// =========================================================
	// Подпись
	// =========================================================
	if (instance_exists(text))
	{
		text.x = x;
		text.y = y;

		name = indx;
		name = string_insert(global.txt281, indx, 0);
		text.txt = "";

		if (image_xscale > 1.4) text.txt = name;
	}

	// =========================================================
	// Статус 0 - летит к точке
	// =========================================================
	if (status == 0)
	{
		if (point_distance(base_x, base_y, point_x, point_y) <= max(speed, 1)) // [FIX]
		{
			if (type == 1)
			{
				status = 2;
				height = irandom_range(10000, 20000);
			}

			if (type == 2)
			{
				status = 2;
				height = irandom_range(10000, 20000);
			}

			if (type == 3)
			{
				instance_destroy(self);
				exit;
			}
		}
	}

	// =========================================================
	// Статус 1 - атака цели
	// =========================================================
	if (status == 1)
	{
		
		if (!instance_exists(target) || point_distance(base_x, base_y, target.base_x, target.base_y) < max(speed, 1)) // [FIX]
		{
			
			if (instance_exists(target) && !global.fight && !global.autofight) 
			{
				if (target.object_index == onmap_enemy) add_fight_to_sequence(0, 0, target.indx, target.own_id, indx, own_id, 2, 0);
				else
				if (target.object_index == onmap_enemysite)
				{
					for (var i = 4; i < global.escortally[indx, 0] + 4; i++)
					{
						global.santaplanes[global.escortally[indx, i], 12] = target.santa_escort_index;
					}
					//add_fight_to_sequence(0, 0, target.escort_index, target.own_id, target.santa_escort_index, own_id, 2, target.own_id);
					// самолеты будут участвовать в бою только с игроком, по-другому не получится без переделки autobattle так как
					// эскадрилья сейчас сразу же удалится из-за смены эскадрильи, а вместо игрока записать нельзя - данные в разных ячейках.
					show_debug_message($"Эскадрилья союзника {indx} влилась в воздушный бой!");
					instance_destroy(self); exit;
				}
				else
				{
					status = 3;
					target = noone;
					show_debug_message($"ОШИБКА: СОЮЗНИК {indx} НЕ РАСПОЗНАЛ ЦЕЛЬ!");
				}
			}

			if (infight && global.autofight && !global.fight)
			{
				if (global.win == 2)
				{
					for (var i = 1; i <= global.eggplanes[0, 0]; i++)
					{
						show_debug_message($"Смотрим подходит ли самолёт {i}");
						if (global.eggplanes[i, 12]	== global.EGG_escort_onfight)
						{
							show_debug_message("Смотрим нужно ли разблокировать страницу в уфопедии");
							var unlocked = false;
							if (global.eggplanes[i, 0] == 1 && !global.wiki[49, 2]) { show_debug_message("Разблокировали!"); global.wiki[49, 2] = true; unlocked = true; }
							if (global.eggplanes[i, 0] == 2 && !global.wiki[50, 2]) { show_debug_message("Разблокировали!"); global.wiki[50, 2] = true; unlocked = true; }
							if (global.eggplanes[i, 0] == 3 && !global.wiki[51, 2]) { show_debug_message("Разблокировали!"); global.wiki[51, 2] = true; unlocked = true; }
							if (global.eggplanes[i, 0] == 4 && !global.wiki[52, 2]) { show_debug_message("Разблокировали!"); global.wiki[52, 2] = true; unlocked = true; }
							if (global.eggplanes[i, 0] == 5 && !global.wiki[53, 2]) { show_debug_message("Разблокировали!"); global.wiki[53, 2] = true; unlocked = true; }
							if (global.eggplanes[i, 0] == 6 && !global.wiki[54, 2]) { show_debug_message("Разблокировали!"); global.wiki[54, 2] = true; unlocked = true; }
							if (global.eggplanes[i, 0] == 7 && !global.wiki[55, 2]) { show_debug_message("Разблокировали!"); global.wiki[55, 2] = true; unlocked = true; }
							if (unlocked)
							{
								time_m.menu_messages[0,0]++;
								time_m.menu_messages[time_m.menu_messages[0,0],0] = global.txt388;
								time_m.menu_messages[time_m.menu_messages[0,0],1] = global.messages_life_time;
								time_m.new_messages = true;
							}
						}
					}
					infight = false;
					fight_win_drop();
				}
				if (global.win == -2)
				{
					infight = false;
					fight_win_drop();
				}
				if (global.win == 3)
				{
					infight = false;
					fight_win_drop();
				}
				if (global.win == -3)
				{
					infight = false;
					fight_win_drop();
					//for (var i = 0; i < instance_number(onmap_enemy); i++)
					//{
					//	if (instance_find(onmap_enemy, i).indx != indx) continue;
					//	var obj = instance_find(onmap_enemy, i);
					//	obj.status = 0;
					//	instance_destroy(self);
					//	break;
					//}
				}
			}
			
			if (!global.fight && !global.autofight)
			{
				
			}
			if (global.autofight && !global.fight)
			{
				show_debug_message($"Союзник {indx} сражается с {target.indx}");
				
				
			}
		}
		if (!instance_exists(target) && status == 1)
		{
			status = 2;
		}
	}

	// =========================================================
	// Статус 2 - выбор нового действия
	// =========================================================
	if (status == 2)
	{
		var nearest_city = instance_nearest(x, y, onmap_city);
		var near_enemy = noone;

		var x_deviation = irandom_range(-100, 100);
		var y_deviation = irandom_range(-100, 100);

		if (type == 1) // разведчик
		{
			point_x = irandom_range(0, 900);
			point_y = irandom_range(0, 900);

			status = choose(0, 0, 0, 3);
		}
		else if (type == 2)
		{
			var is_air_terror_exist = false;
			var terror = noone;
			for (var i = 0; i < instance_number(onmap_enemysite); i++)
			{
				terror = instance_find(onmap_enemysite, i);
				if (terror.type == 1 || terror.type == 2) { is_air_terror_exist = true; break; }
				terror = noone;
			}
			near_enemy = instance_nearest(base_x, base_y, onmap_enemy);
			if ((!is_air_terror_exist && !instance_exists(near_enemy)) || (instance_exists(near_enemy) && point_distance(nearest_city.base_x, nearest_city.base_y, near_enemy.base_x, near_enemy.base_y) > 500) || (instance_exists(terror) && point_distance(terror.base_x, terror.base_y, terror.base_x, terror.base_y) > 500))
			{
				if (instance_exists(nearest_city))
				{
					point_x = nearest_city.x + x_deviation;
					point_y = nearest_city.y + y_deviation;
					point_x = max(0, min(900, point_x));
					point_y = max(0, min(900, point_y));
				}

				if (first_spawn)
				{
					first_spawn = false;
					status = 0;
				}
				else
				{
					status = choose(0, 0, 0, 0, 3);
				}
			}
			else
			if (instance_exists(near_enemy))
			{
				status = 1;
				target = near_enemy;
				target_id = near_enemy.own_id;
				point_x = target.base_x;
				point_y = target.base_y;
			} 
			else
			if (instance_exists(terror))
			{
				near_enemy = noone;
				for (var i = 0; i < instance_number(onmap_enemysite); i++)
				{
					terror = instance_find(onmap_enemysite, i);
					if (!instance_exists(near_enemy))
					{
						if (terror.type == 1 || terror.type == 2) { near_enemy = terror; }
					}
					else
					{
						var dist_1 = point_distance(base_x, base_y, terror.base_x, terror.base_y);
						var dist_2 = point_distance(base_x, base_y, near_enemy.base_x, near_enemy.base_y);
						if (dist_1 < dist_2) near_enemy = terror;
					}
					
				}
				status = 1;
				target = near_enemy;
				target_id = near_enemy.own_id;
				point_x = target.base_x;
				point_y = target.base_y;
			}
		}
		else if (type == 3)
		{
			target = noone; // [FIX]

			for (var i = 0; i < instance_number(onmap_city); i++)
			{
				var city = instance_find(onmap_city, i);
				if (city != nearest_city)
				{
					target = city;
					break;
				}
			}

			if (instance_exists(target))
			{
				point_x = target.base_x;
				point_y = target.base_y;
				status = 0;
			}
			else
			{
				status = 3;
			}
		}
		else
		{
			status = 1;
		}
	}

	// =========================================================
	// Статус 3 - возвращение
	// =========================================================
	if (status == 3)
	{
		var city = instance_nearest(x, y, onmap_city);

		if (instance_exists(city))
		{
			point_x = city.base_x; // [FIX]
			point_y = city.base_y; // [FIX]
			direction = point_direction(x, y, city.x, city.y);

			if (point_distance(base_x, base_y, city.base_x, city.base_y) < max(speed, 1)) // [FIX]
			{
				instance_destroy(self);
				exit;
			}
		}
	}
}

// base_x = x;
// base_y = y;

if (target != noone && target != 0 && instance_exists(target))
{
	target_id = target.own_id;
}
speed = 0;