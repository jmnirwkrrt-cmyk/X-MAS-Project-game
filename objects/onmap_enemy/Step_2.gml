if (indx != 0)
{
	var is_collision_with_map = place_meeting(x, y, map_obj); // base_x & base_y
	var had_transport = false;
	
	// макс. скорость
	//if (!founded && debug) show_debug_message($"эскадрилья {indx}, макс. скорость до: {global.escortfoe[indx, 1]}");
	global.escortfoe[indx, 1] = 99999999999999;
	for (var i = 4; i < global.escortfoe[indx, 0] + 4; i++)
	{
		if (global.eggplanes[global.escortfoe[indx, i], 0] == 6) had_transport = true;
		
		if (global.eggplanes[global.escortfoe[indx, i], 1] < 1)	continue;
		if (i == 4) { global.escortfoe[indx, 1] = global.eggplanedata[global.eggplanes[global.escortfoe[indx, i], 0], 6]; /*if (!founded && debug) show_debug_message($"эскадрилья {indx}, скорость первого самолета: {global.eggplanedata[global.eggplanes[global.escortfoe[indx, i], 0], 6]}"); */}
		else
			if (global.eggplanedata[global.eggplanes[global.escortfoe[indx, i], 0], 6] < global.escortfoe[indx, 1] and i > 4) global.escortfoe[indx, 1] = global.eggplanedata[global.eggplanes[global.escortfoe[indx, i], 0], 6]; 
	}
	//if (!founded && debug) show_debug_message($"эскадрилья {indx}, макс. скорость после: {global.escortfoe[indx, 1]}");
	// дальность РЛС
	global.escortfoe[indx, 3] = 0;
	for (var i = 4; i < global.escortfoe[indx, 0] + 4; i++)
	{
		if (global.eggplanes[global.escortfoe[indx, i], 1] < 1)	continue;
		if (i == 4) global.escortfoe[indx, 3] = global.eggplanedata[global.eggplanes[global.escortfoe[indx, i], 0], 14];
		else
			if (global.eggplanedata[global.eggplanes[global.escortfoe[indx, i], 0], 14] > global.escortfoe[indx, 3] and i > 4) global.escortfoe[indx, 3] = global.eggplanedata[global.eggplanes[global.escortfoe[indx, i], 0], 14]; 
	}	
	radar_range = global.escortfoe[indx, 3] * (image_xscale + basic_size);
		
		
	has_planes = false;
	for (var i = 4; i < global.escortfoe[indx, 0] + 4; i++)
	{
		if (global.eggplanes[global.escortfoe[indx, i], 1] > 0) { has_planes = true; break; }	
	}
	if ((type == 7 || type == 8 || type == 6) && !escort_has_alive_transport(indx)) { type = 1; status = 0; }
	if ((type == 5 || type == 3 || type == 4) && !escort_has_alive_bomber(indx)) { type = 1; status = 0; }
	if ((type == 9 || type == 10) && !escort_has_alive_flagship(indx)) { new_mail(9); is_destroyed = true; instance_destroy(self); exit; }
	if (!has_planes && !infight) 
	{ 
		instance_destroy(self); 
		is_destroyed = true;
		global.enemy_score += global.foe_destroy_foe_bonus_score; 
		global.xmas_score += global.foe_destroy_xmas_bonus_score;
		exit;
	}
	//if (debug) founded = true;
	
	if (has_planes || infight)
	{
		is_in_sam_range = false;
		image_blend = c_white;
		if (founded && !first_run)
		{
			for (var i = 0; i < instance_number(onmap_building); i++)
			{
				var obj = instance_find(onmap_building, i);
				if (obj.object_index != onmap_building) continue;
				if (obj.type == 1 && !obj.revealed) continue;
				if (obj.building_time > 0) continue;
				if (point_distance(x, y, obj.x, obj.y) < obj.AA_range) 
				{
					sam_hit_timer -= global.timespeed;
					is_in_sam_range = true;
					
					if (sam_hit_timer < 0)
					{
					 r = irandom_range(0, 100);
						if (r < global.samchance)
						{
							for (i = 4; i < global.escortfoe[indx, 0] + 4; i++)
							{
								if (global.eggplanes[global.escortfoe[indx, i], 1] < 1)	continue;
								global.eggplanes[global.escortfoe[indx, i], 1] -= obj.AA_damage;
								show_debug_message($"Самолет {global.escortfoe[indx, i]} огрёб от ПВО");
								//effect_create_above(ef_flare, x, y, 1, c_red); 
								image_blend = c_black;
								break;
							}
						}
						else
						{
							show_debug_message($"Эскадрилья {indx} уклонилась от ПВО");
						}
						sam_hit_timer = global.sam_hit_rate
					}
				}
				//var obj = instance_find(map_obj, i);
				//if (obj.radar_range)
			}	
		}
			
		/// Проверка на появившийся сбитый транспорт и спавн места крушения под него
		if (!is_destroyed && had_transport)
		{
			get_must_to_deploy_transport(indx, false);
			squad_array = unite_or_split_squads(indx, 0);
			if (array_length(squad_array) > 0 && is_collision_with_map)
			{
				show_debug_message("Создаем место крушения");
		
				var terror_site = instance_create(base_x, base_y, onmap_enemysite);
				terror_site.base_x = base_x;
				terror_site.base_y = base_y;
				terror_site.name   = global.txt300 + string(indx);
				terror_site.type   = 6;
				terror_site.squad_index = squad_array[array_length(squad_array) - 1].new_squad_index;
				
				merge_terrors(terror_site);
				
				if (!instance_exists(ask_parent))
				{
					var mes = instance_create(1200 / 2, 900 / 2, ask_message_big);
					mes.event = 14;
					mes.ufo_number = indx;
					mes.target = terror_site;
				}
				else
				{
					time_m.menu_messages[0, 0]++;
					time_m.menu_messages[time_m.menu_messages[0, 0], 0] = global.txt300 + string(indx);
					time_m.menu_messages[time_m.menu_messages[0, 0], 1] = global.messages_life_time;
					time_m.new_messages = true;
				}
			}
		}
		
			
		if (!first_run)
		{
			if (!founded)
			{
				if (!global.debug) { visible = false; }
				is_in_radar_range = false;
				var radar_scan_result = radar_scan();
				if (radar_scan_result > 0) is_in_radar_range = true;
				if (radar_scan_result == 2) { founded = true; target_detected_message(); }
			}
			else 
			{
				visible = true;
				is_in_radar_range = false;
				var radar_scan_result = radar_scan();
				if (radar_scan_result > 0) is_in_radar_range = true;
				
				if (!is_in_radar_range && !global.debug) { founded = false; visible = false; }
			}
		}
		image_angle = direction;
		
	
		if ((status == 1 || status == 4 || status == 5 || status == 6) && instance_exists(target))
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
		
		if (speed_deviation < global.min_ai_escort_speed) speed_deviation = global.min_ai_escort_speed;
		speed = speed_deviation;
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
		
		if (instance_exists(text))
		{
			text.x = x;
			text.y = y;
			
			name = indx;
			name = string_insert(global.txt181, indx, 0);
			
			
			text.txt = "";
			if (image_xscale > 1.4) text.txt = name;
		}
		
		
		if (status == 0) // полет к точке
		{
			// обнаружение строений
			if (type == 1)
			{
				if (ground_reveal_timer < 0)
				{
					if (instance_exists(onmap_building))
					{
						for (var i = 0; i < instance_number(onmap_building); i++)
						{
							var building = instance_find(onmap_building, i);
							if (distance_to_object(building) < radar_range)
							{
								r = irandom_range(0, 100);
								var chance = global.reveal_chance_building;
								if (building.type == 1) chance = global.reveal_chance_base;
								if (r < chance) 
								{ 
									building.revealed = true; 
									if (building == global.baseonmap || building.type == 1)
									{
										new_mail(15);
									}
								}
							}
						}
					}
				}
			}
			
			// события во время следования
			if ((type == 1 || type == 2) && accident_timer < 0)
			{
				r = irandom_range(0, 40);
				if (r == 1)
				{
					var event = instance_create(base_x, base_y, text_obj_small_event);
					event.txt = global.txt268 + $"{time_m.txt}";
					global.enemy_score += 10; // замечен неопознанный самолет
				}
				if (r == 2)
				{
					var event = instance_create(base_x, base_y, text_obj_small_event);
					event.txt = global.txt272 + $"{time_m.txt}";
					global.enemy_score += 10; // шум в небе
				}
				if (r == 3)
				{
					var event = instance_create(base_x, base_y, text_obj_small_event);
					event.txt = global.txt273 + $"{time_m.txt}";
					global.enemy_score += 15; // помехи в радиосвязи
				}
				if (r == 4)
				{
					var event = instance_create(base_x, base_y, text_obj_small_event);
					event.txt = global.txt274 + $"{time_m.txt}";
					global.enemy_score += 10; // шум на радаре
				}
			}
			else
			if ((type == 3 || type == 4 || type == 5) && accident_timer < 0)
			{
				r = irandom_range(0, 55);
				if (r == 1)
				{
					var event = instance_create(base_x, base_y, text_obj_small_event);
					event.txt = global.txt268 + $"{time_m.txt}";
					global.enemy_score += 10; // замечен неопознанный самолет
				}
				if (r == 2)
				{
					var event = instance_create(base_x, base_y, text_obj_small_event);
					event.txt = global.txt272 + $"{time_m.txt}";
					global.enemy_score += 10; // шум в небе
				}
				if (r == 3)
				{
					var event = instance_create(base_x, base_y, text_obj_small_event);
					event.txt = global.txt273 + $"{time_m.txt}";
					global.enemy_score += 15; // помехи в радиосвязи
				}
				if (r == 4)
				{
					var event = instance_create(base_x, base_y, text_obj_small_event);
					event.txt = global.txt274 + $"{time_m.txt}";
					global.enemy_score += 10; // шум на радаре
				}
				if (r == 5 && is_collision_with_map)
				{
					var event = instance_create(base_x, base_y, text_obj_small_event);
					event.txt = global.txt270 + $"{time_m.txt}";
					global.enemy_score += 50; // конвой обстрелян
					global.xmas_score -= 10;
				}
				if (r == 6 && is_collision_with_map)
				{
					var event = instance_create(base_x, base_y, text_obj_small_event);
					event.txt = global.txt271 + $"{time_m.txt}";
					global.enemy_score += 75; // патруль уничтожен
					global.xmas_score -= 25;
				}
				if (r == 7 && is_collision_with_map)
				{
					var event = instance_create(base_x, base_y, text_obj_small_event);
					event.txt = global.txt277 + $"{time_m.txt}";
					global.enemy_score += 100; // опорный пункт уничтожен
					global.xmas_score -= 30;
				}
			}
			else
			if ((type == 6 || type == 7 || type == 8) && accident_timer < 0)
			{
				r = irandom_range(0, 50);
				if (r == 1)
				{
					var event = instance_create(base_x, base_y, text_obj_small_event);
					event.txt = global.txt268 + $"{time_m.txt}";
					global.enemy_score += 10; // замечен неопознанный самолет
				}
				if (r == 2)
				{
					var event = instance_create(base_x, base_y, text_obj_small_event);
					event.txt = global.txt272 + $"{time_m.txt}";
					global.enemy_score += 10; // шум в небе
				}
				if (r == 3)
				{
					var event = instance_create(base_x, base_y, text_obj_small_event);
					event.txt = global.txt273 + $"{time_m.txt}";
					global.enemy_score += 15; // помехи в радиосвязи
				}
				if (r == 4)
				{
					var event = instance_create(base_x, base_y, text_obj_small_event);
					event.txt = global.txt274 + $"{time_m.txt}";
					global.enemy_score += 10; // шум на радаре
				}
				if (r == 5 && is_collision_with_map)
				{
					var event = instance_create(base_x, base_y, text_obj_small_event);
					event.txt = global.txt275 + $"{time_m.txt}";
					global.enemy_score += 150; // неопознанные роботы
					global.xmas_score -= 20;
				}
				if (r == 6 && is_collision_with_map && type == 8)
				{
					var event = instance_create(base_x, base_y, text_obj_small_event);
					event.txt = global.txt276 + $"{time_m.txt}";
					global.enemy_score += 150; // неопознанная стройка
					global.xmas_score -= 20;
				}
			}
			//
			
			
			if (point_distance(base_x, base_y, point_x, point_y) < max(1, speed))
			{
				if (type == 1) // разведчики
				{
					r = irandom_range(0, 100);
					if (r < 15)
					{
						point_x = irandom_range(0, 900);
						point_y = irandom_range(0, 900);
						//point_x = point_xn;
						//point_y = point_yn;
						first_run = false;
						speed_deviation = irandom_range(min(global.min_ai_escort_speed, global.escortfoe[indx, 1] - global.escort_speed_deviation_value) * 1.0, global.escortfoe[indx, 1]);
					}
					else
					if (r > 15 && r < 60)
					{
						point_x = irandom_range(max(0, base_x - 150), min(900, base_x + 150));
						point_y = irandom_range(max(0, base_y - 150), min(900, base_y + 150));
						//point_x = point_xn;
						//point_y = point_yn;	
						first_run = false;
						speed_deviation = irandom_range(min(global.min_ai_escort_speed, global.escortfoe[indx, 1] - global.escort_speed_deviation_value) * 0.5, global.escortfoe[indx, 1]);
					}
					else
					{
						if (!first_run) { instance_destroy(self); }
						else exit;
						status = 0;
						exit;
					}
					height = irandom_range(10000, 20000);
				}
				if (type == 2) // доминирование
				{
					r = irandom_range(0, 100);
					if (instance_exists(onmap_escort) || instance_exists(onmap_ally))
					{
						if (instance_exists(onmap_ally) && instance_exists(onmap_escort))
						{
							status = 1;
							var ally = instance_nearest(x, y, onmap_ally);
							var player = instance_nearest(x, y, onmap_escort);
							if (distance_to_object(ally) < distance_to_object(player))
							target = ally;
							else
							target = player;
							first_run = false;
						}
						else
						if (instance_exists(onmap_ally))
						{
							status = 1;
							target = instance_nearest(x, y, onmap_ally);
							first_run = false;
						}
						else
						if (instance_exists(onmap_escort))
						{
							status = 1;	
							target = instance_nearest(x, y, onmap_escort);
							first_run = false;
						}
						speed_deviation = global.escortfoe[indx, 1];
					
					}
					else
					if (r < 8)
					{
						point_x = irandom_range(0, 900);
						point_y = irandom_range(0, 900);
						//point_x = point_xn;
						//point_y = point_yn
						first_run = false;
						speed_deviation = irandom_range(min(global.min_ai_escort_speed, global.escortfoe[indx, 1] - global.escort_speed_deviation_value) * 0.5, global.escortfoe[indx, 1]);
					}
					else
					if (r > 8 && r < 80)
					{
						point_x = irandom_range(max(0, base_x - 200), min(900, base_x + 200));
						point_y = irandom_range(max(0, base_y - 200), min(900, base_y + 200));
						//point_x = point_xn;
						//point_y = point_yn;	
						first_run = false;
						speed_deviation = global.escortfoe[indx, 1];
					}
					else
					{
						if (!first_run) instance_destroy(self);
						else exit;
						status = 0;
						exit;
					}
					height = irandom_range(10000, 20000);
				}
				if (type == 5) // штурмовая
				{
					r = irandom_range(0, 100);
					if ((instance_exists(onmap_city) || instance_exists(onmap_building)) && r < 30)
					{
						var have_revealed_obj = false
						for (var i = 0; i < instance_number(onmap_building); i++)
						{
							var building = instance_find(onmap_building, i);
							if (building.revealed && building.type != 1) { have_revealed_obj = true; break; }	
						}
						if (have_revealed_obj)
						{
							status = 5;
							target = instance_nearest(x, y, onmap_building);
							for (var i = 0; i < instance_number(onmap_building); i++)
							{
								if (distance_to_object(instance_find(onmap_building, i)) < distance_to_object(target) && instance_find(onmap_building, i).revealed) { target = instance_find(onmap_building, i); }	
							}
						}
						else
							if (instance_exists(onmap_city))
							{
								status = 5;	
								target = instance_nearest(x, y, onmap_city);
							}
					}
					else
					if (r < 32)
					{
						point_x = irandom_range(0, 900);
						point_y = irandom_range(0, 900);
						//point_x = point_xn;
						//point_y = point_yn;
						first_run = false;
						speed_deviation = irandom_range(min(global.min_ai_escort_speed, global.escortfoe[indx, 1] - global.escort_speed_deviation_value) * 1.0, global.escortfoe[indx, 1]);
					}
					else
					if (r < 100)
					{
						point_x = irandom_range(max(0, base_x - 200), min(900, base_x + 200));
						point_y = irandom_range(max(0, base_y - 200), min(900, base_y + 200));
						//point_x = point_xn;
						//point_y = point_yn;	
						first_run = false;
						speed_deviation = irandom_range(min(global.min_ai_escort_speed, global.escortfoe[indx, 1] - global.escort_speed_deviation_value) * 1.0, global.escortfoe[indx, 1]);
					}
					else
					{
						if (!first_run) instance_destroy(self);
						else exit;
						status = 0;
						exit;
					}
					height = irandom_range(10000, 20000);
				}
				if (type == 3 || type == 4) // бомбардировщик
				{
					r = irandom_range(0, 100);
					if ((instance_exists(onmap_city) || instance_exists(onmap_building)) && r < 30)
					{
						if (type == 4)
						{
							var have_revealed_obj = false
							for (var i = 0; i < instance_number(onmap_building); i++)
							{
								if (instance_find(onmap_building, i).revealed) { have_revealed_obj = true; break; }	
							}
							if (have_revealed_obj)
							{
								status = 5;
								target = instance_nearest(x, y, onmap_building);
								for (var i = 0; i < instance_number(onmap_building); i++)
								{
									if (distance_to_object(instance_find(onmap_building, i)) < distance_to_object(target) && instance_find(onmap_building, i).revealed) { target = instance_find(onmap_building, i); }	
								}
								first_run = false;
							}
							else
								if (instance_exists(onmap_city))
								{
									status = 5;	
									target = instance_nearest(x, y, onmap_city);
									first_run = false;
								}
						}
						else
							if (instance_exists(onmap_city))
							{
								status = 5;	
								target = instance_nearest(x, y, onmap_city);
								first_run = false;
							}
					}
					else
					if (r < 32)
					{
						point_x = irandom_range(0, 900);
						point_y = irandom_range(0, 900);
						//point_x = point_xn;
						//point_y = point_yn;
						first_run = false;
						speed_deviation = irandom_range(min(global.min_ai_escort_speed, global.escortfoe[indx, 1] - global.escort_speed_deviation_value) * 1.0, global.escortfoe[indx, 1]);
					}
					else
					if (r < 100)
					{
						point_x = irandom_range(max(0, base_x - 200), min(900, base_x + 200));
						point_y = irandom_range(max(0, base_y - 200), min(900, base_y + 200));
						//point_x = point_xn;
						//point_y = point_yn;	
						first_run = false;
						speed_deviation = irandom_range(min(global.min_ai_escort_speed, global.escortfoe[indx, 1] - global.escort_speed_deviation_value) * 1.0, global.escortfoe[indx, 1]);
					}
					else
					{
						if (!first_run) instance_destroy(self);
						else exit; 
						status = 0;
						exit;
					}
					height = irandom_range(10000, 20000);
				}
				if (type == 6 || type == 7 || type == 8) // транспорт
				{
					r = irandom_range(0, 100);
					if (type == 7 && r < 30 && (instance_exists(onmap_city) || instance_exists(onmap_building))) // выбрана цель для террора
					{
						
						var have_revealed_obj = false
						for (var i = 0; i < instance_number(onmap_building); i++)
						{
							var building = instance_find(onmap_building, i);
							if (building.revealed && building.type != 1) { have_revealed_obj = true; break; }
						}
						if (have_revealed_obj)
						{
							status = 4;
							target = instance_nearest(x, y, onmap_building);
							first_run = false;
							for (var i = 0; i < instance_number(onmap_building); i++)
							{
								if (distance_to_object(instance_find(onmap_building, i)) < distance_to_object(target) && instance_find(onmap_building, i).revealed && instance_find(onmap_building, i).type != 1 ) { target = instance_find(onmap_building, i); }
							}
						}
						else
						if (instance_exists(onmap_city))
						{
							status = 4;
							target = instance_nearest(x, y, onmap_city);
							first_run = false;
						}
						else
						instance_destroy(self);
					}
					else
					if (type == 6 && r < 30 && instance_exists(onmap_building)) // цель для возмездия
					{
						have_base = false;
						for (var i = 0; i < instance_number(onmap_building); i++)
						{
							var building = instance_find(onmap_building, i);
							if (building.type != 1 || !building.revealed) continue;
							if (!have_base) { target = building; have_base = true; }
							else if (distance_to_object(building) < distance_to_object(target)) target = building;
							status = 6;
						}
						if (!have_base) { type = 7; exit; }
						first_run = false;
					}
					else
					if (type == 8 && r < 30 && is_collision_with_map) // стройка начата
					{
						status = 1;
						var new_base = instance_create(x, y, onmap_building_enemy);
						new_base.base_x = base_x;
						new_base.base_y = base_y;
						new_base.type = 1;
						global.enemy_base_counts++;
						new_base.indx = global.enemy_base_counts;
						new_base.name = global.txt397 + string(global.enemy_base_counts);
						if (squad_index > 0 && had_transport)
						{
							get_must_to_deploy_transport(indx, true);
							squad_array = unite_or_split_squads(indx, 0);
							new_base.squad_index = squad_array[array_length(squad_array) - 1].new_squad_index;
						}
						status = 4;
						instance_destroy(self);
						exit;
					}
					else
					if (r < 32)
					{
						point_x = irandom_range(0, 900);
						point_y = irandom_range(0, 900);
						//point_x = point_xn;
						//point_y = point_yn;
						first_run = false;
						speed_deviation = irandom_range(min(global.min_ai_escort_speed, global.escortfoe[indx, 1] - global.escort_speed_deviation_value) * 1.0, global.escortfoe[indx, 1]);
					}
					else
					if (r < 100)
					{
						point_x = irandom_range(max(0, base_x - 200), min(900, base_x + 200));
						point_y = irandom_range(max(0, base_y - 200), min(900, base_y + 200));
						//point_x = point_xn;
						//point_y = point_yn;
						first_run = false;
						speed_deviation = irandom_range(min(global.min_ai_escort_speed, global.escortfoe[indx, 1] - global.escort_speed_deviation_value) * 1.0, global.escortfoe[indx, 1]);
					}
					else
					{
						if (!first_run) instance_destroy(self);
						else exit;
						status = 0;
						exit;
					}
					height = irandom_range(10000, 20000);
				}
				if (type == 9 || type == 10)
				{
					if (instance_exists(onmap_city))
					{
						target = instance_nearest(x, y, onmap_city);
						point_x = target.base_x;
						point_y = target.base_y;
						//point_x = point_xn;
						//point_y = point_yn;
						first_run = false;
						status = 1;
					}
					else
					{
						if (instance_exists(global.baseonmap) && global.baseonmap.revealed)
						{
							target = global.baseonmap;
							point_x = target.base_x;
							point_y = target.base_y;
							//point_x = point_xn;
							//point_y = point_yn;
							first_run = false;
							status = 1;
						}
						else
						{
							point_x = irandom_range(0, 900);
							point_y = irandom_range(0, 900);
							first_run = false;
						}
					}
				}

			}
			direction = point_direction(x, y, point_xn, point_yn);
		}
		//
		if (status == 1) // атака цели
		{
			if (instance_exists(target))
			{
				direction = point_direction(x, y, target.x, target.y);
				point_x = target.base_x;
				point_y = target.base_y;
			}
			if (point_distance(base_x, base_y, target.base_x, target.base_y) < max(1, speed))
			{
				if (type == 9 || type == 10)
				{
					if (instance_exists(target))
					{
						instance_destroy(target);
						global.lost_cities_count++;
						var event = instance_create(base_x, base_y, text_obj_small_event);
						event.txt = global.txt398 + $"{time_m.txt}";
					}
					status = 0;
				}
				else
				if (!instance_exists(target) || (target.object_index == onmap_escort && target.target != self))
				{
					if (!global.fight && !global.autofight && instance_exists(target) && array_length(global.fight_sequence) < 1 && global.win == 0 && !infight && global.timespeed > 0 && !instance_exists(ask_parent))
					{
						var mes = instance_create(1200 / 2, 900 / 2, ask_question_plane_designation_reached);
						mes.indx = indx;
						mes.target = target;
						mes.owner = self;
						mes.type = 4;
					}
					else
					{
						global.timespeed = 0;	
					}
					if (infight && global.fight && !global.autofight)
					{
						if (global.win == 1)
						{
							infight = false;
							status = 3;
							fight_win_drop();
						}
						if (global.win == -1)
						{
							infight = false;
							status = 3;
							fight_win_drop();
						}
					}
					if (infight && !global.fight && global.autofight)
					{
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
							infight = false;
							fight_win_drop();
							status = 3;
							if (!instance_exists(ask_parent))
							{
								var mes = instance_create(1200 / 2, 900 / 2, ask_message);
								mes.event = 17
							}
							else
							{
								time_m.menu_messages[0,0]++;
								time_m.menu_messages[time_m.menu_messages[0,0],0] = global.txt251;
								time_m.menu_messages[time_m.menu_messages[0,0],1] = global.messages_life_time;
								time_m.new_messages = true;
							}
						}
						if (global.win == -2)
						{
							infight = false;
							fight_win_drop();
							status = 3;
							if (!instance_exists(ask_parent))
							{
								var mes = instance_create(1200 / 2, 900 / 2, ask_message);
								mes.event = 18
							}
							else
							{
								time_m.menu_messages[0,0]++;
								time_m.menu_messages[time_m.menu_messages[0,0],0] = global.txt252;
								time_m.menu_messages[time_m.menu_messages[0,0],1] = global.messages_life_time;
								time_m.new_messages = true;
							}
						}
						if (global.win == 3)
						{
							infight = false;
							fight_win_drop();
							status = 3;
							if (!instance_exists(ask_parent))
							{
								var mes = instance_create(1200 / 2, 900 / 2, ask_message);
								mes.event = 19
							}
							else
							{
								time_m.menu_messages[0,0]++;
								time_m.menu_messages[time_m.menu_messages[0,0],0] = global.txt253;
								time_m.menu_messages[time_m.menu_messages[0,0],1] = global.messages_life_time;
								time_m.new_messages = true;
							}
						}
						if (global.win == -3)
						{
							infight = false;
							fight_win_drop();
							status = 3;
							if (!instance_exists(ask_parent))
							{
								var mes = instance_create(1200 / 2, 900 / 2, ask_message);
								mes.event = 20
							}
							else
							{
								time_m.menu_messages[0,0]++;
								time_m.menu_messages[time_m.menu_messages[0,0],0] = global.txt254;
								time_m.menu_messages[time_m.menu_messages[0,0],1] = global.messages_life_time;
								time_m.new_messages = true;
							}
						}
					}
				}
				else
				if (!instance_exists(target) || target.object_index == onmap_ally)
				{
					if (!global.fight && !global.autofight && instance_exists(target)) add_fight_to_sequence(0, 0, indx, own_id, target.indx, target.own_id, 2, 0);

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
							status = 3;
							fight_win_drop();
						}
						if (global.win == -2)
						{
							infight = false;
							status = 3;
							fight_win_drop();
						}
						if (global.win == 3)
						{
							infight = false;
							status = 3;
							fight_win_drop();
						}
						if (global.win == -3)
						{
							infight = false;
							status = 3;
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
					//instance_destroy(self);
				}
				else
				if (!instance_exists(target) || (target.object_index == onmap_escort && target.target == self))
				{
					status = 0;
				}
			}
		}
		if ((status == 1 || status == 4 || status == 5 || status == 6) && !instance_exists(target))
		{
		    status = 0;
		}
		//
		if (status == 2) // патруль
		{
			direction = point_direction(x, y, x, y);
			speed = 0;
			speed_deviation = 0;
			show_debug_message($"Эскадрилья НЛО {indx} ушла в патрулирование...");
		}
		//
		if (status == 3) // возврат
		{
			has_planes = false;
			for (var i = 4; i < global.escortfoe[indx, 0] + 4; i++)
			{
				if (global.eggplanes[global.escortfoe[indx, i], 1] > 0) { has_planes = true; break; }	
			}
			if (!has_planes) { instance_destroy(self); is_destroyed = true; exit; }
			show_debug_message($"Эскадрилья НЛО {indx} выжила в ходе перехвата, возобновление преследования...");
			status = 0;
		}
		//
		if (status == 4) // место террора
		{
			if (instance_exists(target) && (target.object_index == onmap_city || target.object_index == onmap_building))
			{
				//speed = global.escortfoe[indx, 1];
				direction = point_direction(x, y, target.x, target.y);
				point_x = target.base_x;
				point_y = target.base_y;
				if (point_distance(x, y, target.x, target.y) < max(1, speed))
				{
					if (target.object_index == onmap_city)
					{
						terror_created_already = true;
						var terror_site = instance_create(base_x, base_y, onmap_enemysite);
						terror_site.base_x = target.base_x;
						terror_site.base_y = target.base_y;
						terror_site.target = target;
						terror_site.target_id = target.own_id;
						global.terror_counts++;
						terror_site.name = global.txt180 + string(global.terror_counts);
						//var squad_index = 0;
						//for (q = 4; q < global.escortfoe[indx, 0] + 4; q++)
						//{
						//	if (global.eggplanes[global.escortfoe[indx, q], 0] != 6) continue;
						//	squad_index = q;
						//	break;
						//}
						get_must_to_deploy_transport(indx, true);
						squad_array = unite_or_split_squads(indx, 0);
						terror_site.squad_index = squad_array[array_length(squad_array) - 1].new_squad_index;
						//terror_site.escort_index = indx;
						terror_site.indx = -global.terror_counts;
						//terror_site.map_index = ground_map;
						terror_site.type = 3;
						
						merge_terrors(terror_site);
						
						if (!instance_exists(ask_parent))
						{
							var mes = instance_create(1200 / 2, 900 / 2, ask_message_big);
							mes.event = 10;
							mes.ufo_number = indx;
							mes.target = terror_site;
						}
						else
						{
							time_m.menu_messages[0,0]++;
							time_m.menu_messages[time_m.menu_messages[0,0],0] = global.txt181 + indx + global.txt296 + target.name;
							time_m.menu_messages[time_m.menu_messages[0,0],1] = global.messages_life_time;
							time_m.new_messages = true;
						}
						
						instance_destroy(self);
					}
					if (target.object_index == onmap_building)
					{
						terror_created_already = true;
						var terror_site = instance_create(base_x, base_y, onmap_enemysite);
						terror_site.base_x = target.base_x;
						terror_site.base_y = target.base_y;
						global.terror_counts++;
						terror_site.name = global.txt180 + string(global.terror_counts);
						//var squad_index = 0;
						//for (q = 4; q < global.escortfoe[indx, 0] + 4; q++)
						//{
						//	if (global.eggplanes[global.escortfoe[indx, q], 0] != 6) continue;
						//	squad_index = q;
						//	break;
						//}
						get_must_to_deploy_transport(indx, true);
						squad_array = unite_or_split_squads(indx, 0);
						terror_site.squad_index = squad_array[array_length(squad_array) - 1].new_squad_index;
						//terror_site.escort_index = indx;
						//terror_site.map_index = ground_map;
						terror_site.type = 3;
						terror_site.target = target;
						terror_site.target_id = target.own_id;
						terror_site.indx = -global.terror_counts;
						
						merge_terrors(terror_site);
						
						if (!instance_exists(ask_parent))
						{
							var mes = instance_create(1200 / 2, 900 / 2, ask_message_big);
							mes.event = 11;
							mes.ufo_number = indx;
							mes.target = terror_site;
						}
						else
						{
							time_m.menu_messages[0,0]++;
							time_m.menu_messages[time_m.menu_messages[0,0],0] = global.txt181 + indx + global.txt297 + target.name;
							time_m.menu_messages[time_m.menu_messages[0,0],1] = global.messages_life_time;
							time_m.new_messages = true;
						}
						
						instance_destroy(self);
					}
				}
			}
			else
			{
				status = 0;
				show_debug_message($"Эскадрилья НЛО {indx} не знает что терроризировать...");
			}
			//show_debug_message($"Эскадрилья НЛО {indx} собирается устроить террор... Цель {target.object_index} и {instance_exists(target)}");
		}
		//
		if (status == 5) // бомбардировка
		{
			if (instance_exists(target) && (target.object_index == onmap_city || target.object_index == onmap_building))
			{
				//speed = global.escortfoe[indx, 1];
				direction = point_direction(x, y, target.x, target.y);
				point_x = target.base_x;
				point_y = target.base_y;
				if (point_distance(base_x, base_y, target.base_x, target.base_y) < max(1, speed))
				{
					if (target.object_index == onmap_building && target.type == 1)
					{
						var success_bombing = true;
						var sam_count = 0;
						var modules_hitted = 0;
						var planes_hitted = 0;
						var bombers = array_create(0);
						var sam_history = array_create(0);
						var bomb_history = array_create(0);
						for (var z = 1; z <= 36; z++)
						{
							if (global.basebuilding[z, 0] != "anti_air" || global.basebuilding[z, 1] > 0) continue;
							sam_count++;
						}
						for (var z = 1; z <= global.eggplanes[0, 0]; z++)
						{
							show_debug_message($"Проход {z}: Тип? {global.eggplanes[z, 0]} Индекс? {global.eggplanes[z, 12]} Наш индекс? {indx} Здоровье? {global.eggplanes[z, 1]}");
							if (global.eggplanes[z, 0] != 4 || global.eggplanes[z, 12] != indx || global.eggplanes[z, 1] < 1) continue;
							array_push(bombers, z);
						}
						if (array_length(bombers) < 1) show_debug_message($"ПВО базы не может отработать по бомбардировщикам эскадрильи {name}, так как какого-то хрена их нет!"); 
						
						for (var z = array_length(bombers) - 1; z >= 0; z--)
						{
							if (sam_count < 1) break;
							var damage = global.HQ_AA_damage + irandom_range(-global.HQ_AA_deviation, global.HQ_AA_deviation);
							global.eggplanes[bombers[z], 1] -= damage;
							var sam_story = { index: sam_count, dmg: damage, kill: false, bombers_remain: array_length(bombers)  }
							if (global.eggplanes[bombers[z], 1] < 1) { array_delete(bombers, z, 1); sam_story.kill = true; sam_story.bombers_remain = array_length(bombers); }
							else z++;
							array_insert(sam_history, 0, sam_story);
							sam_count--;
						}
						
						if (array_length(bombers) < 1) 
						{
							if (!instance_exists(ask_parent))
							{
								//mes = instance_create(1200 / 2, 900 / 2, ask_message);
								//mes.event = 12;
								//mes.ufo_number = indx;
								//mes.target = target;
							}
							else
							{
								//time_m.menu_messages[0,0]++;
								//time_m.menu_messages[time_m.menu_messages[0,0],0] = global.txt181 + indx + global.txt298 + target.name;
								//time_m.menu_messages[time_m.menu_messages[0,0],1] = global.messages_life_time;
								//time_m.new_messages = true;
							}
						}
						else
						{
							for (var z = array_length(bombers) - 1; z >= 0; z--)
							{
								var bomb_story = { index: z, hit_module: 0, hit_plane1: 0, hit_plane2: 0, hit_n1: 0, hit_n2: 0, hit_n3: 0, hit_n4: 0 };
								var max_tries = 500;
								var damaged_time = global.rebuilt_module_time + irandom_range(-global.rebuilt_module_deviation, global.rebuilt_module_deviation);
								
								while (max_tries > 0)
								{
									max_tries--;
									
									var m = irandom_range(1, 36);
									
									if (!base_cell_can_be_damaged(m)) continue;
									if (irandom_range(0, 100) * global.current_diff_mn > global.chance_to_damage_module) break;
									
									bomb_story.hit_module = m;
									damage_base_cell(m, damaged_time);
									modules_hitted++;
									
									var bomb = damage_planes_at_hangar(m, bomb_story);
									if (bomb != false) bomb_story = bomb;
									
									// сосед справа
									if (m != 6 && m != 12 && m != 18 && m != 24 && m != 30 && m != 36)
									{
										var n = m + 1;
										if (global.basebuilding[m, 0] == "hangar")
										{
											if (m != 5 && m != 11 && m != 17 && m != 23 && m != 29 && m != 35) n = m + 2
										}
										if (base_cell_can_be_damaged(n) && irandom_range(0, 100) * global.current_diff_mn <= global.chance_to_hit_neighboor)
										{
											damage_base_cell(n, damaged_time);
											modules_hitted++;
											bomb_story.hit_n1 = n;
										}
									}
									
									// сосед слева
									if (m != 1 && m != 7 && m != 13 && m != 19 && m != 25 && m != 31)
									{
										var n = m - 1;
										if (base_cell_can_be_damaged(n) && irandom_range(0, 100) * global.current_diff_mn <= global.chance_to_hit_neighboor)
										{
											damage_base_cell(n, damaged_time);
											modules_hitted++;
											bomb_story.hit_n2 = n;
										}
									}
									
									// сосед сверху
									if (m > 6)
									{
										var n = m - 6;
										if (global.basebuilding[m, 0] == "hangar")
										{
											if (m > 12) n = m + 2
										}
										if (base_cell_can_be_damaged(n) && irandom_range(0, 100) * global.current_diff_mn <= global.chance_to_hit_neighboor)
										{
											damage_base_cell(n, damaged_time);
											modules_hitted++;
											bomb_story.hit_n3 = n;
										}
									}
									
									// сосед снизу
									if (m < 31)
									{
										var n = m + 6;
										if (base_cell_can_be_damaged(n) && irandom_range(0, 100) * global.current_diff_mn <= global.chance_to_hit_neighboor)
										{
											damage_base_cell(n, damaged_time);
											modules_hitted++;
											bomb_story.hit_n4 = n;
										}
									}
									
									break;
								}
								
								array_insert(bomb_history, 0, bomb_story);
							}
							new_mail(14);
							new_mail(16);
							if (!instance_exists(ask_parent))
							{
								//mes = instance_create(1200 / 2, 900 / 2, ask_message);
								//mes.event = 12;
								//mes.ufo_number = indx;
								//mes.target = target;
							}
							else
							{
								//time_m.menu_messages[0,0]++;
								//time_m.menu_messages[time_m.menu_messages[0,0],0] = global.txt181 + indx + global.txt298 + target.name;
								//time_m.menu_messages[time_m.menu_messages[0,0],1] = global.messages_life_time;
								//time_m.new_messages = true;
							}
						}
						show_debug_message($"Вражеская эскадрилья отбомбилась по базе. Повреждено модулей: {modules_hitted}. Неиспользованных ЗРК: {sam_count}. Осталось бомбардировщиков: {array_length(bombers)}");
						instance_destroy(self);
						var back = instance_create(0, 0, background_map);
						back.type = 13;
						back.bomb_history = bomb_history;
						back.sam_history = sam_history;
					}
					else
					{
						terror_created_already = true;
						var terror_site = instance_create(base_x, base_y, onmap_enemysite);
						global.terror_counts++;
						terror_site.name = global.txt299 + string(global.terror_counts); // Бомбардировка объекта
						terror_site.base_x = target.base_x;
						terror_site.base_y = target.base_y;
						terror_site.escort_index = indx;
						terror_site.type = 1;
						terror_site.target = target;
						terror_site.target_id = target.own_id;
						terror_site.indx = -global.terror_counts;
						
						merge_terrors(terror_site);
						
						if (!instance_exists(ask_parent))
						{
							var mes = instance_create(1200 / 2, 900 / 2, ask_message_big);
							mes.event = 12;
							mes.ufo_number = indx;
							mes.target = terror_site;
						}
						else
						{
							time_m.menu_messages[0,0]++;
							time_m.menu_messages[time_m.menu_messages[0,0],0] = global.txt181 + indx + global.txt298 + target.name;
							time_m.menu_messages[time_m.menu_messages[0,0],1] = global.messages_life_time;
							time_m.new_messages = true;
						}
						
						instance_destroy(self);
					}
				}
			}
			else
			{
				status = 0;
			}
			
			//show_debug_message($"Эскадрилья НЛО {indx} собирается начать бомбардировку...");
		}
		//
		if (status == 6) // возмездие
		{
			if (instance_exists(target) && target.object_index == onmap_building && target.type == 1)
			{
				//speed = global.escortfoe[indx, 1];
				direction = point_direction(x, y, target.x, target.y);
				point_x = target.base_x;
				point_y = target.base_y;
				if (point_distance(base_x, base_y, target.base_x, target.base_y) < max(1, speed))
				{
					var success_invade = true;
					var sam_count = 0;
					var modules_hitted = 0;
					var planes_hitted = 0;
					var transports = array_create(0);
					var sam_history = array_create(0);
					var bomb_history = array_create(0);
					
					// из-за плохой переделки под очередность боев запускается многократно, так что очередность боев убрана для этого типа боёв!
					if (global.win == 0)
					{
						for (var z = 1; z <= 36; z++)
						{
							if (global.basebuilding[z, 0] != "anti_air" || global.basebuilding[z, 1] > 0) continue;
							sam_count++;
						}
						for (var z = 1; z <= global.eggplanes[0, 0]; z++)
						{
							if (global.eggplanes[z, 0] != 6 || global.eggplanes[z, 12] != indx || global.eggplanes[z, 1] < 1) continue;
							array_insert(transports, 0, z);
						}
						if (array_length(transports) < 1) show_debug_message($"ПВО базы не может отработать по транспортам эскадрильи {name}, так как какого-то хрена их нет!"); 
						
						for (var z = array_length(transports) - 1; z >= 0; z--)
						{
							if (sam_count < 1) break;
							var damage = global.HQ_AA_damage + irandom_range(-global.HQ_AA_deviation, global.HQ_AA_deviation);
							global.eggplanes[transports[z], 1] -= damage;
							var sam_story = { index: sam_count, dmg: damage, kill: false, bombers_remain: array_length(transports)  }
							if (global.eggplanes[transports[z], 1] < 1) { array_delete(transports, z, 1); sam_story.kill = true; sam_story.bombers_remain = array_length(transports); }
							else z++;
							array_insert(sam_history, 0, sam_story);
							sam_count--;
						}
					}
					
					if (array_length(transports) > 0 || infight)
					{
						array_insert(bomb_history, 0, 1);
						show_debug_message($"Эскадрилья НЛО {indx} смогла высадить войска на базе, так как транспорт не был сбит!");

						if (!global.fight && !global.autofight && global.win == 0 && !infight && array_length(global.fight_sequence) < 1)
						{
							get_must_to_deploy_transport(indx, true);
							squad_array = unite_or_split_squads(indx, 0);
							if (array_length(squad_array) > 0)
							{
								global.XMAS_squad_onfight = 0; //indx;
								global.EGG_squad_onfight = squad_array[array_length(squad_array) - 1].new_squad_index;
								//add_fight_to_sequence(global.XMAS_squad_onfight, 0, global.EGG_squad_onfight, 0, 0, 0, 5, 0);
								global.fight = true;
								infight = true;
							}
						}
						else
						{
							show_debug_message("Не может быть запущена оборона базы из-за наличия боев в очереди или она уже добавлена в очередь!");	
						}
						
						if (global.fight && !global.autofight && infight)
						{
							if (global.win == 0)
							{
								global.ground_battle_type = 5;
								//var back = instance_create(0, 0, background_map);
								//back.type = 11;
								var back = instance_create(0, 0, background_map);
								back.type = 14;
								back.bomb_history = bomb_history;
								back.sam_history = sam_history;
								back.start_base_defense = true;
							}
							if (global.win == 1)
							{
								//if (global.intros)
								//{
								//	global.timespeed = 0;
								//	room_goto(intro_mission_accomplished);
								//}
								instance_destroy(self);
								infight = false;
								var back = instance_create(0, 0, background_map);
								back.type = 12;
								//fight_win_drop();
							}
							if (global.win == -1)
							{
								//if (global.intros)
								//{
								//	global.timespeed = 0;
								//	room_goto(intro_game_lost);
								//}
								instance_destroy(self);
								infight = false;
								var back = instance_create(0, 0, background_map);
								back.type = 12;
								//fight_win_drop();
							}
							if (global.win == -2)
							{	
								//if (global.intros)
								//{
								//	global.timespeed = 0;
								//	room_goto(intro_game_lost);
								//}
								instance_destroy(self);
								infight = false;
								var back = instance_create(0, 0, background_map);
								back.type = 12;
								//fight_win_drop();
							}
						}
					}
					else
					{
						var back = instance_create(0, 0, background_map);
						back.type = 14;
						back.bomb_history = bomb_history;
						back.sam_history = sam_history;
						show_debug_message($"Эскадрилья НЛО {indx} не смогла высадить войска на базе, так как транспорт был сбит!");
					}
				}
			}
			else
			{
				status = 0;
			}
			
			
			show_debug_message($"Эскадрилья НЛО {indx} начала возмездие...");
		}
		if (crash_after_spawn) { instance_destroy(self); is_destroyed = true; exit; }
		if (bomb_base_after_spawn && !first_run) { status = 5; target = global.baseonmap; bomb_base_after_spawn = false; }
	}
}



//base_x = x;
//base_y = y;

if (air_reveal_timer < 0) air_reveal_timer = global.air_scan_rate;
if (ground_reveal_timer < 0) ground_reveal_timer = global.ground_scan_rate;
if (accident_timer < 0) accident_timer = global.accident_rate;

air_reveal_timer -= global.timespeed;
ground_reveal_timer -= global.timespeed;
accident_timer -= global.timespeed;


if (target != noone && target != 0 && instance_exists(target)) target_id = target.own_id;
speed = 0;