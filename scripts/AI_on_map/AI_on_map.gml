function AI_on_map(){
	
if (global.debug && keyboard_check_released(vk_f5))
{
	global.enemy_score += 1000;
	show_debug_message("Добавлено 1000 очков противнику");
}
	
if (time_m.minutes_spawn_enemy_current >= global.spawn_foe_enemy_delay || (keyboard_check_released(vk_f10) && global.debug))
{
	time_m.minutes_spawn_enemy_current = 0;

	var n = irandom_range(0, 100);

	if (
		(
			n <= global.spawn_chance_factor + global.enemy_score * global.spawn_chance_score_factor
			&& global.enemy_score > 0
			&& time_m.enemies_per_day < global.max_foe_count_per_day
		)
		|| (keyboard_check_released(vk_f10) && global.debug)
	)
	{
		var foe = instance_create(irandom_range(0, 900), irandom_range(0, 900), onmap_enemy);

		/*
			Типы эскадрильи (как ждёт onmap_enemy):
			1 - разведывательная
			2 - господства в воздухе / перехват
			3 - бомбардировочная (города)
			4 - бомбардировочная (объекты)
			5 - штурмовая
			6 - возмездие (транспорт)
			7 - террор (транспорт)
			8 - строительная (транспорт)
			9 - босс (не здесь)
			10 - наказание за изумруды (не здесь)
		*/

		// =========================================================
		// [ARRAY CONFIG] НАСТРОЙКА ПОРЯДКА / ВЕСОВ МИССИЙ
		// Меняй порядок, unlock_score и weight как удобно для баланса.
		// Чем больше weight - тем чаще тип попадает в пул выбора.
		// =========================================================
		var mission_defs =
		[
			{ mission_type: 1, unlock_score: global.score_to_recon_task,      weight: 3 }, // разведка
			{ mission_type: 2, unlock_score: global.score_to_intercept_task,  weight: 3 }, // перехват
			{ mission_type: 3, unlock_score: global.score_to_bomb_sites_task, weight: 3 }, // бомбардировка городов
			{ mission_type: 4, unlock_score: global.score_to_bomb_sites_task, weight: 2 }, // бомбардировка объектов
			{ mission_type: 5, unlock_score: global.score_to_strike_task,     weight: 2 }, // штурмовка
			{ mission_type: 6, unlock_score: global.score_to_retalation_task, weight: 1 }, // возмездие
			{ mission_type: 7, unlock_score: global.score_to_terror_task,     weight: 1 }, // террор
			{ mission_type: 8, unlock_score: global.score_to_build_base_task, weight: 1 }  // стройка базы
		];

		var mission_pool = array_create(0);

		for (var m = 0; m < array_length(mission_defs); m++)
		{
			if (global.enemy_score < mission_defs[m].unlock_score) continue;

			for (var w = 0; w < mission_defs[m].weight; w++)
			{
				array_push(mission_pool, mission_defs[m].mission_type);
			}
		}

		// защита: если по какой-то причине пул пуст, не спавним мусорную эскадрилью
		if (array_length(mission_pool) < 1)
		{
			instance_destroy(foe);
			exit;
		}

		var mission_type = mission_pool[irandom(array_length(mission_pool) - 1)];

		// DEBUG-оверрайды
		if (global.debug)
		{
			if (keyboard_check(vk_shift))
			{
				global.enemy_score += 3000;
				mission_type = 7; // террор
			}
			if (keyboard_check(vk_control))
			{
				global.enemy_score += 3000;
				mission_type = 8; // стройка
			}
			if (keyboard_check(vk_alt))
			{
				global.enemy_score += 3000;
				mission_type = 2; // перехват
			}
			if (keyboard_check(vk_backspace))
			{
				global.enemy_score += 3000;
				mission_type = 4; // бомбардировка объектов
			}
			if (keyboard_check(vk_enter))
			{
				global.enemy_score += 3000;
				mission_type = 3; // бомбардировка объектов
			}
		}

		// =========================================================
		// Размер эскадрильи
		// =========================================================
		var max_size = global.enemy_escort_max_size * (global.enemy_score / global.score_to_max_size);
		if (max_size > global.enemy_escort_max_size) max_size = global.enemy_escort_max_size;

		var size = irandom_range(global.enemy_escort_min_size, max_size);
		if (size < global.enemy_escort_min_size) size = global.enemy_escort_min_size;

		// =========================================================
		// Создаём запись эскадрильи
		// =========================================================
		global.escortfoe[0, 0]++;
		global.escortfoe[global.escortfoe[0, 0], 0] = size; // число самолётов
		global.escortfoe[global.escortfoe[0, 0], 1] = 0;    // макс. скорость
		global.escortfoe[global.escortfoe[0, 0], 2] = 0;    // топливо
		global.escortfoe[global.escortfoe[0, 0], 3] = 0;    // дальность радара
		global.escortfoe[global.escortfoe[0, 0], 4] = 0;    // первый самолёт

		// =========================================================
		// Наполняем самолётами
		// =========================================================
		for (var i = 1; i <= size; i++)
		{
			var plane_type = 1;
			var plane_pool = array_create(0);

			// -----------------------------------------------------
			// Выбор типа самолёта под выбранную миссию
			// -----------------------------------------------------
			switch (mission_type)
			{
				case 1: // разведка
				{
					if (i == 1)
					{
						plane_type = 1; // минимум один разведчик
					}

					if (global.enemy_score > global.score_to_recon_ship) array_push(plane_pool, 1);
					if (global.enemy_score > global.score_to_fighter)    array_push(plane_pool, 2);
					break;
				}

				case 2: // перехват
				{
					if (i == 1)
					{
						if (global.enemy_score > global.score_to_fighter)      plane_type = 2;
						else if (global.enemy_score > global.score_to_recon_ship) plane_type = 1;
						else plane_type = 1;
					}

					if (global.enemy_score > global.score_to_recon_ship)  array_push(plane_pool, 1);
					if (global.enemy_score > global.score_to_fighter)     array_push(plane_pool, 2);
					if (global.enemy_score > global.score_to_interceptor) array_push(plane_pool, 3);
					break;
				}

				case 3: // бомбардировка городов
				{
					if (i == 1)
					{
						if (global.enemy_score > global.score_to_bomber) plane_type = 4;
						else if (global.enemy_score > global.score_to_cas) plane_type = 5;
						else plane_type = 1;
					}

					if (global.enemy_score > global.score_to_fighter)     array_push(plane_pool, 2);
					if (global.enemy_score > global.score_to_interceptor) array_push(plane_pool, 3);
					if (global.enemy_score > global.score_to_bomber)      array_push(plane_pool, 4);
					if (global.enemy_score > global.score_to_cas)         array_push(plane_pool, 5);
					break;
				}

				case 4: // бомбардировка объектов
				{
					if (i == 1)
					{
						if (global.enemy_score > global.score_to_bomber) plane_type = 4;
						else if (global.enemy_score > global.score_to_cas) plane_type = 5;
						else plane_type = 1;
					}

					if (global.enemy_score > global.score_to_fighter)     array_push(plane_pool, 2);
					if (global.enemy_score > global.score_to_interceptor) array_push(plane_pool, 3);
					if (global.enemy_score > global.score_to_bomber)      array_push(plane_pool, 4);
					if (global.enemy_score > global.score_to_cas)         array_push(plane_pool, 5);
					break;
				}

				case 5: // штурмовка
				{
					if (i == 1)
					{
						if (global.enemy_score > global.score_to_cas) plane_type = 5;
						else if (global.enemy_score > global.score_to_bomber) plane_type = 4;
						else plane_type = 1;
					}

					if (global.enemy_score > global.score_to_fighter)     array_push(plane_pool, 2);
					if (global.enemy_score > global.score_to_interceptor) array_push(plane_pool, 3);
					if (global.enemy_score > global.score_to_bomber)      array_push(plane_pool, 4);
					if (global.enemy_score > global.score_to_cas)         array_push(plane_pool, 5);
					break;
				}

				case 6: // возмездие
				case 7: // террор
				case 8: // стройка базы
				{
					if (i == 1)
					{
						plane_type = 6; // ведущий транспорт
					}

					if (global.enemy_score > global.score_to_fighter)     array_push(plane_pool, 2);
					if (global.enemy_score > global.score_to_interceptor) array_push(plane_pool, 3);
					if (global.enemy_score > global.score_to_bomber)      array_push(plane_pool, 4);
					if (global.enemy_score > global.score_to_cas)         array_push(plane_pool, 5);
					if (global.enemy_score > global.score_to_transport)   array_push(plane_pool, 6);
					if (global.enemy_score > global.score_to_recon_ship)  array_push(plane_pool, 1);
					break;
				}
			}

			// не первый самолёт добираем из пула
			if (i > 1 && array_length(plane_pool) > 0)
			{
				plane_type = plane_pool[irandom(array_length(plane_pool) - 1)];
			}

			// если вдруг пул пуст, оставляем ведущий plane_type как есть

			// -----------------------------------------------------
			// Вооружение самолёта
			// -----------------------------------------------------
			var weapon_1 = -1;
			var weapon_2 = -1;
			var weapon_3 = -1;

			if (plane_type == 1)
			{
				weapon_1 = 8;
			}

			if (plane_type == 2)
			{
				if (global.enemy_score < global.score_to_fighter * 1.3)
				{
					weapon_1 = 8;
				}
				else if (global.enemy_score < global.score_to_fighter * 1.6)
				{
					weapon_1 = 8;
					if (irandom_range(0, 1) > 0) weapon_2 = 8;
				}
				else
				{
					if (irandom_range(0, 1) > 0)
					{
						weapon_1 = 8;
						weapon_2 = 8;
					}
					else
					{
						weapon_1 = 8;
						weapon_2 = 10;
					}
				}
			}

			if (plane_type == 3)
			{
				if (global.enemy_score < global.score_to_interceptor * 1.3)
				{
					weapon_1 = 9;
				}
				else if (global.enemy_score < global.score_to_interceptor * 1.6)
				{
					weapon_1 = 9;
					if (irandom_range(0, 1) > 0) weapon_2 = 10;
				}
				else
				{
					if (irandom_range(0, 1) > 0)
					{
						weapon_1 = 9;
						weapon_2 = 9;
					}
					else if (irandom_range(0, 1) > 0)
					{
						weapon_1 = 9;
						weapon_2 = 10;
					}
					else
					{
						weapon_1 = 9;
						weapon_2 = 10;
						weapon_3 = 9;
					}
				}
			}

			if (plane_type == 4)
			{
				weapon_1 = 0;
				weapon_2 = 0;
				weapon_3 = 0;
			}

			if (plane_type == 5)
			{
				if (global.enemy_score < global.score_to_cas * 1.3)
				{
					weapon_1 = 11;
				}
				else if (global.enemy_score < global.score_to_cas * 1.6)
				{
					weapon_1 = 11;
					if (irandom_range(0, 1) > 0) weapon_2 = 11;
				}
				else
				{
					weapon_1 = 11;
					weapon_2 = 11;
				}
			}

			// -----------------------------------------------------
			// Создание самолёта
			// -----------------------------------------------------
			global.eggplanes[0, 0]++;
			var plane_index = global.eggplanes[0, 0];

			global.eggplanes[plane_index, 0]  = plane_type;
			global.eggplanes[plane_index, 1]  = global.eggplanedata[plane_type, 1];
			global.eggplanes[plane_index, 2]  = global.eggplanedata[plane_type, 6];
			global.eggplanes[plane_index, 3]  = global.eggplanedata[plane_type, 12];
			global.eggplanes[plane_index, 4]  = global.eggplanedata[plane_type, 13];
			global.eggplanes[plane_index, 5]  = weapon_1;
			global.eggplanes[plane_index, 6]  = (weapon_1 > -1) ? global.airweapon[weapon_1, 2] : -1;
			global.eggplanes[plane_index, 7]  = weapon_2;
			global.eggplanes[plane_index, 8]  = (weapon_2 > -1) ? global.airweapon[weapon_2, 2] : -1;
			global.eggplanes[plane_index, 9]  = weapon_3;
			global.eggplanes[plane_index, 10] = (weapon_3 > -1) ? global.airweapon[weapon_3, 2] : -1;
			global.eggplanes[plane_index, 11] = 0;
			global.eggplanes[plane_index, 12] = global.escortfoe[0, 0];
			global.eggplanes[plane_index, 13] = global.eggplanedata[plane_type, 0];

			global.escortfoe[global.escortfoe[0, 0], i + 3] = plane_index;

			// -----------------------------------------------------
			// Наполнение транспорта десантом
			// -----------------------------------------------------
			if (plane_type == 6)
			{
				var parties = irandom_range(1, 1 + min(4, round(global.enemy_score / global.score_to_terror_task)));

				for (var q = 0; q < parties; q++)
				{
					var count = irandom_range(3, min(4 + round(global.enemy_score / global.score_to_terror_task), 10)) * global.current_diff_mn;

					global.eggteam[0, 0]++;
					var squad_row = global.eggteam[0, 0];

					global.eggteam[squad_row, 0] = plane_index;
					global.eggteam[squad_row, 1] = count;
					global.eggteam[squad_row, 2] = "";

					var class_max = 12;
					var class = irandom_range(1, class_max);

					if (global.enemy_score >= global.score_to_ufo && class > class_max / 1.5)
					{
						global.eggteam[squad_row, 2] = "ufo";
						count = round(count / 3);
					}
					else if (global.enemy_score >= global.score_to_pawn && class > class_max / 2.5)
					{
						global.eggteam[squad_row, 2] = "pawn";
						count = round(count / 2);
					}
					else if (global.enemy_score >= global.score_to_metal && class > class_max / 4)
					{
						global.eggteam[squad_row, 2] = "metalson";
						count = round(count / 1.5);
					}
					else if (global.enemy_score >= global.score_to_bugs)
					{
						global.eggteam[squad_row, 2] = "beetle";
						count = round(count / 1);
					}
					else
					{
						global.eggteam[squad_row, 2] = "beetle";
						count = round(count / 1);
					}
				}

				foe.squad_index = plane_index;
			}
		}

		// =========================================================
		// Финальные параметры эскадрильи
		// =========================================================
		foe.type = mission_type;
		foe.indx = global.escortfoe[0, 0];
		foe.point_x = foe.x + 10;
		foe.point_y = foe.y + 10;

		if (instance_exists(time_m)) time_m.enemies_per_day++;

		// DEBUG-флаги поведения
		if (global.debug && keyboard_check(vk_control))
		{
			foe.crash_after_spawn = true;
		}

		if (global.debug && keyboard_check(vk_backspace))
		{
			foe.bomb_base_after_spawn = true;
			global.baseonmap.revealed = true;
		}

		show_debug_message("Заспавнен противник:");
		show_debug_message("Тип миссии: " + string(foe.type));
		show_debug_message("Номер: " + string(foe.indx));
		show_debug_message("Число самолетов: " + string(size));
		show_debug_message("Число очков: " + string(global.enemy_score));
	}
}

if ((time_m.minutes_spawn_ally_current >= global.spawn_foe_ally_delay && global.xmas_score > 0 && time_m.allies_per_day < global.max_santa_escorts_per_day + global.max_santa_escorts_add_per_score * global.xmas_score) || (keyboard_check_released(vk_f9) && global.debug))
{
	// союзников НЕ трогал (как просил)
	available_plane_types[0] = 0;
	
	time_m.minutes_spawn_ally_current = 0;
	var n = irandom_range(0, 100);
	
	//var random_max_range = 0;
    //var random_max_range_step = 33.3;
	
	if ((global.xmas_score >= global.ally_score_to_recon_task || global.xmas_score >= global.ally_score_to_transport_task || global.xmas_score >= global.ally_score_to_intercept_task) && n <= global.spawn_chance_factor || (keyboard_check_released(vk_f9) && global.debug))
	{
		var random_city;
		if (!instance_exists(onmap_city)) exit;
		random_city = instance_nearest(irandom_range(0, 900), irandom_range(0, 900), onmap_city);
		var ally = instance_create(random_city.x, random_city.y, onmap_ally);
		ally.base_x = random_city.base_x;
		ally.base_y = random_city.base_y;
		var ally_types = array_create(0);
		
		if (global.xmas_score >= global.ally_score_to_recon_task)
		{
			array_push(ally_types, 1); // разведчик
		}
		if (global.xmas_score >= global.ally_score_to_intercept_task)
		{
			array_push(ally_types, 2); // перехватчик
			array_push(ally_types, 2);
			array_push(ally_types, 2); // увеличил "вес" чтобы уменьшить число разведчиков
		}
		if (global.xmas_score >= global.ally_score_to_transport_task)
		{
			array_push(ally_types, 3); // транспорт / перелёт между городами
		}
		
		if (array_length(ally_types) < 1)
		{
			instance_destroy(ally);
			exit;
		}
		
		ally.type = ally_types[irandom(array_length(ally_types) - 1)];
		//if (global.xmas_score >= global.ally_score_to_recon_task) random_max_range+=random_max_range_step;
		//if (global.xmas_score >= global.ally_score_to_transport_task) random_max_range+=random_max_range_step;
		//if (global.xmas_score >= global.ally_score_to_intercept_task) random_max_range+=random_max_range_step;

		//var r = irandom_range(1, random_max_range + random_max_range_step / 2);
		var max_size = global.ally_escort_max_size * (global.xmas_score / global.score_to_max_size)
		if (max_size > global.ally_escort_max_size) max_size = global.ally_escort_max_size;
		var size = irandom_range(global.ally_escort_min_size, max_size);
		if (size < global.ally_escort_min_size) size = global.ally_escort_min_size;

		global.escortally[0, 0]++
		global.escortally[global.escortally[0, 0], 0] = size
		global.escortally[global.escortally[0, 0], 1] = 0
		global.escortally[global.escortally[0, 0], 2] = 0
		global.escortally[global.escortally[0, 0], 3] = 0
		global.escortally[global.escortally[0, 0], 4] = 0
		
		for (var i = 1; i <= size; i++)
		{
			var plane_type = 1;

			if (ally.type == 1)
			{
				if (i == 1) plane_type = 1;
				if (global.santa_upgraded_planes && i == 1) plane_type = 2;
				available_plane_types = array_create(0);
				array_push(available_plane_types, 1); 
				array_push(available_plane_types, 1); 
				if (global.santa_upgraded_planes) array_push(available_plane_types, 2);
				if (i != 1) plane_type = irandom_range(0, array_length(available_plane_types) - 1);
			}
			else
			if (ally.type == 3)
			{
				if (i == 1) plane_type = 7;
				available_plane_types = array_create(0);
				array_push(available_plane_types, 7); 
				array_push(available_plane_types, 1);
				if (global.santa_upgraded_planes) array_push(available_plane_types, 2);
				if (i != 1) plane_type = irandom_range(0, array_length(available_plane_types) - 1);
			}
			else
			if (ally.type == 2)
			{
				if (i == 1) plane_type = 1;
				if (global.santa_upgraded_planes && i == 1) plane_type = 2;
				available_plane_types = array_create(0);
				array_push(available_plane_types, 1); 
				if (global.santa_upgraded_planes) array_push(available_plane_types, 2);
				if (i != 1) plane_type = irandom_range(0, array_length(available_plane_types) - 1);
			}
			
			var weapon_1 = -1;
			var weapon_2 = -1;
			var weapon_3 = -1;
			if (plane_type == 1 || plane_type == 2)
			{
				if (global.xmas_score < global.ally_score_to_intercept_task / 2)
				{
					weapon_1 = 1;
				}
				else
				if (global.xmas_score < global.ally_score_to_intercept_task)
				{
					weapon_1 = 1;
					if (irandom_range(0, 1) > 0) weapon_1 = 2;
					if (irandom_range(0, 1) > 0) weapon_2 = 3;
				}
				else
				{
					if (irandom_range(0, 1) > 0)
					{
						weapon_1 = 2;
						weapon_2 = 4;
					}
					else
					if (irandom_range(0, 1) > 0)
					{
						weapon_1 = 1;
						weapon_2 = 3;
					}
					if (irandom_range(0, 1) > 0)
					{
						weapon_1 = 4;
						weapon_2 = 4;
					}
					else
					{
						weapon_1 = 1;
						weapon_2 = 4;
					}
				}
			}
			
			global.santaplanes[0, 0]++;
			global.santaplanes[global.santaplanes[0, 0], 0] = plane_type;
			global.santaplanes[global.santaplanes[0, 0], 1] = global.planedata[plane_type, 1];
			global.santaplanes[global.santaplanes[0, 0], 2] = 0;
			global.santaplanes[global.santaplanes[0, 0], 3] = global.planedata[plane_type, 12];
			global.santaplanes[global.santaplanes[0, 0], 4] = global.planedata[plane_type, 13];
			global.santaplanes[global.santaplanes[0, 0], 5] = weapon_1;
			if (weapon_1 > -1) global.santaplanes[global.santaplanes[0, 0], 6] = global.airweapon[weapon_1, 2];
			else global.santaplanes[global.santaplanes[0, 0], 6] = -1;
			global.santaplanes[global.santaplanes[0, 0], 7] = weapon_2;
			if (weapon_2 > -1) global.santaplanes[global.santaplanes[0, 0], 8] = global.airweapon[weapon_2, 2];
			else global.santaplanes[global.santaplanes[0, 0], 8] = -1;
			global.santaplanes[global.santaplanes[0, 0], 9] = weapon_3;
			if (weapon_3 > -1) global.santaplanes[global.santaplanes[0, 0], 10] = global.airweapon[weapon_3, 2];
			else global.santaplanes[global.santaplanes[0, 0], 10] = -1;
			global.santaplanes[global.santaplanes[0, 0], 11] = 0;
			global.santaplanes[global.santaplanes[0, 0], 12] = global.escortally[0, 0];
			global.santaplanes[global.santaplanes[0, 0], 13] = global.planedata[plane_type, 0];
			
			global.escortally[global.escortally[0, 0], i + 3] = global.santaplanes[0, 0];
		}
		if (instance_exists(time_m)) time_m.allies_per_day++;
		//ally.type = clamp(ceil(r / random_max_range_step), 1, 3);
		if (ally.type < 1 || ally.type > 3) ally.type = 1;
		ally.indx = global.escortally[0, 0]
		ally.point_x = ally.x + 10;
		ally.point_y = ally.y + 10;
		show_debug_message("Заспавнен союзник: ");
		show_debug_message("Тип: " + string(ally.type));
		show_debug_message("Номер: " + string(ally.indx));
		show_debug_message("Номер изнач: " + string(global.escortally[0, 0]));
		show_debug_message("Число самолетов: " + string(size));
	}
}

}











