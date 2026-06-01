if (!ready and indx != 0)
{
	// защита от неинициализированной эскадрильи (первый кадр после спавна)
	//if (global.escortfoe[indx, 0] <= 0) exit;

	// выгружаем топливо из ПТБ и выкидываем его
	for (var i = 4; i < global.escortplayer[indx, 0] + 4; i++)
	{
		if (global.planes[global.escortplayer[indx, i], 6] == 7 && global.planes[global.escortplayer[indx, i], 7] > 0) 
		{ 
			global.planes[global.escortplayer[indx, i], 1] += global.fuelbonus; 
			global.planes[global.escortplayer[indx, i], 7] = 0;
		}
		if (global.planes[global.escortplayer[indx, i], 8] == 7 && global.planes[global.escortplayer[indx, i], 9] > 0) 
		{ 
			global.planes[global.escortplayer[indx, i], 1] += global.fuelbonus; 
			global.planes[global.escortplayer[indx, i], 9] = 0;
		}
		if (global.planes[global.escortplayer[indx, i], 10] == 7 && global.planes[global.escortplayer[indx, i], 11] > 0) 
		{ 
			global.planes[global.escortplayer[indx, i], 1] += global.fuelbonus; 
			global.planes[global.escortplayer[indx, i], 11] = 0;
		}
	}
	
	ready = true;

}