// ОРИГИНАЛ, НЕ ИЗМЕНЕННЫЙ CHATGPT
//function AI_on_map(){
//	
//if (global.debug && keyboard_check_released(vk_f5))
//{
//	global.enemy_score += 1000;
//	show_debug_message("Добавлено 1000 очков противнику");
//}
//	
//if (time_m.minutes_spawn_enemy_current >= global.spawn_foe_enemy_delay || (keyboard_check_released(vk_f10) && global.debug))
//{
//
//time_m.minutes_spawn_enemy_current = 0;
//n = irandom_range(0, 100);
//if (n <= global.spawn_chance_factor + global.enemy_score * global.spawn_chance_score_factor  || (keyboard_check_released(vk_f10) && global.debug))
//{
//	var foe = instance_create(irandom_range(0, 900), irandom_range(0, 900), onmap_enemy);
//	/*
//	Типы эскадрильи:
//	1 - разведывательная
//	2 - господства в воздухе
//	3 - штурмовая (атака конвоев деда мороза и систем ПВО X-MAS)
//	4 - бомбардировочная (бомбардировка городов)
//	5 - бомбардировочная (атака объектов X-MAS)
//	6 - террора
//	7 - строительная
//	8 - босс (спавнится не здесь)
//	9 - ...
//	*/
//	var random_max_range = 0;
//	var random_max_range_step = 12.5; // 100 / число типов
//	
//	available_plane_types[0] = 0;
//	
//	if (global.enemy_score >= global.score_to_recon_task) random_max_range+=random_max_range_step;
//	if (global.enemy_score >= global.score_to_intercept_task) random_max_range+=random_max_range_step;
//	if (global.enemy_score >= global.score_to_bomb_sites_task) random_max_range+=random_max_range_step * 2;
//	if (global.enemy_score >= global.score_to_strike_task) random_max_range+=random_max_range_step;
//	if (global.enemy_score >= global.score_to_retalation_task) random_max_range+=random_max_range_step;
//	if (global.enemy_score >= global.score_to_terror_task) random_max_range+=random_max_range_step;
//	if (global.enemy_score >= global.score_to_build_base_task) random_max_range+=random_max_range_step;
//	var r = irandom_range(1, random_max_range + random_max_range_step / 2);
//	var max_size = global.enemy_escort_max_size * (global.enemy_score / global.score_to_max_size)
//	if (max_size > global.enemy_escort_max_size) max_size = global.enemy_escort_max_size;
//	var size = irandom_range(global.enemy_escort_min_size, max_size);
//	if (size < global.enemy_escort_min_size) size = global.enemy_escort_min_size;
//
//
//	global.escortfoe[0, 0]++
//	global.escortfoe[global.escortfoe[0, 0], 0] = size // - число самолётов
//	global.escortfoe[global.escortfoe[0, 0], 1] = 0 // - макс. скорость
//	global.escortfoe[global.escortfoe[0, 0], 2] = 0 // - топливо (берётся мин. топливо среди самолей)
//	global.escortfoe[global.escortfoe[0, 0], 3] = 0 // - дальность радара (берётся макс. дальность)
//	global.escortfoe[global.escortfoe[0, 0], 4] = 0 // - номер самолёта 1 (остальные идут дальше)
//	for (var i = 1; i <= size; i++)
//	{
//		var plane_type = 1;
//		if ((keyboard_check(vk_shift) && global.debug) || (keyboard_check(vk_control) && global.debug)) { r = random_max_range * 7.01; }
//		if (keyboard_check(vk_alt) && global.debug) { r = random_max_range * 2; 	}
//		if (r > random_max_range_step * 8) // строительство базы
//		{
//			if (i == 1) plane_type = 6;
//			available_plane_types[0] = 0;
//			if (global.enemy_score > global.score_to_fighter) { available_plane_types[0]++; available_plane_types[1] = 2; }
//			if (global.enemy_score > global.score_to_interceptor) { available_plane_types[0]++; available_plane_types[2] = 3; }
//			if (global.enemy_score > global.score_to_recon_ship) { available_plane_types[0]++; available_plane_types[3] = 1; }
//			if (global.enemy_score > global.score_to_transport) { available_plane_types[0]++; available_plane_types[4] = 6; }
//		}
//		else
//		if (r > random_max_range_step * 7) // террор
//		{
//			if (i == 1) plane_type = 6;
//			available_plane_types[0] = 0;
//			if (global.enemy_score > global.score_to_fighter) { available_plane_types[0]++; available_plane_types[1] = 2; }
//			if (global.enemy_score > global.score_to_interceptor) { available_plane_types[0]++; available_plane_types[2] = 3; }
//			if (global.enemy_score > global.score_to_bomber) { available_plane_types[0]++; available_plane_types[3] = 4; }
//			if (global.enemy_score > global.score_to_cas) { available_plane_types[0]++; available_plane_types[4] = 5; }
//			if (global.enemy_score > global.score_to_transport) { available_plane_types[0]++; available_plane_types[5] = 6; }
//			if (global.enemy_score > global.score_to_recon_ship) { available_plane_types[0]++; available_plane_types[6] = 1; }
//		}
//		else
//		if (r > random_max_range_step * 6) // возмездие
//		{
//			if (i == 1) plane_type = 6;
//			available_plane_types[0] = 0;
//			if (global.enemy_score > global.score_to_fighter) { available_plane_types[0]++; available_plane_types[available_plane_types[0]] = 2; }
//			if (global.enemy_score > global.score_to_interceptor) { available_plane_types[0]++; available_plane_types[available_plane_types[0]] = 3; }
//			if (global.enemy_score > global.score_to_bomber) { available_plane_types[0]++; available_plane_types[available_plane_types[0]] = 4; }
//			if (global.enemy_score > global.score_to_cas) { available_plane_types[0]++; available_plane_types[available_plane_types[0]] = 5; }
//			if (global.enemy_score > global.score_to_transport) { available_plane_types[0]++; available_plane_types[available_plane_types[0]] = 6; }
//			if (global.enemy_score > global.score_to_recon_ship) { available_plane_types[0]++; available_plane_types[available_plane_types[0]] = 1; }
//		}
//		else
//		if (r > random_max_range_step * 5) // штурмовка
//		{
//			if (i == 1 && global.enemy_score > global.score_to_cas) plane_type = 5;
//			else if (i == 1 && global.enemy_score > global.score_to_bomber) plane_type = 4;
//			available_plane_types[0] = 0;
//			if (global.enemy_score > global.score_to_fighter) { available_plane_types[0]++; available_plane_types[available_plane_types[0]] = 2; }
//			if (global.enemy_score > global.score_to_interceptor) { available_plane_types[0]++; available_plane_types[available_plane_types[0]] = 3; }
//			if (global.enemy_score > global.score_to_bomber) { available_plane_types[0]++; available_plane_types[available_plane_types[0]] = 4; }
//			if (global.enemy_score > global.score_to_cas) { available_plane_types[0]++; available_plane_types[available_plane_types[0]] = 5; }
//		}
//		else
//		if (r > random_max_range_step * 4) // бомбардировка
//		{
//			if (i == 1 && global.enemy_score > global.score_to_bomber) plane_type = 4;
//			else if (i == 1 && global.enemy_score > global.score_to_cas) plane_type = 5;
//			available_plane_types[0] = 0;
//			if (global.enemy_score > global.score_to_fighter) { available_plane_types[0]++; available_plane_types[available_plane_types[0]] = 2; }
//			if (global.enemy_score > global.score_to_interceptor) { available_plane_types[0]++; available_plane_types[available_plane_types[0]] = 3; }
//			if (global.enemy_score > global.score_to_bomber) { available_plane_types[0]++; available_plane_types[available_plane_types[0]] = 4; }
//			if (global.enemy_score > global.score_to_cas) { available_plane_types[0]++; available_plane_types[available_plane_types[0]] = 5; }
//		}
//		else
//		if (r > random_max_range_step * 3) // бомбардировка
//		{
//			if (i == 1 && global.enemy_score > global.score_to_bomber) plane_type = 4;
//			else if (i == 1 && global.enemy_score > global.score_to_cas) plane_type = 5;
//			available_plane_types[0] = 0;
//			if (global.enemy_score > global.score_to_fighter) { available_plane_types[0]++; available_plane_types[available_plane_types[0]] = 2; }
//			if (global.enemy_score > global.score_to_interceptor) { available_plane_types[0]++; available_plane_types[available_plane_types[0]] = 3; }
//			if (global.enemy_score > global.score_to_bomber) { available_plane_types[0]++; available_plane_types[available_plane_types[0]] = 4; }
//			if (global.enemy_score > global.score_to_cas) { available_plane_types[0]++; available_plane_types[available_plane_types[0]] = 5; }
//		}
//		else
//		if (r > random_max_range_step * 2) // перехват
//		{
//			if (global.enemy_score > global.score_to_fighter) { if (i == 1) plane_type = 2; }
//			else { if (global.enemy_score > global.score_to_recon_ship) if (i == 1) plane_type = 1; }
//			available_plane_types[0] = 0;
//			if (global.enemy_score > global.score_to_recon_ship) { available_plane_types[0]++; available_plane_types[available_plane_types[0]] = 1; }
//			if (global.enemy_score > global.score_to_fighter) { available_plane_types[0]++; available_plane_types[available_plane_types[0]] = 2; }
//			if (global.enemy_score > global.score_to_interceptor) { available_plane_types[0]++; available_plane_types[available_plane_types[0]] = 3; }
//		}
//		else
//		if (r > random_max_range_step * 1) // разведка 
//		{
//			//if (global.enemy_score >= global.score_to_fighter) max_plane_types++; 
//			if (i == 1) plane_type = 1; // должен быть минимум один разведчик в подобных миссиях
//			available_plane_types[0] = 0;
//			if (global.enemy_score > global.score_to_recon_ship) { available_plane_types[0]++; available_plane_types[available_plane_types[0]] = 1; }
//			if (global.enemy_score > global.score_to_fighter) { available_plane_types[0]++; available_plane_types[available_plane_types[0]] = 2; }
//			// определяем кого ещё можно добавить в зависимости от очков и типа эскадрильи
//		}
//		if (available_plane_types[0] > 1 && (i > 1 || plane_type == 0))
//		{
//			var idx = irandom_range(1, available_plane_types[0]);
//			plane_type = available_plane_types[idx];
//			
//			/*
//			plane_type = 0;
//			while (plane_type == 0) // лентяй, блять
//			{
//				plane_type = irandom_range(1, max_plane_types);
//				// изменение порядка, чтобы одновременно и совпадало по plane_data и не было такого, что на старте одни истребители
//				if (plane_type == 1) plane_type = 1;
//				if (plane_type == 2) plane_type = 2;
//				if (plane_type == 3) plane_type = 4;
//				if (plane_type == 4) plane_type = 5;
//				if (plane_type == 5) plane_type = 6;
//				if (plane_type == 6) plane_type = 3;
//				//
//				if (plane_type == 1 && global.enemy_score < global.score_to_recon_ship) { plane_type = 0; continue; }
//				if (plane_type == 2 && global.enemy_score < global.score_to_fighter) { plane_type = 0; continue; }
//				if (plane_type == 3 && global.enemy_score < global.score_to_interceptor) { plane_type = 0; continue; }
//				if (plane_type == 4 && global.enemy_score < global.score_to_bomber) { plane_type = 0; continue; }
//				if (plane_type == 5 && global.enemy_score < global.score_to_cas) { plane_type = 0; continue; }
//				if (plane_type == 6 && global.enemy_score < global.score_to_transport) { plane_type = 0; continue; }
//				//
//				if (plane_type == 1 && !can_add_recon) { plane_type = 0; continue; }
//				if (plane_type == 2 && !can_add_fighters) { plane_type = 0; continue; }
//				if (plane_type == 3 && !can_add_fighters) { plane_type = 0; continue; }
//				if (plane_type == 4 && !can_add_bombers) { plane_type = 0; continue; }
//				if (plane_type == 5 && !can_add_cas) { plane_type = 0; continue; }
//				if (plane_type == 6 && !can_add_transport) { plane_type = 0; continue; }
//			}*/
//		}
//		
//		var weapon_1 = -1;
//		var weapon_2 = -1;
//		var weapon_3 = -1;
//		if (plane_type == 1) weapon_1 = 8;
//		if (plane_type == 2)
//		{
//			if (global.enemy_score < global.score_to_fighter * 1.3)
//			{
//				weapon_1 = 8;
//			}
//			else
//			if (global.enemy_score < global.score_to_fighter * 1.6)
//			{
//				weapon_1 = 8;
//				if (irandom_range(0, 1) > 0) weapon_2 = 8;
//			}
//			else
//			{
//				if (irandom_range(0, 1) > 0)
//				{
//					weapon_1 = 8;
//					weapon_2 = 8;
//				}
//				else
//				{
//					weapon_1 = 8;
//					weapon_2 = 10;
//				}
//			}
//		}
//		if (plane_type == 3)
//		{
//			if (global.enemy_score < global.score_to_interceptor * 1.3)
//			{
//				weapon_1 = 9;
//			}
//			else
//			if (global.enemy_score < global.score_to_interceptor * 1.6)
//			{
//				weapon_1 = 9;
//				if (irandom_range(0, 1) > 0) weapon_2 = 10;
//			}
//			else
//			{
//				if (irandom_range(0, 1) > 0)
//				{
//					weapon_1 = 9;
//					weapon_2 = 9;
//				}
//				else
//				if (irandom_range(0, 1) > 0)
//				{
//					weapon_1 = 9;
//					weapon_2 = 10;
//				}
//				else
//				{
//					weapon_1 = 9;
//					weapon_2 = 10;
//					weapon_3 = 9;
//				}
//			}
//		}
//		if (plane_type == 4)
//		{
//			weapon_1 = 0;
//			weapon_2 = 0;
//			weapon_3 = 0;
//		}
//		if (plane_type == 5)
//		{
//			if (global.enemy_score < global.score_to_cas * 1.3)
//			{
//				weapon_1 = 11;
//			}
//			else
//			if (global.enemy_score < global.score_to_cas * 1.6)
//			{
//				weapon_1 = 11;
//				if (irandom_range(0, 1) > 0) weapon_2 = 11;
//			}
//			else
//			{
//				if (irandom_range(0, 1) > 0)
//				{
//					weapon_1 = 11;
//					weapon_2 = 11;
//				}
//				else
//				{
//					weapon_1 = 11;
//					weapon_2 = 11;
//				}
//			}
//		}
//		
//		global.eggplanes[0, 0]++; // число самолётов
//		global.eggplanes[global.eggplanes[0, 0], 0] = plane_type; // индекс в planedata, разведчик Е-104
//		global.eggplanes[global.eggplanes[0, 0], 1] = global.eggplanedata[global.eggplanes[global.eggplanes[0, 0], 0], 1]; // хп
//		global.eggplanes[global.eggplanes[0, 0], 2] = global.eggplanedata[global.eggplanes[global.eggplanes[0, 0], 0], 6]; // скорость
//		global.eggplanes[global.eggplanes[0, 0], 3] = global.eggplanedata[global.eggplanes[global.eggplanes[0, 0], 0], 12]; // место для десанта
//		global.eggplanes[global.eggplanes[0, 0], 4] = global.eggplanedata[global.eggplanes[global.eggplanes[0, 0], 0], 13]; // место для груза
//		global.eggplanes[global.eggplanes[0, 0], 5] = weapon_1; // оружие 1, излучатель эггмана простой
//		if (weapon_1 > -1) global.eggplanes[global.eggplanes[0, 0], 6] = global.airweapon[weapon_1, 2]; // БК оружия 1
//		else global.eggplanes[global.eggplanes[0, 0], 6] = -1;
//		global.eggplanes[global.eggplanes[0, 0], 7] = weapon_2; // оружие 2
//		if (weapon_2 > -1) global.eggplanes[global.eggplanes[0, 0], 8] = global.airweapon[weapon_2, 2]; // БК оружия 2
//		else global.eggplanes[global.eggplanes[0, 0], 8] = -1;
//		global.eggplanes[global.eggplanes[0, 0], 9] = weapon_3; // оружие 3
//		if (weapon_3 > -1) global.eggplanes[global.eggplanes[0, 0], 10] = global.airweapon[weapon_3, 2]; // БК оружия 3
//		else global.eggplanes[global.eggplanes[0, 0], 10] = -1;
//		global.eggplanes[global.eggplanes[0, 0], 11] = 0; // Статус (0 - перемещение, 1 - патруль, 2 - перехват, 3 - бомбардировка)
//		global.eggplanes[global.eggplanes[0, 0], 12] = global.escortfoe[0, 0]; // номер эскадрильи, 0 = на базе
//		global.eggplanes[global.eggplanes[0, 0], 13] = global.eggplanedata[global.eggplanes[1, 0], 0]; // название
//
//		global.escortfoe[global.escortfoe[0, 0], i + 3] = global.eggplanes[0, 0];
//		
//		if (plane_type == 6)
//		{
//			var parties = irandom_range(1, 1 + round(global.enemy_score / global.score_to_terror_task));
//			for (var q = 0; q < parties; q++)
//			{
//				var count = irandom_range(3, 8 + round(global.enemy_score / global.score_to_terror_task));
//				global.eggteam[0, 0]++; // количество в массиве
//				global.eggteam[global.eggteam[0, 0], 0] = global.eggplanes[0, 0]; // индекс транспортника
//				global.eggteam[global.eggteam[0, 0], 1] = count; // численность
//				global.eggteam[global.eggteam[0, 0], 2] = ""; // тип
//				var class_max = 12;
//				var class = irandom_range(1, class_max);
//				if (global.enemy_score >= global.score_to_ufo && class > class_max / 1.5)
//				{
//					global.eggteam[global.eggteam[0, 0], 2] = "ufo"; // тип
//				}
//				else
//				if (global.enemy_score >= global.score_to_pawn && class > class_max / 2.5)
//				{
//					global.eggteam[global.eggteam[0, 0], 2] = "pawn"; // тип
//				}
//				else
//				if (global.enemy_score >= global.score_to_metal && class > class_max / 4)
//				{
//					global.eggteam[global.eggteam[0, 0], 2] = "metalson"; // тип
//				}
//				else
//				if (global.enemy_score >= global.score_to_bugs)
//				{
//					global.eggteam[global.eggteam[0, 0], 2] = "beetle"; // тип
//				}
//				else
//				global.eggteam[global.eggteam[0, 0], 2] = "beetle"; // тип
//				
//			}
//			foe.squad_index = global.eggplanes[0, 0];
//		}
//	
//	}
//	
//	if (keyboard_check(vk_shift) && global.debug) { foe.type = 6; }
//	if (keyboard_check(vk_alt) && global.debug) { foe.type = 2; }
//	
//	foe.type = clamp(ceil(r / random_max_range_step), 1, 8);
//	show_debug_message($"Значение типа противника: {foe.type}");
//	if (foe.type < 1 || foe.type > 8) foe.type = 1;
//	foe.indx = global.escortfoe[0, 0];
//	foe.point_x = foe.x + 10;
//	foe.point_y = foe.y + 10;
//	if (global.debug && keyboard_check(vk_control)) foe.crash_after_spawn = true;
//	show_debug_message("Заспавнен противник: ");
//	show_debug_message("Тип: " + string(foe.type));
//	show_debug_message("Номер: " + string(foe.indx));
//	show_debug_message("Номер изнач: " + string(global.escortfoe[0, 0]));
//	show_debug_message("Число самолетов: " + string(size));
//	show_debug_message("Число очков: " + string(global.enemy_score));
//
//	}
//
//}
//
//
//if (time_m.minutes_spawn_ally_current >= global.spawn_foe_ally_delay || (keyboard_check_released(vk_f9) && global.debug))
//{
//	
//	
//	
//	available_plane_types[0] = 0;
//	
//	time_m.minutes_spawn_ally_current = 0;
//	n = irandom_range(0, 100);
//	
//	random_max_range = 0;
//    random_max_range_step = 12.5; // 100 / число типов
//	
//	if ((global.xmas_score >= global.ally_score_to_recon_task || global.xmas_score >= global.ally_score_to_transport_task || global.xmas_score >= global.ally_score_to_intercept_task) && n <= global.spawn_chance_factor || (keyboard_check_released(vk_f9) && global.debug))
//	{
//		
//		var ally = instance_create(irandom_range(0, 900), irandom_range(0, 900), onmap_ally);
//		
//		/*
//		Типы эскадрильи:
//		1 - разведывательная
//		2 - господства в воздухе
//		3 - бомбардировочная (бомбардировка городов)
//		4 - бомбардировочная (атака объектов X-MAS)
//		5 - штурмовая (атака конвоев деда мороза и систем ПВО X-MAS)
//		6 - возмездие
//		7 - террора
//		8 - строительная
//		9 - босс (спавнится не здесь)
//		*/
//		
//		if (global.xmas_score >= global.ally_score_to_recon_task) random_max_range+=random_max_range_step;
//		if (global.xmas_score >= global.ally_score_to_transport_task) random_max_range+=random_max_range_step;
//		if (global.xmas_score >= global.ally_score_to_intercept_task) random_max_range+=random_max_range_step;
//		var r = irandom_range(1, random_max_range + random_max_range_step / 2);
//		var max_size = global.ally_escort_max_size * (global.xmas_score / global.score_to_max_size)
//		if (max_size > global.ally_escort_max_size) max_size = global.ally_escort_max_size;
//		var size = irandom_range(global.ally_escort_min_size, max_size);
//		if (size < global.ally_escort_min_size) size = global.ally_escort_min_size;
//
//
//		global.escortally[0, 0]++
//		global.escortally[global.escortally[0, 0], 0] = size // - число самолётов
//		global.escortally[global.escortally[0, 0], 1] = 0 // - макс. скорость
//		global.escortally[global.escortally[0, 0], 2] = 0 // - топливо (берётся мин. топливо среди самолей)
//		global.escortally[global.escortally[0, 0], 3] = 0 // - дальность радара (берётся макс. дальность)
//		global.escortally[global.escortally[0, 0], 4] = 0 // - номер самолёта 1 (остальные идут дальше)
//		
//		for (var i = 1; i <= size; i++)
//		{
//			
//			var plane_type = 1;
//			if (r > random_max_range_step * 1) // разведка 
//			{
//				if (i == 1) plane_type = 1; // должен быть минимум один разведчик в подобных миссиях
//				if (global.xmas_score >= global.ally_score_to_modernization && i == 1) plane_type = 2;
//				available_plane_types[0] = 1;
//				available_plane_types[1] = 1; 
//				if (global.xmas_score >= global.ally_score_to_modernization) available_plane_types[1] = 2;
//			}
//			else
//			if (r > random_max_range_step * 2) // транспорт 
//			{
//				if (i == 1) plane_type = 7; // должен быть минимум один вертолет в подобных миссиях
//				available_plane_types[0] = 2;
//				available_plane_types[1] = 1; 
//				available_plane_types[2] = 7; 
//				if (global.xmas_score >= global.ally_score_to_modernization) available_plane_types[1] = 2;
//			}
//			else
//			if (r > random_max_range_step * 3) // перехват 
//			{
//				if (i == 1) plane_type = 1; // должен быть минимум один истребитель в подобных миссиях
//				if (global.xmas_score >= global.ally_score_to_modernization && i == 1) plane_type = 2;
//				available_plane_types[0] = 1;
//				available_plane_types[1] = 1; 
//				if (global.xmas_score >= global.ally_score_to_modernization) available_plane_types[1] = 2;
//			}
//			
//			var weapon_1 = -1;
//			var weapon_2 = -1;
//			var weapon_3 = -1;
//			if (plane_type == 1 || plane_type == 2)
//			{
//				if (global.xmas_score < global.ally_score_to_intercept_task / 2)
//				{
//					weapon_1 = 1;
//				}
//				else
//				if (global.xmas_score < global.ally_score_to_intercept_task)
//				{
//					weapon_1 = 1;
//					if (irandom_range(0, 1) > 0) weapon_1 = 2;
//					if (irandom_range(0, 1) > 0) weapon_2 = 3;
//				}
//				else
//				{
//					if (irandom_range(0, 1) > 0)
//					{
//						weapon_1 = 2;
//						weapon_2 = 4;
//					}
//					else
//					if (irandom_range(0, 1) > 0)
//					{
//						weapon_1 = 1;
//						weapon_2 = 3;
//					}
//					if (irandom_range(0, 1) > 0)
//					{
//						weapon_1 = 4;
//						weapon_2 = 4;
//					}
//					else
//					{
//						weapon_1 = 1;
//						weapon_2 = 4;
//					}
//				}
//			}
//			
//			
//			
//			global.santaplanes[0, 0]++; // число самолётов
//			global.santaplanes[global.santaplanes[0, 0], 0] = plane_type; // индекс в planedata, разведчик Е-104
//			global.santaplanes[global.santaplanes[0, 0], 1] = global.planedata[global.santaplanes[global.santaplanes[0, 0], 0], 1]; // хп
//			global.santaplanes[global.santaplanes[0, 0], 2] = 0; // скорость
//			global.santaplanes[global.santaplanes[0, 0], 3] = global.planedata[global.santaplanes[global.santaplanes[0, 0], 0], 12]; // место для десанта
//			global.santaplanes[global.santaplanes[0, 0], 4] = global.planedata[global.santaplanes[global.santaplanes[0, 0], 0], 13]; // место для груза
//			global.santaplanes[global.santaplanes[0, 0], 5] = weapon_1; // оружие 1, излучатель эггмана простой
//			if (weapon_1 > -1) global.santaplanes[global.santaplanes[0, 0], 6] = global.airweapon[weapon_1, 2]; // БК оружия 1
//			else global.santaplanes[global.santaplanes[0, 0], 6] = -1;
//			global.santaplanes[global.santaplanes[0, 0], 7] = weapon_2; // оружие 2
//			if (weapon_2 > -1) global.santaplanes[global.santaplanes[0, 0], 8] = global.airweapon[weapon_2, 2]; // БК оружия 2
//			else global.santaplanes[global.santaplanes[0, 0], 8] = -1;
//			global.santaplanes[global.santaplanes[0, 0], 9] = weapon_3; // оружие 3
//			if (weapon_3 > -1) global.santaplanes[global.santaplanes[0, 0], 10] = global.airweapon[weapon_3, 2]; // БК оружия 3
//			else global.santaplanes[global.santaplanes[0, 0], 10] = -1;
//			global.santaplanes[global.santaplanes[0, 0], 11] = 0; // Статус (0 - перемещение, 1 - патруль, 2 - перехват, 3 - бомбардировка)
//			global.santaplanes[global.santaplanes[0, 0], 12] = global.escortally[0, 0]; // номер эскадрильи, 0 = на базе
//			global.santaplanes[global.santaplanes[0, 0], 13] = global.planedata[global.santaplanes[1, 0], 0]; // название
//			
//			global.escortally[global.escortally[0, 0], i + 3] = global.santaplanes[0, 0];
//		}
//		
//		ally.type = 100 / (r * (100 / r));
//		if (ally.type < 1 || !is_int32(ally.type) || ally.type > 3) ally.type = 1;
//		ally.indx = global.escortally[0, 0]
//		ally.point_x = ally.x + 10;
//		ally.point_y = ally.y + 10;
//		show_debug_message("Заспавнен союзник: ");
//		show_debug_message("Тип: " + string(ally.type));
//		show_debug_message("Номер: " + string(ally.indx));
//		show_debug_message("Номер изнач: " + string(global.escortally[0, 0]));
//		show_debug_message("Число самолетов: " + string(size));
//		
//	}
//
//}
//
//
//}