if (ready)
{
	
	// макс. высота
	height = 9999999999999999;
	for (var i = 4; i < global.escortplayer[indx, 0] + 4; i++)
	{
		if (global.planes[global.escortplayer[indx, i], 2] < 1)	continue;
		if (i == 4) height = global.planedata[global.planes[global.escortplayer[indx, i], 0], 17];
		else
			if (global.planedata[global.planes[global.escortplayer[indx, i], 0], 17] < height and i > 4) height = global.planedata[global.planes[global.escortplayer[indx, i], 0], 17];
	}
	// макс. топливо
	global.escortplayer[indx, 2] = 9999999999999999;
	for (var i = 4; i < global.escortplayer[indx, 0] + 4; i++)
	{
		if (global.planes[global.escortplayer[indx, i], 2] < 1)	continue;
		if (i == 4) global.escortplayer[indx, 2] = global.planes[global.escortplayer[indx, i], 1];
		else
			if (global.planes[global.escortplayer[indx, i], 1] < global.escortplayer[indx, 2] and i > 4) global.escortplayer[indx, 2] = global.planes[global.escortplayer[indx, i], 1]; 
	}
	// макс. скорость
	global.escortplayer[indx, 1] = 9999999999999999;
	for (var i = 4; i < global.escortplayer[indx, 0] + 4; i++)
	{
		if (global.planes[global.escortplayer[indx, i], 2] < 1)	continue;
		if (i == 4) global.escortplayer[indx, 1] = global.planedata[global.planes[global.escortplayer[indx, i], 0], 6];
		else
			if (global.planedata[global.planes[global.escortplayer[indx, i], 0], 6] < global.escortplayer[indx, 1] and i > 4) global.escortplayer[indx, 1] = global.planedata[global.planes[global.escortplayer[indx, i], 0], 6]; 
	}
	// дальность РЛС
	global.escortplayer[indx, 3] = 0;
	for (var i = 4; i < global.escortplayer[indx, 0] + 4; i++)
	{
		if (global.planes[global.escortplayer[indx, i], 2] < 1)	continue;
		if (i == 4) global.escortplayer[indx, 3] = global.planedata[global.planes[global.escortplayer[indx, i], 0], 14];
		else
			if (global.planedata[global.planes[global.escortplayer[indx, i], 0], 14] > global.escortplayer[indx, 3] and i > 4) global.escortplayer[indx, 3] = global.planedata[global.planes[global.escortplayer[indx, i], 0], 14]; 
	}
	radar_range = global.escortplayer[indx, 3] * (image_xscale + basic_size);
		
		
	has_planes = false;
	for (var i = 4; i < global.escortplayer[indx, 0] + 4; i ++)
	{
		if (global.planes[global.escortplayer[indx, i], 2] > 0) { has_planes = true; break; }	
	}
	if (!has_planes && !infight) { instance_destroy(self); exit; }
		
		
		
		
	image_angle = direction;	
		
		
		
		
		
		
	if (has_planes || infight)
	{
		if (status == 7)
		{
			if (global.debug) show_debug_message($"Эскадрилья {indx} получает целеуказание!");
			//if ((instance_exists(onmap_enemy) && instance_exists(onmap_enemy)) || (instance_exists(target) && target.object_index == onmap_enemy))
			//{
			//	if (!instance_exists(target))
			//	{
			//		if (point_distance(point_x, point_y, instance_nearest(point_x, point_y, onmap_enemy).x, instance_nearest(point_x, point_y, onmap_enemy).y) < 1)
			//		{
			//			target = instance_nearest(point_x, point_y, onmap_enemy);
			//			point_x = target.base_x;
			//			point_y = target.base_y;
			//			status = 1;
			//			if (global.debug) show_debug_message($"Эскадрилья {indx} нашла и летит на цель НЛО {target.indx}!");
			//		}
			//		else 
			//		{
			//			if (global.debug) show_debug_message($"Эскадрилья {indx} не нашла цель!");
			//			status = 0;
			//		}
			//	}
			//	else
			//	{
			//		point_x = target.base_x;
			//		point_y = target.base_y;
			//		status = 1;
			//		if (global.debug) show_debug_message($"Эскадрилья {indx} летит на цель НЛО {target.indx}!");
			//	}
			//}
			//else
			//if ((instance_exists(onmap_enemysite) && instance_exists(onmap_enemysite)) || (instance_exists(target) && target.object_index == onmap_enemysite))
			//{
			//	if (!instance_exists(target))
			//	{
			//		if (point_distance(point_x, point_y, instance_nearest(point_x, point_y, onmap_enemysite).x, instance_nearest(point_x, point_y, onmap_enemysite).y) < 1)
			//		{
			//			target = instance_nearest(point_x, point_y, onmap_enemysite);
			//			point_x = target.base_x;
			//			point_y = target.base_y;
			//			status = 4;
			//			if (global.debug) show_debug_message($"Эскадрилья {indx} нашла и летит на цель террор {target.indx}!");
			//		}
			//		else 
			//		{
			//			if (global.debug) show_debug_message($"Эскадрилья {indx} не нашла цель!");
			//			status = 0;
			//		}
			//	}
			//	else
			//	{
			//		point_x = target.base_x;
			//		point_y = target.base_y;
			//		status = 4;
			//		if (global.debug) show_debug_message($"Эскадрилья {indx} летит на цель террор {target.indx}!");
			//	}
			//}
			//else
			//if ((instance_exists(onmap_building_enemy) && instance_exists(onmap_building_enemy)) || (instance_exists(target) && target.object_index == onmap_building_enemy))
			//{
			//	if (!instance_exists(target))
			//	{
			//		if (point_distance(point_x, point_y, instance_nearest(point_x, point_y, onmap_building_enemy).x, instance_nearest(point_x, point_y, onmap_building_enemy).y) < 1)
			//		{
			//			target = instance_nearest(point_x, point_y, onmap_building_enemy);
			//			point_x = target.base_x;
			//			point_y = target.base_y;
			//			status = 1;
			//			if (global.debug) show_debug_message($"Эскадрилья {indx} нашла и летит на цель база {target.indx}!");
			//		}
			//		else 
			//		{
			//			if (global.debug) show_debug_message($"Эскадрилья {indx} не нашла цель!");
			//			status = 0;
			//		}
			//	}
			//	else
			//	{
			//		point_x = target.base_x;
			//		point_y = target.base_y;
			//		status = 1;
			//		if (global.debug) show_debug_message($"Эскадрилья {indx} летит на цель база {target.indx}!");
			//	}
			//}
			//else
			{
				status = 0;	
			}
		}	
		
		if (status == 1 && instance_exists(target))
		{
		    point_x = target.base_x;
		    point_y = target.base_y;
		}
		
		point_xn = point_x;
		point_yn = point_y;
		new_x = base_x;
		new_y = base_y;
		
		if (point_x > map_obj.basic_x) point_xn = point_x + (point_x - 450) * (map_obj.image_xscale - 1);
		else if (point_x < map_obj.basic_x) point_xn = point_x - (450 - point_x) * (map_obj.image_xscale - 1);
		
		if (point_y > map_obj.basic_y) point_yn = point_y + (point_y - 450) * (map_obj.image_yscale - 1);
		else if (point_y < map_obj.basic_y) point_yn = point_y - (450 - point_y) * (map_obj.image_yscale - 1);
		
		image_xscale = map_obj.image_xscale - basic_size;
		image_yscale = map_obj.image_yscale - basic_size;
		
		if (base_x > map_obj.basic_x) new_x = base_x + (base_x - 450) * (map_obj.image_xscale - 1);
		else if (base_x < map_obj.basic_x) new_x = base_x - (450 - base_x) * (map_obj.image_xscale - 1);
		
		if (base_y > map_obj.basic_y) new_y = base_y + (base_y - 450) * (map_obj.image_yscale - 1);
		else if (base_y < map_obj.basic_y) new_y = base_y - (450 - base_y) * (map_obj.image_yscale - 1);
		
		point_xn += (map_obj.x - map_obj.basic_x);
		point_yn += (map_obj.y - map_obj.basic_y);
		
		// [FIX] ЭТО ЛУЧШЕ УБРАТЬ, иначе ты затираешь преобразованные координаты
		// if (status != 2 && status != 0)
		// {
		//     point_xn = point_x;
		//     point_yn = point_y;
		// }
		
		x = new_x + (map_obj.x - map_obj.basic_x);
		y = new_y + (map_obj.y - map_obj.basic_y);
		
		speed = global.escortplayer[indx, 1];
		speed *= (image_xscale + basic_size);
		speed *= global.timespeed;
		speed /= global.mapsize;
		//direction = point_direction(x, y, point_xn, point_yn);
		
		length_x = lengthdir_x(point_distance(x, y, point_xn, point_yn), point_direction(x, y, point_xn, point_yn));
		length_y = lengthdir_y(point_distance(x, y, point_xn, point_yn), point_direction(x, y, point_xn, point_yn));
		
		if (abs(length_x) < 0.0001) length_x = 0.0001;
		if (abs(length_y) < 0.0001) length_y = 0.0001;
		if (x > point_xn) base_x -= speed / sqrt(sqr(length_y) / sqr(length_x) + 1);
			else base_x += speed / sqrt(sqr(length_y) / sqr(length_x) + 1);
		if (y > point_yn) base_y -= speed / sqrt(sqr(length_x) / sqr(length_y) + 1);
			else base_y += speed / sqrt(sqr(length_x) / sqr(length_y) + 1);
		
		
		//speed = 0;
		
		if (instance_exists(text))
		{
			text.x = x;
			text.y = y;
			
			name = indx;
			name = string_insert(global.txt185, indx, 0);
			
			
			text.txt = "";
			if (image_xscale > 1.4) text.txt = name;
		}
		
		drw.indx = indx;
		drw.range = radar_range;
		
		global.escortplayer[indx, 2] -= global.timespeed;
		
		if (status == 0)
		{
			drw.point_x = point_xn;
			drw.point_y = point_yn;
			direction = point_direction(x, y, point_xn, point_yn);
			if (point_distance(base_x, base_y, point_x, point_y) < max(1, speed))
			{
				if (!instance_exists(ask_parent))
				{
					mes = instance_create(1200 / 2, 900 / 2, ask_question_plane_designation_reached);
					mes.indx = indx
					status = 2;
				}
				else
				{
					global.timespeed = 0;
				}
			}
		}
		//
		
		if (status == 1 || status == 5 || status == 6 || status == 4)
		{
			if (instance_exists(target))
			{
				drw.point_x = point_xn;
				drw.point_y = point_yn;
				point_x = target.base_x;
				point_y = target.base_y;
			}
			direction = point_direction(x, y, point_xn, point_yn);
			if (true)
			{
				if (status != 4) // Воздушный бой
				{
					if (!global.fight && !global.autofight && instance_exists(target))
					if (has_planes && array_length(global.fight_sequence) < 1 && global.win == 0 && !infight && global.timespeed > 0 && (point_distance(base_x, base_y, target.base_x, target.base_y) < max(1, speed) && (status == 1 || (status == 6 && target.height <= height))) && !instance_exists(ask_parent))
					{
						if (!instance_exists(ask_parent))
						{
							mes = instance_create(1200 / 2, 900 / 2, ask_question_plane_designation_reached);
							mes.indx = indx
							mes.target = target;
							mes.owner = self;
							mes.type = 2
						}
						else
						{
							global.timespeed = 0;
						}
					}
					if (infight && global.fight && !global.autofight)
					{
						if (global.win == 1)
						{
							status = 3;
							show_debug_message("Эскадрилья возвращается домой после боя");
							fight_win_drop();
							infight = false;
						}
						if (global.win == -1)
						{
							status = 3;
							show_debug_message("Эскадрилья возвращается домой после боя");
							fight_win_drop();
							infight = false;
						}
					}
					if (infight && global.autofight && !global.fight)
					{
						//global.XMAS_escort_onfight = indx;
						//global.EGG_escort_onfight = target.indx;
						if (global.win == 2)
						{
							for (var i = 1; i <= global.eggplanes[0, 0]; i++)
							{
								show_debug_message($"Смотрим подходит ли самолёт {i}");
								if (global.eggplanes[i, 12]	== global.EGG_escort_onfight)
								{
									var unlocked = false;
									show_debug_message("Смотрим нужно ли разблокировать страницу в уфопедии");
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
							status = 3;
							show_debug_message("Эскадрилья возвращается домой после боя");
							if (!instance_exists(ask_parent))
							{
								mes = instance_create(1200 / 2, 900 / 2, ask_message);
								mes.event = 17
							}
							else
							{
								time_m.menu_messages[0,0]++;
								time_m.menu_messages[time_m.menu_messages[0,0],0] = global.txt251;
								time_m.menu_messages[time_m.menu_messages[0,0],1] = global.messages_life_time;
								time_m.new_messages = true;
							}
							infight = false;
							fight_win_drop();
						}
						if (global.win == -2)
						{
							status = 3;
							show_debug_message("Эскадрилья возвращается домой после боя");
							if (!instance_exists(ask_parent))
							{
								mes = instance_create(1200 / 2, 900 / 2, ask_message);
								mes.event = 18
							}
							else
							{
								time_m.menu_messages[0,0]++;
								time_m.menu_messages[time_m.menu_messages[0,0],0] = global.txt252;
								time_m.menu_messages[time_m.menu_messages[0,0],1] = global.messages_life_time;
								time_m.new_messages = true;
							}
							infight = false;
							fight_win_drop();
						}
						if (global.win == 3)
						{
							status = 3;
							show_debug_message("Эскадрилья возвращается домой после боя");
							if (!instance_exists(ask_parent))
							{
								mes = instance_create(1200 / 2, 900 / 2, ask_message);
								mes.event = 19
							}
							else
							{
								time_m.menu_messages[0,0]++;
								time_m.menu_messages[time_m.menu_messages[0,0],0] = global.txt253;
								time_m.menu_messages[time_m.menu_messages[0,0],1] = global.messages_life_time;
								time_m.new_messages = true;
							}
							infight = false;
							fight_win_drop();
						}
						if (global.win == -3)
						{
							status = 3;
							show_debug_message("Эскадрилья возвращается домой после боя");
							if (!instance_exists(ask_parent))
							{
								mes = instance_create(1200 / 2, 900 / 2, ask_message);
								mes.event = 20
							}
							else
							{
								time_m.menu_messages[0,0]++;
								time_m.menu_messages[time_m.menu_messages[0,0],0] = global.txt254;
								time_m.menu_messages[time_m.menu_messages[0,0],1] = global.messages_life_time;
								time_m.new_messages = true;
							}
							infight = false;
							fight_win_drop();
						}
					}
				}
				else // Террор
				{
					// Наземный бой (террор)
					if (instance_exists(target) && (target.object_index == onmap_building_enemy || (target.object_index == onmap_enemysite && target.type > 2)))
					{
						if (!global.fight && !global.autofight && instance_exists(target))
				 		if (has_planes && array_length(global.fight_sequence) < 1 && global.win == 0 && !infight && global.timespeed > 0 && point_distance(base_x, base_y, target.base_x, target.base_y) < max(1, speed) && !instance_exists(ask_question_plane_designation_reached))
						{
							if (!instance_exists(ask_parent))
							{
								mes = instance_create(1200 / 2, 900 / 2, ask_question_plane_designation_reached);
								mes.indx = indx;
								mes.owner = self;
								mes.target = target;
								mes.type = 5
							}
							else
							{
								global.timespeed = 0;	
							}
						}
						if (point_distance(base_x, base_y, target.base_x, target.base_y) < max(1, speed) && infight)
						{
							squad_array = unite_or_split_squads(indx, 0);
							global.XMAS_squad_onfight = squad_array[0].new_squad_index; //indx;
							global.EGG_squad_onfight = 0;
							if (variable_instance_exists(target, "squad_index")) global.EGG_squad_onfight = target.squad_index;
							global.SANTA_squad_onfight = 0;
							if (variable_instance_exists(target, "santa_squad_index")) global.SANTA_squad_onfight = target.santa_squad_index;
							if (!global.fight && !global.autofight && global.win == 0)
							add_fight_to_sequence(global.XMAS_squad_onfight, 0, global.EGG_squad_onfight, 0, global.SANTA_squad_onfight, 0, 5, target.own_id);
							if (target.object_index == onmap_building_enemy)
							{
								if (!global.santa_will_support_next_assault)
								{
									if (target.santa_will_support) global.santa_will_support_next_assault = true;
								}
							}
							
							if (global.fight && !global.autofight)
							{
								if (global.win == 0)
								{
									global.ground_battle_type = target.battle_type;
									var back = instance_create(0, 0, background_map);
									back.type = 11;
									target.infight = true;
								}
								if (global.win == 1)
								{
									squad_array = unite_or_split_squads(indx, squad_array);
									
									status = 3;
									if (global.intros)
									{
										global.timespeed = 0;
										room_goto(intro_mission_accomplished);
									}
									var back = instance_create(0, 0, background_map);
									back.type = 12;
									infight = false;
									//fight_win_drop();
								}
								if (global.win == -1)
								{
									if (target.type == 5) { global.passed_emeralds_counts++; instance_destroy(target); }
									squad_array = unite_or_split_squads(indx, squad_array);
									status = 3;
									if (global.intros)
									{
										global.timespeed = 0;
										room_goto(intro_mission_failed);
									}
									var back = instance_create(0, 0, background_map);
									back.type = 12;
									infight = false;
									//fight_win_drop();
								}
								if (global.win == -2)
								{
									if (target.type == 5) { global.passed_emeralds_counts++; instance_destroy(target); }
									squad_array = unite_or_split_squads(indx, squad_array);
									status = 3;
									if (global.intros)
									{
										global.timespeed = 0;
										room_goto(intro_mission_aborted);
									}
									var back = instance_create(0, 0, background_map);
									back.type = 12;
									infight = false;
									//fight_win_drop();
								}
							}
						}
					}
					else
					if (instance_exists(target) && target.object_index == onmap_enemysite && target.type <= 2 && target.type > 0) // Воздушный бой (террор)
					{
						if (!global.fight && !global.autofight)
				 		if (has_planes && global.win == 0 && !infight && global.timespeed > 0 && point_distance(base_x, base_y, target.base_x, target.base_y) < max(1, speed) && !instance_exists(ask_question_plane_designation_reached))
						{
							if (!instance_exists(ask_parent))
							{
								mes = instance_create(1200 / 2, 900 / 2, ask_question_plane_designation_reached);
								mes.indx = indx;
								mes.owner = self;
								mes.target = target;
								mes.type = 6;
							}
							else
							{
								global.timespeed = 0;	
							}
						}
						if (infight && global.fight && !global.autofight)
						{
							if (global.win == 0)
							{
								target.infight = true;	
							}
							if (global.win == 1)
							{
								status = 3;
								infight = false;
								fight_win_drop();
							}
							if (global.win == -1)
							{
								status = 3;
								infight = false;
								fight_win_drop();
							}
						}
						if (infight && global.autofight && !global.fight)
						{
							
							if (global.win == 2)
							{
								status = 3;
								if (!instance_exists(ask_parent))
								{
									mes = instance_create(1200 / 2, 900 / 2, ask_message);
									mes.event = 17
								}
								else
								{
									time_m.menu_messages[0,0]++;
									time_m.menu_messages[time_m.menu_messages[0,0],0] = global.txt251;
									time_m.menu_messages[time_m.menu_messages[0,0],1] = global.messages_life_time;
									time_m.new_messages = true;
								}
								infight = false;
								fight_win_drop();
							}
							if (global.win == 0)
							{
								target.infight = true;	
							}
							if (global.win == -2)
							{
								status = 3;
								if (!instance_exists(ask_parent))
								{
									mes = instance_create(1200 / 2, 900 / 2, ask_message);
									mes.event = 18
								}
								else
								{
									time_m.menu_messages[0,0]++;
									time_m.menu_messages[time_m.menu_messages[0,0],0] = global.txt252;
									time_m.menu_messages[time_m.menu_messages[0,0],1] = global.messages_life_time;
									time_m.new_messages = true;
								}
								infight = false;
								fight_win_drop();
							}
							if (global.win == 3)
							{
								status = 3;
								if (!instance_exists(ask_parent))
								{
									mes = instance_create(1200 / 2, 900 / 2, ask_message);
									mes.event = 19
								}
								else
								{
									time_m.menu_messages[0,0]++;
									time_m.menu_messages[time_m.menu_messages[0,0],0] = global.txt253;
									time_m.menu_messages[time_m.menu_messages[0,0],1] = global.messages_life_time;
									time_m.new_messages = true;
								}
								infight = false;
								fight_win_drop();
							}
							if (global.win == -3)
							{
								status = 3;
								if (!instance_exists(ask_parent))
								{
									mes = instance_create(1200 / 2, 900 / 2, ask_message);
									mes.event = 20
								}
								else
								{
									time_m.menu_messages[0,0]++;
									time_m.menu_messages[time_m.menu_messages[0,0],0] = global.txt254;
									time_m.menu_messages[time_m.menu_messages[0,0],1] = global.messages_life_time;
									time_m.new_messages = true;
								}
								infight = false;
								fight_win_drop();
							}
							
						}
					}
					else
					if (!instance_exists(target))
					{
						if (infight)
						{
							show_debug_message("У эскадрильи исчезла цель до сброса флага боя!!!");	
							infight = false;
							status = 3;
							fight_win_drop();
						}
					}
				}
			}
		}
		if (!infight && !instance_exists(target) && !instance_exists(background_map) && (status == 1 || status == 5 || status == 6 || status == 4))	
		{
			if (!instance_exists(ask_message))
			{
				mess = instance_create(1200 / 2, 900 / 2, ask_message);
				mess.event = 16;
			}
			else
			{
				time_m.menu_messages[0,0]++;
				time_m.menu_messages[time_m.menu_messages[0,0],0] = global.txt239;
				time_m.menu_messages[time_m.menu_messages[0,0],1] = global.messages_life_time;
				time_m.new_messages = true;
			}
			status = 3;	
		}
		//
		if (status == 2)
		{
		drw.point_x = x;
		drw.point_y = y;
		direction = point_direction(x, y, x, y);
		speed = 0;
		}
		//
		if (status == 3)
		{
			drw.point_x = global.baseonmap.x;
			drw.point_y = global.baseonmap.y;
			point_x = global.baseonmap.base_x;
			point_y = global.baseonmap.base_y;
			direction = point_direction(x, y, global.baseonmap.x, global.baseonmap.y);
			if (point_distance(base_x, base_y, global.baseonmap.base_x, global.baseonmap.base_y) < max(1, speed))
			{
				var i;
				for (i = 1; i <= global.planes[0, 0]; i++)
				{
					if (global.planes[i, 14] != indx) continue;
					global.planes[i, 14] = 0;
					global.planes[i, 1] -= global.escortplayer[indx, 2] / 1000;
				}
				instance_destroy(self);
				global.xmas_score += global.xmas_score_for_success * 5;
			}
		}
		if (global.escortplayer[indx, 2] < 1) global.escortplayer[indx, 2] = 0;
		if (global.escortplayer[indx, 2] = 0 && status != 3) 
		{
			if (!instance_exists(ask_parent))
			{
				mes = instance_create(1200 / 2, 900 / 2, ask_message);
				mes.event = 15;
				mes.plane_indx = indx;
				status = 3;
			}
			else
			{
				time_m.menu_messages[0,0]++;
				time_m.menu_messages[time_m.menu_messages[0,0],0] = string_insert(indx, global.txt186, 0);
				time_m.menu_messages[time_m.menu_messages[0,0],1] = global.messages_life_time;
				time_m.new_messages = true;
			}
		}
		
		
		for (var i = 4; i < global.escortplayer[indx, 0] + 4; i++)
		{
			global.planes[global.escortplayer[indx, i], 1] -= 1 * global.timespeed; 
			if (global.planes[global.escortplayer[indx, i], 1] < 0) global.planes[global.escortplayer[indx, i], 1] = 0;
		}
		
		
	}
}
//base_x = x;
//base_y = y;

if (target != noone && target != 0 && instance_exists(target)) target_id = target.own_id;
speed = 0;